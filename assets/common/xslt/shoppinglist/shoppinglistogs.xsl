<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="ShoppingListItems.xsl"/>
	<xsl:import href="../AdPod.xsl"/>
	<xsl:import href="../GlobalQuickSearch.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingList">
		<xsl:variable name="OGSRequiresVarieties" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSRequireAvaliableVarieties']/Value"/>
		<xsl:call-template name="GlobalQuickSearchDisplay"/>
		<div id="ShoppingList">
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js"/>
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>
			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
				<script type="text/javascript"><![CDATA[
					Event.observe(window, 'scroll', CheckSideColumnPosition);
					]]>
				</script>
			</xsl:if>
			<div>
				<div id="ShoppingListHeaderSmall" class="OGS"/>
				<div id="ShoppingListItemsDisplay">
					<xsl:call-template name="ShoppingListItems"/>
				</div>
				<div id="FiveListButtons">
					<a href="javascript:printList();" id="PrintListIcon" class="shoplistPrint">
						<span>Print<br/>Cart</span>
					</a>
					<a href="/index.aspx?linkid=42" id="CheckOutIcon" class="shoplistCheckout">
						<span>Check<br/>Out</span>
					</a>
					<!--					
					<a href="/Shop/EmailList.aspx" class="shoplistEmail">
						Email
					</a>
					-->
					<a class="shoplistLast">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:LastShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('You must be logged in to access your last shopping cart.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>My Last<br/>Cart</span>
					</a> 
					<a class="shoplistSave">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:SaveCurrentShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('You must be logged in to save your shopping cart.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>Save<br/>Cart</span>
					</a>
					<a href="/Shop/ManageList.aspx" class="shoplistManage">
						<span>Manage<br/>Cart</span>
					</a>
				</div>
				<xsl:if test="translate(//GenericChain/ChainSettings/Setting[Name='EnableOwnItems']/Value,'TRUE','true') = 'true'">
					<div id="AddYourOwnItems">
						<a class="lightwindow" href="#OwnItems">
							<xsl:attribute name="title">Add Your Own Items</xsl:attribute>
							<xsl:attribute name="style">margin:0</xsl:attribute>
							<xsl:attribute name="params">"lightwindow_width=800;lightwindow_height=400"</xsl:attribute>Add Your Own Items!</a>
					</div>

					<div id="OwnItems" style="display:none;">
						<div class="OwnItems" style="width:580px;">
							<h2>More Information Needed</h2>


							<div class="separator">
								<span class="fieldName">Name:</span>
								<input type="text" title="name" class="productname"/>
								<p>Enter the name of the item.</p>
							</div>

							<div class="separator">
								<span class="fieldName">Size:</span>
								<input type="text" class="Size" title="size"/>
								<p>Please specify what size item you are looking for: such as "72 oz. box", or "2 liter bottle".</p>
							</div>

							<xsl:if test="//ArrayOfCategory">
								<div class="separator">
									<span class="fieldName">Item Department:</span>
									<select title="category">
										<option>- Select a Department -</option>
										<xsl:for-each select="//ArrayOfCategory/Category">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="CategoryID"/>
												</xsl:attribute>
												<xsl:value-of select="CategoryName"/>
											</option>
										</xsl:for-each>
									</select>
									<p>What department can this item be found in?</p>
								</div>
								<script type="text/javascript">// work around to display selects in light window
									if ($('lightwindow_contents') != null) {
										lightwindow.prototype._toggleTroubleElements('visible', true);
									}</script>
							</xsl:if>

							<div class="separator">
								<span class="fieldName">Quantity:</span>
								<input type="text" class="Quantity" title="quantity" value="1" maxlength="3"/>
								<div id="ProductPlusMinusButtons">
									<a class="ProductAddToListPlus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', 1, 99);"/>
									<a class="ProductAddToListMinus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', -1, 99);"/>
								</div>
								<select title="randomweight" style="display: none;"/>
								<p>How many/no. of pounds?</p>
							</div>

							<div class="separator">
								<span class="fieldName">Additional Information:</span>
								<textarea title="description" maxlength="499"/>
							</div>

							<div class="disclaimer">Please note that items added here will be added to your cart and reflected with your final bill, but will not reflect in the running cart total while you continue to shop.</div>

							<div class="addButtons">
								<a class="button" id="btnAddOwnItem" onclick="AddOwnItem('lightwindow_contents');">
									<span>Add Item</span>
								</a>
								<a class="button red" id="btnAddAnotherItem" onclick="AddOwnItem('lightwindow_contents', true);">
									<span>Add Another Item</span>
								</a>
							</div>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
		<div id="availablevarieties"></div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>

		<xsl:if test="$OGSRequiresVarieties = 'true'">
			<input>
				<xsl:attribute name="id">hfOGSRequiresVarieties</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">true</xsl:attribute>
			</input>
		</xsl:if>
		<!--<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'1'" />
		</xsl:apply-templates>
		<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'2'" />
		</xsl:apply-templates>-->
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\43\XmlData\43-PageTypeId-99-ShoppingList.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
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