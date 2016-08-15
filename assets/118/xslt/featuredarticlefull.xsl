<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<div id="Article">
			<xsl:apply-templates select="ExpressLane/Article" />
			<div id="BackToArticle-outer">
                <div id="BackToArticle">
                    <a href="/Recipes/RecipeCenter.aspx">Back to Recipe Center</a>
                </div>
                <div class="PrintArticle">
                    <a href="#" onClick="window.print(); return false">Print this article</a>
                </div>
            </div>
            <style>
                @media print {
                    #BackToArticle-outer,
                    .dfm-location-selection-wrap,
                    .dfmHeader{display:none;}
                }
            </style>
		</div>
	</xsl:template>
	<xsl:template name="ArticleFull" match="Article">
		<style>#AskTheChefLink	{text-align: right;}</style>
		<div id="FeaturedArticleFull">
			<h3>
				<xsl:if test="ArticleTypeID=1">Ask The Chef</xsl:if>
				<xsl:if test="ArticleTypeID=2">Featured Article</xsl:if>
				<xsl:if test="ArticleTypeID=3">Cooking Tips</xsl:if>
				<xsl:if test="ArticleTypeID=4">Kids Corner</xsl:if>
				<xsl:if test="ArticleTypeID=5">Sage Advice</xsl:if>
				<xsl:if test="ArticleTypeID=6">Featured Article</xsl:if>
				<xsl:if test="ArticleTypeID=7">Cookbook Review</xsl:if>
				<xsl:if test="ArticleTypeID=8">Upcoming Events</xsl:if>
				<xsl:if test="ArticleTypeID=''">Featured Article</xsl:if>
			</h3>
			<xsl:if test="ArticleTypeID=1">
				<div id="AskTheChefLink">
					<a><xsl:attribute name="href">/Recipes/SubmitAskTheChef.aspx</xsl:attribute>Ask the Chef a Question</a>
				</div>
			</xsl:if>
			<h2>
				<xsl:value-of select="Title"/>
			</h2>
			<p>
				<xsl:if test="ImageURL!=''">
					<a>
						<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
						<img hspace="12" align="right">
							<xsl:attribute name="src">
								<xsl:value-of select="ImageURL"/>
							</xsl:attribute>
						</img>
					</a>
				</xsl:if>
				<xsl:value-of select="Body" disable-output-escaping="yes"/>
			</p>
		</div>
	</xsl:template>
</xsl:stylesheet>