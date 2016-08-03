<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookLikeButton"/>
	</xsl:template>
	<xsl:template name="FacebookLikeButton">
		<xsl:param name="url" select="concat(//Uri/Scheme, '://', //Uri/Host, //Uri/PathAndQuery)"/>
		<xsl:param name="class" select="'facebookLike'"/>
		<xsl:param name="style" select="'border:none; width:450px; height:80px;'"/>
		<!--
			this template generates a Facebook like button
			http://developers.facebook.com/docs/reference/plugins/like
		-->
		<xsl:if test="string-length($url) &gt; 3">
			<iframe scrolling="no" frameborder="0">
				<xsl:attribute name="src">
					<xsl:value-of select="concat('http://www.facebook.com/widgets/like.php?href=', $url)"/>
				</xsl:attribute>
				<xsl:if test="$style">
					<xsl:attribute name="style">
						<xsl:value-of select="$style"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="string-length($class) &gt; 0">
					<xsl:attribute name="class">
						<xsl:value-of select="$class"/>
					</xsl:attribute>
				</xsl:if>
			</iframe>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>