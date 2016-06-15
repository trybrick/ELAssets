<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="Home" class="main-wrapper">
			<xsl:call-template name="SlideShow"/>
			
			<div id="AdPromo">
				<h2 class="splashbox-title">Check Out Our Weekly Ads!</h2>
				<p>Click on the image below to view our weekly ads.</p>
				<a href="Shop/WeeklyAd.gsn">
					<img alt="Check Out Our Weekly Ads!">
						<xsl:attribute name="src">
							<xsl:choose>
								<xsl:when test="string-length(//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl) &gt; 0">
									<xsl:value-of select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>
								</xsl:when>
								<xsl:when test="string-length(//CircularPageSummary/SmallImageUrl) &gt; 0">
									<xsl:value-of select="//CircularPageSummary/SmallImageUrl"/>
								</xsl:when>
								<xsl:otherwise>/Assets/Common/Images/CircularThumb.png</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</img>
				</a>
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
			<xsl:if test="number($ArticleTypeID)">
				<div id="FeaturedArticleTeaser">
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
					<p>
						<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Teaser"/>
					</p>
					<a class="moreLink"><xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>
                    	more...
                    </a>
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
				</div>
			</xsl:if>
						
			<div class="splashBox">
				<h2 class="splashbox-title">Coupons</h2>
				<p>Check out all of our coupon savings.</p>
				<a href="/Shop/Coupons.gsn" class="arrow-link">View Coupons</a>
                <div id="home-coupon-list">
					<xsl:for-each select="//ArrayOfCoupon/Coupon">
						<xsl:if test="position() &lt; 3">
							<a href="/Shop/Coupons.gsn">
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="ImageURL"/>
									</xsl:attribute>
								</img>
							</a>
						</xsl:if>
					</xsl:for-each>
				</div>
			</div>
            
            <div class="splashBox">
				<h2 class="splashbox-title">Recipe of the Day</h2>
				<p>
					<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
					<xsl:text>. </xsl:text>
				</p>
				<a>
					<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
					<xsl:attribute name="class">arrow-link</xsl:attribute>View Recipe
				</a>
                <a class="splashBoxMainImg">
					<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
					<xsl:choose>
						<xsl:when test="string-length(//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL) &gt; 1">
							<img alt="Recipe Image" style="margin: 0 auto;" height="125">
								<xsl:attribute name="src">
									<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
								</xsl:attribute>
							</img>
						</xsl:when>
						<xsl:otherwise>
							<img alt="" src="/Assets/227/Images/no-img-recipe.jpg" style="margin: 0 auto;" height="125"/>
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</div>
			
		</div>
	</xsl:template>
</xsl:stylesheet>