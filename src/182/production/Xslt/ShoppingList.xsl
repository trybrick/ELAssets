<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/ShoppingList/ShoppingListItems.xsl" />
	<xsl:import href="/Assets/Common/Xslt/AdPod.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/" name="ShoppingList">
		<div id="ShoppingList">
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js" />
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js" />
			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
				<script type="text/javascript"><![CDATA[
					Event.observe(window, 'scroll', CheckSideColumnPosition);
					]]>
				</script>
			</xsl:if>
			<div>
				<div id="ShoppingListHeaderSmall" />
				<div id="ShoppingListItemsDisplay">
					<xsl:call-template name="ShoppingListItems" />
				</div>
				<xsl:if test="//ChainSettings/Setting[Name='EnableOwnItems']/Value= 'True'">
					<div id="AddYourOwnItems">
						<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('AddYourOwnItems'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
						<a href="javascript:AddOwnItem('AddYourOwnItems');" class="button">
							<span> + </span>
						</a>
					</div>
				</xsl:if>
				<div id="FiveListButtons">
					<a href="javascript:printList();">
						<img alt="Print List" src="/assets/182/images/Page_1_r1_c1.gif" onmouseout="this.src='/assets/182/images/Page_1_r1_c1.gif';" onmouseover="this.src='/assets/182/images/Page_1_r1_c1_f2.gif';" id="imgbtn_print" />
					</a>
					<a href="/Shop/EmailList.aspx">
						<img alt="Email List" src="/assets/182/images/Page_1_r1_c2.gif" onmouseout="this.src='/assets/182/images/Page_1_r1_c2.gif';" onmouseover="this.src='/assets/182/images/Page_1_r1_c2_f2.gif';" />
					</a>
					<a href="javascript:LastShoppingList();">
						<img alt="Get Last List" src="/assets/182/images/Page_1_r1_c3.gif" onmouseout="this.src='/assets/182/images/Page_1_r1_c3.gif';" onmouseover="this.src='/assets/182/images/Page_1_r1_c3_f2.gif';" />
					</a>
					<a href="javascript:SaveCurrentShoppingList();">
						<img alt="Save List" src="/assets/182/images/Page_1_r1_c4.gif" onmouseout="this.src='/assets/182/images/Page_1_r1_c4.gif';" onmouseover="this.src='/assets/182/images/Page_1_r1_c4_f2.gif';" />
					</a>
					<a href="/Shop/ManageList.aspx">
						<img alt="Manage List" src="/assets/182/images/Page_1_r1_c5.gif" onmouseout="this.src='/assets/182/images/Page_1_r1_c5.gif';" onmouseover="this.src='/assets/182/images/Page_1_r1_c5_f2.gif';" />
					</a>
				</div>
			</div>
		</div>
		<div id="availablevarieties">
		</div>
		<!--<xsl:apply-templates select="ExpressLane/Common/ExternalAds">
			<xsl:with-param name="Tile" select="'1'" />
		</xsl:apply-templates>
		<xsl:apply-templates select="ExpressLane/Common/ExternalAds">
			<xsl:with-param name="Tile" select="'2'" />
		</xsl:apply-templates>-->
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