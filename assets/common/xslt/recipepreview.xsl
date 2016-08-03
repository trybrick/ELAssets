<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:for-each select="ExpressLane/RecipeData/GenericRecipe">
			<style>#recipecontent {
				height:auto;
				margin:0 0 0 12px;
				width:480px;
			}

			#recipetitle {
				text-align:center;
			}

			#recipeoptions,#reciperating 
			{
				display:none;
			}

			#recipetitle h2 {
				border-bottom:1px dotted #999999;
				margin:0 0 6px 12px;
				width:100%;
			}

			#recipecontent h3 {
				clear:both;
				margin-top:12px;
				width:25%;
				background-color:#ffffff;
				color:#B37F2B;
			}

			.recipeIngredient 
			{
				clear:both;
			}

			.ingredientItems {
				float:left;
				width:300px;
				margin:0 0 0 25px;
			}

			.preparation, .yield, .cookTime {
				clear:both;
				margin:0 0 0 25px;
				width:530px;
			}

			#chainlogo 
			{
				display:none;
			}

			#NutritionTable {
				border:1px solid black;
				border-collapse:collapse;
				clear:both;
				font-family:Arial;
				font-size:90%;
				margin:12px 0 0 12px;
				padding:4px;
				width:auto;
			}

			.NutritionLine {
				border-collapse:collapse;
				margin:0 2px;
				padding:0;
				text-align:left;
				width:100%;
			}

			.NutritionLineItem {
				float:left;
				margin:0;
				padding:0;
				text-align:left;
				width:49.9%;
			}

			.NutritionLineElement {
				border-bottom:1px solid black;
				float:left;
				margin:0;
				padding:0;
				text-align:left;
				width:49.9%;
			}

			.NutritionLineElementRight {
				border-bottom:1px solid black;
				float:left;
				margin:0;
				padding:0;
				text-align:right;
				width:49.9%;
			}

			#NutritionTable h2 {
				border:0 none;
				color:#000000;
				font-size:200%;
				margin:0;
			}

			#NutritionTable hr.thin {
				background-color:black;
				border:medium none black;
				color:black;
				height:1px;
				margin:0;
			}

			#recipeImageDiv {
				float:left;
			}
			</style>
			<div id="recipetitle">
				<h2>
					<xsl:value-of select="Title"/>
				</h2>
			</div>
			<xsl:if test="Images/RecipeImage">
				<div id="recipeImageDiv">
					<img style="border-width: 0px;">
						<xsl:attribute name="src">
							<xsl:value-of select="Images/RecipeImage/RecipeImageURL"/>
						</xsl:attribute>
					</img>
				</div>
			</xsl:if>
			<div id="recipecontent">		
				<div class="ingredientItems">
					<h3>Ingredients</h3>
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
				<div class="preparation">
					<h3>Preparation</h3>
					<xsl:for-each select="Instructions/RecipeInstruction">
						<xsl:sort select="DisplayOrder" data-type="number"/>
						<xsl:value-of select="RecipeInstructionDescription" disable-output-escaping="yes"/>
						<br/>
						<br/>
					</xsl:for-each>
				</div>
				<div class="yield">
					<h3>Yield</h3>
					<xsl:value-of select="YieldText"/>
				</div>
				<xsl:if test="PrepTime != '0' or CookTime != '0'">
					<div class="cookTime">
						<h3>Cook Time</h3>
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
	</xsl:template>

	<xsl:template name="RecipeIngredientDisplay" match="GenericRecipeIngredient">
		<div class="recipeIngredient">
			<xsl:choose>
				<xsl:when test="string-length(MetricText)&gt;1">
					<span class="ImperialDescription" name="ImperialDescription">
						<xsl:if test="//ExpressLane/RecipeData/GenericRecipe/UseMetricDescriptions='true'">
							<xsl:attribute name="style">display: none;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
					</span>
					<span class="MetricDescription" name="MetricDescription">
						<xsl:if test="//ExpressLane/RecipeData/GenericRecipe/UseMetricDescriptions!='true'">
							<xsl:attribute name="style">display: none;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="MetricText"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="description">
						<xsl:value-of select="StandardText" disable-output-escaping="yes"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-23-RecipeFull.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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