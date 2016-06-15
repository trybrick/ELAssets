<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="consumer-recipe-list">
			<h2>
				<xsl:text>My Saved Recipe</xsl:text>
				<xsl:if test="count(//SavedRecipe) != 1">s</xsl:if>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="count(//SavedRecipe)"/>
				<xsl:text>) </xsl:text>
				<span style="font-size:13px; font-weight:normal; margin-left:4px; "> recipe(s) you have saved, sorted alphabetically by title below.</span>
			</h2>
			<xsl:choose>
				<xsl:when test="count(//SavedRecipe) &gt; 0">
					<ul>
						<xsl:for-each select="//SavedRecipe">
							<xsl:sort select="RecipeTitle" order="ascending"/>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat('/Recipes/RecipeFull.aspx?RecipeID=', RecipeID)"/>
									</xsl:attribute>
									<xsl:value-of select="RecipeTitle"/>
								</a>
								<br />
								<xsl:choose>
								<xsl:when test="Comment != ''">
									<dd>
										<p>
											<strong>My Comment: </strong>
											<i>
												<xsl:value-of select="Comment"/>
											</i>
										</p>
									</dd>
								</xsl:when>
								</xsl:choose>

							</li>
						</xsl:for-each>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<p>
						<strong>You do not have any saved recipes.</strong>
					</p>
					<p>
						<a href="/Recipes/RecipeCenter.aspx" class="BackLink">Back to Recipe Center</a>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<!--
 			Disable this feature until it is ready. 07/22/10

		<div class="consumer-recipe-list">
			<h2>
				<xsl:text>My Custom Recipe</xsl:text>
				<xsl:if test="count(//OwnRecipe) != 1">s</xsl:if>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="count(//OwnRecipe)"/>
				<xsl:text>) </xsl:text>
				<span style="font-size:13px; font-weight:normal; margin-left:4px; "> Recipes that you have created, sorted alphabetically by title below.</span>
			</h2>
			<xsl:choose>
				<xsl:when test="count(//OwnRecipe) &gt; 0">
					<ul>
						<xsl:for-each select="//ArrayOfOwnRecipe/OwnRecipe">
							<xsl:sort select="Title" data-type="text"/>
							<li>
								<a>
									<xsl:attribute name="href">/Recipes/OwnRecipeFull.aspx?RecipeID=<xsl:value-of select="OwnRecipeID"/></xsl:attribute>
									<xsl:value-of select="Title"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<p>
						<strong>You have not created any recipes.</strong>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<a class="button" href="/Recipes/AddRecipe.aspx">
			<span>Create a recipe</span>
		</a> -->
	</xsl:template>
</xsl:stylesheet>