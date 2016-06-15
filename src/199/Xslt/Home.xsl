<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:import href="../../Common/Xslt/FeaturedRecipe.xsl"/>
	<xsl:import href="../../Common/Xslt/AdPod.xsl"/>
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/ActiveContent.js"></script>
		<script type="text/javascript" src="/Assets/199/Js/Home.js"></script>
		<div id="home" class="main-wrapper">
			<div class="main-content">
				<xsl:call-template name="SlideShow"/>
				<div class="home-module-wrapper group">
                    <xsl:for-each select="//Modules/Module">
						<xsl:call-template name="HomeModule" />
					</xsl:for-each>
				</div>
			</div>
			<div class="aside">
				<div id="AdPromo">
					<a href="Shop/WeeklyAd.aspx">
						<h2 style="color:#44494F;">Check Out</h2>
						<h2 style="color:#9E0B0F;">Our Current Ads!</h2>
					</a>
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
					<h3 style="margin:4px auto; text-align:center; font-size:15px;">
						<a href="/Shop/Coupons.aspx">Digital Coupons - Click Here</a>
					</h3>
                    <h3 style="margin:4px auto; text-align:center; font-size:15px;">
						<a href="recalls.aspx">Product Recalls - Click Here</a>
					</h3>
					<div style="float:left; margin-top:6px;">
						<a class="home_twitter" href="http://twitter.com/countrymartgroc" target="_blank">
							<img src="/Assets/199/Images/twitter_icon.gif" />
						</a>
						<a class="home_facebook" href="http://www.facebook.com/pages/Country-Mart-Stores/149297966997" target="_blank">
							<img src="/Assets/199/Images/facebook_icon.gif" />
						</a>
					</div>
				</div>
				<xsl:call-template name="RightColumn" />
			</div>
		</div>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="HomeModule" match="Module">
		<div>
			<xsl:attribute name="class">
				<xsl:text>home-module</xsl:text>
				<xsl:if test="position() mod 2 = 0">
					<xsl:text> alt</xsl:text>
				</xsl:if>
				<xsl:if test="string-length(Image) &gt; 0">
					<xsl:text> with-image</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@type = 'featuredRecipe'">
					<xsl:attribute name="id">
						<xsl:text>featured-recipe-teaser</xsl:text>
					</xsl:attribute>
					<xsl:apply-templates select="//FeaturedRecipeList"/>
				</xsl:when>
				<xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="@type = 'coupons'">
                            <h2>
                                <a href="/Shop/Coupons.aspx"><xsl:value-of select="Title"/></a>
                            </h2>
                        </xsl:when>
                        <xsl:otherwise>
                            <h2><xsl:value-of select="Title"/></h2>
                        </xsl:otherwise>
                    </xsl:choose>
					<div class="inner-text-wrap">
						<h3><xsl:value-of select="Subtitle"/></h3>
						<p><xsl:value-of select="Description"/></p>
					</div>
					<xsl:choose>
						<xsl:when test="@type = 'coupons'">
							<div class="savings-center">
								<xsl:for-each select="//Coupon[position() &lt; 4]">
									<img style="float:left; margin:0 4px; border:0; padding:0; width:80px; height:100px;">
										<xsl:attribute name="src">
											<xsl:value-of select="ImageURL"/>
										</xsl:attribute>
									</img>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="string-length(Image) &gt; 0">
								<img src="/Assets/##chainid##/Images/{Image}" alt="{Image/@alt}" border="0">
									<xsl:if test="string-length(Image/@width) &gt; 0">
										<xsl:attribute name="width">
											<xsl:value-of select="Image/@width" />
										</xsl:attribute>
									</xsl:if>
								</img>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<a class="more-link" href="{Url}">
						<xsl:choose>				
							<xsl:when test="@type = 'coupons'">
								<xsl:text>Save up to ##manufacturercoupontotalsavings##</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Learn More</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="RightColumn">
		<div class="quick search-module group">
			<h2>Quick Recipe Search</h2>
			<div id="PanelEasy" class="accordion-content">
				<div id="CtrlDivTextSearch">
					<p>Looking for recipes? You've come to the right place. We have more than 60,000 free recipes - all created, tested, reviewed by our experienced staff.</p>
					<input id="txtQuickSearch" runat="server" type="text" onkeypress="if (event.keyCode==13) RunQuickSearch(); return event.keyCode!=13;" />
					<a href="javascript:RunQuickSearch();" class="search">Search</a>
				</div>
			</div>
		</div>

		<div class="holiday search-module group">
			<h2>Search by occasion</h2>
			<div id="PanelHoliday" class="accordion-content">
				<p>Search by meal occasion</p>
				<select id="PanelHoliday_drpHoliday">
					<option value="">Holiday</option>
					<xsl:for-each select="//RecipeAdvancedSearchCategories/Holiday/RecipeCategory">
						<xsl:call-template name="AdvancedSearchCategory"/>
					</xsl:for-each>
				</select>
				<p>and by course</p>
				<select id="PanelHoliday_drpCourse">
					<option value="">Course</option>
					<xsl:for-each select="//RecipeAdvancedSearchCategories/Course/RecipeCategory">
						<xsl:call-template name="AdvancedSearchCategory"/>
					</xsl:for-each>
				</select>
				<a href="javascript:RunCategorySearch();" class="search">Search</a>
			</div>
		</div>
		<!-- recipe videos -->
		<div class="home-module group">
			<h2>Cooking Videos</h2>
			<h3>We offer dozens of videos on all facets of food preparation and cooking tips.</h3>
			<a href="/Recipes/RecipeVideos.aspx">
				<img src="/Assets/199/Images/cookingvideos.jpg" border="0"/>
			</a>
			<a class="more-link" href="/Recipes/RecipeVideos.aspx">
				<xsl:text>View Videos</xsl:text>
			</a>
		</div>
		<xsl:apply-templates select="ExpressLane/Common/ExternalAds">
			<xsl:with-param name="Tile" select="'1'"/>
		</xsl:apply-templates>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="AdvancedSearchCategory" match="RecipeCategory">
		<xsl:if test="IsActive = 'true'">
			<option>
				<xsl:attribute name="value">
					<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
				</xsl:attribute>
				<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
			</option>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>