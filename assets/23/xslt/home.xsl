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
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="splashblocks">
				<div id="FeaturedRecipeTeaser">
					<xsl:variable name="RecipeURL" select="concat('/Recipes/RecipeFull.aspx?RecipeID=',//FeaturedRecipeList/FeaturedRecipe/RecipeID)" />
					<h2>
						<a href="{$RecipeURL}">
							<xsl:text>Recipe of the Day</xsl:text>
						</a>
					</h2>
					<p>We offer a different recipe each day. Try something new tonight!</p>
					<a href="{$RecipeURL}">
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</a>
					<p>
						<a href="{$RecipeURL}">
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</a>
					</p>
				</div>			
				<div id="pharmacists" style="border-style: none;">
					<a href="https://stores.healthmart.com/countymarketpharmacyWI/Login.aspx?ReturnUrl=%2fcountymarketpharmacyWI" target="_blank">
						<img alt="" src="/Assets/##chainid##/Images/hudsonpharm.png" />
					</a> 
				</div>
				<div id="valu2u" style="margin-left:20px; float:left; width:210px; height:210px;">
					<a target="_blank" href="http://holiday.rollbackrewards.com/consumer/Partner.action?partner=countymarkethudson">
						<img src="/Assets/23/Images/pumpperks.jpg" border="0"/>
					</a>
				</div>
				<div id="facebookLike" style="margin-left:20px; float:left; width:210px; height:210px;">
					<a target="_blank" href="https://www.facebook.com/CountyMarketHudson">
						<img src="/Assets/23/Images/home_facebook.jpg" border="0"/>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->