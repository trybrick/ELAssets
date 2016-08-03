<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="SignOut">
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/SignOut/Message) &gt; 0">
					<xsl:value-of select="ExpressLane/SignOut/Message" disable-output-escaping="yes"/>
				</xsl:when>
				<xsl:otherwise>
					<h2>
						<xsl:text>Thank you for visiting </xsl:text>
						<xsl:value-of select="//GenericChain/ChainName"/>
						<xsl:text>. Please shop again soon!</xsl:text>
					</h2>
					<h3>You are signed out.</h3>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>