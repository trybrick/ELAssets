<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate" />
	<xsl:template match="/">
		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment>
				<![CDATA[
     			function changeDIV(hide, show)
        		{
            		var d = new Object();
            		d = document.getElementById(hide);
            		d.style.display = "none";
                       
            		d = document.getElementById(show);
            		d.style.display = "";
        		}
				]]>
			</xsl:comment>
		</script>
		<div id="div1">
			<div id="SplashContainer">
				<div id="AdPromo">
					<a href="Shop/WeeklyAd.aspx">
						<h2>
							Check Out our<br/>Weekly Ads!
						</h2>
					</a>
					<p>
						Click on the image below to view<br/>our weekly ads.
					</p>
					<a href="Shop/WeeklyAd.aspx">
						<xsl:choose>
							<xsl:when test="//ArrayOfStoreCircularPage/StoreCircularPage[CircularTypeID = 1]">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//ArrayOfStoreCircularPage/StoreCircularPage[CircularTypeID = 1]/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:when test="//ArrayOfStoreCircularPage/StoreCircularPage">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//ArrayOfStoreCircularPage/StoreCircularPage/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:when test="//Circular/CircularPageCollection/CircularPage != ''">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//Circular/CircularPageCollection/CircularPage/SmallImageURL"/>
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
				<div id="SplashImage">
					<!--
					<object type="application/x-shockwave-flash" data="/Assets/51/Images/splash_movie.swf" width="100%" height="100%">
						<param name="movie" value="/Assets/51/Images/splash_movie.swf"/>
						<param name="wmode" value="transparent"/>
						<param name="menu" value="false"/>
					</object>
					<script type="text/javascript" src="Shared/js/ieupdate.js"></script>
				-->
					<img src="/Assets/51/Images/SplashImage.jpg"/>
				</div>
			</div>
			<div id="FeaturedRecipeTeaser">
				<h2>
					<a>
						<xsl:attribute name="href">
							##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="ExpressLane/Home/FeaturedRecipeList/FeaturedRecipe/RecipeID"/>
						</xsl:attribute>Recipe of the Day
					</a>
				</h2>
				<p>We offer a different recipe each day. Try something new tonight!</p>
				<a>
					<xsl:attribute name="href">
						##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="ExpressLane/Home/FeaturedRecipeList/FeaturedRecipe/RecipeID"/>
					</xsl:attribute>
					<img alt="">
						<xsl:attribute name="src">
							<xsl:value-of select="ExpressLane/Home/FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
						</xsl:attribute>
					</img>
				</a>
				<p>
					<a>
						<xsl:attribute name="href">
							##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="ExpressLane/Home/FeaturedRecipeList/FeaturedRecipe/RecipeID"/>
						</xsl:attribute>Chili-Carrot Soup
					</a>
				</p>
			</div>
			<div id="FeaturedArticleTeaser">
				<h2>
					<a>
						<xsl:attribute name="href">
							##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ExpressLane/Home/Article/ArticleID"/>
						</xsl:attribute>Healthy News
					</a>
				</h2>
				<p>Buyer's Guide: Summer Corn and Tomatoes</p>
				<a>
					<xsl:attribute name="href">
						##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ExpressLane/Home/Article/ArticleID"/>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ExpressLane/Home/Article/ImageURL"/>
						</xsl:attribute>
					</img>
				</a>
				<p>
					<xsl:value-of select="ExpressLane/Home/Article/Teaser"/>
				</p>
				<a>
					<xsl:attribute name="href">
						##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ExpressLane/Home/Article/ArticleID"/>
					</xsl:attribute>more...
				</a>
			</div>
			<div id="DualContentControlDiv">
				<div id="DualContentControlDivA">
					<a href="#" onclick="javascript:changeDIV('div1', 'div2');">
						<img src="/Assets/51/Images/instoreflyers.gif" alt=""/>
					</a>
				</div>
				<br/>
				<div id="DualContentControlDivB">
					<a href="#" onclick="javascript:changeDIV('div1', 'div3');">
						<img src="/Assets/51/Images/community_events.gif" alt=""/>
					</a>
				</div>
			</div>
			<div id="MealPlanner">
				<h2>
					<a>
						<xsl:attribute name="href">
							##root##/Recipes/MealPlannerFull.aspx
						</xsl:attribute>
						Meal Planner
					</a>
				</h2>

				<xsl:for-each select="//MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
					<xsl:sort select="DisplayOrderDate" />
					<h3>
						<xsl:value-of select="DisplayDate" />
					</h3>
					<ul>
						<xsl:for-each select="key('meals-by-date', DisplayDate)">
							<xsl:sort select="RecipeTitle" />
							<li>
								<a>
									<xsl:attribute name="href">
										##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/>
									</xsl:attribute>
									<xsl:value-of select="RecipeTitle"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:for-each>
			</div>
			<div id="StoreFooter">
				<a href="#" onclick="javascript:changeDIV('div1', 'div2');">
					<img src="/Assets/51/Images/AdPodBottom.jpg" alt=""/>
				</a>
			</div>
		</div>
		<div id="div2" style="display:none">
			<h2>There are no In-Store Specials currently available.</h2>
		</div>
		<div id="div3" style="display:none">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="h2">Discount Jack Loek's Theatre Tickets</td>
				</tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td valign="top" class="main">
						<center>
							<br/>
							<br/>
							<br/>
							<img>
								<xsl:attribute name="src">
									##root##/Assets/51/Images/jacklo1.jpg
								</xsl:attribute>
							</img>							
							<br/>
							<br/>
							<font size="4">
								<b>
									Purchase G.O.L.D. tickets from Plumb's and save $1.50 off<br/>
									the regular admission price. <u>Tickets currently sell for $6.50.</u>
								</b>
							</font>
							<br/>
							<br/>Tickets valid for any show.<br/><br/>
							Tickets good at Cinema Carousel - Muskegon, Studio 28 - Grand Rapids and other
							Jack Loek's Theatres.<br/><br/><font size="3" color="#ff0000">
								<b>
									Great for Birthdays, Holiday gifts, or for regular
									use.
								</b>
							</font>
						</center>
						<CENTER>
						</CENTER>
						<CENTER>
						</CENTER>
						<CENTER>
							<STRONG>
								<FONT size="4">Rent the Plumb's Hot Dog Wagon!</FONT>
							</STRONG>
						</CENTER>
						<CENTER>
							<STRONG>
								<FONT size="4">A great fund raiser for any organization!</FONT>
							</STRONG>
						</CENTER>
						<CENTER>
						</CENTER>
						<CENTER>
							Only $50.00 or Free with the purchase of $200.00 from a Plumbs store or the
							Sherman Blvd Save-A-Lot.
						</CENTER>
						<CENTER>
						</CENTER>
						<CENTER>
							Contact Mary or Glenn at the Plumb's corporate office at (231) 759-0918 for
							more details.
						</CENTER>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->