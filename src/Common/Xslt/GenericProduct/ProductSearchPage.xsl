<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/livepipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/recipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/rating.js"></script>	
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
		<script type="text/javascript" src="/Assets/Common/Js/GenericProduct/ProductSearchPage.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/autosuggest.js" />
		<script type="text/javascript" src="/Assets/Common/Js/sorter.js" />
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js" />
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingListPage.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Circulars/Circulars.js" />
		<script type="text/javascript"> 
		<![CDATA[
			 function togglePanelSaleItems(){
			  var items = document.getElementById('PanelSaleItems').childElements();
			  for(var i=0; i<items.length;i++)
			  {
			 document.getElementById('SaleItems').appendChild(items[i]);			 
			  }		
			document.getElementById('toggler').style.display="none";	  
			
			}
			  function togglePanelCircularItems(){
				Effect.toggle('PanelCircularItems','blind', {duration: 1.0});
			}
		]]>
		</script>		

		<div id="Search">
			<div id="CtrlDivSubTitle" style="display:none;">
			    <h2>Product Search:</h2>
		    </div>
	        <div id="TextSearch" style="display:none;">
			    <p>Search by Name and Description</p>
			    <input type="text" id="txtSearchInput" onkeypress="if (event.keyCode==13) RunSearch(); return event.keyCode!=13;" style="float:left; margin-right:6px;"/>
			    <a class="button" href="javascript:RunSearch();"><span>Search</span></a>
				<div id="autosuggest"><ul></ul></div>
		    </div>

			<div id="UpdateProgress1" style="display: none; margin-top: 0px;">
				<div id="ProcessingPanel">
					<img src="../Assets/Common/Images/Wait.gif" alt="Wait"/>Processing...
				</div>
			</div>

			<div id="SearchTipsHelp">
				<table style="border-collapse:collapse;">
					<tbody><tr>
						<td colspan="2" >
							<h3>Misspellings can cause no items to qualify in your results, however we try to help you out a bit.  We do check words that have similar spellings to what you search, so if you type "<em>rasberry</em>" we will also search "<em>raspberry</em>". If you are still having problems finding an item the following examples show some search tips for you.</h3>
							<br/>
						</td>
					</tr>
					<tr class="box">
						<td width="35%" valign="top" style="padding-left:8px">
							<b>This Search</b>
						</td>
						<td width="65%" valign="top" style="padding-left:8px">
							<b>Will Produce This Result</b>
						</td>
					</tr>
					<tr class="GridAlternatingItem">
						<td width="35%" valign="top">
							<p>peanut 
						</p></td>
						<td width="65%" valign="top">
							<p>results that contain the word peanut
						</p></td>
					</tr>	
					<tr class="GridItem">
						<td width="35%" valign="top">
							<p>peanut oil
						</p></td>
						<td width="65%" valign="top">
							<p>results that contain both the words peanut and oil
						</p></td>
					</tr>		
					<tr class="GridItem">
						<td width="35%" valign="top">
							<p>"peanut oil" 
						</p></td>
						<td width="65%" valign="top">
							<p>results that contain the exact phrase "peanut oil"
						</p></td>
					</tr>			
					<tr class="GridAlternatingItem">
						<td width="35%" valign="top">
							<p>oyster
						</p></td>
						<td width="65%" valign="top">
							<p>results that contain the word oyster
						</p></td>
					</tr>			
					<tr class="GridItem">
						<td width="35%" valign="top">
							<p>oyster stew
						</p></td>
						<td width="65%" valign="top">
							<p>all results that contain both the words oyster and stew
						</p></td>
					</tr>
					<tr class="GridItem">
						<td width="35%" valign="top">
							<p>"oyster stew"
						</p></td>
						<td width="65%" valign="top">
							<p>results that contain the exact phrase "oyster stew"
						</p></td>
					</tr>
				</tbody></table>


			</div>


		</div>
		<div id="SearchResults">
		</div>
		<script type="text/javascript">
			checkQuerystring();
		
			productSearchHistory = new Array(
				<xsl:for-each select="ExpressLane/ArrayOfString/string">
					<xsl:choose>
						<xsl:when test="position() != (last())">
							"<xsl:value-of select="." />",
						</xsl:when>
						<xsl:otherwise>
							"<xsl:value-of select="." />"
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			)

			var txtbx = $('txtSearchInput');
			new AutoSuggest(txtbx, productSearchHistory);
		</script>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\90\XmlData\90-PageTypeId-109-ProductSearchPage.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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