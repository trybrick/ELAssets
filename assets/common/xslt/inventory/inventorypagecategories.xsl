<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/" name="InventoryCategories">
		<xsl:choose>
			<xsl:when test="ExpressLane/Inventory/ArrayOfGenericCategory/GenericCategory">
				<xsl:for-each select="ExpressLane/Inventory/ArrayOfGenericCategory/GenericCategory">
					<xsl:sort select="CategoryName" data-type="text" />
					<xsl:call-template name="GenericCategoryDisplay" />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="ExpressLane/Inventory/ArrayOfCategory/Category">
					<xsl:sort select="CategoryName" data-type="text" />
					<xsl:call-template name="CategoryDisplay" />
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GenericCategoryDisplay" match="GenericCategory">
		<option>
			<xsl:attribute name="value"><xsl:value-of select="CategoryID" /></xsl:attribute>
			<xsl:attribute name="exportkeyid">
				<xsl:value-of select="ExportKeyID" />
			</xsl:attribute>
			<xsl:value-of select="CategoryName" />
		</option>
	</xsl:template>
	<xsl:template name="CategoryDisplay" match="Category">
		<option>
			<xsl:attribute name="value"><xsl:value-of select="CategoryID" /></xsl:attribute>
			<xsl:attribute name="exportkeyid">
				<xsl:value-of select="ExportKeyID" />
			</xsl:attribute>
			<xsl:value-of select="CategoryName" />
		</option>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\123\XmlData\123-PageTypeId-106-InventoryPage.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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