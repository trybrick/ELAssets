<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="WineList.xsl"/>
	<xsl:import href="http://localhost/Assets/Common/Xslt/SocialMedia/TweetButton.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:key name="recipe-circular" match="CircularItems/GenericCircularItem" use="CategoryID"/>
	<xsl:key name="recipe-coupon" match="Coupons/Coupon" use="CategoryID"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/livepipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/recipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/rating.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/RecipeFull.js"></script>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<div id="Recipe" class="hrecipe">
			<xsl:for-each select="ExpressLane/RecipeData/GenericRecipe">
				<div style="display:none;">
					<xsl:if test="Images/RecipeImage">
						<img style="border-width: 0px;">
							<xsl:attribute name="src">
								<xsl:value-of select="Images/RecipeImage/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</xsl:if>
				</div>
				<xsl:if test="/ExpressLane/RecipeData/WineConnectWineList/WineData">
					<xsl:apply-templates select="/ExpressLane/RecipeData/WineConnectWineList"/>
				</xsl:if>
				<div id="chainlogo">
					<img>
						<xsl:attribute name="src">/Assets/##chainid##/Images/printlogo.gif</xsl:attribute>
						<xsl:attribute name="border">0</xsl:attribute>
					</img>
				</div>

				<div id="recipetitle">
					<h2 class="fn">
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
						<div id="recipeImageDiv">
							<img style="border-width: 0px;">
								<xsl:attribute name="src">
									<xsl:value-of select="Images/RecipeImage/RecipeImageURL"/>
								</xsl:attribute>
							</img>
						</div>
					</xsl:if>
					<ul>
						<li class="recipesave">
							<a id="recipesave">
								<xsl:attribute name="href">javascript:RedirectToSaveRecipe(<xsl:value-of select="/ExpressLane/RecipeData/GenericRecipe/RecipeID"/>);</xsl:attribute>Save to My Recipe Box</a>
						</li>
						<li class="recipeprint">
							<a id="recipeprint" href="javascript:window.print();">Print Recipe</a>
						</li>
						<li class="recipeaddchecked">
							<a id="recipeaddchecked" href="javascript:AddRecipeCheckedItemsToShoppingList();">Add Checked to
								<xsl:choose>
									<xsl:when test="$IsOGS = 'true'">Cart</xsl:when>
									<xsl:otherwise>List</xsl:otherwise>
								</xsl:choose>
							</a>
						</li>
						<li class="recipeaddall">
							<a id="recipeaddall">
								<xsl:attribute name="href">javascript:AddAllRecipeIngredients();</xsl:attribute>Add All Ingredients to
								<xsl:choose>
									<xsl:when test="$IsOGS = 'true'">Cart</xsl:when>
									<xsl:otherwise>List</xsl:otherwise>
								</xsl:choose>
							</a>
						</li>
						<!--The Recipe Search Back button is populated at run-time by the javascript function 'CheckQueryString()'-->
						<li class="recipeback">
							<span id="recipeback"></span>
						</li>
					</ul>
					<div id="UserRecipeRating">
						<div id="userrating">Rate this Recipe!</div>
						<div id="userRatingControl" class="rating_container"></div>
					</div>
				</div>
				<div id="socialControls">
					<div id="twWrapper">
						<xsl:call-template name="TweetButton">
							<xsl:with-param name="data-count" select="'horizontal'"/>
						</xsl:call-template>
					</div>
					<div id="fbWrapper">##facebooklike##</div>
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
					<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
						<xsl:if test="Image">
							<div class="BannerImage" style="clear:both;">
								<a target="_new">
									<xsl:attribute name="href">
										<xsl:value-of select="Description" disable-output-escaping="yes"/>
									</xsl:attribute>
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="Title"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="Image" disable-output-escaping="yes"/>
										</xsl:attribute>
									</img>
								</a>
							</div>
						</xsl:if>
					</xsl:for-each>
					<h3>Ingredients</h3>
					<div class="ingredientItems">
						<xsl:variable name="Ingredients" select="Ingredients/GenericRecipeIngredient[IsActive = 'true']"/>
						<xsl:for-each select="$Ingredients">
							<xsl:sort select="DisplayOrder" data-type="number"/>
							<xsl:call-template name="RecipeIngredientDisplay"/>
						</xsl:for-each>

						<br/>
						<xsl:if test="//GenericRecipe/UseMetricDescriptions='true'">
							<div class="ShowHideMetric">
								<input type="checkbox" id="chkMetric" onclick="ToggleMetric()" alt="Convert to Metric">
									<xsl:attribute name="checked">true</xsl:attribute>
									<img src="/Assets/common/images/measuring_cup_small.gif"/>
									<strong>Use Metric Measurements</strong>
								</input>
							</div>
						</xsl:if>
					</div>
					<h3>Preparation</h3>
					<div class="preparation instructions">
						<xsl:for-each select="Instructions/RecipeInstruction">
							<xsl:sort select="DisplayOrder" data-type="number"/>
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
							<xsl:if test="PrepTime != '0'"><span class="duration">Prep Time: <xsl:value-of select="PrepTime"/> mins.</span><br/></xsl:if>
							<xsl:if test="CookTime != '0'"><span class="duration">Cook Time: <xsl:value-of select="CookTime"/> mins.</span><br/></xsl:if>
						</div>
					</xsl:if>
				</div>
				<xsl:for-each select="/ExpressLane/RecipeData/WineConnectWineList/WineData[position()&lt;4]">
					<xsl:call-template name="WineListLightBox"/>
				</xsl:for-each>
				<xsl:if test="Nutrients/GenericNutrient">
					<div id="NutritionTable" class="clearfix">
						<div class="NutritionLine">
							<h2>Nutrition Facts</h2>Nutrition information is provided as a resource. Values will vary depending on specific ingredients used.</div>
						<div class="NutritionLine">
							<div class="NutritionLineItem">
								Serving Size: 1 <br/>
						Number of Servings: <xsl:value-of select="YieldText"/></div>
							<div class="NutritionLineItem">
								Amount Per Serving: <br/>
								<xsl:for-each select="Nutrients/GenericNutrient">
									<xsl:if test="Description = 'Calories'">Calories: <xsl:value-of select="DisplayAmount"/></xsl:if>
								</xsl:for-each>
								<xsl:for-each select="Nutrients/GenericNutrient">
									<xsl:if test="Description = 'Calories From Fat'"><br/>Calories from Fat: <xsl:value-of select="DisplayAmount"/></xsl:if>
								</xsl:for-each>
							</div>
						</div>
						<hr class="thin"/>
						<div class="NutritionLine">
							<div class="NutritionLineItem">
								<div class="NutritionLineElement" style="border-bottom:2px solid black">Amount per Serving</div>
								<div class="NutritionLineElementRight" style="border-bottom:2px solid black">% Daily Value*<xsl:text>&#xA0;&#xA0;</xsl:text></div>
							</div>
							<div class="NutritionLineItem">
								<div class="NutritionLineElement" style="border-bottom:2px solid black">Amount per Serving</div>
								<div class="NutritionLineElementRight" style="border-bottom:2px solid black">% Daily Value*<xsl:text>&#xA0;&#xA0;</xsl:text></div>
							</div>
						</div>

						<div class="NutritionLine">
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
		</div>

			<script type="text/javascript">document.observe('dom:loaded', function(){

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

	<xsl:template name="RecipeIngredientDisplay" match="GenericRecipeIngredient">
		<div class="recipeIngredient">
			<input type="checkbox">
				<xsl:choose>
					<xsl:when test="ContainsProductPlacement = 'true'">
						<xsl:attribute name="name">chkbxRecipeProductPlacements</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="RecipeProductPlacementID"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="name">chkbxRecipeIngredients</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="RecipeIngredientID"/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</input>
			<!--<strong><xsl:value-of select="DisplayOrder"/>: </strong>-->
			<xsl:choose>
				<xsl:when test="string-length(MetricText)&gt;1">
					<span class="ImperialDescription ingredient" name="ImperialDescription">
						<xsl:if test="//ExpressLane/RecipeData/GenericRecipe/UseMetricDescriptions='true'">
							<xsl:attribute name="style">display: none;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
					</span>
					<span class="MetricDescription ingredient" name="MetricDescription">
						<xsl:if test="//ExpressLane/RecipeData/GenericRecipe/UseMetricDescriptions!='true'">
							<xsl:attribute name="style">display: none;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="MetricText"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="ingredient">
						<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
			<div style="display:none;">
				<xsl:attribute name="class">
					<xsl:value-of select="concat('ItemData_', RecipeIngredientID, '_5')"/>
				</xsl:attribute>
				<span class="ExportKeyID">
					<xsl:value-of select="ExportKeyID"/>
				</span>
			</div>
			<xsl:for-each select="/ExpressLane/RecipeData/WineConnectWineList/WineData[position()&lt;4]">
				<xsl:call-template name="WineListLightBox"/>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
