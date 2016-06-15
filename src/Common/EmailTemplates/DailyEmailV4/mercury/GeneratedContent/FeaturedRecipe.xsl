<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<xsl:variable name="destination" select="concat('##root##/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
		<div id="podFeaturedRecipe" class="EmailPod">
			<h2>Featured Recipe</h2>
			<a href="{$destination}">
				<xsl:choose>
					<xsl:when test="string-length(//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL) &gt; 0">
						<img src="{//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL}" alt="Featured Recipe: {//RecipeData/GenericRecipe/Title}"/>
					</xsl:when>
					<xsl:otherwise>
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podFeatRecipe.jpg" alt="Featured Recipe"/>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
