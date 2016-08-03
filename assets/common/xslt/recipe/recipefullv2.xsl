<!-- DWXMLSource="file:///C|/Dev/98-PageTypeId-23-RecipeFull.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:import href="../GenericSearch/GenericSearchPage.xsl" />
<xsl:import href="RatingControl.xsl" />
<xsl:import href="../WineList.xsl" />
<xsl:output method="html" indent="yes"/>
<xsl:key name="recipe-circular" match="//CircularItems/GenericCircularItem" use="CategoryID"/>
<xsl:key name="recipe-coupon" match="//Coupons/Coupon" use="CategoryID"/>
    <xsl:template match="/">
		<xsl:variable name="UserRating">
			<xsl:choose>
				<xsl:when test="ExpressLane/RecipeData/RecipeRating/Rating &gt; 0">
					<xsl:value-of select="ExpressLane/RecipeData/RecipeRating/Rating" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		
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
        <xsl:call-template name="SearchControl" />
      <div id="recipeFullWrapper" class="clearfix">
            <div class="mainContent hrecipe">
            <a name="recipeContent" />
            <xsl:call-template name="RecipeCardHeader" />
                <xsl:call-template name="RecipeIngredients" />
                <xsl:call-template name="RecipePreparation" />
                <xsl:if test="count(ExpressLane/RecipeData/GenericRecipe/Nutrients/GenericNutrient) &gt; 0">
                	<xsl:call-template name="RecipeNutrition" />
                </xsl:if>
            </div>
            <div class="relatedContent">
                <img>
				<xsl:attribute name="src">
					<xsl:choose>
                    	<xsl:when test="//Images/RecipeImage/RecipeImageURL">
                        	<xsl:value-of select="//Images/RecipeImage/RecipeImageURL" />
                        </xsl:when>
                        <xsl:otherwise>##root##/Assets/Common/Images/RecipeSearch/no_image_200.jpg</xsl:otherwise>
                    </xsl:choose>
				</xsl:attribute>
				</img>
                <xsl:call-template name="WinePairings" />
                <xsl:call-template name="CookingLinks" />            
                <xsl:if test="count(//Videos/Video) &gt; 0">
                	<xsl:call-template name="RelatedVideos" />
                </xsl:if>
<!--                <xsl:if test="count(//RelatedRecipes::child) &gt; 0">
                	<xsl:call-template name="RelatedRecipes" />
                </xsl:if>-->
            </div>
        </div>
    </xsl:template>
    
<!-- ====================================================================== -->
    
    <xsl:template name="RecipeCardHeader">  
        <div class="recipeCardHeader">
          <h2 class="fn"><xsl:value-of select="//GenericRecipe/Title" /></h2>
          <div class="sponsorship">
          	<span>brought to you by: </span>
            <a title="Ucook - Over 60,000 recipes." target="_blank" href="http://www.ucook.com">
            <img id="sponsorLogo">
            <xsl:attribute name="src">
            	<xsl:choose>
            		<xsl:when test="//Sponsor">
                		<xsl:value-of select="//Sponsor/SponsorLogo" />            	
                	</xsl:when>
                    <xsl:otherwise>##root##/Assets/Common/Images/ucook_logo_small.png</xsl:otherwise>
            	</xsl:choose>
            </xsl:attribute>
            </img>
            </a>
          </div>
          <div class="yieldWrapper yield"><strong>Serves: </strong><xsl:value-of select="//GenericRecipe/YieldQuantity" /></div>	
          <xsl:if test="//GenericRecipe/PrepTime &gt; 0 or //GenericRecipe/CookTime &gt; 0 or //GenericRecipe/EstimatedTime &gt; 0">
          <ul class="recipeTime">
              <xsl:if test="//GenericRecipe/PrepTime &gt; 0">
              <li class="duration">
              	<strong>Prep time: </strong>
                	<xsl:call-template name="CalculatedTime">
                		<xsl:with-param name="Minutes" select="//GenericRecipe/PrepTime" />
                    </xsl:call-template>
              </li>
              <li class="separator vertical"></li>
              </xsl:if>
              <xsl:if test="//GenericRecipe/CookTime &gt; 0">
              <li class="duration"><strong>Cook time: </strong>
              		<xsl:call-template name="CalculatedTime">
              			<xsl:with-param name="Minutes" select="//GenericRecipe/CookTime" />
                    </xsl:call-template>
              </li>
              <li class="separator vertical"></li>
              </xsl:if>
              <xsl:if test="//GenericRecipe/EstimatedTime &gt; 0">
              <li class="duration"><strong>Total time: </strong>
              		<xsl:call-template name="CalculatedTime">
                    	<xsl:with-param name="Minutes" select="//GenericRecipe/EstimatedTime" />
                    </xsl:call-template>
              </li>
              </xsl:if>
          </ul>
          </xsl:if>
          <xsl:call-template name="RatingControl">
          	<xsl:with-param name="AverageRating" select="ExpressLane/RecipeData/GlobalRecipeRating/AverageRating" />
            <xsl:with-param name="TotalRatings" select="ExpressLane/RecipeData/GlobalRecipeRating/TotalNumberOfRatings" />
            <xsl:with-param name="UserRating" select="ExpressLane/RecipeData/RecipeRating/Rating" />
            <xsl:with-param name="RatingType" select="'Recipe'" />
			<xsl:with-param name="ItemID" select="//GenericRecipe/RecipeID" />
          </xsl:call-template>
          <div class="notesWrapper">
          	<xsl:for-each select="//Notes/RecipeNote[1]">
            	<p><xsl:value-of select="RecipeNoteDescription" /></p>
            </xsl:for-each>
          </div>
          <ul class="recipe-actions">
              <li><a class="addAll" href="javascript:AddAllRecipeIngredients();">Add all</a></li>
              <li><a class="addChecked" href="javascript:AddRecipeCheckedItemsToShoppingList();">Add checked</a></li>
              <li><a class="printRecipe" href="javascript:window.print();">Print</a></li>
              <li>
			  	<a class="saveRecipe">
                	<xsl:attribute name="href">javascript:RedirectToSaveRecipe(<xsl:value-of select="/ExpressLane/RecipeData/GenericRecipe/RecipeID" />);</xsl:attribute>
                    <xsl:text>Save Recipe</xsl:text>
            	</a>
            </li>
          </ul>
		  <div id="socialControls">
			<xsl:text>##tweetbutton.horizontal##</xsl:text>
			<br/>
			<div style="height:20px;">##facebooklike##</div>
		</div>
		</div>
    </xsl:template>
    
