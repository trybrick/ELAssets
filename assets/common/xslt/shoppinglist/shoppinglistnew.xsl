<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="ShoppingListItems.xsl"/>
	<xsl:import href="../AdPod.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingList">
		<div id="ShoppingList">
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js"/>
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>
			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
				<script type="text/javascript"><![CDATA[
					Event.observe(window, 'scroll', CheckSideColumnPosition);
					]]>
				</script>
			</xsl:if>
			<div>
				<div id="ShoppingListHeaderSmall"/>
				<div id="ShoppingListItemsDisplay">
					<xsl:call-template name="ShoppingListItems"/>
				</div>
				<div id="FiveListButtons">
					<a href="javascript:printList();" class="shoplistPrint">
						<span id="imgbtn_print">Print</span>
					</a>
					<a href="/Shop/EmailList.aspx" class="shoplistEmail" onclick="javascript:EmailShoppingList();">
						<span>Email</span>
					</a>
					<a class="shoplistLast">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:LastShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('Please log-in to retrieve your saved shopping list.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>Previous</span>
					</a>
					<a class="shoplistSave">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:SaveCurrentShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('Please log-in to to save your shopping list.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>Save</span>
					</a>
					<a href="/Shop/ManageList.aspx" class="shoplistManage">
						<span>Manage</span>
					</a>
				</div>

				<div id="AddYourOwnItems">
					<a class="lightwindow" href="#OwnItems">
						<xsl:attribute name="title">Add Your Own Items</xsl:attribute>
						<xsl:attribute name="style">margin:0</xsl:attribute>
						<xsl:attribute name="params">"lightwindow_width=600;lightwindow_height=400"</xsl:attribute>Add Your Own Items!</a>
				</div>

				<div id="OwnItems" style="display:none;width:600px;">
					<div class="OwnItems">
						<h3>Add Your Own Items</h3>
						<p>Can't find the item you are looking for?<br/>
							Just input the information below and add it to your list.</p>
						<div>
							<span>Item Name:</span>
							<input type="text" title="name"/>
						</div>
						<div>
							<span>Item Size:</span>
							<input type="text" title="size"/>
						</div>
						<!--<div>
							<span>Item Category: </span>
							<select title="category">
							</select>
						</div>-->
						<div>
							<span>Item Quantity:</span>
							<input type="text" title="quantity"/>
						</div>
						<div>
							<span>Item Description:</span>
							<input type="text" title="description" maxlength="499"/>
						</div>
						<div>
							<button id="btnAddOwnItem" onclick="AddOwnItem('lightwindow_contents');">Add</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="availablevarieties">
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-99-ShoppingList.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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