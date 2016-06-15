<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/Profile/SignInControlV2.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="string-length(ExpressLane/SignUp/ErrorMessage) &gt; 0">
				<xsl:call-template name="ErrorMessage" />
			</xsl:when>
			<xsl:otherwise><xsl:call-template name="SignIn" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ErrorMessage">
		<xsl:value-of select="ExpressLane/SignUp/ErrorMessage" disable-output-escaping="yes" />
	</xsl:template>
	<xsl:template name="SignIn" match="ExpressLane"><xsl:apply-imports /></xsl:template>
</xsl:stylesheet>