<!-- ====================================================================== -->

	<xsl:template name="CalculatedTime">
    	<xsl:param name="Minutes" />
        <xsl:choose>
        	<xsl:when test="$Minutes &gt; 59">
            	<xsl:value-of select="concat(floor($Minutes div 60),' hrs.',' ')" />
                <xsl:if test="($Minutes mod 60) &gt; 0">
                	<xsl:value-of select="$Minutes mod 60" /><xsl:text> mins.</xsl:text>
				</xsl:if>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$Minutes" /><xsl:text> mins.</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- ====================================================================== -->

	<xsl:template name="WinePairings">
        <xsl:if test="/ExpressLane/RecipeData/WineConnectWineList/WineData" >
			<div id="winePairing" class="recipeMod">
            <h2>Wine Pairings</h2>
            	<em>Click on wine name for more details.</em>
                <xsl:apply-templates select="/ExpressLane/RecipeData/WineConnectWineList" />
				<xsl:for-each select="/ExpressLane/RecipeData/WineConnectWineList/WineData[position()&lt;4]">
					<xsl:call-template name="WineListLightBox" />
				</xsl:for-each>
            </div>
		</xsl:if>
    </xsl:template>
    
<!-- ====================================================================== -->

	<xsl:template name="RecipeIngredients">
		<div id="ingredients" class="recipeMod">
			<h2>Ingredients</h2>
			<div class="recipeMod-content">
				<ul class="clearfix">
				<xsl:for-each select="//GenericRecipeIngredient">
    				<li class="ingredient">
    					<!-- 21946 Issue starting here??-->
                        <input type="checkbox">
							<xsl:choose>
								<xsl:when test="ContainsProductPlacement = 'true'"> <!-- The recipe is clearly not getting this assigned even when its atually a product placement -->
									<xsl:attribute name="name">chkbxRecipeProductPlacements</xsl:attribute>
									<xsl:attribute name="value"><xsl:value-of select="RecipeProductPlacementID" /></xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="name">chkbxRecipeIngredients</xsl:attribute>
									<xsl:attribute name="value"><xsl:value-of select="RecipeIngredientID" /></xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</input>
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
                    </li>
                    <div style="display:none;">
						<xsl:attribute name="class">
							<xsl:value-of select="concat('ItemData_', RecipeIngredientID, '_5')" />
						</xsl:attribute>
						<span class="ExportKeyID"><xsl:value-of select="ExportKeyID" /></span>
					</div>
                    <!-- sale items --> 
					<xsl:for-each select="key('recipe-circular', CategoryID)">
						<a class="ingredientSaleItem">
							<xsl:attribute name="alt"><xsl:value-of select="Name" /></xsl:attribute>
							<xsl:attribute name="onclick">AddToShoppingList(<xsl:value-of select="CircularItemID" /> , 8);</xsl:attribute>
							<xsl:attribute name="onmouseout">UnTip()</xsl:attribute>
							<xsl:attribute name="onmouseover">TagToTip('<xsl:value-of select="CircularItemID" />span')</xsl:attribute>
							<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
							<xsl:text>On Sale</xsl:text>
						</a>
					</xsl:for-each>
		
					<!-- coupons --> 
					<xsl:for-each select="key('recipe-coupon', CategoryID)">
						<a>
							<xsl:attribute name="href">#</xsl:attribute>
							<xsl:attribute name="onclick">AddToShoppingList(<xsl:value-of select="CouponID" /> , 2);</xsl:attribute>
							<img>
								<xsl:attribute name="src">/Assets/Common/Images/ingredient_coupon.jpg</xsl:attribute>
								<xsl:attribute name="border">0</xsl:attribute>
							</img>
						</a>
					</xsl:for-each>		
				
				</xsl:for-each>
				</ul>
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
    	</div>
    </xsl:template> 
    
