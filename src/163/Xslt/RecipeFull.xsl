<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>

	<xsl:key name="foodmatches-by-categoryname" match="FoodMatches" use="CategoryName"/>
	<xsl:key name="foodmatches-by-categoryname-foodname" match="FoodMatches" use="concat(CategoryName, FoodName)"/>
	<xsl:key name="recipe-circular" match="CircularItems/GenericCircularItem" use="CategoryID"/>
	<xsl:key name="recipe-coupon" match="Coupons/Coupon" use="CategoryID"/>

	<xsl:template match="/">
		<xsl:variable name="UserRating">
			<xsl:choose>
				<xsl:when test="ExpressLane/RecipeData/RecipeRating/Rating &gt; 0">
					<xsl:value-of select="ExpressLane/RecipeData/RecipeRating/Rating" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>


		<link href="/Assets/Common/Styles/print.css" rel="stylesheet" type="text/css" media="print"/>
    	<script type="text/javascript" src="/Assets/Common/Js/livepipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/recipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/Recipe/RecipeFull.js"></script> 
        <script type="text/javascript" src="/assets/common/js/Circulars/Circulars.js"></script>
        <script type="text/javascript">
			Event.observe(document, 'dom:loaded', init); 
			
			function init(){
				var itemID = <xsl:value-of select="//GenericRecipe/RecipeID" />;
				var averageRating = <xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/AverageRating" />;
				var totalNum = <xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/TotalNumberOfRatings" />;
				var userRating = <xsl:value-of select="$UserRating" />;
				
				var userRatingControl = new Control.Rating('RecipeRatingContainer', { value: userRating, rated: false });
				
				SetGlobalRating('Recipe', averageRating, totalNum);
			}
			
		</script>

		<xsl:for-each select="ExpressLane/RecipeData/GenericRecipe">

			<xsl:if test="/ExpressLane/RecipeData/WineConnectWineList/WineData">
				<div id="winecontent">
					<table>
						<xsl:attribute name="cellpadding">0</xsl:attribute>
						<xsl:attribute name="cellspacing">0</xsl:attribute>
						<xsl:attribute name="border-collapse">collapse</xsl:attribute>
						<xsl:attribute name="style">margin-bottom:4px</xsl:attribute>

						<xsl:for-each select="/ExpressLane/RecipeData/WineConnectWineList/WineData[position()&lt;4]">
							<tr>
								<td>
									<xsl:attribute name="class">WineName</xsl:attribute>
									<xsl:if test="position() != last()">
										<xsl:attribute name="style">border-bottom:1px dotted #999999</xsl:attribute>
									</xsl:if>
									<a>
										<xsl:attribute name="class">lightwindow</xsl:attribute>
										<xsl:attribute name="href">#lightbox<xsl:value-of select="position()"/></xsl:attribute>
										<xsl:attribute name="title">more information</xsl:attribute>
										<xsl:attribute name="style">margin:0</xsl:attribute>
										<xsl:attribute name="params">"lightwindow_width=600;lightwindow_height=400"</xsl:attribute>
										<xsl:value-of select="WineAttributes/WineName"/>
									</a>
								</td>
								<td>
									<xsl:attribute name="width">30</xsl:attribute>
									<xsl:if test="position() != last()">
										<xsl:attribute name="style">border-bottom:1px dotted #999999</xsl:attribute>
									</xsl:if>
									<a>
										<xsl:attribute name="title">add to your shopping list</xsl:attribute>
										<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="ProductID"/>', <xsl:value-of select="ShoppingListItemTypeID"/>);</xsl:attribute>Add</a>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<span class="winename" style="font-size:80%; clear:both; font-style:italic">Wines are recomendations only and may not be carried by this store</span>
				</div>
				<xsl:for-each select="/ExpressLane/RecipeData/WineConnectWineList/WineData[position()&lt;4]">
					<div>
						<xsl:attribute name="id">lightbox<xsl:value-of select="position()"/></xsl:attribute>
						<xsl:attribute name="class">winebox</xsl:attribute>

						<table class="winetable">
							<tr>
								<td>
									<h2>
										<xsl:value-of select="WineAttributes/WineName"/>
									</h2>
								</td>
								<td>
									<a class="lightwindow_action" rel="deactivate" href="#" style="float:right">
										<img src="/Assets/Common/Images/close_lightbox.gif"/>
									</a>
								</td>
							</tr>
							<tr valign="top">
								<td>
									<table width="100%">

										<tr>
											<td colspan="2">
												<a name="attributes"></a>
												<h3>Attributes</h3>
											</td>
										</tr>
										<xsl:if test="WineAttributes/Producer !=''">
											<tr>
												<td class="winedetailbold" width="100">Producer</td>
												<td>
													<p>
														<xsl:value-of select="WineAttributes/Producer"/>
													</p>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="WineAttributes/Region !=''">
											<tr>
												<td class="winedetailbold" width="100">Region</td>
												<td>
													<p>
														<xsl:value-of select="WineAttributes/Region"/>
													</p>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="WineAttributes/Varietal !=''">
											<tr>
												<td class="winedetailbold" width="100">Varietal</td>
												<td>
													<p>
														<xsl:value-of select="WineAttributes/Varietal"/>
													</p>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="WineAttributes/BottleSize !=''">
											<tr>
												<td class="winedetailbold" width="100">Bottle Size</td>
												<td>
													<p>
														<xsl:value-of select="WineAttributes/BottleSize"/>
													</p>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td colspan="2">
												<a name="foodmatches"/>
												<h3>Food Matches</h3>
											</td>
										</tr>
										<xsl:for-each select="FoodMatches[count(. | key('foodmatches-by-categoryname', CategoryName)[1]) = 1]">
											<xsl:sort select="CategoryName"/>
											<tr>
												<td class="winedetailbold">
													<xsl:value-of select="CategoryName"/>
												</td>
												<td>
													<xsl:for-each select="key('foodmatches-by-categoryname', CategoryName)[count(.|key('foodmatches-by-categoryname-foodname', concat(CategoryName, FoodName))[1])=1]">
														<xsl:sort select="FoodName"/>
														<xsl:value-of select="FoodName"/>,</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td colspan="2">
												<xsl:for-each select="WineTerms/WineTerm">
													<br/>
													<xsl:if test="Name !=''">
														<div class="winedetailbold">
															<a name="wineterms"/>
															<xsl:value-of select="Name"/>
														</div>
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
								</td>
								<td width="250">
									<img>
										<xsl:attribute name="src">
											<xsl:value-of select="WineImages/File"/>
										</xsl:attribute>
										<xsl:attribute name="height">300</xsl:attribute>
									</img>
									<br/>
									<xsl:for-each select="WineDescription[position()&lt;9]">
										<h3>(<xsl:value-of select="Vintage"/>) <xsl:value-of select="Source"/>: <xsl:value-of select="Rating"/></h3>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</div>
				</xsl:for-each>
			</xsl:if>

			<div id="chainlogo">
				<img>
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="/ExpressLane/Common/Chain/ChainID"/>/Images/printlogo.gif</xsl:attribute>
					<xsl:attribute name="border">0</xsl:attribute>
				</img>
			</div>

			<div id="recipetitle">
				<h2>
					<xsl:value-of select="Title"/>
				</h2>
			</div>
			<div id="reciperating">
				<div class="globalRatingText">Rated</div>
				<div id="globalRatingControl" class="rating_container">
				</div>
				<div id="globalRatingCount" class="globalRatingText">
				</div>
			</div>
			<div id="recipeoptions">
				<xsl:if test="Images/RecipeImage">
					<img style="border-width: 0px;">
						<xsl:attribute name="src">
							<xsl:value-of select="Images/RecipeImage/RecipeImageURL"/>
						</xsl:attribute>
					</img>
				</xsl:if>
				<ul>
					<li class="recipeprint">
						<a id="recipeprint" href="javascript:window.print();">Print Recipe</a>
					</li>
					<li class="recipeaddchecked">
						<a id="recipeaddchecked" href="javascript:AddRecipeCheckedItemsToShoppingList();">Add Checked to List</a>
					</li>
					<li class="recipeaddall">
						<a id="recipeaddall">
							<xsl:attribute name="href">javascript:AddAllRecipeIngredients();</xsl:attribute>Add All Ingredients to List</a>
					</li>
					<!--The Recipe Search Back button href is populated at run-time by the javascript function 'CheckQueryString()'-->
					<li class="recipeback">
						<a id="recipeback" href="">Back to Search Results</a>
					</li>
					<li class="recipecenterback">
						<a id="recipecenterback" href="/Shop/WeeklyAd.aspx">Back to Weekly Ad</a>
					</li>
				</ul>
				<div id="UserRecipeRating">
					<div id="userrating">Rate this Recipe!</div>
					<div id="userRatingControl" class="rating_container"></div>
				</div>
			</div>


			<div style="display:none;visiblity:hidden;">
				<xsl:for-each select="CircularItems/GenericCircularItem">
					<span>
						<xsl:attribute name="id">
							<xsl:value-of select="CircularItemID"/>span</xsl:attribute>
						<div class="circularHoversNew">
							<div class="circularHoversImage">
								<xsl:if test="SmallImageUrl">
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="CircularItemName"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="SmallImageUrl"/>
										</xsl:attribute>
									</img>
								</xsl:if>
							</div>
							<div class="circularHoversPricing">
								<h2>
									<xsl:value-of select="CircularItemName"/>
								</h2>
								<h3>
									<xsl:value-of select="CircularItemDescription" disable-output-escaping="yes"/>
								</h3>
								<h4>
									<xsl:value-of select="PriceString"/>
								</h4>
							</div>
							<h5>Click to see available varieties and add to list.</h5>
						</div>
					</span>
				</xsl:for-each>
			</div>
			<div id="recipecontent">
				<h3>Ingredients</h3>
				<div class="ingredientItems">

					<xsl:for-each select="Ingredients/GenericRecipeIngredient">
						<xsl:sort select="DisplayOrder"/>

						<div class="recipeIngredient">
							<input type="checkbox" name="chkbxRecipeIngredients">
								<xsl:attribute name="value">
									<xsl:value-of select="RecipeIngredientID"/>
								</xsl:attribute>
								<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
							</input>
							<div style="display:none;">
								<xsl:attribute name="class">
									<xsl:value-of select="concat('ItemData_', RecipeIngredientID, '_5')"/>
								</xsl:attribute>
								<span class="ExportKeyID">
									<xsl:value-of select="ExportKeyID"/>
								</span>
							</div>
						</div>
					</xsl:for-each>
				</div>

				<h3>Preparation</h3>
				<div class="preparation">
					<xsl:for-each select="Instructions/RecipeInstruction">
						<xsl:sort select="DisplayOrder"/>
						<xsl:value-of select="RecipeInstructionDescription" disable-output-escaping="yes"/>
						<br/>
						<br/>
					</xsl:for-each>
				</div>
				<h3>Yield</h3>
				<div class="yield">
					<xsl:value-of select="YieldText"/>
				</div>
				<xsl:if test="PrepTime != '0' or CookTime != '0'">
					<h3>Cook Time</h3>
					<div class="cookTime">
						<xsl:if test="PrepTime != '0'">Prep Time: <xsl:value-of select="PrepTime"/> mins. <br/></xsl:if>
						<xsl:if test="CookTime != '0'">Cook Time: <xsl:value-of select="CookTime"/> mins. <br/></xsl:if>
					</div>
				</xsl:if>
			</div>
			<xsl:if test="Nutrients/GenericNutrient">
				<div id="NutritionTable">
					<div class="NutritionLine">
						<h2>Nutrition Facts</h2>Nutrition information is provided as a resource. Values will vary depending on specific ingredients used.</div>
					<div class="NutritionLine">
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>Serving Size: 1 <br/>
					Number of Servings: <xsl:value-of select="YieldText"/></div>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>Amount Per Serving: <br/>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Calories'">Calories: <xsl:value-of select="DisplayAmount"/></xsl:if>
							</xsl:for-each>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Calories From Fat'">Calories from Fat: <xsl:value-of select="DisplayAmount"/></xsl:if>
							</xsl:for-each>
						</div>
					</div>
					<hr class="thin"/>
					<div class="NutritionLine">
						<xsl:comment>ie7 div fix</xsl:comment>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>
							<div class="NutritionLineElement" style="border-bottom:2px solid black">Amount per Serving</div>
							<div class="NutritionLineElementRight" style="border-bottom:2px solid black">% Daily Value*<xsl:text>&#xA0;&#xA0;</xsl:text></div>
						</div>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>
							<div class="NutritionLineElement" style="border-bottom:2px solid black">Amount per Serving</div>
							<div class="NutritionLineElementRight" style="border-bottom:2px solid black">% Daily Value*<xsl:text>&#xA0;&#xA0;</xsl:text></div>
						</div>
					</div>

					<div class="NutritionLine">
						<xsl:comment>ie7 div fix</xsl:comment>
						<div class="NutritionLineItem">
							<xsl:comment>TotFat</xsl:comment>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Total Fat'">
									<div class="NutritionLineElement">
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>TotFat</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
								<xsl:if test="Description = 'Carbohydrates'">
									<div class="NutritionLineElement">
										<xsl:comment>Carbs</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Carbs</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Saturated Fat'">
									<div class="NutritionLineElement">
										<xsl:comment>SatFat</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>SatFat</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
								<xsl:if test="Description = 'Dietary Fiber'">
									<div class="NutritionLineElement">
										<xsl:comment>Fiber</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Fiber</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Cholesterol'">
									<div class="NutritionLineElement">
										<xsl:comment>Cholesterol</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Cholesterol</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
								<xsl:if test="Description = 'Calories'">
									<div class="NutritionLineElement">
										<xsl:comment>Calories</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Calories</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="NutritionLineItem">
							<xsl:comment>ie7 div fix</xsl:comment>
							<xsl:for-each select="Nutrients/GenericNutrient">
								<xsl:if test="Description = 'Sodium'">
									<div class="NutritionLineElement">
										<xsl:comment>Sodium</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Sodium</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
								<xsl:if test="Description = 'Protein'">
									<div class="NutritionLineElement">
										<xsl:comment>Protein</xsl:comment>
										<xsl:value-of select="Description"/>
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="Amount &gt; 1">
												<xsl:value-of select="Amount"/>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&lt; 1</xsl:text>
												<xsl:value-of select="MeasureUnit"/>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="NutritionLineElementRight">
										<xsl:comment>Protein</xsl:comment>
										<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
								</xsl:if>
							</xsl:for-each>
						</div>


						<xsl:for-each select="Nutrients/GenericNutrient">
							<xsl:if test="Description = 'Vitamin A' or Description = 'Vitamin C' or Description = 'Calcium' or Description = 'Iron'">
								<div class="NutritionLineItem">
									<xsl:comment>ie7 div fix</xsl:comment>
									<xsl:if test="Description = 'Vitamin A'">
										<div class="NutritionLineElement">
											<xsl:comment>A</xsl:comment>
											<xsl:value-of select="Description"/>
										</div>
										<div class="NutritionLineElementRight">
											<xsl:comment>A</xsl:comment>
											<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
									</xsl:if>
									<xsl:if test="Description = 'Vitamin C'">
										<div class="NutritionLineElement">
											<xsl:comment>C</xsl:comment>
											<xsl:value-of select="Description"/>
										</div>
										<div class="NutritionLineElementRight">
											<xsl:comment>C</xsl:comment>
											<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
									</xsl:if>
									<xsl:if test="Description = 'Calcium'">
										<div class="NutritionLineElement">
											<xsl:comment>Calcium</xsl:comment>
											<xsl:value-of select="Description"/>
										</div>
										<div class="NutritionLineElementRight">
											<xsl:comment>Calcium</xsl:comment>
											<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
									</xsl:if>
									<xsl:if test="Description = 'Iron'">
										<div class="NutritionLineElement">
											<xsl:comment>Iron</xsl:comment>
											<xsl:value-of select="Description"/>
										</div>
										<div class="NutritionLineElementRight">
											<xsl:comment>Iron</xsl:comment>
											<xsl:value-of select="PctDailyValue"/>%<xsl:text>&#xA0;&#xA0;</xsl:text></div>
									</xsl:if>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
					<div class="NutritionLine">
						<em>*Percent Daily Values are based on a 2,000 calorie diet. Your daily values may be higher or lower depending on your calorie needs.</em>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>

		<xsl:element name="INPUT">
			<xsl:attribute name="type">hidden</xsl:attribute>
			<xsl:attribute name="title">recipeid</xsl:attribute>
			<xsl:attribute name="id">recipeid</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="ExpressLane/RecipeData/GenericRecipe/RecipeID"/>
			</xsl:attribute>
		</xsl:element>

		<script type="text/javascript">document.observe('dom:loaded', function(){
    var rating = new Control.Rating('userRatingControl');

    rating.observe('afterChange', function(ratevalue){
      SetRecipeRating(ratevalue);
    });
    
    CheckQueryString();

    var parentUserRating = document.getElementById('UserRecipeRating');
    var parentGlobalRating = document.getElementById('reciperating');

    if(parentUserRating != null){
    parentUserRating.style.display = 'none';
    parentUserRating.style.visibility = 'hidden';
    }

    if(parentGlobalRating != null){
    parentGlobalRating.style.display = 'none';
    parentGlobalRating.style.visibility = 'hidden';
    }

    SetUserRecipeRating(<xsl:value-of select="ExpressLane/RecipeData/RecipeRating/Rating"/>);

			<xsl:if test="/ExpressLane/RecipeData/GlobalRecipeRating/AverageRating &gt;= 0">SetGlobalRecipeRating(<xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/AverageRating"/>, <xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/TotalNumberOfRatings"/>);</xsl:if>});</script>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="RecipeFull" userelativepaths="yes" externalpreview="no" url="..\..\..\Desktop\xml\RecipeFullTestXml2.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\Desktop\xml\RecipeFullTestXml2.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="xsl:for-each" x="332" y="120"/>
				<block path="xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each" x="282" y="30"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/a/xsl:attribute[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/a/xsl:attribute[2]/xsl:for-each" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/a/xsl:attribute[2]/xsl:for-each/xsl:value-of" x="282" y="150"/>
				<block path="" x="242" y="110"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/a/xsl:attribute[2]/xsl:for-each/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td/a/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td[1]/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td[1]/a/xsl:attribute/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/div/table/xsl:for-each/tr/td[1]/a/xsl:attribute/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each" x="242" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/xsl:attribute/xsl:value-of" x="202" y="110"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr/td/h2/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[1]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[1]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[2]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[2]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[2]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[3]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[3]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:if[3]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/tr/td/h3/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/tr/td/h3/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/tr/td/h3/xsl:value-of[2]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[1]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[1]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[2]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[2]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[2]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[3]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[3]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[3]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[4]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[4]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[4]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[5]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[5]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[5]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[6]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[6]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[6]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[7]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[7]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each/xsl:if[7]/tr/td[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each[1]/tr/td/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each[1]/tr/td[1]/xsl:for-each" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/xsl:for-each[1]/tr/td[1]/xsl:for-each/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if[1]/!=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td/table/tr[3]/td/xsl:for-each/xsl:if[1]/p/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if/xsl:for-each/div/table/tr[1]/td[1]/img/xsl:attribute/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/div[2]/xsl:if" x="162" y="110"/>
				<block path="xsl:for-each/div[2]/xsl:if/img/xsl:attribute/xsl:value-of" x="322" y="30"/>
				<block path="xsl:for-each/div[2]/ul/li/a/xsl:attribute/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/div[3]/div/xsl:for-each" x="242" y="30"/>
				<block path="xsl:for-each/div[3]/div[1]/xsl:for-each" x="122" y="110"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if/!=[0]" x="0" y="118"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if" x="12" y="120"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if[1]/!=[0]" x="6" y="78"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if[1]" x="52" y="80"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if[2]/!=[0]" x="0" y="78"/>
				<block path="xsl:for-each/div[3]/div[3]/xsl:if[2]" x="12" y="80"/>
				<block path="xsl:for-each/xsl:if[1]" x="202" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each" x="342" y="170"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each/xsl:if/=[0]" x="6" y="38"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each/xsl:if" x="52" y="40"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each/xsl:if/xsl:value-of" x="162" y="30"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each[1]" x="62" y="170"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each[1]/xsl:if/=[0]" x="0" y="38"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each[1]/xsl:if" x="12" y="40"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[1]/div[1]/xsl:for-each[1]/xsl:if/xsl:value-of" x="282" y="190"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each" x="172" y="240"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/=[0]" x="196" y="228"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if" x="242" y="230"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:value-of" x="202" y="190"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:choose" x="12" y="200"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:choose/&gt;[0]" x="0" y="194"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of" x="162" y="190"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of[1]" x="122" y="190"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div/xsl:choose/xsl:otherwise/xsl:value-of" x="322" y="230"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if/div[1]/xsl:value-of" x="122" y="230"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:value-of" x="82" y="230"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:choose" x="12" y="240"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:choose/&gt;[0]" x="0" y="234"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div/xsl:for-each/xsl:if[1]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[1]/xsl:for-each/xsl:if[1]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[2]/xsl:for-each/xsl:if[1]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:choose" x="252" y="120"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:choose/&gt;[0]" x="206" y="114"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:when/xsl:value-of[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div/xsl:choose/xsl:otherwise/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/div[3]/xsl:for-each/xsl:if[1]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each" x="12" y="160"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]" x="196" y="188"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/or[0]" x="150" y="182"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/or[0]/or[0]" x="104" y="176"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/or[0]/or[0]/=[0]" x="58" y="170"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/or[0]/or[0]/=[1]" x="58" y="198"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/or[0]/=[1]" x="104" y="204"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/or[0]/=[1]" x="150" y="210"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if" x="242" y="190"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[1]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[1]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[1]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[1]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[2]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[2]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[2]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[2]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[3]/=[0]" x="236" y="148"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[3]" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[3]/div/xsl:value-of" x="282" y="150"/>
				<block path="xsl:for-each/xsl:if[1]/div/div[3]/xsl:for-each/xsl:if/div/xsl:if[3]/div[1]/xsl:value-of" x="282" y="150"/>
				<block path="script[6]/xsl:value-of" x="162" y="150"/>
				<block path="script[6]/xsl:if/&gt;=[0]" x="6" y="118"/>
				<block path="script[6]/xsl:if" x="52" y="120"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->