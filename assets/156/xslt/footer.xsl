<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="GsnFooter" class="clearfix">
			<p>
				<xsl:text>Copyright 2016 </xsl:text>
				<a href="http://trybrick.com">Brick, Inc.</a>
				<xsl:text>   |   Please review our </xsl:text>
				<a href="/profile/PrivacyPolicy.aspx">Privacy Policy</a>
				<xsl:text>.</xsl:text>
			</p>
		</div>
		<xsl:call-template name="FacebookJsApi"/>
	</xsl:template>
</xsl:stylesheet>