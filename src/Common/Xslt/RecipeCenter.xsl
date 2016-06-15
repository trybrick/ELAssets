<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="FeaturedRecipe.xsl"/>
	<xsl:import href="MealPlannerTeaser.xsl"/>
	<xsl:import href="ChangeDietaryPreferences.xsl"/>
	<xsl:import href="QuickSearch.xsl"/>
	<xsl:import href="TopRecipesTeaser.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script src="/Assets/Common/Js/ActiveContent.js" type="text/javascript"/>
		<script type="text/javascript" src="/Assets/Common/Js/RecipeCenter.js"></script>
		<div id="RecipeCardMiddle">
			<div id="FeaturedRecipeTeaser" class="recipe teaser">
				<xsl:apply-templates select="ExpressLane/FeaturedRecipeList" />
			</div>
			<div id="MealPlanner" class="recipe teaser">
				<xsl:apply-templates select="ExpressLane/MealPlannerList"/>
			</div>
			<div id="ChangeDietaryPreferences">
				<xsl:apply-templates select="ExpressLane/ChangeDietaryPreferences"/>
			</div>
			<xsl:if test="ExpressLane/RecipeInformation/ChainRecipeInformation/ChainRecipeIcon != ''">
				<div id="ChainRecipes">
					<h2>
						<a href="##root##/Recipes/RecipeSearchResults.aspx?ChainOnlyRecipes=true">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="ExpressLane/RecipeInformation/ChainRecipeInformation/ChainRecipeIcon"/>
								</xsl:attribute>
								<xsl:attribute name="border">0</xsl:attribute>
							</img>Click here for <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> featured recipes!</a>
					</h2>
				</div>
			</xsl:if>
			<div id="SavedRecipes">
				<span class="RecipeBox">
					<a href="##root##/Recipes/MyRecipes.aspx">My Recipe Box</a>- recipes I have saved!</span>
			</div>
			<div id="TopRecipesTeaser">
				<a href="javascript:;" style="text-decoration:none; cursor:pointer;">
					<h2 onclick="togglePanelTopRecipes();">
                    	<xsl:choose>
                            <xsl:when test="ExpressLane/RecipeCenter/TopRecipeElements/Title != ''">
                                <xsl:value-of select="ExpressLane/RecipeCenter/TopRecipeElements/Title"/>:
                            </xsl:when>
                            <xsl:otherwise>
                                Top 50 Recipes:
                            </xsl:otherwise>
                        </xsl:choose>
						<xsl:comment><![CDATA[[if lte IE 6]><span style="font-size:70%"> [click to expand/hide]</span><![endif]]]></xsl:comment>
					</h2>
				</a>
				<a href="javascript:;">
					<h1 id="toggler3" class="accordionToggle" onclick="togglePanelTopRecipes();"></h1>
				</a>
				<div id="PanelTopRecipes" class="accordion_content" style="display: none;">

					<div id="column1" style="width:46%; float:left;">
						<ul>
							<xsl:for-each select="ExpressLane/TopRecipes/TopRecipeList">
								<xsl:if test="position() &lt;= count(/ExpressLane/TopRecipes/TopRecipeList) div 2">
									<li>
										<a>
											<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
											<xsl:value-of select="RecipeTitle"/>
										</a>
									</li>
								</xsl:if>
							</xsl:for-each>
						</ul>
					</div>

					<div id="column2" style="width:46%; float:left;">
						<ul>
							<xsl:for-each select="ExpressLane/TopRecipes/TopRecipeList">
								<xsl:if test="position() &gt; count(/ExpressLane/TopRecipes/TopRecipeList) div 2">
									<li>
										<a>
											<xsl:attribute name="href">##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
											<xsl:value-of select="RecipeTitle"/>
										</a>
									</li>
								</xsl:if>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
			<div id="QuickSearch">
				<xsl:apply-templates select="ExpressLane/QuickSearch"/>
			</div>
			<div id="AdvancedSearch">
				<a href="javascript:;" style="text-decoration:none;cursor:pointer;">
					<h2 onclick="togglePanelSearch();">Advanced Recipe Search: <xsl:comment><![CDATA[[if lte IE 6]><span style="font-size:70%"> [click to expand/hide]</span><![endif]]]></xsl:comment></h2>
				</a>

				<a href="javascript:;">
					<h1 id="toggler" class="accordionToggle" onclick="togglePanelSearch();"></h1>
				</a>

				<div id="PanelSearch" class="accordion_content" style="display: none;">
					<div id="CtrlDivSubTitle">
						<p>You can combine more than one attribute.</p>
					</div>
					<div id="CtrlDivCourseSelection">
						<select id="drpCourse">
							<option value="">-- Select Course, Food or Event Type --</option>
							<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/Course/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivRegionSelection">
						<select id="drpRegion">
							<option value="">-- Select a Region --</option>
							<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/Region/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivPreparationTimeSelection">
						<select id="drpPreparationTime">
							<option value="">-- Select a Total Preparation Time --</option>
							<option value="20">20 minute meals</option>
							<option value="30">30 minute meals</option>
							<option value="45">45 minute meals</option>
							<option value="60">60 minute meals</option>
						</select>
					</div>
					<div id="CtrlDivHolidaySelection">
						<select id="drpHoliday">
							<option value="">-- Select a Holiday --</option>
							<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/Holiday/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivSkillLevelSelection">
						<select id="drpSkillLevel">
							<option value="">-- Select a Skill Level --</option>
							<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/SkillLevel/RecipeSkillLevel">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="SkillLevel" disable-output-escaping="yes"/>
									</xsl:attribute>
									<xsl:value-of select="SkillLevelDescription" disable-output-escaping="yes"/>
								</option>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivEquipmentSelection">
						<select id="drpEquipment">
							<option value="">-- Select Equipment --</option>
							<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/Equipment/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivTextSearch">
						<p>Name and Ingredients</p>
						<input id="txtSearch" runat="server" type="text">
							<xsl:attribute name="onkeypress">if (event.keyCode==13) RunAdvancedSearch(); return event.keyCode!=13;</xsl:attribute>
						</input>
						<a>
							<xsl:attribute name="class">button</xsl:attribute>
							<xsl:attribute name="href">javascript:RunAdvancedSearch();</xsl:attribute>
							<span>Search</span>
						</a>
					</div>
					<div id="SearchTips">
						<a href="##root##/Recipes/RecipeSearchTips.aspx">Search Tips</a>
					</div>
				</div>
			</div>
		</div>
		<div id="RecipeCardBottom">
		</div>








		<xsl:for-each select="ExpressLane/FeaturedArticles/Article[ArticleTypeID &lt; 9][position()&lt;4]">

			<div id="FeaturedArticleTeaser" class="recipe teaser">
				<h2>
					<a>
						<xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
						<xsl:if test="ArticleTypeID=1">Ask The Chef</xsl:if>
						<xsl:if test="ArticleTypeID=2">Featured Article</xsl:if>
						<xsl:if test="ArticleTypeID=3">Cooking Tips</xsl:if>
						<xsl:if test="ArticleTypeID=4">Kids Corner</xsl:if>
						<xsl:if test="ArticleTypeID=5">Sage Advice</xsl:if>
						<xsl:if test="ArticleTypeID=6">Featured Article</xsl:if>
						<xsl:if test="ArticleTypeID=7">Cookbook Review</xsl:if>
						<xsl:if test="ArticleTypeID=8">Upcoming Events</xsl:if>
						<xsl:if test="ArticleTypeID=''">Featured Article</xsl:if>
					</a>
				</h2>

				<h3>
					<xsl:value-of select="Title" disable-output-escaping="yes"/>
				</h3>

				<a>
					<xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>
					<xsl:if test="ImageURL != '' ">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageURL"/>
							</xsl:attribute>
						</img>
					</xsl:if>
				</a>

				<p>
					<xsl:value-of select="Teaser"/>
				</p>
				<a>
					<xsl:attribute name="href">##root##/Recipes/Article.aspx?ArticleID=<xsl:value-of select="ArticleID"/></xsl:attribute>more...</a>
			</div>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AdvancedSearchCategory" match="RecipeCategory">
		<xsl:if test="IsActive = 'true'">
			<option>
				<xsl:attribute name="value">
					<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
				</xsl:attribute>
				<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
			</option>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-112-RecipeCenter.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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