<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
<!-- import this file on any page that displays the search module -->
<xsl:import href="../Recipe/QuickSearchV2.xsl" />
<xsl:output method="html" />

<!-- ========================================================================================================================================= -->

	<xsl:template name="SearchControl" match="/">
    	<script type="text/javascript" src="/Assets/Common/Js/GenericSearch/SearchService.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/Recipe/RecipeSearchControl.js"></script>
        <div id="searchControls">
		<!-- accessibility skip link. place #recipeContent named anchor on pages that include this template. -->
        <a id="skipToContent" href="#recipeContent">Skip search options</a>
        <xsl:call-template name="TextField">
			<!-- <xsl:with-param name="Label" select="'Search Term'"/> -->
			<xsl:with-param name="Name" select="'SearchTerm'"/>
            <xsl:with-param name="ButtonText" select="'Search'" />
            <xsl:with-param name="ButtonAction" select="'NewSearch();'" />
		</xsl:call-template>
        
        <!-- <a class="searchTips searchControlLink" href="javascript:ToggleSearchTips();">Search Tips</a> -->
		<a class="advancedSearch searchControlLink" href="javascript:ToggleAdvancedSearch();">Advanced Search</a>
        <a class="quickSearch searchControlLink" href="javascript:ToggleQuickSearch();">Quick Search</a>
        
        <xsl:call-template name="SearchTips" />
        <xsl:call-template name="QuickSearch" />
        <xsl:call-template name="AdvancedSearchModal" />
		
        <xsl:call-template name="TextFieldHidden">
			<xsl:with-param name="Name" select="'SearchType'"/>
			<xsl:with-param name="Default" select="'3'"/>
		</xsl:call-template>
		
        <xsl:call-template name="TextFieldHidden">
			<xsl:with-param name="Name" select="'PageNumber'"/>
			<xsl:with-param name="Default" select="'0'"/>
		</xsl:call-template>
		
        <xsl:call-template name="TextFieldHidden">
			<xsl:with-param name="Name" select="'PageLength'"/>
			<xsl:with-param name="Default" select="'20'"/>
		</xsl:call-template>
		
        <xsl:call-template name="TextFieldHidden">
			<xsl:with-param name="Name" select="'SearchCategoryID'"/>
		</xsl:call-template>
		
        </div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    
    
    <xsl:template name="SearchTips" match="/">
    	<div id="SearchTipsHelp" style="display:none">
			<p class="searchTips">When an ingredient or recipe title is misspelled in a search, unexpected or no results may be returned.  As an aide, the search engine checks words with a similar spelling.  For example, if &quot;<em>rasberry</em>&quot; is typed, the correct spelling (&quot;<em>raspberry</em>&quot;) is also included in the search.  Below are tips on how to search for a variety of peanut-related items.</p>
                <table class="searchTips">
					<thead>
						<tr>
							<th scope="col">This Search:</th>
							<th scope="col">Will Produce This Result:</th>
						</tr>
                    </thead>
                    <tbody>
						<tr class="alternateRow">
							<td><strong>peanut</strong></td>
							<td>results that contain the word &quot;<em>peanut</em>&quot;</td>
						</tr>	
						<tr>
							<td><strong>peanut oil</strong></td>
							<td>results that contain both the words &quot;<em>peanut</em>&quot; and &quot;<em>oil</em>&quot;</td>
						</tr>		
						<tr class="alternateRow">
							<td><strong>&quot;peanut oil&quot;</strong></td>
							<td>results that contain the exact phrase &quot;<em>peanut oil</em>&quot;</td>
						</tr>	
					</tbody>
            	</table>
			</div>
    </xsl:template>
    
<!-- ========================================================================================================================================= -->    
    
  <xsl:template name="QuickSearch" match="/">	
      <div id="quickSearch" style="display:none;">
          <div class="quickSearch clearfix">
			<!--<xsl:call-template name="RecipeQuickSearches" />-->
			<xsl:apply-templates select="//RecipeQuickSearches" />
          </div>
      </div>
  </xsl:template>
    
