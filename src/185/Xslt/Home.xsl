<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/ShoppingList/ShoppingListOGS2Buttons.xsl"/>
	<xsl:import href="/Assets/Common/Xslt/AdPod.xsl"/>
	<xsl:import href="/Assets/185/Xslt/Tabs.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="HomeGrid">
			<div class="pageHeaderContainer">
				<span class="pageHeader">Online shopping made easy! </span>
				<span class="pageSubHeader">Click on a tab or department below to start.</span>
			</div>
			<xsl:call-template name="tabs"/>
			<div id="Departments">
				<xsl:for-each select="ExpressLane/ArrayOfGenericCategory[1]/GenericCategory[string-length(ParentCategoryID) &lt; 1]">
					<xsl:sort select="Name"/>
					<xsl:variable name="CategoryID" select="CategoryID"/>
					<a class="grid_3">
						<xsl:attribute name="href">
							<xsl:value-of select="concat('/Shop/Product.aspx?Department=', $CategoryID)"/>
						</xsl:attribute>
						<img>
							<xsl:attribute name="alt">
								<xsl:value-of select="CatgoryName"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="SmallImageUrl"/>
							</xsl:attribute>
						</img>
						<span>
							<xsl:value-of select="CategoryName"/>
						</span>
					</a>
				</xsl:for-each>
			</div>
		</div>
		<div id="sidebar">
			<xsl:call-template name="ShoppingList"/>
			<xsl:call-template name="AdPodMaster"/>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\185-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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