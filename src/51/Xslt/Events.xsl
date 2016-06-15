<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
	<script id="jsImage" type="text/javascript" language="javascript">

			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:if test="position()=last()">
					<![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1] = ']]><xsl:value-of select="Image"/><![CDATA[';]]>
			</xsl:for-each>
			<xsl:comment>
				<![CDATA[
    
    function showImage(page)
    {
		page = page-1;
        var img = document.getElementById('Image');
        img.src = images[page];
    }

	]]>
			</xsl:comment>

		</script>
		<div id="StaticContentImg">
			<h3 id="eventsHeading" class="pageHeading">Store News &amp; Events</h3>
		<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image !=''">
				<div style="margin-left:350px;float:left;text-align:center;">
					<xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Description" disable-output-escaping="yes" />
				</div>
				<img id="Image">
					<xsl:attribute name="src"><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image" /></xsl:attribute>
				</img>
			</xsl:when>
			<xsl:otherwise>
				<h4>There are no Store Events at this time.</h4>
			</xsl:otherwise>
		</xsl:choose>
		</div>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Village Market-Coffee.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth="" profilelength=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="Village Market-Coffee.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->