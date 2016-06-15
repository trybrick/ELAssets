<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/GenericProduct/GenericProductDisplay.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
		<div id="main" role="main">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number" />
				<xsl:value-of select="Description" disable-output-escaping="yes" />
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/MostPopularProducts/Categories/GenericCategory">
				<xsl:sort select="CategoryName" data-type="text"/>
				<xsl:call-template name="GenericProductTableByCategory">
					<xsl:with-param name="GenericProducts" select="//MostPopularProducts/Products/GenericProduct"></xsl:with-param>
					<xsl:with-param name="GenericCategory" select="."></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-146-MostPopularProducts.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
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