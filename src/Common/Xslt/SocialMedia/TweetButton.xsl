<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template name="TweetButton" match="/">
		<xsl:param name="data-count"/>
		<a href="http://twitter.com/share" class="twitter-share-button" data-text="{concat(//RecipeData/GenericRecipe/Title, ' at ', //GenericStore/ChainName)}" data-count="{$data-count}">Tweet</a>
		<script type="text/javascript" src="http://platform.twitter.com/widgets.js"/>
	</xsl:template>
</xsl:stylesheet>