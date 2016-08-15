<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template name="FeaturedArticleTeaser">
		<xsl:variable name="ArticleTypeID">
			<xsl:choose>
				<xsl:when test="//Article[ArticleTypeID = 2]">2</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 1]">1</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 3]">3</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 4]">4</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 5]">5</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 6]">6</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 7]">7</xsl:when>
				<xsl:when test="//Article[ArticleTypeID = 8]">8</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="number($ArticleTypeID)">
			<div id="FeaturedArticleTeaser" class="home">
				<h2>
					<a>
						<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="$ArticleTypeID = 1">Ask The Chef</xsl:when>
							<xsl:when test="$ArticleTypeID = 2">Featured Article</xsl:when>
							<xsl:when test="$ArticleTypeID = 3">Cooking Tips</xsl:when>
							<xsl:when test="$ArticleTypeID = 4">Kids</xsl:when>
							<xsl:when test="$ArticleTypeID = 5">Sage Advice</xsl:when>
							<xsl:when test="$ArticleTypeID = 6">Featured Article</xsl:when>
							<xsl:when test="$ArticleTypeID = 7">Equipment Reviews</xsl:when>
							<xsl:when test="$ArticleTypeID = 8">Upcoming Events</xsl:when>
						</xsl:choose>
					</a>
				</h2>
				<h3>
					<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Title"/>
				</h3>
				<xsl:if test="//Article[ArticleTypeID = $ArticleTypeID]/ImageURL!=''">
					<a>
						<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ImageURL"/>
							</xsl:attribute>
						</img>
					</a>
				</xsl:if>
				<p>
					<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Teaser"/>
				</p>
				<a>
					<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>more...</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>