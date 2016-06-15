<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:apply-templates select="//Article" />
	</xsl:template>
	<xsl:template match="Article" name="ArticleTeaser">
		<h2>
			<xsl:if test="ArticleTypeID=1">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Ask The Chef</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=2">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Featured Article</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=3">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Cooking Tips</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=4">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Kids Corner</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=5">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Sage Advice</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="Article/ArticleTypeID=6">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Featured Article</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=7">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Cookbook Review</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=8">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Upcoming Events</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="ArticleTypeID=''">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<xsl:text>Featured Article</xsl:text>
				</a>
			</xsl:if>
		</h2>
		<h3><xsl:value-of select="Title" disable-output-escaping="yes"/></h3>
		<xsl:if test="ImageURL">
			<xsl:if test="ImageURL!=''">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
					</xsl:attribute>
					<img alt="">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageURL"/>
						</xsl:attribute>
					</img>
				</a>
			</xsl:if>
		</xsl:if>
		<p><xsl:value-of select="Teaser" disable-output-escaping="yes"/></p>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="concat('/Recipes/Article.aspx?ArticleID=', ArticleID)"/>
			</xsl:attribute>
			<xsl:text>more...</xsl:text>
		</a>
	</xsl:template>
</xsl:stylesheet>