<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="http://localhost/Assets/Common/Xslt/GenericProduct/GenericProductSearchDisplay.xsl"/>
<xsl:template match="/">
	<script type="text/javascript" src="/Assets/Common/Js/Specials/Specials.js" />
	<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
	<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
	<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
	<script type="text/javascript">
	
		<![CDATA[
			 
			function UnwrapResponse(response) {
				
				var responseValue = '';

				if (response.responseXML.firstChild.textContent) {
			        responseValue = response.responseXML.firstChild.textContent;
			    }
			    else if (response.responseXML.documentElement.firstChild.nodeValue) {
			        responseValue = response.responseXML.documentElement.firstChild.nodeValue;
			    }
			    else {
			        responseValue = response.responseJSON.d;
			    }
				
				return responseValue;
			}

			function RunSearch() {
				$('SearchResults').style.display = 'none';
				$('UpdateProgress1').style.display = 'block';
				$('SearchTipsHelp').style.display = 'none';
				
				var requestArgs = GSNContext.RequestArguments;
				var searchText = $('txtSearchInput').value;
				
				SearchProductInLucene(document.URL, requestArgs, searchText, HandlSearchSuccess, HandleSearchFailure);
			}

			function HandlSearchSuccess(response) {

				$('UpdateProgress1').style.display = 'none';
				$('SearchResults').style.display = 'block';

				var htmlContent = UnwrapResponse(response);

				$('SearchResults').innerHTML = htmlContent;
			}

			function HandleSearchFailure() {
				$('UpdateProgress1').style.display = 'none';
				$('SearchResults').style.display = 'block';
				$('SearchTipsHelp').style.display = 'block';
				//Alert('Search Failed');
			}

			function AddSearchProductToList(productID, quantitySelect, showDiv, hideDiv) {

				var quantity = $(quantitySelect).value;

				AddToShoppingListWithQuantity(productID, 3, quantity);

				$(hideDiv).hide();
				$(showDiv).show();
			}

			function AddSearchProductToListWithWeight(productID, quantitySelect, showDiv, hideDiv) {

				var weight = $(quantitySelect).value;

				AddWeightedToShoppingList(productID, 3, weight);

				$(hideDiv).hide();
				$(showDiv).show();
			}

			function ShowDiv(divid){
				var classes = document.getElementsByClassName('CategoryDisplayResultsContainer');

				if(classes != null){
					for(i=0; i < classes.length; i++)
					{
						var item = classes[i];

						if(item.id == divid){
							item.style.display = "block";
						}
						else{
							item.style.display = "none";
						}	
					}
				}
			}

			function UpdateQuantityInShoppingList(shoppingListItemID, quantitySelect) {
				
				var quantity = $(quantitySelect).value;

				SetShoppingListItemQuantity(shoppingListItemID, 3, quantity);
			}

			function UpdateWeightInShoppingList(itemID, quantitySelect) {

				var weight = $(quantitySelect).value;

				SetShoppingListItemWeight(itemID, 3, weight);
			}

			function RemoveProductFromShoppingList(productID, showDiv, hideDiv) {

				RemoveFromShoppingListByID(productID, 3, "");

				$(hideDiv).hide();
				$(showDiv).show();
			}

			function changeQuantity(quantitySelect, increment, maxValue) {

				if ($(quantitySelect) != null) {

					var value = Math.abs($(quantitySelect).value);
					var newValue = increment + value;

					if ((0 < newValue) && (newValue <= maxValue)) {
						
						$(quantitySelect).value = increment + value;
					}
					else if (newValue > maxValue) {

						$(quantitySelect).value = maxValue;
					}
					else {
						
						$(quantitySelect).value = minValue;
					}
				}
			}
			
			function checkQuerystring(){
				var currentUrl = document.location.href;

				if(currentUrl.include('?')){
					var obj = currentUrl.toQueryParams();

					if(typeof(obj) == 'object'){
						$('txtSearchInput').value = obj.Keyword;
						RunSearch();
					}
				}
			}

		]]>
	</script>

		<div id="PreviousOrders">
			<xsl:choose>
				<xsl:when test="count(ExpressLane/ArrayOfPreviousOrder/PreviousOrder) > 0">
					<xsl:for-each select="ExpressLane/ArrayOfPreviousOrder/PreviousOrder">
						<xsl:sort select="Information/CreateDate" order="descending" />
						<xsl:call-template name="PreviousOrder" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="NoPreviousOrders" />
				</xsl:otherwise>
			</xsl:choose>

		</div>

</xsl:template>

<xsl:template name="PreviousOrder" match="PreviousOrder">
	<xsl:if test="count(Products) > 0">
		<div>
		<xsl:attribute name="id">Order<xsl:value-of select="Information/CheckOutListID" /></xsl:attribute>
		<xsl:attribute name="class">previousorder</xsl:attribute>
		
		<h2>
			<xsl:choose>
				<xsl:when test="string-length(Information/FormattedCreateDate) > 1">
					<xsl:value-of select="Information/FormattedCreateDate" />	
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>No Date Specified</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</h2>

		<table class="GridItem">
			<tbody>
				<tr>
					<th scope="col"> </th>
					<th scope="col">Item</th>
					<th scope="col">Price</th>
					<th scope="col" colspan="2">Quantity</th>
				</tr>
				<xsl:for-each select="Products/GenericProduct">
					<xsl:call-template name="ProductTableRow" />
				</xsl:for-each>
			</tbody>
		</table>
	</div>
	</xsl:if>
</xsl:template>
<xsl:template name="NoPreviousOrders">
	<h2>There are no saved orders associated with this account.</h2>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\90\XmlData\90-PageTypeId-137-OGSPreviousOrders.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->