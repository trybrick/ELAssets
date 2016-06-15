<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="GenericProductDisplayFavoritesNoPrice.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/" name="InventoryPageProducts">
		<xsl:if test="ExpressLane/Inventory/ArrayOfGenericProduct/GenericProduct">
			<div class="CategoryHeader">
				<h3>
					<xsl:choose>
						<xsl:when test="ExpressLane/Inventory/GenericCategory">
							<xsl:value-of select="ExpressLane/Inventory/GenericCategory/CategoryName" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ExpressLane/Inventory/Settings/TopNText" />
						</xsl:otherwise>
					</xsl:choose>
				</h3>
			</div>
			<div>
				<xsl:if test="ExpressLane/Inventory/Category/CategoryID">
					<xsl:if test="ExpressLane/Inventory/Settings/DisplayMostPopular = 'True'">
						<a>
							<xsl:attribute name="href">javascript:DisplayMostPopular();</xsl:attribute>
							Display<xsl:value-of select="concat(' ', ExpressLane/Inventory/Settings/TopNText)" />
						</a>
					</xsl:if>
				</xsl:if>
				<xsl:call-template name="GenericProductTableAndBrands">
					<xsl:with-param name="GenericProducts" select="ExpressLane/Inventory/ArrayOfGenericProduct/GenericProduct"></xsl:with-param>
					<xsl:with-param name="GenericBrands" select="ExpressLane/Inventory/ArrayOfGenericBrand/GenericBrand"></xsl:with-param>
					<!--<xsl:with-param name="DisplayType" select="'div'" />-->
				</xsl:call-template>
			</div>
		</xsl:if>
		<div id="productdescription"></div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\90\XmlData\90-PageTypeId-108-InventoryPageProducts.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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