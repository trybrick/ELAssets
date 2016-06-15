<?xml version="1.0"?><!-- DWXMLSource="../../../98/XmlData/98-PageTypeId-112-RecipeCenter.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:import href="../GenericSearch/GenericSearchControl.xsl" />
<xsl:key name="meals-by-date" match="//MealPlanner" use="DisplayDate" />
	<xsl:output method="html"/>
	<xsl:template match="/">    	
		<script type="text/javascript" src="/Assets/Common/Js/Recipe/RecipeCenter.js"></script>
        <xsl:call-template name="SearchControl" />
		<!-- display registration promo banner if consumer is not logged in -->
 		<xsl:if test="//GenericConsumer/IsLoggedIn != 'true'">
			<script type="text/javascript" src="/Assets/Common/Js/AdInternal.js"></script>
			<div id="adInternal" class="recipeCenter" />
		</xsl:if>
        <!-- main featured content -->
		<div class="mainContent featured">
        	<a name="recipeContent" />
            <xsl:call-template name="FeaturedRecipe" />
        	<xsl:call-template name="FeaturedVideo" />
        	<xsl:call-template name="FeaturedWine" />
         </div>
		<!-- secondary content in side bar -->
         <div class="relatedContent">
        	<xsl:call-template name="CookingLinks" />
            <xsl:call-template name="MealPlannerTeaser" />
        </div>
		<!-- cooking related articles module -->
        <xsl:call-template name="CookingContent" />
        <script type="text/javascript">
			document.observe('dom:loaded',function(){
				var staticpagetypeid = <xsl:value-of select="//StaticPageType/StaticPageTypeID"/>;
				LoadAdInternal(staticpagetypeid);
			});
        </script>
	</xsl:template>
    
<!-- ======================================================================================================================== -->    
    <!-- Links in related content div -->
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
                        <xsl:attribute name="href">##root##/Recipes/RecipeVideos.aspx</xsl:attribute>
                        	Watch Cooking Videos
                        </a>
                    </dt>
                  	<dd>Learn cooking techniques from our collection of videos.</dd>
          		</dl>
    	</div>
    </xsl:template>
    
<!-- ======================================================================================================================== -->      
    
    <xsl:template name="MealPlannerTeaser">
    	<div class="mealPlanner recipeMod">
            	<h2>
					Meal Planner
				</h2>
                <xsl:for-each select="//MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
				<xsl:sort select="DisplayOrderDate" order="ascending" />
					<h3>
						<xsl:value-of select="DisplayDate" />
					</h3>
					<ul>
					<xsl:for-each select="key('meals-by-date', DisplayDate)">
					<xsl:sort select="RecipeTitle" />
						<li>
							<a>
								<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
								<xsl:value-of select="RecipeTitle"/>
							</a>
						</li>
					</xsl:for-each>
					</ul>
				</xsl:for-each>
				<a class="meal-planner-more" title="View full week">
					<xsl:attribute name="href">##root##/Recipes/MealPlannerFull.aspx</xsl:attribute>
					<xsl:text>More recipes...</xsl:text>
				</a>
    	</div>
    </xsl:template>
    
