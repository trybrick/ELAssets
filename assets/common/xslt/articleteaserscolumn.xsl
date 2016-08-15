<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="FeaturedArticleTeaser.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/">
		<div class="recipe sidebarTeaser" id="FeaturedArticleTeaser">
			<xsl:apply-templates select="//FeaturedArticles/Article[ArticleTypeID = 2]" />
        </div>
		<div class="recipe sidebarTeaser" id="AskTheChefTeaser">
			<xsl:apply-templates select="//FeaturedArticles/Article[ArticleTypeID = 1]" />
		</div>
		<div class="recipe sidebarTeaser" id="CookingTipsTeaser">
			<xsl:apply-templates select="//FeaturedArticles/Article[ArticleTypeID = 3]" />
		</div>
	</xsl:template>
</xsl:stylesheet>