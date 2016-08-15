<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	<xsl:if test="//AdInternal">
		<div id="adInternalSponsorText"><p>this shopping list brought to you by:</p></div>
		<xsl:for-each select="//AdInternal">
			<xsl:if test="string-length(ImageURL) &gt; 0">
				<xsl:choose>
					<xsl:when test="string-length(LinkDestination) &gt; 0">
						<a href="{LinkDestination}">
							<img src="{ImageURL}" alt="" />
						</a>
					</xsl:when>
					<xsl:otherwise>
						<img alt="advertisement" src="{ImageURL}" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
