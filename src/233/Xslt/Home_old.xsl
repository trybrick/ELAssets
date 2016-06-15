<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="home" class="main-wrapper">
			<div id="SplashContainer">
				<div id="AdPromo">
					<a href="/Shop/WeeklyAd.aspx">
						<h2>Check Out our
							<br/>Weekly Ads!</h2>
					</a>
					<p>Click on the image below to view
						<br/>our weekly ads.</p>
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
				<xsl:call-template name="SlideShow" />
				<div id="splashblocks">
            		<div id="FeaturedRecipeTeaser">				
						<xsl:call-template name="RateThisRecipe"></xsl:call-template>            
					</div>
					<div id="DualContentControlDiv">
						<div id="DualContentControlDivA">
							<a href="/Page.aspx?Display=45">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_01.jpg</xsl:attribute>
								</img>
							</a>
						</div>
						<div id="DualContentControlDivB">
							<a href="/Page.aspx?Display=42">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_02.jpg</xsl:attribute>
								</img>
							</a>
						</div>
						<div id="DualContentControlDivB">
							<a href="/Page.aspx?Display=46">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_03.jpg</xsl:attribute>
								</img>
							</a>
						</div>
					</div>
					<div id="DualContentControlDiv2">
						<div id="DualContentControlDivA">
							<a href="/StoreLocator.aspx?StoreID=4040">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_04.jpg</xsl:attribute>
								</img>
							</a>
						</div>
						<div id="DualContentControlDivB">
							<a href="/StoreLocator.aspx?StoreID=765">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_05.jpg</xsl:attribute>
								</img>
							</a>
						</div>
						<div id="DualContentControlDivB">
							<a href="/Shop/Coupons.aspx">
								<img>
									<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/home_06.jpg</xsl:attribute>
								</img>
							</a>
						</div>
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
									<li value="0">
										<a>
											<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
											<xsl:value-of select="RecipeTitle"/>
										</a>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:for-each>
					</div>
				</div>
				<div id="StoreFooter">
					<table cellSpacing="0" cellPadding="0" width="820" border="0">
						<tbody>
							<tr>
								<td>
									<img height="1" src="/assets/common/images/spacer.gif" width="515" border="0"/>
								</td>
								<td>
									<img height="1" src="/assets/common/images/spacer.gif" width="75" border="0"/>
								</td>
								<td>
									<img height="1" src="/assets/common/images/spacer.gif" width="104" border="0"/>
								</td>
								<td>
									<img height="1" src="/assets/common/images/spacer.gif" width="126" border="0"/>
								</td>
								<td>
									<img height="1" src="/assets/common/images/spacer.gif" width="1" border="0"/>
								</td>
							</tr>
							<tr>
								<td>
									<img height="58" src="/assets/98/images/AdPodBottomMap_r1_c1.jpg" width="515" border="0" name="AdPodBottomMap_r1_c1"/>
								</td>
								<td>
									<a href="http://www.tomsofmaine.com" target="_blank">
										<img height="58" src="/assets/98/images/AdPodBottomMap_r1_c2.jpg" width="75" border="0" name="AdPodBottomMap_r1_c2"/>
									</a>
								</td>
								<td>
									<a href="http://www.boarshead.com" target="_blank">
										<img height="58" src="/assets/98/images/AdPodBottomMap_r1_c3.jpg" width="104" border="0" name="AdPodBottomMap_r1_c3"/>
									</a>
								</td>
								<td>
									<a href="http://www.euroroast.com" target="_blank">
										<img height="58" src="/assets/98/images/AdPodBottomMap_r1_c4.jpg" width="126" border="0" name="AdPodBottomMap_r1_c4"/>
									</a>
								</td>
								<td>
									<img height="58" src="/assets/common/images/spacer.gif" width="1" border="0"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->