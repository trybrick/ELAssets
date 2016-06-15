<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
	<xsl:variable name="FaceBookUrl" select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value" />
	<xsl:variable name="FaceBookIcon" select="//GenericChain/ChainSettings/Setting[SettingID=267]/Value" />
		<div id="home" class="main-wrapper">
			<div id="SplashContainer">
				<div id="AdPromo">
					<a id="WeeklyLink">
						<xsl:attribute name="href">Shop/WeeklyAd.aspx</xsl:attribute>
						<xsl:text>WEEKLY SPECIALS &gt;&gt;</xsl:text>
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
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="splashblocks">
				<div>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=41</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/Pharmacy.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=286</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/MobileApp.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
				<div>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=285</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/RewardsCard.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=56</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/PartyTray.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
				<div>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=42</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/GiftCard.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
				<div id="recOfTheDay">
					<a>
						<xsl:attribute name="href">/Recipes/RecipeCenter.aspx</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
							<xsl:attribute name="height">85px</xsl:attribute>
							<xsl:attribute name="style">margin:81px auto 0 auto;</xsl:attribute>
						</img>
					</a>
				</div>
				<div>
					<a>
						<xsl:attribute name="href">/Recipes/RecipeVideos.aspx</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/147/Images/video_center_link.gif</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="StoreFooter">
			
					<xsl:if test="string-length($FaceBookUrl) &gt; 0">
						<a id="headerFBIcon" href="{$FaceBookUrl}" target="_blank">
							<img alt="Find us on Facebook">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="string-length($FaceBookIcon) &gt; 0">
											<xsl:value-of select="$FaceBookIcon"/>
										</xsl:when>
										<xsl:otherwise>/Assets/Common/Images/SocialNetworking/facebook_badge.gif</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</xsl:if>
				
			
			
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
