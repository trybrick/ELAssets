<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
			<xsl:choose>
				<xsl:when test="contains($AbsolutePath, '/recipes/recipevideos.aspx')">
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.aspx'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="secondary-navigation">
			<ul class="group">
				<xsl:for-each select="//tabs/tab">
					<xsl:variable name="tabPath"><xsl:value-of select="translate(url, $ucletters, $lcletters)"/></xsl:variable>
					<li>
						<xsl:attribute name="class">
							<xsl:if test="$aTabPath = $tabPath">
								<xsl:text>current </xsl:text>
							</xsl:if>
							<xsl:value-of select="@class" />
						</xsl:attribute>
						<a style="text-align:center">
							<xsl:attribute name="href">
								<xsl:value-of select="url"/>
							</xsl:attribute>
							<xsl:value-of select="text" disable-output-escaping="yes"/>
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="AbsolutePath">
	</xsl:template>
</xsl:stylesheet>