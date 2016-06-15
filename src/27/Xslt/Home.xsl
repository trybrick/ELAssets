<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="home" class="main-wrapper">
			<div id="SplashContainer">
				<div id="AdPromo">
					<a href="Shop/WeeklyAd.aspx">
						<h2>Check Out our<br/>Weekly Ads!</h2>
					</a>
					<p>Click on the image below to view<br/>our weekly ads.</p>
					<a href="Shop/WeeklyAd.aspx">
						<xsl:choose>
							<xsl:when test="//CircularPageSummary[CircularTypeID = 1]">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:when test="//CircularPageSummary">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<div id="circularThumbnail">
									<img alt="Check Out Our Weekly Ads!" src="/Assets/Common/Images/CircularThumb.png"/>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</a>
					<table border="0" cellpadding="1">
						<tr>
						<td style="color: #e2383f;"><p>Follow Us On:</p></td>
							<td><a href="http://www.twitter.com/banksmarket" target="_blank">
									<img src="/Assets/27/Images/twitter.png"/>
								</a>
							</td>	
							<td><a href="http://www.facebook.com/banksmarket" target="_blank">
								<img src="/Assets/27/Images/facebook.png"/>
								</a>
							</td>		
						</tr>
					</table>
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="MealPlanner">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/MealPlannerFull.aspx</xsl:attribute>Meal Planner</a>
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
				<div class="features">
				<div id="FeaturedRecipeTeaser">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>Recipe of the Day</a>
					</h2>
					<p>We offer a different recipe each day. Try something new tonight!</p>
					<a>
						<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</a>
					<p>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</a>
					</p>
					
				</div>
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

				<div id="FeaturedArticleTeaser" style="height:210px">
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
			<div class="specialSlots">
				<div id="SpecialsSlotOne">
						<a href="/Page.aspx?Display=43">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/partyPlatter.png</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="SpecialsSlotTwo">
						<a href="/Page.aspx?Display=287">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/sushiLogo.png</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="SpecialsSlotThree">
						<a href="http://www.westkentuckystar.com/Living/Ro-s-Recipes.aspx" target="_blank">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/rosRecipes.png</xsl:attribute>
							</img>
						</a>
					</div>
					
				
				</div>
			</div>
			<div id="StoreFooter">
				
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>