<!-- ========================================================================================================================================= -->

	<xsl:template match="/" name="AdvancedSearchModal">
	<div id="advancedSearch" style="display:none;">
            <div id="Categories" class="advancedSearchMod">
            <h2>Search Criteria</h2>
				<xsl:call-template name="CategorySelect">
					<xsl:with-param name="CategoryType" select="'Course'"/>
					<xsl:with-param name="EmptyText" select="'-- Course or Event --'"/>
				</xsl:call-template>
				<xsl:call-template name="CookingTimeList"/>
				<xsl:call-template name="CategorySelect">
					<xsl:with-param name="CategoryType" select="'Region'"/>
					<xsl:with-param name="EmptyText" select="'-- Region --'"/>
				</xsl:call-template>
				<xsl:call-template name="CategorySelect">
					<xsl:with-param name="CategoryType" select="'Holiday'"/>
					<xsl:with-param name="EmptyText" select="'-- Holiday --'"/>
				</xsl:call-template>
				<xsl:call-template name="SkillLevelList"/>
				<xsl:call-template name="CategorySelect">
					<xsl:with-param name="CategoryType" select="'Equipment'"/>
					<xsl:with-param name="EmptyText" select="'-- Equipment --'"/>
				</xsl:call-template>
			</div>
            <div class="nutrition advancedSearchMod">
            <h2>Nutrition</h2>
			<table id="Nutrition">
            	<thead>
                	<tr>
                    	<th scope="col">Nutrient</th>
                        <th scope="col">Min</th>
                        <th scope="col"></th>
                        <th scope="col">Max</th>
                    </tr>
                </thead>
                <tbody>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Protein'"/>
					<xsl:with-param name="Name" select="'Protein'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Total Fat'"/>
					<xsl:with-param name="Name" select="'TotalFat'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Carbohydrates'"/>
					<xsl:with-param name="Name" select="'Carbohydrates'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Calories'"/>
					<xsl:with-param name="Name" select="'Calories'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Sugars'"/>
					<xsl:with-param name="Name" select="'Sugars'"/>
				</xsl:call-template>
                <!-- 
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Dietary Fiber'"/>
					<xsl:with-param name="Name" select="'DietaryFiber'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Calcium'"/>
					<xsl:with-param name="Name" select="'Calcium'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Iron'"/>
					<xsl:with-param name="Name" select="'Iron'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Sodium'"/>
					<xsl:with-param name="Name" select="'Sodium'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Vitamin A'"/>
					<xsl:with-param name="Name" select="'VitaminA'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Vitamin C'"/>
					<xsl:with-param name="Name" select="'VitaminC'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Cholesterol'"/>
					<xsl:with-param name="Name" select="'Cholesterol'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Saturated Fat'"/>
					<xsl:with-param name="Name" select="'SaturatedFat'"/>
				</xsl:call-template>
				<xsl:call-template name="RangeField">
					<xsl:with-param name="Label" select="'Unsaturated Fat'"/>
					<xsl:with-param name="Name" select="'UnsaturatedFat'"/>
				</xsl:call-template> -->
                </tbody>
			</table>
            </div>
            <div class="titleExclusion advancedSearchMod">
            <h2>Title &amp; Exclusion</h2>
           		<xsl:call-template name="TextField">
					<xsl:with-param name="Label" select="'Recipe Title'"/>
					<xsl:with-param name="Name" select="'RecipeTitle'"/>
                	<xsl:with-param name="Class" select="'excludeTitle'" />
				</xsl:call-template>
            	<xsl:call-template name="TextField">
					<xsl:with-param name="Label" select="'Exclude from results'"/>
					<xsl:with-param name="Name" select="'Exclude'"/>
                	<xsl:with-param name="Class" select="'excludeTitle'" />
				</xsl:call-template>
            </div>
            <a href="#" class="search button" onclick="NewAdvancedSearch();"><span>Search</span></a>
		</div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->

	<xsl:template name="TextField">
		<xsl:param name="Label"/>
		<xsl:param name="Name"/>
        <xsl:param name="Class" />
        <xsl:param name="ButtonText" />
        <xsl:param name="ButtonAction" />
		<div>
        	<xsl:attribute name="class">
            	<xsl:text>searchField </xsl:text>
                <xsl:if test="$Class"><xsl:text> </xsl:text><xsl:value-of select="$Class" /></xsl:if>
            </xsl:attribute>
            <xsl:if test="$Label">
				<label for="{$Name}"><xsl:value-of select="$Label"/><xsl:text>: </xsl:text></label>
            </xsl:if>
			<input type="text">
				<xsl:attribute name="name">
					<xsl:value-of select="$Name"/>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:value-of select="concat('txt', $Name)"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="//SearchParameters/node()[name() = $Name]"/>
				</xsl:attribute>
			</input>
            <xsl:if test="$ButtonText">
            	<a href="#" class="search button">
                <xsl:attribute name="onclick">
                	<xsl:value-of select="$ButtonAction" />
                </xsl:attribute>
				<span><xsl:value-of select="$ButtonText" /></span>
				</a>
            </xsl:if>
		</div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="TextFieldHidden">
		<xsl:param name="Name"/>
		<xsl:param name="Default"/>
		<input type="hidden">
			<xsl:attribute name="name">
				<xsl:value-of select="$Name"/>
			</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('hdn', $Name)"/>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:choose>
					<xsl:when test="//SearchParameters/node()[name() = $Name]">
						<xsl:value-of select="//SearchParameters/node()[name() = $Name]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$Default"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</input>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->

	<xsl:template name="RangeField">
		<xsl:param name="Label"/>
		<xsl:param name="Name"/>
		<xsl:variable name="Node" select="//SearchParameters/node()[name() = $Name]"/>
		<xsl:variable name="Min">
			<xsl:choose>
				<xsl:when test="contains($Node, ',')">
					<xsl:value-of select="substring-before($Node, ',')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~')">
					<xsl:value-of select="substring-before($Node, '~')"/>
				</xsl:when>
				<xsl:when test="contains(//SearchField[IndexField = $Name]/DefaultSearchDirection, '&lt;')">
					<xsl:value-of select="$Node"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Max">
			<xsl:choose>
				<xsl:when test="contains($Node, ',')">
					<xsl:value-of select="substring-after($Node, ',')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~~')">
					<xsl:value-of select="substring-after($Node, '~~')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~')">
					<xsl:value-of select="substring-after($Node, '~')"/>
				</xsl:when>
				<xsl:when test="contains(//SearchField[IndexField = $Name]/DefaultSearchDirection, '&gt;')">
					<xsl:value-of select="$Node"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<tr class="searchField">
			<td class="nutritionLabel"><xsl:value-of select="$Label"/><xsl:text>: </xsl:text></td>
			<td><input type="text" class="Numeric rangeField">
				<xsl:attribute name="name">
					<xsl:value-of select="$Name"/>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:value-of select="concat('txt', $Name, 'Min')"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="$Min"/>
				</xsl:attribute>
			</input>
            </td>
            <td style="text-align:center;"><xsl:text> -- </xsl:text></td>
            <td>
			<input type="text" class="Numeric rangeField">
				<xsl:attribute name="name">
					<xsl:value-of select="$Name"/>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:value-of select="concat('txt', $Name, 'Max')"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="$Max"/>
				</xsl:attribute>
			</input></td>
		</tr>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->

	<xsl:template name="RangeFieldHidden">
		<xsl:param name="Name"/>
		<xsl:variable name="Node" select="//SearchParameters/node()[name() = $Name]"/>
		<xsl:variable name="Min">
			<xsl:choose>
				<xsl:when test="contains($Node, ',')">
					<xsl:value-of select="substring-before($Node, ',')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~')">
					<xsl:value-of select="substring-before($Node, '~')"/>
				</xsl:when>
				<xsl:when test="contains(//SearchField[IndexField = $Name]/DefaultSearchDirection, '&lt;')">
					<xsl:value-of select="$Node"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Max">
			<xsl:choose>
				<xsl:when test="contains($Node, ',')">
					<xsl:value-of select="substring-after($Node, ',')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~~')">
					<xsl:value-of select="substring-after($Node, '~~')"/>
				</xsl:when>
				<xsl:when test="contains($Node, '~')">
					<xsl:value-of select="substring-after($Node, '~')"/>
				</xsl:when>
				<xsl:when test="contains(//SearchField[IndexField = $Name]/DefaultSearchDirection, '&gt;')">
					<xsl:value-of select="$Node"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<input type="hidden">
			<xsl:attribute name="name">
				<xsl:value-of select="$Name"/>
			</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('hdn', $Name, 'Min')"/>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="$Min"/>
			</xsl:attribute>
		</input>
		<input type="hidden">
			<xsl:attribute name="name">
				<xsl:value-of select="$Name"/>
			</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('hdn', $Name, 'Max')"/>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="$Max"/>
			</xsl:attribute>
		</input>
	</xsl:template>    
    
