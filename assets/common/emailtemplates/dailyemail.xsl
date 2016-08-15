<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:key name="meals-by-date" match="//MealPlannerList/MealPlanner" use="DisplayDate"/>

<xsl:template match="/">
	<xsl:variable name="ChainID" select="//GenericChain/ChainID" />
	<xsl:variable name="StoreID" select="//GenericStore/StoreID" />
	<xsl:variable name="Domain" select="//GenericChain/PreferedHost" />
	<xsl:variable name="ConsumerID"  select="//GenericConsumer/ConsumerID" />
	<xsl:variable name="EmailID" select="//EmailID" />
	<xsl:variable name="EmailTemplateID" select="//EmailTemplates/EmailTemplate/EmailTemplateID" />

		<body style="font-weight:normal; font-style:normal; font-family: Verdana, Arial, Helvetica, sans-serif; color:black; padding:0; vertical-align:top;">
			<STYLE type="text/css">
				a:link,
				a:visited,
				a:active			{color:#C02407;text-decoration:none;}
				a:hover				{color:#FF0000;text-decoration:underline;}
				p					{color:#000000; font-size:12px;}
			</STYLE>
		<div id="container" style="display:block; height:auto; width: 820px; margin-left:auto; margin-top:0px; margin-right:auto; border:0; padding:0; overflow:hidden;">
			<table>
				<tbody>
					<tr>
						<td>
							<table width="820">
						  		<tbody>
									<tr>
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:call-template name="RedirectUrl">
														<xsl:with-param name="Destination" select="$Domain" />
													</xsl:call-template>
												</xsl:attribute>
												<img id="src" border="0" src="{//ChainInformation/StoreEmailLogo}"/>
											</a>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<br />
			<table width="820">
				<tbody>
					<tr>
						<td vAlign="top" width="572">
							<!-- Start User Customize Section -->
							<table>
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:for-each select="//DynamicContents/DynamicContent">
														<tr>
															<td align="center">
																<div align="center" style="width:572px">
																<xsl:value-of select="Content" disable-output-escaping="yes"/>
																</div>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<!-- START recipe section -->
							<table width="100%" border="0" cellPadding="0" cellSpacing="0">
								<tbody>
									<tr>
										<td colSpan="3"><h1 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 12px 0;font-weight:normal;color:#999999;font-size:36px;border-bottom: 1px solid black;">Recipe Center</h1></td>
									</tr>
									<tr>
										<td class="subText" width="100%">
											<table width="100%" style="border:0; border-width:0; padding:0; vertical-align:top;">
												<tbody>
													<tr>
														<!--==      ROD                =-->
														<td width="45%" vAlign="top">
															<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
																<a>
																	<xsl:attribute name="href">
																		<xsl:call-template name="RedirectUrl">
																			<xsl:with-param name="Destination" select="$Domain" />
																		</xsl:call-template>
																	</xsl:attribute>
																	Recipe of the Day
																</a>
															</h2>
															<p align="center">
																<a>
																	<xsl:attribute name="href">
																		<xsl:call-template name="RedirectUrl">
																			<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)" />
																		</xsl:call-template>
																	</xsl:attribute>
																	<img id="src" border="0" src="{//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL}" width="120" style="margin:4px auto"/>
																</a>
															</p>
															<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0;font-weight:bold;color:#000000;font-size:12px;text-align:center;">
																<a>
																	<xsl:attribute name="href">
																		<xsl:call-template name="RedirectUrl">
																			<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)" />
																		</xsl:call-template>
																	</xsl:attribute>
																	<xsl:value-of select="//RecipeData/GenericRecipe/Title"/>
																</a>
															</h3>
															<p style="text-align:center; margin-top:2px; color:#000000; font-size:12px;">
																<em>
																	Click to view and print recipes, and<br />to add ingredients to your shopping list.
																</em>
															</p>
															<p>
																<a>
																	<xsl:attribute name="href">
																		<xsl:call-template name="RedirectUrl">
																			<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)" />
																		</xsl:call-template>
																	</xsl:attribute>
																</a>
															</p>
											          </td>
														<td width="10%">
															<img>
																<xsl:attribute name="src">
																	<xsl:value-of select="$Domain"/>/Assets/Common/Images/pixel.gif</xsl:attribute>
																<xsl:attribute name="width">
																	12
																</xsl:attribute>
															</img>
														</td>
													<!--== MealPlannerControlRecipeDiv =-->
													<td width="45%" vAlign="top">
														<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:left; width:100%;" >
															<a>
																<xsl:attribute name="href">
																	<xsl:call-template name="RedirectUrl">
																		<xsl:with-param name="Destination" select="concat($Domain, '/recipes/MealsOfTheWeek.aspx')" />
																	</xsl:call-template>
																</xsl:attribute>
																Meal Planner
															</a>
														</h2>
														<table style="border:0; border-width:0; padding:0; vertical-align:top; margin-left:12px; width:250px;">
															<tbody>
																<xsl:for-each select="//MealPlannerList/MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
																	<xsl:sort select="DisplayOrderDate" order="ascending"/>
																	<tr vAlign="top">
																		<td>
																			<h4 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0;font-weight:bold;color:#000000;font-size:12px;text-align:left;">
																				<xsl:value-of select="DisplayDate"/>
																			</h4>
																		</td>
																	</tr>
																	<xsl:for-each select="key('meals-by-date', DisplayDate)">
																		<xsl:sort select="RecipeTitle"/>
																		<tr vAlign="top">
																			<td>
																				<p style="font-size:12px;margin-left:12px;text-indent:-0.25em;color: #333366;">
																					<a style="color: #333366;">
																						<xsl:attribute name="href">
																							<xsl:call-template name="RedirectUrl">
																								<xsl:with-param name="Destination" select="RecipeURL" />
																							</xsl:call-template>
																						</xsl:attribute>
																						<xsl:value-of select="RecipeTitle" disable-output-escaping="yes"/>
																					</a>
																				</p>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:for-each>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
							</table>
	            			<br />
							<!-- end recipe card -->
							<table width="100%" border="0" cellPadding="0" cellSpacing="0">
								<xsl:variable name="CookingTips" select="//FeaturedArticles/Article[ArticleTypeID = 3]" />
								<xsl:variable name="FeaturedArticle" select="//FeaturedArticles/Article[ArticleTypeID = 2]" />

								<xsl:variable name="FeaturedArticleURL">
									<xsl:call-template name="RedirectUrl">
										<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/Article.aspx?ArticleID=', $FeaturedArticle/ArticleID)" />
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="CookingTipsURL">
									<xsl:call-template name="RedirectUrl">
										<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/Article.aspx?ArticleID=', $CookingTips/ArticleID)" />
									</xsl:call-template>
								</xsl:variable>
								<tbody>
									<tr>
										<td colspan="3" vAlign="top" class="rodbrdr">
											<h1 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 12px 0;font-weight:normal;color:#999999;font-size:36px;border-bottom: 1px solid black;">
												Cooking  Resources
											</h1>
										</td>
									</tr>
									<tr>
										<td width="45%" vAlign="top" class="rodbrdr">
											<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$FeaturedArticleURL" />
													</xsl:attribute>
													Featured Article
												</a>
											</h2>
											<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; font-weight:bold; color:#000000; font-size:12px; text-align:center;">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$FeaturedArticleURL" />
													</xsl:attribute>
													<xsl:value-of select="$FeaturedArticle/Title"/>
												</a>
											</h3>
											<div align="center">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$FeaturedArticleURL" />
													</xsl:attribute>
													<img id="src"  border="0" src="{$FeaturedArticle/ImageURL}" style="margin:4px auto"/>
												</a>
											</div>
											<p style="color:#000000; font-size:12px;text-align:center">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$FeaturedArticleURL" />
													</xsl:attribute>
													Click to read &gt;&gt;
												</a>
											</p>
										</td>
										<td width="10%">
											<img>
												<xsl:attribute name="src">
													<xsl:value-of select="concat($Domain, '/Assets/Common/Images/pixel.gif')"/></xsl:attribute>
												<xsl:attribute name="width">
													12
												</xsl:attribute>
											</img>         
										</td>
										<td width="45%" vAlign="top" class="rodbrdr">
											<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$CookingTipsURL" />
													</xsl:attribute>
													Cooking Tips
												</a>
											</h2>
											<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; font-weight:bold; color:#000000; font-size:12px; text-align:center;">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$CookingTipsURL" />
													</xsl:attribute>
													<xsl:value-of select="$CookingTips/Title"/>
												</a>
											</h3>
											<div align="center">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$CookingTipsURL" />
													</xsl:attribute>
													<img id="src"  border="0" src="{$CookingTips/ImageURL}" style="margin:4px auto"/>
												</a>
											</div>
											<p style="color:#000000; font-size:12px;text-align:center">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$CookingTipsURL" />
													</xsl:attribute>
													Click to read &gt;&gt;
												</a>											
                                      		</p>										
										</td>
									</tr>
								</tbody>
							</table>
						</td>                        
						<td width="28">
							<img>
								<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/pixel.gif')"/></xsl:attribute>
								<xsl:attribute name="width">18</xsl:attribute>
								<xsl:attribute name="border">0</xsl:attribute>
							</img>	
						</td>
						<!--==   Right Column   ==-->
						<td width="210" vAlign="top">
                        
							<!-- GSN Promo AdPod 210px
							<a>
								<xsl:attribute name="href">
									<xsl:call-template name="RedirectUrl">
										<xsl:with-param name="Destination" select="'http://www.tinyurl.com/y8rszhd/'" />
									</xsl:call-template>
								</xsl:attribute>
								<xsl:attribute name="target">_blank</xsl:attribute>
					      		<img>
									<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/Email_210px/210-cookbook-halloween.jpg')"/></xsl:attribute>
									<xsl:attribute name="border">0</xsl:attribute>
									<xsl:attribute name="style">210</xsl:attribute>
								</img>
							</a>
							<br />
							<br />
							 -->
                             			
							<table width="210" bgcolor="#FFFFCC" STYLE="border: medium double #C02407; border-collapse: separate; border-spacing: 10pt 5pt; padding:0; vertical-align:top;">
								<tr>
									<td>
										<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:6px 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">
											<a>
												<xsl:attribute name="href">
													<xsl:call-template name="RedirectUrl">
														<xsl:with-param name="Destination" select="concat($Domain, '/Shop/WeeklyAd.aspx')" />
													</xsl:call-template>
												</xsl:attribute>
												Check out our<br/>Weekly Ads!
											</a>
										</h2>
									<p align="center" style="text-align:center; color:#000000; font-size:12px;">
										Click on an item, find a &#160; <a>
											<xsl:attribute name="href">
												<xsl:call-template name="RedirectUrl">
													<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeCenter.aspx')" />
												</xsl:call-template>
											</xsl:attribute> recipe</a>&#160; to match, and create your own <a><xsl:attribute name="href">
												<xsl:call-template name="RedirectUrl">
													<xsl:with-param name="Destination" select="$Domain" />
												</xsl:call-template>
												</xsl:attribute> shopping list</a>. <br/>
                                        
										<xsl:variable name="Circular" select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>  
										<xsl:choose>
										<xsl:when test="$Circular">
											<a>
												<xsl:attribute name="href">
													<xsl:call-template name="RedirectUrl">
														<xsl:with-param name="Destination" select="concat($Domain, '/Shop/WeeklyAd.aspx')" />
													</xsl:call-template>
												</xsl:attribute>
												<img  border="0" src="{$Circular}" style="margin:12px auto"/>                                                                      
											</a>
											</xsl:when>
										<xsl:otherwise>
											<img>
												<xsl:attribute name="border">0</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/CircularThumb.png')"/></xsl:attribute>
												<xsl:attribute name="style">margin:12px auto</xsl:attribute>
											</img>
										</xsl:otherwise>
										</xsl:choose>
									</p>
								</td>
							</tr>
						</table>
						<br/>
						<!-- recipe videos.gif -->
						<a>
							<xsl:attribute name="href">
								<xsl:call-template name="RedirectUrl">
									<xsl:with-param name="Destination" select="concat($Domain, '/Recipes/RecipeVideos.aspx')" />
								</xsl:call-template>								
							</xsl:attribute>
	               		 	<img border="0" >
								<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/recipe_video_ad.jpg')"/></xsl:attribute>
							</img>
						</a>						
					</td>
				</tr>
				<tr>
					<td colspan="3" vAlign="top">
						<hr style="width:100%; height:1px; color:gray; border:0; background-color:gray; clear:both; margin:4px 0 4px 0;"/>
                    	<table width="100%">
							<tbody>
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" border="0" style="border:0; border-width:0; padding:0; vertical-align:top;">
											<tbody>
												<tr>
													<td>
														<small style="color:#000000; font-size:10px;">
															<img  border="0" src="{//ChainInformation/StoreSmallLogo}" align="left" style="margin-right:6px;"/>
															Email News is an opt-in, recurring email from 
															<strong>
																<xsl:value-of select="//GenericChain/ChainName"/>
															</strong>. This email address was obtained through e-mail sign up on our website located at
															<a>
																<xsl:attribute name="href">
																	<xsl:call-template name="RedirectUrl">
																		<xsl:with-param name="Destination" select="$Domain" />
																	</xsl:call-template>								
																</xsl:attribute>																	
																<xsl:value-of select="$Domain"/>
															</a>. Please direct any questions or comments about our service to our 
															<a>
																<xsl:attribute name="href">
																	<xsl:call-template name="RedirectUrl">
																		<xsl:with-param name="Destination" select="concat($Domain, '/contact/Default.aspx')" />
																	</xsl:call-template>	
																</xsl:attribute>
																Contact Us 
															</a>
															page. To view our privacy policy, 
															<a>
																<xsl:attribute name="href">
																	<xsl:call-template name="RedirectUrl">
																		<xsl:with-param name="Destination" select="concat($Domain, '/profile/PrivacyPolicy.aspx')" />
																	</xsl:call-template>	
																</xsl:attribute>
																click here</a>.															 
															If you would like to change your account in any way 
															<a>
																<xsl:attribute name="href">
																	<xsl:call-template name="RedirectUrl">
																		<xsl:with-param name="Destination" select="concat($Domain, '/profile/SignIn.aspx')" />
																	</xsl:call-template>	
																</xsl:attribute>
																click here</a> to log in and edit your profile settings.
															<!--
															or to unsubscribe, 
															<a>
																<xsl:attribute name="href">
																	<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/profile/Unsubscribe.aspx
																</xsl:attribute>
																click here
															</a>
														-->
														</small>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<hr style="width:100%; height:1px; color:gray; border:0; background-color:gray; clear:both; margin:4px 0 4px 0;"/>
					    <div align="center">
							<a>
								<xsl:attribute name="href">
									<xsl:call-template name="RedirectUrl">
										<xsl:with-param name="Destination" select="'http://www.groceryshopping.net'" />
									</xsl:call-template>
								</xsl:attribute>
								<xsl:attribute name="target">_blank</xsl:attribute>
					      		<img>
									<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/powered_by_gsn.gif')"/></xsl:attribute>
									<xsl:attribute name="border">0</xsl:attribute>
									<xsl:attribute name="style">margin:0 auto</xsl:attribute>
								</img>
							</a>
							<br/>			
			            </div>
					</td>
				</tr>
			</tbody>
	  	</table>
	</div>
</body>

</xsl:template>

<xsl:template name="RedirectUrl">
	<xsl:param name="Destination" />

	<xsl:variable name="ChainID" select="//GenericChain/ChainID" />
	<xsl:variable name="StoreID" select="//GenericStore/StoreID" />
	<xsl:variable name="Domain" select="//GenericChain/PreferedHost" />
	<xsl:variable name="ConsumerID" select="//GenericConsumer/ConsumerID" />
	<xsl:variable name="EmailID" select="//EmailID" />
	<xsl:value-of select="$Domain" />/EmailRedirect.aspx?redirect=<xsl:value-of select="$Destination"/>&amp;ChainID=<xsl:value-of select="$ChainID"/>&amp;StoreID=<xsl:value-of select="$StoreID"/>&amp;ConsumerID=<xsl:value-of select="$ConsumerID"/>&amp;EmailID=<xsl:value-of select="$EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="//EmailTemplates/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="//MealPlannerList/MealPlanner/DisplayDate"/>
</xsl:template>
</xsl:stylesheet>