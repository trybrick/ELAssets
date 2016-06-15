<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style>.contentTop {display:none;}</style>
        <div id="Home" class="home-main-wrapper">
			<xsl:call-template name="SlideShow"/>
			<div id="AdPromo">
				<h2 class="splashbox-title">Check Out Our Weekly Ads!</h2>
				<p>Click on the image below to view our weekly ads.</p>
				<a href="Shop/WeeklyAd.aspx">
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
				<div class="splashBox">
					<h2>Featured Article</h2>
					<div class="teaserContainer">
						<div class="leftTeaseContainer">
							<a class="moreLink">
								<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>
								<h3>
									<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Title"/>
								</h3>
								<p>
									<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Teaser"/>
								</p>
								<p><strong>View Article</strong></p>
							</a>
						</div>
						<div class="rightTeaseContainer">
							<xsl:if test="//Article[ArticleTypeID = $ArticleTypeID]/ImageURL!=''">
								<a>
									<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>
									<img>
										<xsl:attribute name="src">
											<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ImageURL"/>
										</xsl:attribute>
									</img>
								</a>
							</xsl:if>
						</div>
					</div>
				</div>
			</xsl:if>
			<div class="splashBox">
				<h2 class="splashbox-title">Coupons</h2>
				<div class="teaserContainer">
					<div class="leftTeaseContainer">
						<a href="/Shop/Coupons.aspx">
							<h3>##manufacturercoupontotalsavings## in Coupon Savings</h3>
							<p>Check out all of our manufacturer coupon savings</p>
							<p><strong>View Coupons</strong></p>
						</a>
					</div>
					<div class="rightTeaseContainer">
						<xsl:for-each select="//ArrayOfCoupon/Coupon">
							<xsl:if test="position() &lt; 2">
								<a href="/Shop/Coupons.aspx">
									<img alt="">
										<xsl:attribute name="src">
											<xsl:value-of select="ImageURL"/>
										</xsl:attribute>
									</img>
								</a>
							</xsl:if>
						</xsl:for-each>
						<!--</div>-->
					</div>
				</div>
			</div>
			<div class="splashBox">
				<h2 class="splashbox-title">Recipe of the Day</h2>
				<div class="teaserContainer">
					<div class="leftTeaseContainer">
						<a><xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<h3>
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</h3>
						<p>We offer a different recipe each day. Try something new tonight!</p>
						<p><strong>View Recipe</strong></p>
                        </a>
					</div>
					<div class="rightTeaseContainer">
						<!--<a class="splashBoxMainImg">-->
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
							<xsl:choose>
								<xsl:when test="string-length(//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL) &gt; 1">
									<img alt="">
										<xsl:attribute name="src">
											<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
										</xsl:attribute>
									</img>
								</xsl:when>
								<xsl:otherwise>
									<img alt="" src="/Assets/227/Images/no-img-recipe.jpg"/>
								</xsl:otherwise>
							</xsl:choose>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
