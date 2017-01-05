<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:include href="OrderSlideShow.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="main-wrapper" id="Home">
			<script id="jsImage" language="javascript" type="text/javascript">
				<xsl:comment>
     			function changeDIV(hide, show)
        		{
            		var d = new Object();
            		d = document.getElementById(hide);
            		d.style.display = "none";
                       
            		d = document.getElementById(show);
            		d.style.display = "";
        		}
				</xsl:comment>
			</script>
			<div id="SplashContainer">
				<div id="SplashImage">
					<xsl:call-template name="SlideShow"/>
				</div>
			</div>
			<div id="AdPromo">
				<h3>Weekly Ad</h3>
				<a href="/Shop/WeeklyAd.aspx">
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
			</div>
			<div class="splashBox" id="EmailsPromo">
				<h3>Get Our Emails</h3>
				<img alt="Click here to signup for email" height="51" src="/Assets/228/Images/envelope.png" style="margin: 0 auto;" width="116"/>
				<h4 style="text-align:center; margin: 15px auto 0 auto; float:none;">
					<a href="../Profile/SignUp.aspx">Click here to sign up for email</a>
				</h4>
			</div>
			<div class="splashBox" id="CouponPromo">
				<h3>Coupon Center</h3>
				<xsl:for-each select="//ArrayOfCoupon/Coupon">
					<xsl:if test="position() &lt; 2">
						<a href="/Shop/Coupons.aspx">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageURL"/>
								</xsl:attribute>
							</img>
						</a>
					</xsl:if>
				</xsl:for-each>
				<p>
					<a>
						<xsl:attribute name="href">/Shop/Coupons.aspx</xsl:attribute>
						<xsl:text>Coupon Savings</xsl:text>
					</a>
				</p>
			</div>
			<div class="splashBox" id="RecipePromo">
				<h3>Recipe of the Day</h3>
				<a class="home-recipe-link">
					<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
					<img alt="Recipe of the Day">
						<xsl:attribute name="src">
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
						</xsl:attribute>
						<xsl:attribute name="class">
							home-recipe-image
						</xsl:attribute>
					</img>
				</a>
				<p>
					<a>
						<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						<xsl:text>.</xsl:text>
					</a>
				</p>
			</div>
			<div class="splashBox" id="OnlineOrdering">
				<h3>Online Ordering</h3>
				<a class="orderSlideContainer" href="/online-ordering.aspx">
					<xsl:call-template name="OrderSlideShow"/>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
