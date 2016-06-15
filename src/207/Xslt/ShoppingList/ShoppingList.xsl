<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../../../Common/Xslt/ShoppingList/ShoppingListItems.xsl"/>
	<xsl:import href="/Assets/Common/Xslt/AdPod.xsl"/>
	<xsl:import href="/Assets/common/xslt/GlobalQuickSearch.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingList">
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
	<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
    	<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>      
        <xsl:variable name="ShowGlobalSearch" select="translate(//ChainSettings/Setting[SettingID=14]/Value,$ucletters,$lcletters)" />
		<xsl:choose>
			<xsl:when test="$ShowGlobalSearch = 'true'">
				<style>
					<!-- removes the search box over the ad and widens the dropdowns to fill the space -->
						#CircularLists select		{width:36%;}
                        #CircularLists input,
                        #CircularLists a.button		{display:none; }
                 </style>
				<xsl:call-template name="GlobalQuickSearchDisplay"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- no search -->
			</xsl:otherwise>
		</xsl:choose>
		<div id="ShoppingList">
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js"/>
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>
			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
				<script type="text/javascript"><![CDATA[
					Event.observe(window, 'scroll', CheckSideColumnPosition);
					]]>
				</script>
			</xsl:if>
			<div id="ShoppingListHeaderSmall"/>
			<div id="ShoppingListMain">
				<div id="ShoppingListItemsDisplay">
					<xsl:call-template name="ShoppingListItems"/>
				</div>
				<xsl:if test="//ChainSettings/Setting[Name='EnableOwnItems']/Value= 'True'">
					<div id="AddYourOwnItems">
							<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('AddYourOwnItems'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
								<a href="javascript:AddOwnItem('AddYourOwnItems');" class="button">
									<span> + </span>
								</a>
					</div>
				</xsl:if>
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
						<span>Edit List</span>
					</a>
				</div>

		</div>
		<div id="availablevarieties">
		</div>

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