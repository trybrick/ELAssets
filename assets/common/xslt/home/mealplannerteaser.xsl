<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/" name="MealPlannerTeaser">
		<div id="MealPlanner" class="home">
			<h2>
				<a href="/Recipes/MealPlannerFull.aspx">
					<xsl:text>Meal Planner</xsl:text>
				</a>
			</h2>
			<xsl:for-each select="//MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
				<xsl:sort select="DisplayOrderDate"/>
				<h3>
					<xsl:value-of select="DisplayDate"/>
				</h3>
				<ul>
					<xsl:for-each select="key('meals-by-date', DisplayDate)">
						<xsl:sort select="RecipeTitle"/>
						<li>
							<a>
								<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
								<xsl:value-of select="RecipeTitle"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>