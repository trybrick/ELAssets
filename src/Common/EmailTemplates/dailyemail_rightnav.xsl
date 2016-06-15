<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="http://villagemarket.beta.groceryshopping.net/Assets/98/XmlData/EmailID-4.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" encoding="UTF-8"/>

	<xsl:key name="meals-by-date" match="EmailContents/MealPlanner" use="DisplayDate"/>

	<xsl:template match="/">

		<html>
			<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0" bgcolor="#cccccc">

				<STYLE>.headerTop { background-color:#FFCC66; border-top:0px solid #000000; border-bottom:1px solid #FFFFFF; text-align:center; }
 .adminText { font-size:10px; color:#996600; line-height:200%; font-family:verdana; text-decoration:none; }
 .headerBar { background-color:#FFFFFF; border-top:0px solid #333333; border-bottom:10px solid #FFFFFF; }
 .title { font-size:20px; font-weight:bold; color:#CC6600; font-family:arial; line-height:110%; }
 .subTitle { font-size:11px; font-weight:normal; color:#666666; font-style:italic; font-family:arial; }
 td { font-size:12px; color:#000000; line-height:150%; font-family:trebuchet ms; }
 .sideColumn { background-color:#FFFFFF; border-left:1px dashed #CCCCCC; text-align:left; }
 .sideColumnText { font-size:11px; font-weight:normal; color:#999999; font-family:arial; line-height:150%; }
 .sideColumnTitle { font-size:15px; font-weight:bold; color:#333333; font-family:arial; line-height:150%; }
 .footerRow { background-color:#FFFFCC; border-top:10px solid #FFFFFF; }
 .footerText { font-size:10px; color:#996600; line-height:100%; font-family:verdana; }
 a { color:#FF6600; color:#FF6600; color:#FF6600; }</STYLE>

				<xsl:variable name="emailDate">
					<xsl:for-each select="EmailContents/MealPlanner">
						<xsl:sort select="DisplayOrderDate" order="ascending"/>
						<xsl:if test="position() = 1">
							<xsl:value-of select="DisplayDate"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>


				<table width="100%" cellpadding="10" cellspacing="0" bgcolor="#cccccc">
					<tr>
						<td valign="top" align="center">

							<table width="600" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="border-collapse:collapse;">

								<tr>
									<td colspan="2" align="left" valign="middle" style="background-color:#FFFFFF;border-top:0px solid #333333;border-bottom:10px solid #FFFFFF;">
										<center>

											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>


												<xsl:choose>
													<xsl:when test="//ChainSettings/Setting[Name='EmailHeader600px']/Value != ''">
														<img>
															<xsl:attribute name="id">src</xsl:attribute>
															<xsl:attribute name="border">0</xsl:attribute>
															<xsl:attribute name="style">margin:0</xsl:attribute>
															<xsl:attribute name="src">
																<xsl:value-of select="//ChainSettings/Setting[Name='EmailHeader600px']/Value"/>
															</xsl:attribute>
															<xsl:attribute name="width">600</xsl:attribute>
														</img>
													</xsl:when>
													<xsl:otherwise>
														<img>
															<xsl:attribute name="id">src</xsl:attribute>
															<xsl:attribute name="border">0</xsl:attribute>
															<xsl:attribute name="style">margin:0</xsl:attribute>
															<xsl:attribute name="src">http://villagemarket.beta.groceryshopping.net/Assets/Common/Images/generic_email_header.jpg</xsl:attribute>
															<xsl:attribute name="width">600</xsl:attribute>
														</img>
													</xsl:otherwise>
												</xsl:choose>
											</a>
										</center>
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px dashed #999999; padding-bottom:6px;">
										<span style="text-transform:lowercase; margin:0 20px;  font-size:15px;font-weight:bold;color:#999999;font-family:arial;line-height:150%;">
											<xsl:value-of select="EmailContents/ChainInfo/ChainName"/>email news</span>
									</td>
									<td align="right" style="border-bottom:1px dashed #999999; padding-bottom:6px;">
										<span style="text-transform:lowercase; margin:0 20px;  font-size:15px;font-weight:bold;color:#999999;font-family:arial;line-height:150%;">
											<xsl:value-of select="$emailDate"/>
										</span>
									</td>
								</tr>
							</table>

							<table width="600" cellpadding="20" cellspacing="0" bgcolor="#FFFFFF">

								<!-- BANNER ADS GONNA GO HERE -->

								<tr>
									<td colspan="2">
										<center>
											<img src="http://codesascii.com/images/advertiseHereBanner468x60.jpg" border="0"/>
										</center>
									</td>
								</tr>

								<!-- STATIC CONTENT FROM CHAINS -->

								<xsl:for-each select="EmailContents/DynamicContent">
									<tr>
										<td colspan="2" align="center">
											<div align="center">
												<xsl:value-of select="EmailContent" disable-output-escaping="yes"/>
											</div>
										</td>
									</tr>
								</xsl:for-each>


								<tr>

									<td bgcolor="#FFFFFF" width="425" valign="top" style="font-size:12px;color:#000000;line-height:150%;font-family:trebuchet ms;">


										<xsl:choose>

											<xsl:when test="substring($emailDate,1,3) = 'Mon'">
												<!-- Recipe of the Day -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Recipe of the Day:</span>
													<br/>
													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
														<xsl:value-of select="//RecipeData/GenericRecipe/Title"/>
													</span>
													<br/>
													<br/>

													<xsl:if test="//RecipeData/GenericRecipe/Images/RecipeImage">
														<img align="right" border="0" width="120" style="margin-left:12px;">
															<xsl:attribute name="src">
																<xsl:value-of select="//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL"/>
															</xsl:attribute>
														</img>
													</xsl:if>

													<strong>Ingredients</strong>
													<ul>
														<xsl:for-each select="//RecipeData/GenericRecipe/Ingredients/GenericRecipeIngredient">
															<xsl:sort select="DisplayOrder" data-type="number"/>
															<li>
																<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
															</li>
														</xsl:for-each>
													</ul>
													<strong>Preparation</strong>
													<br/>
													<xsl:for-each select="//RecipeData/GenericRecipe/Instructions/RecipeInstruction">
														<xsl:sort select="DisplayOrder" data-type="number"/>
														<xsl:value-of select="RecipeInstructionDescription" disable-output-escaping="yes"/>
														<br/>
														<br/>
													</xsl:for-each>
													<br/>
													<strong>Yield</strong>
													<br/>
													<xsl:value-of select="//RecipeData/GenericRecipe/YieldText"/>
													<br/>

													<xsl:if test="//RecipeData/GenericRecipe/PrepTime != '0' or //RecipeData/GenericRecipe/CookTime != '0'">
														<strong>Cook Time</strong>
														<br/>
														<xsl:if test="PrepTime != '0'">Prep Time: <xsl:value-of select="//RecipeData/GenericRecipe/PrepTime"/> mins. <br/></xsl:if>
														<xsl:if test="CookTime != '0'">Cook Time: <xsl:value-of select="//RecipeData/GenericRecipe/CookTime"/> mins. <br/></xsl:if>
														<xsl:if test="//RecipeData/GenericRecipe/EstimatedTime != '0'">Estimated Time: <xsl:value-of select="//RecipeData/GenericRecipe/EstimatedTime"/> mins. <br/></xsl:if>
														<xsl:if test="//RecipeData/GenericRecipe/TotalTime != '0'">Total Cooking Time: <xsl:value-of select="//RecipeData/GenericRecipe/TotalTime"/> mins. <br/></xsl:if>
													</xsl:if>
												</p>
											</xsl:when>

											<xsl:when test="substring($emailDate,1,3) = 'Tue'">
												<!-- Featured Article -->
												<p>
													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Featured Article:</span>
													<br/>

													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
														<a style="text-decoration:none">
															<xsl:attribute name="href">
																<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='2']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>

															<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='2']/Title" disable-output-escaping="yes"/>
														</a>
													</span>
													<br/>
													<a style="text-decoration:none">
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='2']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
														<img id="src" border="0" src="{EmailContents/FeaturedArticles/Article[ArticleTypeID='2']/ImageURL}" align="right"/>
													</a>
													<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='2']/Body" disable-output-escaping="yes"/>
												</p>
											</xsl:when>

											<xsl:when test="substring($emailDate,1,3) = 'Wed'">
												<!-- Ask the Chef -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Ask The Chef:</span>
													<br/>
													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
														<a style="text-decoration:none">
															<xsl:attribute name="href">
																<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='1']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
															<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='1']/Title" disable-output-escaping="yes"/>
														</a>
													</span>
													<br/>
													<a style="text-decoration:none">
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='1']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
														<img id="src" border="0" src="{EmailContents/FeaturedArticles/Article[ArticleTypeID='1']/ImageURL}" align="right"/>
													</a>
													<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='1']/Body" disable-output-escaping="yes"/>
												</p>
											</xsl:when>

											<xsl:when test="substring($emailDate,1,3) = 'Thu'">
												<!-- Cooking Tips -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Cooking Tips:</span>
													<br/>
													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
														<a style="text-decoration:none">
															<xsl:attribute name="href">
																<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='3']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
															<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='3']/Title" disable-output-escaping="yes"/>
														</a>
													</span>
													<br/>
													<a style="text-decoration:none">
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/Article.aspx?ArticleID=<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='3']/ArticleID"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
														<img id="src" border="0" src="{EmailContents/FeaturedArticles/Article[ArticleTypeID='3']/ImageURL}" align="right"/>
													</a>
													<xsl:value-of select="EmailContents/FeaturedArticles/Article[ArticleTypeID='3']/Body" disable-output-escaping="yes"/>
												</p>
											</xsl:when>



											<xsl:when test="substring($emailDate,1,3) = 'Fri' and //WineConnectWineList !='' ">
												<!-- Wine Matches for the Week -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">This Week's Featured Wine:</span>
													<br/>




													<xsl:for-each select="//WineConnectWineList/WineData[position()=1]">


														<h2>
															<xsl:value-of select="WineAttributes/WineName"/>
														</h2>


														<xsl:variable name="winegraphic" select="WineImages/File"/>
														<img>
															<xsl:attribute name="align">right</xsl:attribute>
															<xsl:attribute name="src">http://images.wineconnect.com/ImageLibrary/ImageHandler.ashx?imageid=<xsl:value-of select="translate(substring($winegraphic, 31),'.JPG','')"/>&amp;height=200&amp;width=150</xsl:attribute>
														</img>




														<table width="210">
															<tr>
																<td colspan="2" valign="top">
																	<h3>Attributes:</h3>
																</td>
															</tr>
															<xsl:if test="WineAttributes/Producer !=''">
																<tr>
																	<td width="70" valign="top">Producer:</td>
																	<td valign="top">
																		<p>
																			<xsl:value-of select="WineAttributes/Producer"/>
																		</p>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="WineAttributes/Region !=''">
																<tr>
																	<td width="70" valign="top">Region:</td>
																	<td valign="top">
																		<p>
																			<xsl:value-of select="WineAttributes/Region"/>
																		</p>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="WineAttributes/Varietal !=''">
																<tr>
																	<td width="70" valign="top">Varietal:</td>
																	<td valign="top">
																		<p>
																			<xsl:value-of select="WineAttributes/Varietal"/>
																		</p>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="WineAttributes/BottleSize !=''">
																<tr>
																	<td width="70" valign="top">Bottle Size:</td>
																	<td valign="top">
																		<p>
																			<xsl:value-of select="WineAttributes/BottleSize"/>
																		</p>
																	</td>
																</tr>
															</xsl:if>
															<xsl:for-each select="WineDescription[position()=1]">
																<tr>
																	<td colspan="2" valign="top">
																		<a name="ratings"></a>
																		<strong>
																			<xsl:value-of select="Vintage"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="Source"/>Rating: <xsl:value-of select="Rating"/></strong>
																	</td>
																</tr>
															</xsl:for-each>
														</table>

														<!--
                           <table width="100%">
                           
							<xsl:for-each select="WineDescription[position()=1]">
                                <xsl:if test="Acidity !=''">
									<tr>
										<td class="winedetailbold" width="100">Acidity:</td>
										<td>
											<p>
												<xsl:value-of select="Acidity"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Aromas !=''">
									<tr>
										<td class="winedetailbold" width="100">Aromas:</td>
										<td>
											<p>
												<xsl:value-of select="Aromas"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Body !=''">
									<tr>
										<td class="winedetailbold" width="100">Body:</td>
										<td>
											<p>
												<xsl:value-of select="Body"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Complexity !=''">
									<tr>
										<td class="winedetailbold" width="100">Complexity:</td>
										<td>
											<p>
												<xsl:value-of select="Complexity"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Compliments !=''">
									<tr>
										<td class="winedetailbold" width="100">Compliments:</td>
										<td>
											<p>
												<xsl:value-of select="Compliments"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Flavors !=''">
									<tr>
										<td class="winedetailbold" width="100">Flavors:</td>
										<td>
											<p>
												<xsl:value-of select="Flavors"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Fruit !=''">
									<tr>
										<td class="winedetailbold" width="100">Fruit:</td>
										<td>
											<p>
												<xsl:value-of select="Fruit"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Texture !=''">
									<tr>
										<td class="winedetailbold" width="100">Texture:</td>
										<td>
											<p>
												<xsl:value-of select="Texture"/>
											</p>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
                            </table>
                                -->


														<table width="100%">

															<tr>
																<td colspan="2" valign="top">
																	<a name="foodmatches"/>
																	<h3>Goes well with:</h3>
																</td>
															</tr>
															<xsl:for-each select="FoodMatches[not(CategoryName=preceding-sibling::FoodMatches/CategoryName)]">
																<xsl:sort select="CategoryName"/>
																<xsl:call-template name="FoodMatch">
																	<xsl:with-param name="CategoryName" select="CategoryName"/>
																	<xsl:with-param name="WineDataNode" select="parent::node()"/>
																</xsl:call-template>
															</xsl:for-each>
															<tr>
																<td colspan="2" valign="top">
																	<xsl:for-each select="WineTerms/WineTerm">
																		<br/>
																		<xsl:if test="Name !=''">
																			<h3>
																				<a name="wineterms"/>
																				<xsl:value-of select="Name"/>:</h3>
																		</xsl:if>
																		<xsl:if test="Definition !=''">
																			<p>
																				<xsl:value-of select="Definition"/>
																			</p>
																		</xsl:if>
																	</xsl:for-each>
																</td>
															</tr>
														</table>
													</xsl:for-each>
												</p>
											</xsl:when>

											<xsl:when test="substring($emailDate,1,3) = 'Sat'">
												<!-- Recipe Videos -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">The Cooking Channel:</span>
													<br/>
													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
														<a style="text-decoration:none">
															<xsl:attribute name="href">
																<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/RecipeVideos.aspx</xsl:attribute>
															<xsl:value-of select="//ArrayOfVideo/Video/Title" disable-output-escaping="yes"/>
														</a>
													</span>
													<br/>
													<br/>
													<a style="text-decoration:none">
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>Recipes/RecipeVideos.aspx</xsl:attribute>
														<img id="src" border="0" src="{//ArrayOfVideo/Video/ThumbNail}" width="360"/>
													</a>
													<br/>
													<br/>

													<xsl:value-of select="//ArrayOfVideo/Video/Description" disable-output-escaping="yes"/>
												</p>
											</xsl:when>





											<xsl:otherwise>
												<!-- weekly ad -->
												<p>

													<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">This week's Ad:</span>
													<br/>
													<span style="font-size:20px;font-weight:bold;color:#CC6600;font-family:arial;line-height:110%;">
													</span>
													<br/>
													<a style="text-decoration:none">
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Shop/WeeklyAd.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
														<img>
															<xsl:attribute name="src">
																<xsl:value-of select="EmailContents/StoreCircularSummary/Pages/CircularPageSummary[CircularTypeID='1']/ImageUrl"/>
															</xsl:attribute>
															<xsl:attribute name="border">0</xsl:attribute>
															<xsl:attribute name="width">355</xsl:attribute>
														</img>
													</a>
												</p>
											</xsl:otherwise>
										</xsl:choose>
									</td>



									<td width="175" valign="top" style="background-color:#FFFFFF;border-left:1px dashed #CCCCCC;text-align:left;">


										<xsl:if test="substring($emailDate,1,3) != 'Mon'">

											<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Recipe of the Day</span>
											<br/>

											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/FeaturedRecipe/RecipeURL"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
												<img id="src" border="0" src="{EmailContents/FeaturedRecipe/RecipeImageURL}" style="margin:4px auto; width:150px;"/>
											</a>
											<br/>

											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/FeaturedRecipe/RecipeURL"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
												<xsl:value-of select="EmailContents/FeaturedRecipe/RecipeTitle"/>
											</a>

											<br/>
											<em>click to view and print recipes and to add ingredients to your shopping list</em>



											<div style="height:12px; border-top: 1px dotted #000000; border-left:0; border-right:0; border-bottom:0; margin-top: 12px;">&#xA0;</div>
										</xsl:if>

										<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Meal Planner</span>
										<br/>

										<xsl:for-each select="EmailContents/MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
											<xsl:sort select="DisplayOrderDate" order="ascending"/>

											<strong>
												<xsl:value-of select="DisplayDate"/>
											</strong>

											<ul>
												<xsl:for-each select="key('meals-by-date', DisplayDate)">
													<xsl:sort select="RecipeTitle"/>
													<li>
														<a>
															<xsl:attribute name="href">

																<xsl:value-of select="/EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="RecipeURL"/>&amp;ChainID=<xsl:value-of select="/EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="/EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="/EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="/EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="/EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="/EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
															<xsl:value-of select="RecipeTitle" disable-output-escaping="yes"/>
														</a>
													</li>
												</xsl:for-each>
											</ul>
										</xsl:for-each>

										<div style="height:12px; border-top: 1px dotted #000000; border-left:0; border-right:0; border-bottom:0; margin-top: 12px;">&#xA0;</div>


										<span style="font-size:11px;font-weight:normal;color:#999999;font-family:arial;line-height:150%;">




											<span style="font-size:15px;font-weight:bold;color:#333333;font-family:arial;line-height:150%;">Weekly Ads</span>
											<br/>Click on an item, find a
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/RecipeCenter.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>recipe</a>to match and create your own
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Recipes/RecipeCenter.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>shopping lists</a>.

											<br/>

											<xsl:choose>
												<xsl:when test="EmailContents/Circular/SmallImageURL">
													<a>
														<xsl:attribute name="href">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/Circular/CircularURL"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
														<img border="0" src="{EmailContents/Circular/SmallImageURL}" style="margin:12px 0"/>
													</a>
												</xsl:when>
												<xsl:otherwise>
													<img>
														<xsl:attribute name="border">0</xsl:attribute>
														<xsl:attribute name="src">
															<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Assets/Common/Images/CircularThumb.png</xsl:attribute>

														<xsl:attribute name="style">margin:12px 0</xsl:attribute>
													</img>
												</xsl:otherwise>
											</xsl:choose>

											<div style="height:12px; border-top: 1px dotted #000000; border-left:0; border-right:0; border-bottom:0; margin-top: 12px;">&#xA0;</div>
										</span>
									</td>
								</tr>

								<!-- BANNER ADS GONNA GO HERE -->

								<tr>
									<td colspan="2">
										<center>
											<img src="http://codesascii.com/images/advertiseHereBanner468x60.jpg" border="0"/>
										</center>
									</td>
								</tr>


								<tr>
									<td style="background-color:#FFFFCC;border-top:10px solid #FFFFFF;" valign="top" colspan="2">
										<span style="font-size:10px;color:#996600;line-height:100%;font-family:verdana;">
											<img>
												<xsl:attribute name="border">0</xsl:attribute>
												<xsl:attribute name="src">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/Assets/<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>/Images/email_logo_small.gif</xsl:attribute>
												<xsl:attribute name="align">left</xsl:attribute>
												<xsl:attribute name="style">margin-right:6px;</xsl:attribute>
											</img>Email News is an opt-in, recurring email from
											<strong>
												<xsl:value-of select="EmailContents/ChainInfo/ChainName"/>
											</strong>. This email address was obtained through e-mail sign up on our website located at
											<a>

												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>
												<xsl:value-of select="EmailContents/ChainInfo/Domain"/>
											</a>. Please direct any questions or comments about our service to our
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/contact/Default.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>Contact Us</a>page. To view our privacy policy,
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/profile/PrivacyPolicy.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>click here</a>.															 
															If you would like to change your account in any way
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/EmailRedirect.aspx?redirect=<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/profile/SignIn.aspx&amp;ChainID=<xsl:value-of select="EmailContents/EmailTemplate/ChainID"/>&amp;StoreID=<xsl:value-of select="EmailContents/StoreInfo/StoreID"/>&amp;ConsumerID=<xsl:value-of select="EmailContents/Consumer/ConsumerID"/>&amp;EmailID=<xsl:value-of select="EmailContents/EmailTemplate/EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="EmailContents/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="EmailContents/MealPlanner/DisplayDate"/></xsl:attribute>click here</a>.
											<!--
															or to unsubscribe, 
															<a>
																<xsl:attribute name="href">
																	<xsl:value-of select="EmailContents/ChainInfo/Domain"/>/profile/Unsubscribe.aspx
																</xsl:attribute>
																click here
															</a>
														--></span>
										<br/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="FoodMatch" match="FoodMatches">
		<xsl:param name="CategoryName"/>
		<xsl:param name="WineDataNode"/>
		<xsl:if test="$WineDataNode/FoodMatches[CategoryName=$CategoryName]">
			<tr>
				<td width="100" valign="top">
					<strong>
						<xsl:value-of select="CategoryName"/>:</strong>
				</td>
				<td valign="top">
					<xsl:for-each select="$WineDataNode/FoodMatches[CategoryName=$CategoryName]">
						<xsl:choose>
							<xsl:when test="position()=count($WineDataNode/FoodMatches[CategoryName=$CategoryName])">
								<xsl:value-of select="FoodName"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(FoodName, ', ')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>