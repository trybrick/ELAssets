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
		<div id="cateringimg">
			<h3>Goretti&apos;s Catering</h3>
		<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<a>
				<xsl:attribute name="href">
						javascript:showImage(<xsl:value-of select="SortBy"/>);
				</xsl:attribute>
				<xsl:value-of select="SortBy"/>
			</a>
			<xsl:if test="position()!=last()">
				|
			</xsl:if>
		</xsl:for-each>

		<img id="Image">
		<xsl:attribute name="src">
			<xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent/Image"/>
		</xsl:attribute>
		</img>
		</div>

</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Village Market&#x2D;Coffee.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="Village Market&#x2D;Coffee.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->