<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/assets/common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:key name="meals-by-date" match="//MealPlannerList/MealPlanner" use="DisplayDate"/>

	<xsl:template match="/">
		<xsl:variable name="ChainID" select="//GenericChain/ChainID"/>
		<xsl:variable name="StoreID" select="//GenericStore/StoreID"/>
		<xsl:variable name="Domain" select="//GenericChain/PreferedHost"/>
		<xsl:variable name="ConsumerID" select="//GenericConsumer/ConsumerID"/>
		<xsl:variable name="EmailID" select="//EmailID"/>
		<xsl:variable name="EmailTemplateID" select="//EmailTemplates/EmailTemplate/EmailTemplateID"/>

		<!-- EXACT TARGET CODE FOR MAIN -->
		<xsl:call-template name="ExactTargetScript_NonPersonalized" />
							
		<body style="font-weight:normal; font-style:normal; font-family: Verdana, Arial, Helvetica, sans-serif; color:black; padding:0; vertical-align:top;">
			<STYLE type="text/css">
				a:link,
				a:visited,
				a:active			{color:#C02407;text-decoration:none;}
				a:hover				{color:#FF0000;text-decoration:underline;}
				p					{color:#000000; font-size:12px;}
			</STYLE>
			<div id="container" style="display:block; height:auto; width: 820px; margin-left:auto; margin-top:0px; margin-right:auto; border:0; padding:0; overflow:hidden;">
				<!-- BEGIN EMAIL HEADER -->
				<div id="secondary-navigation">
					<a>
						<xsl:attribute name="href">
							<xsl:call-template name="RedirectUrl">
								<xsl:with-param name="Destination" select="$Domain"/>
							</xsl:call-template>
						</xsl:attribute>
						<img id="src" border="0" src="{//ChainInformation/StoreEmailLogo}"/>
					</a>
				</div>
				<!-- END EMAIL HEADER -->
				<!-- BEGIN CONTENT -->
				<table id="content" width="820">
					<tbody>
						<tr>
							<td vAlign="top" colspan="3">
							<!-- Exact Target Main Store -->
							<xsl:call-template name="ExactTargetRetrieve_StoreContent" />
							</td>
							<td rowspan="5"><img src="https://upload.brickinc.net/elvs/common/blank.gif" alt="" border="0" width="15" /></td>
							<!-- RIGHT COLUMN -->
							<td valign="top" rowspan="5" width="210">
								<!-- Code to call the weekly ad html in Exact Target-->
								<xsl:call-template name="ExactTargetRetrieve_WeeklyAdContent" />
								<a>
									<xsl:attribute name="href">
										<xsl:call-template name="RedirectUrl">
											<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeVideos.aspx')"/>
										</xsl:call-template>
									</xsl:attribute>
									<img border="0">
										<xsl:attribute name="src">
											<xsl:value-of select="concat($Domain, '/Assets/Common/Images/recipe_video_ad.jpg')"/>
										</xsl:attribute>
									</img>
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="3"><hr /></td>
						</tr>
						<tr>
							<td colspan="3">
								<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 12px 0;font-weight:normal;color:#999999;font-size:36px;">Recipe Center</h2>
							</td>
						</tr>
						<tr>
							<!-- RECIPE SECTION -->
							<td valign="top">
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
									<a>
										<xsl:attribute name="href">
											<xsl:call-template name="RedirectUrl">
												<xsl:with-param name="Destination" select="$Domain"/>
											</xsl:call-template>
										</xsl:attribute>Recipe of the Day
									</a>
								</h3>
								<p style="text-align:center;">
									<a>
										<xsl:attribute name="href">
											<xsl:call-template name="RedirectUrl">
												<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
											</xsl:call-template>
										</xsl:attribute>
										<img id="src" border="0" src="{//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL}" style="margin:4px auto" width="120"/>
									</a>
								</p>
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0;font-weight:bold;color:#000000;font-size:12px;text-align:center;">
									<a>
										<xsl:attribute name="href">
											<xsl:call-template name="RedirectUrl">
												<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
											</xsl:call-template>
										</xsl:attribute>
										<xsl:value-of select="//RecipeData/GenericRecipe/Title"/>
									</a>
								</h3>
								<p style="text-align:center; margin-top:2px; color:#000000; font-size:12px;">
									<em>Click to view and print recipes, and<br/>to add ingredients to your shopping list.</em>
								</p>
								<p>
									<a>
										<xsl:attribute name="href">
											<xsl:call-template name="RedirectUrl">
												<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
											</xsl:call-template>
										</xsl:attribute>
									</a>
								</p>
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="$Domain"/>/Assets/Common/Images/pixel.gif</xsl:attribute>
									<xsl:attribute name="width">12</xsl:attribute>
								</img>
							</td>
							<!-- END RECIPE SECTION -->
							<td><img src="https://upload.brickinc.net/elvs/common/blank.gif" alt="" border="0" width="10" /></td>
							<!-- MEAL PLANNER -->
							<td valign="top">
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:left; width:100%;">
									<a>
									<xsl:attribute name="href">
										<xsl:call-template name="RedirectUrl">
											<xsl:with-param name="Destination" select="concat($Domain, '/recipes/MealsOfTheWeek.aspx')"/>
										</xsl:call-template>
									</xsl:attribute>Meal Planner</a>
								</h3>
								<xsl:for-each select="//MealPlannerList/MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
								<xsl:sort select="DisplayOrderDate" order="ascending"/>
								<h4 style="font-family:Georgia, 'Times New Roman', Times, serif; margin:0; padding:0; font-weight:bold; color:#000000; font-size:12px; text-align:left;">
									<xsl:value-of select="DisplayDate"/>
								</h4>
								<ul style="padding:0; margin:0; list-style-type:none;">								
									<xsl:for-each select="key('meals-by-date', DisplayDate)">
									<xsl:sort select="RecipeTitle"/>
										<li style="margin-left:10px; font-size:11px;">
											<a style="color: #333366;">
												<xsl:attribute name="href">
													<xsl:call-template name="RedirectUrl">
														<xsl:with-param name="Destination" select="RecipeURL"/>
													</xsl:call-template>
												</xsl:attribute>
												<xsl:value-of select="RecipeTitle" disable-output-escaping="yes"/>
											</a>
										</li>
									</xsl:for-each>
								</ul>
								</xsl:for-each>
							</td>
							<!-- END MEAL PLANNER -->
						</tr>
						<tr><td colspan="3"><hr /></td></tr>
						<!-- COOKING RESOURCES -->
						<tr>
							<td colspan="3">
								<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 12px 0;font-weight:normal;color:#999999;font-size:36px;">Cooking  Resources</h2>
							</td>
						</tr>
						<tr>
							<xsl:variable name="CookingTips" select="//FeaturedArticles/Article[ArticleTypeID = 3]"/>
							<xsl:variable name="FeaturedArticle" select="//FeaturedArticles/Article[ArticleTypeID = 2]"/>

							<xsl:variable name="FeaturedArticleURL">
								<xsl:call-template name="RedirectUrl">
									<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/Article.aspx?ArticleID=', $FeaturedArticle/ArticleID)"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:variable name="CookingTipsURL">
								<xsl:call-template name="RedirectUrl">
									<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/Article.aspx?ArticleID=', $CookingTips/ArticleID)"/>
								</xsl:call-template>
							</xsl:variable>
							<!-- FEATURED ARTICLE -->
							<td valign="top">
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="$FeaturedArticleURL"/>
									</xsl:attribute>Featured Article
								</a>
								</h3>
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; font-weight:bold; color:#000000; font-size:12px; text-align:center;">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="$FeaturedArticleURL"/>
										</xsl:attribute>
										<xsl:value-of select="$FeaturedArticle/Title"/>
									</a>
								</h3>
								<div align="center">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="$FeaturedArticleURL"/>
										</xsl:attribute>
										<img id="src" border="0" src="{$FeaturedArticle/ImageURL}" style="margin:4px auto"/>
									</a>
								</div>
								<p style="color:#000000; font-size:12px;text-align:center">
									<a>
										<xsl:attribute name="href">
										<xsl:value-of select="$FeaturedArticleURL"/>
										</xsl:attribute>Click to read &gt;&gt;
									</a>
								</p>
							</td>
							<!-- END FEATURED ARTICLE -->
							<td><img src="https://upload.brickinc.net/elvs/common/blank.gif" alt="" border="0" width="10" /></td>
							<!-- COOKING TIPS -->
							<td valign="top">
								<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
									<a>
									<xsl:attribute name="href">
										<xsl:value-of select="$CookingTipsURL"/>
									</xsl:attribute>Cooking Tips</a>
								</h2>
								<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; font-weight:bold; color:#000000; font-size:12px; text-align:center;">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="$CookingTipsURL"/>
										</xsl:attribute>
										<xsl:value-of select="$CookingTips/Title"/>
									</a>
								</h3>
								<div align="center">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="$CookingTipsURL"/>
										</xsl:attribute>
										<img id="src" border="0" src="{$CookingTips/ImageURL}" style="margin:4px auto"/>
									</a>
								</div>
								<p style="color:#000000; font-size:12px;text-align:center">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="$CookingTipsURL"/>
										</xsl:attribute>Click to read &gt;&gt;</a>
								</p>
							</td>
							<!-- END COOKING TIPS -->
						</tr>
					</tbody>
				</table>
				<!-- END CONTENT -->
				<!-- BEGIN AD-->
				<!--
				<table width="820">
					<tr>
						<td align="center">
							<a href="http://jelmar.com/experts/expertswomen1.htm">
								<img src="http://staticcontent.gsngrocers.com/Email/UploadFiles/Content/211/2011/4/4/728x90%20BK.gif" alt="728x90 Ad" width="728" height="90" />
							</a>						
						</td>
					</tr>
				</table>-->
				<!-- END AD-->
				<!-- BEGIN FOOTER -->
				<div id="footer">
					<!-- Code to call the footer display at exact target-->
					<xsl:call-template name="ExactTargetRetrieve_FooterContent" />
				</div>
				<!-- END FOOTER -->
			</div>
			<xsl:text disable-output-escaping="yes"><![CDATA[<custom name="opencounter" type="tracking" />]]></xsl:text>
		</body>
	</xsl:template>

	<xsl:template name="RedirectUrl">
		<xsl:param name="Destination"/>

		<xsl:value-of select="$Destination" />

	</xsl:template>
</xsl:stylesheet>