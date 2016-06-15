<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes"/>
<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>
<xsl:variable name="tab"><xsl:text>&#x09;</xsl:text></xsl:variable>

	<xsl:template match="/">
		<xsl:text>ID</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>MPN</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>GTIN</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Brand</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Title</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Description</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>product_type</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Link</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Condition</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>Price</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>availability</xsl:text>
		<xsl:value-of select="$tab"/>
		<xsl:text>image_link</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:for-each select="//SearchProduct">
			<xsl:value-of select="id"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="MPN"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="GTIN"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="Brand"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="title"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="Description"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="product_type"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="concat('shop.raleys.com/shop/productsearch.aspx?Keyword=', MPN)" /> <!-- Link  -->
			<xsl:value-of select="$tab"/>
			<xsl:text>new</xsl:text>
			<xsl:value-of select="$tab"/>
			<xsl:text>1.00 USD</xsl:text>
			<xsl:value-of select="$tab"/>
			<xsl:text>in stock</xsl:text>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="image_link"/>
			<xsl:value-of select="$newline"/>
		</xsl:for-each>
	</xsl:template>

<xsl:template match="DataManager">
	
</xsl:template>

<xsl:template match="SearchProduct">
	
</xsl:template>

<xsl:template match="ArrayOfSearchProduct">
	
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\XmlData.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
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
		<scenario default="yes" name="Scenario2" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\NOBACKUP\download\XmlData.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="Untitled1.xml" srcSchemaRoot="Test" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->