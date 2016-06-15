<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="main" class="home">
			<div class="main-content" role="main">
				<div class="splash-image">
					<xsl:choose>
						<xsl:when test="string-length(//StaticContent[SortBy=0]/Image) &gt; 0">
							<img>
								<xsl:attribute name="alt"><xsl:value-of select="//StaticContent[SortBy=0]/Title" /></xsl:attribute>
								<xsl:attribute name="src"><xsl:value-of select="//StaticContent[SortBy=0]/Image" /></xsl:attribute>
							</img>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//StaticContent[SortBy=0]/Description" disable-output-escaping="yes" />
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<table id="home-departments" cell-spacing="0" border-collapse="collapse">
					<xsl:call-template name="DepartmentRow">
						<xsl:with-param name="Min" select="1" />
						<xsl:with-param name="Max" select="2" />
						<xsl:with-param name="Row" select="1" />
					</xsl:call-template>
					<xsl:call-template name="DepartmentRow">
						<xsl:with-param name="Min" select="3" />
						<xsl:with-param name="Max" select="4" />
						<xsl:with-param name="Row" select="2" />
					</xsl:call-template>
					<xsl:call-template name="DepartmentRow">
						<xsl:with-param name="Min" select="5" />
						<xsl:with-param name="Max" select="6" />
						<xsl:with-param name="Row" select="3" />
					</xsl:call-template>
				</table>
			</div>
			<div class="aside">
				<div class="section">
					<h2>
						<a href="Shop/WeeklyAd.aspx" title="View the current ad">
							<xsl:text>Weekly Ad</xsl:text>
						</a>
					</h2>
					<a href="Shop/WeeklyAd.aspx" title="View the current ad">
						<img src="Assets/188/Images/news_woman.jpg" alt="Image of woman reading weekly ad" />
					</a>
				</div>
				<div class="section">
					<h2>
						<a href="/StoreLocator.aspx">Locations</a>
					</h2>
					<a href="/StoreLocator.aspx">
						<img src="/Assets/188/Images/locations.jpg" alt="Image of local map"/>
					</a>
				</div>
				<div class="section featured-recipe">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeCenter.aspx?=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
							<xsl:text>Recipes</xsl:text>
						</a>
					</h2>
					<a class="recipe-image">
						<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<img alt="{concat('Image of featured recipe: ',//FeaturedRecipeList/FeaturedRecipe/RecipeTitle)}">
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
						</img>
						<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="DepartmentRow">
		<xsl:param name="Min" />
		<xsl:param name="Max" />
		<xsl:param name="Row" />
		<tr>
			<xsl:if test="$Row mod 2 &gt; 0">
				<xsl:attribute name="class">
					<xsl:text>alt</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:for-each select="//StaticContent[SortBy = $Min or SortBy = $Max]">
				<td valign="top"><xsl:value-of select="Description" disable-output-escaping="yes" /></td>
			</xsl:for-each>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>