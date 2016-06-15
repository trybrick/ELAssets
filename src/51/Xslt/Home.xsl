<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
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
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="FeaturedRecipeTeaser" class="teaser">
				<h2>
					<a><xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>Recipe of the Day</a>
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
			<div id="DualContentControlDiv">
				<div id="DualContentControlDivA">
					<a href="/Page.aspx?Display=44" title="View our signature items">
						<img alt="Signature Items Button" src="/Assets/##chainid##/Images/SignatureItems.jpg"/>
					</a>
				</div>
				<br/>
				<div id="DualContentControlDivB">
					<a href="/Page.aspx?Display=36">
						<img alt="Community Events Button" src="/Assets/##chainid##/Images/community_events.jpg"/>
					</a>
				</div>
			</div>
			<div id="DualContentControlDiv2">
				<div id="DualContentControlDivA">
					<a href="/Page.aspx?Display=43">
						<img alt="Deli Trays Button" src="/Assets/##chainid##/Images/deli_trays.jpg"/>
					</a>
				</div>
				<br/>
				<div id="DualContentControlDivB">
					<a href="/Page.aspx?Display=48">
						<img alt="Daily Menu Button" src="/Assets/##chainid##/Images/daily_menu.jpg"/>
					</a>
				</div>
			</div>
			<div id="MealPlanner">
				<h2>
					<a href="/Recipes/MealPlannerFull.aspx">Meal Planner</a>
				</h2>
				<xsl:for-each select="//MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
					<xsl:sort select="DisplayOrderDate"/>
					<h3>
						<xsl:value-of select="DisplayDate"/>
					</h3>
					<ul>
						<xsl:for-each select="key('meals-by-date', DisplayDate)">
							<xsl:sort select="RecipeTitle"/>
							<li value="0">
								<a href="{concat('/Recipes/RecipeFull.aspx?RecipeID=', RecipeID)}">
									<xsl:value-of select="RecipeTitle"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:for-each>
			</div>
			<div class="footer">
				<div class="footer-left">
					<!-- <a href="/tools-for-schools.aspx" target="_blank">
						<img src="/Assets/##chainid##/Images/footer-toolsforschools.jpg" alt="Tools for Schools Information"/>
					</a> -->
				</div>
				<div class="footer-middle">
					<a href="https://plumbsmarket.reachoffers.com/" target="_blank">
						<img src="/Assets/##chainid##/Images/footer-reachoffers.jpg" alt="Reach Offers"/>
					</a>
				</div>
				<div class="footer-middle">
					<a href="http://www.turntospartan.com" target="_blank">
						<img src="/Assets/##chainid##/Images/footer-spartan.jpg" alt="Spartan Brands"/>
					</a>
				</div>				
			</div>
			<div class="footer">
				<a href="/Page.aspx?display=63">
					<img alt="">
						<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/AdPodBottom.jpg</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
