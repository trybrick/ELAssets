<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:if test="ExpressLane/FeaturedRecipeList/FeaturedRecipe">
			<xsl:apply-templates select="ExpressLane/FeaturedRecipeList/FeaturedRecipe" />
		</xsl:if>
	</xsl:template>
	<xsl:template match="FeaturedRecipe" name="FeaturedRecipeTeaser">
	<xsl:variable name="RecipeURL" select="concat('##root##/Recipes/RecipeFull.aspx?RecipeID=',RecipeID)" />
		<h2>
			<a href="{$RecipeURL}">
				<xsl:text>Recipe of the Day</xsl:text>
			</a>
		</h2>
		<p>We offer different recipes each day. Try something new tonight!</p>
		<a href="{$RecipeURL}">
			<img alt="" src="{RecipeImageURL}" />
		</a>
		<p>
			<a href="{$RecipeURL}">
				<xsl:value-of select="RecipeTitle"/>
			</a>
		</p>
	</xsl:template>
</xsl:stylesheet>