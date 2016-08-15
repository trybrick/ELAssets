<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:variable name="Recipe" select="//ExpressLane/RecipeData/GenericRecipe" />
		
		<div style="text-align:center;">
			<h3>
				Recipe of the Day
			</h3>
			
			<img  border="0" style="margin:4px auto" width="120" src="{ $Recipe/Images/RecipeImage/RecipeImageURL }"></img>
			
			<h5>
				<xsl:value-of select="$Recipe/Title" />
			</h5>
			
			<p>
				<em>Click to view and print recipes and add ingredients to your shopping list.</em>
			</p>
		</div>
	</xsl:template>
</xsl:stylesheet>