<!-- ======================================================================================================================== -->    
    
    <xsl:template name="FeaturedRecipe">
          <xsl:for-each select="ExpressLane/RecipeData/GenericRecipe">
          <div id="featuredRecipe" class="recipeMod">
              	<h2>Featured Recipe</h2>
              	<!-- IE6 hack -->
                <xsl:comment>[if lte IE 6]&gt;&lt;table&gt;&lt;tr&gt;&lt;![endif]</xsl:comment>
        		<xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
				<!-- END IE6 hack -->
                <div class="featuredImage">
              		<a>
                  		<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeId=<xsl:value-of select="RecipeID" /></xsl:attribute>
                  		<img>
                      		<xsl:attribute name="src">
                          		<xsl:value-of select="Images/RecipeImage/RecipeImageURL" />
                      		</xsl:attribute>
                      		<xsl:attribute name="alt">
                          		<xsl:value-of select="Title" />
                      		</xsl:attribute>
                  		</img>
              		</a>
          		</div>
				<!-- IE6 hack -->
                <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
                <xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
				<!-- END IE6 hack -->
                <div class="featuredDetail">
                  <h3>
                      <a>
                          <xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeId=<xsl:value-of select="RecipeID" /></xsl:attribute>
                          <xsl:value-of select="Title" />
                      </a>
                   </h3>
                   <xsl:call-template name="RatingControl">
                      <xsl:with-param name="AverageRating" select="AverageRating" />
                      <xsl:with-param name="TotalRatings" select="NumberOfRatings" />
                  </xsl:call-template>
                  <a class="viewLink">
                  	<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeId=<xsl:value-of select="RecipeID" /></xsl:attribute>
                    <xsl:text>View this recipe</xsl:text>
                  </a>
                </div>
			<!-- IE6 hack -->
            <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
			<xsl:comment>[if lte IE 6]&gt;&lt;/tr&gt;&lt;/table&gt;&lt;![endif]</xsl:comment>
			<!-- END IE6 hack -->
          </div>
          </xsl:for-each>
    </xsl:template>
	
<!-- ======================================================================================================================== -->
	
	<xsl:template name="FeaturedVideo">
	<xsl:for-each select="ExpressLane/Video">
		<xsl:variable name="Url"><xsl:value-of select="concat('##root##/Recipes/RecipeVideos.aspx?videoid=',ExternalVideoID,'&amp;videotitle=',Title)" /></xsl:variable>
        <xsl:variable name="RuntimeMinutes">
            <xsl:if test="floor(Runtime div 60) &lt; 10">0</xsl:if>
            <xsl:value-of select="floor(Runtime div 60)" />
        </xsl:variable>
        <xsl:variable name="RuntimeSeconds">
            <xsl:if test="Runtime mod 60 &lt; 10">0</xsl:if>
            <xsl:value-of select="Runtime mod 60" />
        </xsl:variable>
        <xsl:variable name="Runtime">
			<xsl:value-of select="concat($RuntimeMinutes,':',$RuntimeSeconds)" />
        </xsl:variable>
		<div id="featuredVideo" class="recipeMod">
        	<h2>Featured Video</h2>
			<!-- IE6 hack -->
			<xsl:comment>[if lte IE 6]&gt;&lt;table&gt;&lt;tr&gt;&lt;![endif]</xsl:comment>
        	<xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
			<!-- END IE6 hack -->
            <div class="featuredImage">
                <a>
            	<xsl:attribute name="href"><xsl:value-of select="$Url" /></xsl:attribute>
            		<img>
            			<xsl:attribute name="src">
                			<xsl:choose>
							<xsl:when test="string-length(ThumbNail) &gt; 0">
								<xsl:value-of select="ThumbNail" />
							</xsl:when>
							<xsl:otherwise>##root##/Assets/Common/Images/RecipeSearch/no_image_200.jpg</xsl:otherwise>
							</xsl:choose>
                		</xsl:attribute>
                		<xsl:attribute name="alt">
                			<xsl:value-of select="Title" />
                		</xsl:attribute>
            		</img>
            	</a>
				<xsl:if test="$RuntimeMinutes != 'NaN' and $RuntimeSeconds != 'Nan'"> 
                	<span class="runtime"><xsl:value-of select="$Runtime" /></span>
				</xsl:if>
            </div>
			<!-- IE6 hack -->
            <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
            <xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
            <!-- END IE6 hack -->
			<div class="featuredDetail">
            	<h3>
                	<a>
                    	<xsl:attribute name="href"><xsl:value-of select="$Url" /></xsl:attribute>
                      	<xsl:value-of select="Title" />
                  	</a>
              	</h3>
				<!-- Hide until we have ratings on video page -->
				<!-- 
                <xsl:call-template name="RatingControl">
                  	<xsl:with-param name="AverageRating" select="AverageRating" />
                  	<xsl:with-param name="TotalRatings" select="NumberOfRatings" />
              	</xsl:call-template>
				-->
                <p>
                	<xsl:value-of select="Description" />
                </p>
                <a class="viewLink">
                	<xsl:attribute name="href"><xsl:value-of select="$Url" /></xsl:attribute>
                    <xsl:text>Watch this video</xsl:text>
                </a>
            </div>
			<!-- IE6 hack -->
      		<xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
			<xsl:comment>[if lte IE 6]&gt;&lt;/tr&gt;&lt;/table&gt;&lt;![endif]</xsl:comment>
			<!-- END IE6 hack -->
        </div>
		</xsl:for-each>
	</xsl:template>
	
