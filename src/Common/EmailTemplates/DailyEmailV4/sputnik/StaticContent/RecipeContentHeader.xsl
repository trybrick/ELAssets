<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="count(//ArrayOfStaticContent/StaticContent) &gt; 0">
				<xsl:call-template name="CustomContent" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DefaultContent" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="DefaultContent">
		<hr></hr>
		<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 12px 0;font-weight:normal;color:#999999;font-size:36px;">Recipe Center</h2>
	</xsl:template>
	
	<xsl:template name="CustomContent">
		<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
		<xsl:sort select="SortBy" data-type="number" />
			<div>
				<xsl:value-of select="Description" disable-output-escaping="yes" />
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>