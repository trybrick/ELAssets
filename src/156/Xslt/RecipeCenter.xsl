<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="FeaturedRecipe.xsl"/>
	<xsl:import href="ChangeDietaryPreferences.xsl"/>
	<xsl:import href="QuickSearch.xsl"/>
	<xsl:import href="TopRecipesTeaser.xsl"/>
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">

		<script src="/Assets/Common/Js/ActiveContent.js" type="text/javascript"/>

		<script type="text/javascript"><![CDATA[
			
			var isOpen = new Boolean(false);

			  function toggleQuickSearch(){
			    Element.toggleClassName('toggler2', 'accordion_toggle');
			    Element.toggleClassName('toggler2', 'accordion_toggle_active');
			    Effect.toggle('PanelQuick','blind', {duration: 1.0});
			}
			  function togglePanelTopRecipes(){
			    Element.toggleClassName('toggler3', 'accordion_toggle');
			    Element.toggleClassName('toggler3', 'accordion_toggle_active');
			    Effect.toggle('PanelTopRecipes','blind', {duration: 1.0});
			}
			]]>
		</script>

		<div id="SplashContainer" style="overflow:hidden; width:490px;">
			<img alt="">
				<xsl:attribute name="src">##root##/Assets/##chainid##/Images/Ucook_splash.jpg</xsl:attribute>
			</img>
		</div>




		<div id="RecipeVideoSplash">
			<h2 style="display:inline; margin-left:10px; width:490px; line-height:120%; float:left;">Featured Cooking Videos</h2>
			<div id="recipe1" style="text-align:center; width:24%; margin:0; padding:0; float:left; margin-left:10px; display:inline;">
				<h3>Avocados</h3>
				<p>
					<a>
						<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=GSN-Avocados</xsl:attribute>
						<xsl:attribute name="title">Avocados</xsl:attribute>
						<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
						<xsl:attribute name="style">text-decoration:none</xsl:attribute>
						<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
						<img src="/Assets/156/Images/video_avocados.gif" border="0"/>
						<br/>Play video</a>
				</p>
			</div>
			<div id="recipe2" style="text-align:center; width:24%; margin:0; padding:0; float:left;display:inline;">
				<h3>Brining</h3>
				<p>
					<a>
						<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=GSN-Brining</xsl:attribute>
						<xsl:attribute name="title">Brining</xsl:attribute>
						<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
						<xsl:attribute name="style">text-decoration:none</xsl:attribute>
						<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
						<img src="/Assets/156/Images/video_brining.gif" border="0"/>
						<br/>Play video</a>
				</p>
			</div>
			<div id="recipe3" style="text-align:center; width:24%; margin:0; padding:0; float:left;display:inline;">
				<h3>Grilling</h3>
				<p>
					<a>
						<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=GSN-Grilling Lamb Chops</xsl:attribute>
						<xsl:attribute name="title">Grilling</xsl:attribute>
						<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
						<xsl:attribute name="style">text-decoration:none</xsl:attribute>
						<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
						<img src="/Assets/156/Images/video_lambchops.gif" border="0"/>
						<br/>Play video</a>
				</p>
			</div>
			<div id="recipe4" style="text-align:center; width:24%; margin:0; padding:0; float:left;display:inline;">
				<h3>Peeling Tomatoes</h3>
				<p>
					<a>
						<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=GSN-Tomato Concasse</xsl:attribute>
						<xsl:attribute name="title">Peeling Tomatoes</xsl:attribute>
						<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
						<xsl:attribute name="style">text-decoration:none</xsl:attribute>
						<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
						<img src="/Assets/156/Images/video_tomatoes.gif" border="0"/>
						<br/>Play video</a>
				</p>
			</div>

			<p style="margin-left:10px;">
				<a href="##root##/Recipes/RecipeVideos.aspx">Click here to view all of our Cooking Video content</a>
			</p>
		</div>


		<div id="FoodContent">
			<h2>Food Content</h2>

			<div id="MealPlanner">
				<xsl:for-each select="/ExpressLane/FeaturedRecipeList/FeaturedRecipe">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="RecipeImageURL"/>
						</xsl:attribute>
					</img>
				</xsl:for-each>
				<div style="float:left; width:139px;">
					<h3>Meal Planner</h3>
					<ul>
						<xsl:for-each select="/ExpressLane/MealPlannerList/MealPlanner[position()&lt;4]">
							<li>
								<a>
									<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
									<xsl:value-of select="RecipeTitle"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
					<a>
						<xsl:attribute name="class">more</xsl:attribute>
						<xsl:attribute name="href">##root##/Recipes/MealPlannerFull.aspx</xsl:attribute>plan your whole week</a>
				</div>
				<div id="FeaturedArticleTeaserFooter"></div>
			</div>

			<xsl:for-each select="ExpressLane/FeaturedArticles/Article[position()&lt;3]">

				<div id="FeaturedArticleTeaser" class="recipe">
					<a>
						<xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageURL"/>
							</xsl:attribute>
						</img>
					</a>
					<div style="float:left; width:139px;">
						<h3>
							<xsl:if test="ArticleTypeID=1">Ask The Chef</xsl:if>
							<xsl:if test="ArticleTypeID=2">Featured Article</xsl:if>
							<xsl:if test="ArticleTypeID=3">Cooking Tips</xsl:if>
							<xsl:if test="ArticleTypeID=4">Kids Corner</xsl:if>
							<xsl:if test="ArticleTypeID=5">Sage Advice</xsl:if>
							<xsl:if test="ArticleTypeID=6">Featured Article</xsl:if>
							<xsl:if test="ArticleTypeID=7">Cookbook Review</xsl:if>
							<xsl:if test="ArticleTypeID=8">Upcoming Events</xsl:if>
							<xsl:if test="ArticleTypeID=''">Featured Article</xsl:if>
						</h3>
						<p>
							<xsl:value-of select="Teaser"/>
						</p>
						<a>
							<xsl:attribute name="class">more</xsl:attribute>
							<xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>read the entire article</a>
					</div>

					<xsl:if test="position()&lt;2">
						<div id="FeaturedArticleTeaserFooter"></div>
					</xsl:if>
				</div>
			</xsl:for-each>
		</div>

		<div id="couponTeaser" style="clear:none; width:250px;">

			<h2>savings center</h2>
			<h3>click for coupon savings!</h3>
			<p>Print brand name coupons and use them at your favorite store!</p>
			<xsl:for-each select="//ArrayOfCoupon/Coupon">
				<xsl:if test="position() &lt; 4">
					<img style="margin-left:3px;">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageURL"/>
						</xsl:attribute>
					</img>
				</xsl:if>
			</xsl:for-each>
			<br/>
			<a>
				<xsl:attribute name="href">##root##/Shop/Coupons.aspx</xsl:attribute>Save ##manufacturercoupontotalsavings##</a>
		</div>

		<div id="DailyRecipe">
			<xsl:apply-templates select="ExpressLane/FeaturedRecipeList"/>
		</div>
	</xsl:template>


	<xsl:template name="AdPod" match="ExternalAds">
		<xsl:param name="Tile"/>
		<xsl:param name="Request" select="AdPods/AdPod[Tile=$Tile]/Request"/>
		<xsl:if test="$Request">
			<div class="AdMaster">
				<iframe height="1" frameborder="0" width="1" scrolling="no" src="/Assets/Common/Images/pixel.gif" id="pixel"/>
				<iframe frameborder="0" scrolling="no">
					<xsl:attribute name="class">
						<xsl:value-of select="concat('adPodFrame', $Tile)"/>
					</xsl:attribute>
					<xsl:attribute name="src">
						<xsl:value-of select="$Request"/>
					</xsl:attribute>
				</iframe>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>