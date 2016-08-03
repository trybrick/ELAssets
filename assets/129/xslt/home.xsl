<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="div1">
			<div id="SplashContainer">
				<div id="AdPromo">
					<div id="AdPromoTop">
						<a href="Shop/WeeklyAd.aspx" title="Shop Our Weekly Ad">
							<img alt="Shop Our Weekly Ad" src="/Assets/129/Images/CWweeklyadALT2.jpg"/>
						</a>
					</div>
					<div id="AdPromoBot">
						<a href="http://www.facebook.com/CashWise" target="_blank" title="Join Us On Facebook">
							<img alt="Join Us On Facebook" src="/Assets/129/Images/AdPromoFB.jpg"/>
						</a>
					</div>
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="splashblocks" style="clear:both; float:left; width:910px; margin:0;">
				<div id="FeaturedRecipeTeaser">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>Recipe of the Day</a>
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
						<p>
							<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/Teaser"/>
						</p>
						<a>
							<xsl:attribute name="href">/Recipes/Article.aspx?ArticleID=<xsl:value-of select="//Article[ArticleTypeID = $ArticleTypeID]/ArticleID"/></xsl:attribute>more...</a>
					</div>
				</xsl:if>


				<div id="CobornsDelivers" style="margin:0; padding:0; width:auto; height:auto;">
					<a>
						<xsl:attribute name="href">http://www.cashwisedelivers.com/</xsl:attribute>
						<xsl:attribute name="target">_blank</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/129/Images/cwdeliv.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
							<xsl:attribute name="style">float:left; margin:0; padding:0; border:0;</xsl:attribute>
						</img>
					</a>
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=41</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/129/Images/cwdeliv_$4meds.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
							<xsl:attribute name="style">float:left; margin:0; padding:0; border:0;</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="StoreFooter">
				<img>
					<xsl:attribute name="src">/Assets/129/Images/coborns_footer.gif</xsl:attribute>
					<xsl:attribute name="border">0</xsl:attribute>
					<xsl:attribute name="usemap">#m_coborns_footer</xsl:attribute>
				</img>

				<map>
					<xsl:attribute name="name">m_coborns_footer</xsl:attribute>
					<xsl:attribute name="id">m_coborns_footer</xsl:attribute>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">749,0,803,63</xsl:attribute>
						<xsl:attribute name="href">/holiday-stations.aspx</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">646,0,724,63</xsl:attribute>
						<xsl:attribute name="href">/little-dukes.aspx</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">547,0,624,63</xsl:attribute>
						<xsl:attribute name="href">http://www.cashwise.com</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">424,0,531,63</xsl:attribute>
						<xsl:attribute name="href">http://www.coborns.com</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">821,0,910,63</xsl:attribute>
						<xsl:attribute name="href">/save-a-lot.aspx</xsl:attribute>
					</area>
				</map>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
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