<!-- ======================================================================================================================== -->
 
<xsl:template name="FeaturedWine">
<xsl:for-each select="ExpressLane/Wine">
	<div id="featuredWine" class="recipeMod">
       	<h2>Featured Wine</h2>
		<!-- IE6 hack -->
        <xsl:comment>[if lte IE 6]&gt;&lt;table&gt;&lt;tr&gt;&lt;![endif]</xsl:comment>
        <xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
		<!-- END IE6 hack -->
        <div class="featuredImage">
       		<xsl:variable name="WineImage">
				<xsl:choose>
					<xsl:when test="string-length(LargeImageUrl) &gt; 0"><xsl:value-of select="LargeImageUrl" /></xsl:when>
					<xsl:otherwise>##root##/Assets/Common/Images/RecipeCenter/WineBackup.jpg</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<img>
       			<xsl:attribute name="src">
           			<xsl:value-of select="$WineImage" />
           		</xsl:attribute>
           		<xsl:attribute name="alt">
           			<xsl:value-of select="WineName" />
           		</xsl:attribute>
       		</img>
            <br />
            <a class="button">
            <xsl:attribute name="onclick">AddToShoppingList(<xsl:value-of select="ProductID" />, 3)</xsl:attribute>
            	<span>Add to List</span>
            </a>
        </div>
		<!-- IE6 hack -->
        <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
        <xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
		<!-- END IE6 hack -->
        <div class="featuredDetail">
			<h3><xsl:value-of select="WineName" /></h3>
            <!-- removed until we have a place for users to rate wine. -->
			<!--
			<xsl:call-template name="RatingControl">
        		<xsl:with-param name="AverageRating" select="AverageRating" />
            	<xsl:with-param name="TotalRatings" select="NumberOfRatings" />
        	</xsl:call-template>
			-->
        	<ul id="wineDetail">
        		<li><strong>Varietal:</strong><xsl:value-of select="Varietal" /></li>
            	<li><strong>Producer:</strong><xsl:value-of select="Producer" /></li>
            	<li><strong>Region:</strong><xsl:value-of select="Region" /></li>
            	<li><strong>Bottle Size:</strong><xsl:value-of select="BottleSize" /></li>
        	</ul>
            <xsl:if test="(BodyValue + FruitValue + AcidValue) &gt; 0">
        	<h3>Attributes</h3>
        	<ul id="wineAttributes">
        		<li>
            		<strong>Body:</strong>
                	<div class="attributeValue">
                		<span>
                    	<xsl:attribute name="style">width:
                    		<xsl:value-of select="concat(BodyValue * 20,'%')" />
                    	</xsl:attribute>
                    	<xsl:value-of select="BodyValue" />
                    	</span>
               		</div>
            	</li>
            	<li>
            		<strong>Fruit:</strong>
                	<div class="attributeValue">
                		<span>
                    		<xsl:attribute name="style">width:
                    			<xsl:value-of select="concat(FruitValue * 20,'%')" />
                    		</xsl:attribute>
                    		<xsl:value-of select="FruitValue" />
                    	</span>
                	</div>
            	</li>
            	<li>
            		<strong>Acid:</strong>
                	<div class="attributeValue">
                		<span>
                    		<xsl:attribute name="style">width:
                    			<xsl:value-of select="concat(AcidValue * 20,'%')" />
                    		</xsl:attribute>
                    		<xsl:value-of select="AcidValue" />
                    	</span>
                	</div>
            	</li>
        	</ul>
            </xsl:if>
        </div>
		<!-- IE6 hack -->
        <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
		<xsl:comment>[if lte IE 6]&gt;&lt;/tr&gt;&lt;/table&gt;&lt;![endif]</xsl:comment>
		<!-- END IE6 hack -->
    </div>