<!-- ====================================================================== -->

	<xsl:template name="RecipePreparation">      
    	<div id="preparation" class="recipeMod">
        	<h2>Preparation</h2>
            <div class="recipeMod-content instructions">
            	<xsl:for-each select="ExpressLane/RecipeData/GenericRecipe/Instructions/RecipeInstruction">
                	<p><xsl:value-of select="RecipeInstructionDescription" disable-output-escaping="yes" /></p>
                    <xsl:if test="position() != last()"><span class="separator horizontal"></span></xsl:if>
                </xsl:for-each>
        	</div>
    	</div>
     </xsl:template>
     
<!-- ====================================================================== -->

	<xsl:template name="RelatedRecipes">
    	<div class="recipeMod relatedRecipes">
        	<h2>Related Recipes</h2>
        	<ul>
            	<li><a href="#">Recipe 1</a></li>
            	<li><a href="#">Recipe 2</a></li>
            	<li><a href="#">Recipe 3</a></li>
            	<li><a href="#">Recipe 4</a></li>
        	</ul>
    	</div>
    </xsl:template>   
    
<!-- ====================================================================== -->

	<xsl:template name="RelatedVideos">
		
        <div class="recipeMod relatedVideos">
    		<h2>Related Videos</h2>
        	<ul>
            	<xsl:for-each select="//Videos/Video">
                <li>
                	<a>
                    <xsl:attribute name="href"><xsl:value-of select="concat('##root##/Recipes/RecipeVideos.aspx?videoid=',ExternalVideoID,'&amp;videotitle=',Title)" /></xsl:attribute>
                    <xsl:value-of select="Title" />
                    </a>
                </li>
                </xsl:for-each>
            </ul>
     	</div> 
     </xsl:template>
     
<!-- ====================================================================== -->

	<xsl:template name="RecipeNutrition">
    	<div class="recipeMod nutrition">
        	<h2>Nutrition Information</h2>
            <em>Nutrition information is provided as a resource. Values will vary depending on specific ingredients used.</em>
            <table class="nutrition">
            <thead style="display:none;">
            	<tr>
                	<th></th>
                    <th>Amount</th>
                    <th>% Daily</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="//Nutrients/GenericNutrient">
            <xsl:sort select="Description" />
            	<tr>
                <xsl:if test="position() mod 2 = 0">
                	<xsl:attribute name="class">alternateRow</xsl:attribute>
                </xsl:if>
                	<td><strong><xsl:value-of select="Description" /></strong></td>
                	<td><xsl:value-of select="concat(Amount,' ',MeasureUnit)" /></td>
                	<td><xsl:value-of select="concat(PctDailyValue,'%')" /></td>
                </tr>
            </xsl:for-each>
            </tbody>
            </table>
            <em>*Percent Daily Values are based on a 2,000 calorie diet. Your daily values may be higher or lower depending on your calorie needs.</em>
        </div>
    </xsl:template>
    
<!-- ====================================================================== -->
    
    <xsl:template name="CookingLinks">
    	<div class="cookingLinks recipeMod">
          		<h2>Cooking Links</h2>
          		<dl>
              		<dt>
                    	<a>
                        <xsl:attribute name="href">##root##/Recipes/MyRecipes.aspx</xsl:attribute>
                       		My Saved Recipes
                        </a>
                    </dt>
                  	<dd>Recipes you have book marked.</dd>
              		<dt>
                    	<a>
                        <xsl:attribute name="href">##root##/Recipes/AddRecipe.aspx</xsl:attribute>
                   	 		Add your own recipe
                        </a>
                    </dt>
                  	<dd>Create a custom recipe here.</dd>
              		<dt>
                    	<a>
                        <xsl:attribute name="href">##root##/Recipes/MealPlannerFull.aspx</xsl:attribute>
                        	Plan your meals
                        </a>
                    </dt>
                  	<dd>Let us help you plan the week.</dd>
              		<dt>
                    	<a>
                        <xsl:attribute name="href">##root##/Recipes/RecipeVideos.aspx</xsl:attribute>
                        	Watch Cooking Videos
                        </a>
                    </dt>
                  	<dd>Learn cooking techniques from our collection of videos.</dd>
          		</dl>
    	</div>
    </xsl:template>
</xsl:stylesheet>
