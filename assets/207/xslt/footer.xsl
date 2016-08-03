<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="/Assets/Common/Xslt/Footer.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="FooterDrop">
			<p class="FooterDropText">
				<xsl:variable name="TotalLinks" select="count(ExpressLane/header/TopLevelNavigation/MenuItem)"/>
				<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
					<span class="FooterSpacer">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Link"/>
							</xsl:attribute>
							<xsl:if test="Target">
								<xsl:attribute name="target">
									<xsl:value-of select="Target"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="Title"/>
						</a>
					</span>
					<xsl:if test="position() &lt; $TotalLinks">|</xsl:if>
				</xsl:for-each>
			</p>
		</div>
		<xsl:call-template name="GSNFooter"/>
	</xsl:template>
</xsl:stylesheet>