<!-- ========================================================================================================================================= -->
	
    <xsl:template name="CategorySelect">
		<xsl:param name="CategoryType"/>
		<xsl:param name="EmptyText"/>
		<xsl:variable name="Node" select="ExpressLane/SearchParameters/AttributeList"/>
		<select name="AttributeList" class="alwaysShow categorySelect">
			<xsl:attribute name="id">
				<xsl:value-of select="concat('ddl', $CategoryType)"/>
			</xsl:attribute>
			<option value="">
				<xsl:value-of select="$EmptyText"/>
			</option>
			<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/node()[name() = $CategoryType]/RecipeCategory">
				<option>
					<xsl:attribute name="value">
						<xsl:value-of select="RecipeCategoryDescription"/>
					</xsl:attribute>
					<xsl:if test="contains($Node, RecipeCategoryDescription)">
						<xsl:attribute name="selected"/>
					</xsl:if>
					<xsl:value-of select="RecipeCategoryDescription"/>
				</option>
			</xsl:for-each>
		</select>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->
	
    <xsl:template name="SkillLevelList">
		<xsl:variable name="Node" select="ExpressLane/SearchParameters/SkillLevelList"/>
		<select name="SkillLevelList" id="ddlSkillLevelList" class="alwaysShow categorySelect">
			<option value="">-- Skill level --</option>
			<xsl:for-each select="ExpressLane/RecipeAdvancedSearchCategories/SkillLevel/RecipeSkillLevel">
				<xsl:sort select="SkillLevel" data-type="number"/>
				<option>
					<xsl:attribute name="value">
						<xsl:value-of select="SkillLevel"/>
					</xsl:attribute>
					<xsl:if test="$Node = SkillLevel">
						<xsl:attribute name="selected"/>
					</xsl:if>
					<xsl:value-of select="SkillLevelDescription"/>
				</option>
			</xsl:for-each>
		</select>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->
	
    <xsl:template name="CookingTimeList">
		<xsl:variable name="Node" select="ExpressLane/SearchParameters/RecipeTime"/>
		<select name="RecipeTime" id="ddlCookingTimeList" class="alwaysShow categorySelect">
			<option value="">-- Total preparation time --</option>
			<option value="20">
				<xsl:if test="$Node = '20'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>20 minute meals</xsl:text>
			</option>
			<option value="30">
				<xsl:if test="$Node = '30'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>30 minute meals</xsl:text>
			</option>
			<option value="45">
				<xsl:if test="$Node = '45'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>45 minute meals</xsl:text>
			</option>
			<option value="60">
				<xsl:if test="$Node = '60'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>60 minute meals</xsl:text>
			</option>
		</select>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->
    
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->