</xsl:for-each>
</xsl:template>

<!-- ======================================================================================================================== -->

<xsl:template name="CookingContent">
	<div class="cookingContent recipeMod">
        <h2>
            <xsl:text>Cooking Tips, Techniques, and Help</xsl:text>
        </h2>
        <xsl:comment>[if lte IE 6]&gt;&lt;table&gt;&lt;tr&gt;&lt;![endif]</xsl:comment>
        <xsl:for-each select="ExpressLane/FeaturedArticles/Article[ArticleTypeID &lt; 9][position()&lt;4]">
             <xsl:comment>[if lte IE 6]&gt;&lt;td&gt;&lt;![endif]</xsl:comment>
            <div>
                <xsl:variable name="Id">
                    <xsl:choose>
                        <xsl:when test="ArticleTypeID = 1">
                            <xsl:text>Ask The Chef</xsl:text>
                        </xsl:when>
                        <xsl:when test="ArticleTypeID = 3">
                            <xsl:text>Cooking Tips</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>Featured Article</xsl:otherwise><!-- use this for all other articles -->
                    </xsl:choose>
                </xsl:variable>
                <xsl:attribute name="id"><xsl:value-of select="normalize-space($Id)" /></xsl:attribute>
                <h3><xsl:value-of select="$Id" /></h3>
                <h4>
                    <a>
                        <xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
                        <xsl:value-of select="Title" disable-output-escaping="yes"/>
                    </a>
                </h4>
                <a class="articleImage">
                    <xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
                    <xsl:if test="ImageURL != '' ">
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageURL"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title" disable-output-escaping="yes"/>
                        </xsl:attribute>
                    </img>
                </xsl:if>
                </a>
                <a>
                    <xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
                    <xsl:text>Read full article</xsl:text>
                </a>
            </div>
            <xsl:if test="position() != last()">
                <div class="separator vertical"></div>
            </xsl:if>
        <xsl:comment>[if lte IE 6]&gt;&lt;/td&gt;&lt;![endif]</xsl:comment>
        </xsl:for-each>
        <xsl:comment>[if lte IE 6]&gt;&lt;/tr&gt;&lt;/table&gt;&lt;![endif]</xsl:comment>
	</div>
</xsl:template>

<!-- ======================================================================================================================== -->

<xsl:template name="RatingControl">
<xsl:param name="TotalRatings" />
<xsl:param name="AverageRating" />
<xsl:if test="$TotalRatings &gt; 0">
    <div class="averageRating">
        <span class="ratedText"><xsl:text>Rated </xsl:text></span>
        <span class="ratingContainer">
            <xsl:call-template name="Rating">
                <xsl:with-param name="RatingValue" select="$AverageRating" />
            </xsl:call-template>
            <xsl:value-of select="concat($AverageRating, ' stars')" />
        </span>
        <span class="ratedText">
            <xsl:text> by </xsl:text>
            <xsl:value-of select="$TotalRatings" />
            <xsl:text> user</xsl:text>
            <xsl:if test="$TotalRatings &gt; 1">s</xsl:if>
        </span>
    </div>
</xsl:if>
</xsl:template>

<!-- ========================================================================================================================================= -->      

	<xsl:template name="Rating">
		<xsl:param name="RatingValue"/>
		<xsl:if test="$RatingValue &gt; 0">
			<span class="ratingOn ratingSelected"></span>
			<xsl:call-template name="Rating">
				<xsl:with-param name="RatingValue" select="$RatingValue - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

<!-- ========================================================================================================================================= -->

</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->