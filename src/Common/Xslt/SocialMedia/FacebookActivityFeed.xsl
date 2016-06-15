<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookActivityFeed" />
	</xsl:template>
	<xsl:template name="FacebookActivityFeed">
		<xsl:param name="site" select="//Uri/Host"/>
		<xsl:param name="class" />
		<xsl:param name="style" />
		<!-- 
			this template generates a Facebook activity feed:
			http://developers.facebook.com/docs/reference/plugins/activity
		-->
		<xsl:if test="string-length($site) &gt; 0">
			<iframe>
				<xsl:attribute name="src">
					<xsl:value-of select="concat('http://www.facebook.com/widgets/activity.php?site=', $site)"/>
				</xsl:attribute>
				<xsl:if test="$class">
					<xsl:attribute name="class">
						<xsl:value-of select="$class" />
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="$style">
					<xsl:attribute name="style">
						<xsl:value-of select="$style" />
					</xsl:attribute>
				</xsl:if>
			</iframe>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>