<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:variable name="FeaturedArticle" select="//FeaturedArticles/Article[ArticleTypeID = 3]"/>

		<xsl:variable name="FeaturedArticleURL">
			<xsl:value-of select="concat('##root##/Recipes/Article.aspx?ArticleID=', $FeaturedArticle/ArticleID)"/>
		</xsl:variable>
		
		<div>
			<h3>Cooking Tips</h3>
			<h4><xsl:value-of select="$FeaturedArticle/Title"/></h4>
			<div align="center">
				<img id="src" border="0" src="{$FeaturedArticle/ImageURL}" style="margin:4px auto"/>
			</div>
			<p>Click to read &gt;&gt;</p>
		</div>
	</xsl:template>
</xsl:stylesheet>