<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template name="FeaturedRecipeTeaser">
		<xsl:variable name="RecipeURL" select="concat('/Recipes/RecipeFull.aspx?RecipeID=',//FeaturedRecipeList/FeaturedRecipe/RecipeID)" />
		<div id="FeaturedRecipeTeaser">
			<h2>
				<a href="{$RecipeURL}">
					<xsl:text>Recipe of the Day</xsl:text>
				</a>
			</h2>
			<p>We offer a different recipe each day. Try something new tonight!</p>
			<xsl:if test="string-length(//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL) &gt; 0">
				<a href="{$RecipeURL}">
					<img alt="Recipe Image" src="{//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL}" />
				</a>
				<p>
					<a href="{$RecipeURL}">
						<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
					</a>
				</p>
			</xsl:if>
		</div>
	</xsl:template>	
</xsl:stylesheet>