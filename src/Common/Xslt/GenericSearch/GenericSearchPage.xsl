<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:import href="../RecipeSearchCriteriaTips.xsl" />
<xsl:import href="GenericSearchControl.xsl" />
	<xsl:output method="html"/>
    
<!-- ========================================================================================================================================= -->    
    
	<xsl:template match="/">    
    <script type="text/javascript" src="/Assets/Common/Js/GenericSearch/SearchService.js"></script>
	<script type="text/javascript" src="/Assets/Common/Js/GenericSearch/GenericSearchPage.js"></script>
		<xsl:variable name="SearchTypeID">
			<xsl:choose>
				<xsl:when test="contains(ExpressLane/SearchParameters/SearchType, ',')">
					<xsl:value-of select="substring-before(ExpressLane/SearchParameters/SearchType, ',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ExpressLane/SearchParameters/SearchType"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 14">
				<xsl:call-template name="SearchPage">
					<xsl:with-param name="SearchTypeID" select="$SearchTypeID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericSearch/GenericSearch[SearchTypeID = $SearchTypeID]"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
<!-- ========================================================================================================================================= -->
    
	<xsl:template name="SearchPage">
		<xsl:param name="SearchTypeID"/>
		<div id="Search">
			<div id="LineItem" class="LineItem">
				<xsl:call-template name="SearchControl"/>
                <div id="CurrentSearch" style="display:none;">
        			Current search filter:<br /><strong id="currentSearchText"></strong>
        		</div>
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericSearch/GenericSearch[SearchTypeID = $SearchTypeID]"/>
			</div>
		</div>
        <div id="loadingSearch" class="hidden">
        	<img alt="loading..." src="/Assets/Common/Images/ajax-loader.gif" />
        </div>
        <div id="searchResults"></div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->

	<xsl:template name="SearchSuggestions" match="SearchSuggestions">
		<xsl:if test="count(./SearchSuggestion) &gt; 0">
		
			<div id="searchSuggestions">
				<span>Did you mean ...</span>
				<ul>
					<xsl:for-each select="./SearchSuggestion">
						<xsl:variable name="link" select="concat('javascript:SetAndRunSearch(&quot;', Word, '&quot;);')" />
						<li>
							<a class="searchControlLink" href="{$link}">
								<xsl:value-of select="Word" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
	</xsl:template>
	
<!-- ========================================================================================================================================= -->  

	<xsl:template match="GenericSearch" name="SearchItemsPaged">
		<xsl:variable name="SearchTypeID" select="SearchTypeID"/>
		<xsl:variable name="PageNumber">
			<xsl:choose>
				<xsl:when test="number(//SearchParameters/PageNumber)">
					<xsl:value-of select="number(//SearchParameters/PageNumber)"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageLength">
			<xsl:choose>
				<xsl:when test="number(//SearchParameters/PageLength)">
					<xsl:value-of select="number(//SearchParameters/PageLength)"/>
				</xsl:when>
				<xsl:otherwise>20</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="SortBy" select="//SearchParameters/SortBy"/>
		<xsl:variable name="SearchCategoryID" select="//SearchParameters/SearchCategoryID"/>
		<xsl:variable name="SearchResults">
			<xsl:choose>
				<xsl:when test="number($SearchCategoryID)">
					<xsl:copy-of select="SearchResults/SearchResult[ItemID = //SearchResultCategory[SearchCategoryID = $SearchCategoryID and SearchTypeID = $SearchTypeID]/ItemID]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="SearchResults/SearchResult"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="SortedResults">
			<xsl:choose>
				<xsl:when test="$SortBy = 'ItemName'">
					<xsl:for-each select="msxsl:node-set($SearchResults)/node()">
						<xsl:sort select="ItemName"/>
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="$SortBy = 'Rating'">
					<xsl:for-each select="msxsl:node-set($SearchResults)/node()">
						<xsl:sort select="Rating" data-type="number" order="descending" />
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="msxsl:node-set($SearchResults)/node()">
						<xsl:sort select="Relevance" data-type="number" order="descending" />
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="StartPosition" select="$PageNumber * $PageLength"/>
		<xsl:variable name="EndPosition" select="$StartPosition + $PageLength"/>
		<xsl:variable name="PagedResults">
			<xsl:choose>
				<xsl:when test="$PageLength &gt; count(msxsl:node-set($SortedResults)/node())">
					<xsl:copy-of select="$SortedResults"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="msxsl:node-set($SortedResults)/node()[position() &gt; $StartPosition and position() &lt;= $EndPosition]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div>
        	<xsl:attribute name="class">
            	<xsl:if test="number(SearchTypeID)">
					searchType<xsl:value-of select="SearchTypeID" />
                </xsl:if>
                <xsl:text> results</xsl:text>
            </xsl:attribute>
			
			<xsl:apply-templates select="SearchSuggestions" />

            <dl id="searchLegend">
            	<dt class="hasVideo">[ V ]</dt>
                <dd> = Related video</dd>
                <dt class="hasSaleItem">[ S ]</dt>
                <dd> = Includes sale item</dd>
                <!-- <dt class="isChain">[ C ]</dt>
                <dd> = <xsl:value-of select="//GenericChain/ChainName" /> recipe</dd> -->
            </dl>
			<xsl:call-template name="SearchTypeSelect">
				<xsl:with-param name="SearchTypeID" select="$SearchTypeID" />
			</xsl:call-template>
            <xsl:call-template name="SortSelector">
				<xsl:with-param name="SortBy" select="//SearchParameters/SortBy" />
			</xsl:call-template>
			<div>
				<xsl:call-template name="Pager2">
					<xsl:with-param name="CurrentPage" select="$PageNumber"/>
					<xsl:with-param name="Increment" select="$PageLength"/>
					<xsl:with-param name="ItemCount" select="count(msxsl:node-set($SearchResults)/node())"/>
                    <xsl:with-param name="Position" select="'top'" />
				</xsl:call-template>
				<xsl:for-each select="SearchImages/SearchImage">
					<xsl:sort select="ImageUrl" order="descending"/>
					<xsl:call-template name="ImageDisplay">
						<xsl:with-param name="DisplayItems" select="$PagedResults"/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:call-template name="Pager2">
					<xsl:with-param name="CurrentPage" select="$PageNumber"/>
					<xsl:with-param name="Increment" select="$PageLength"/>
					<xsl:with-param name="ItemCount" select="count(msxsl:node-set($SearchResults)/node())"/>
                    <xsl:with-param name="Position" select="'bottom'" />
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template match="SearchImage" name="ImageDisplay">
		<xsl:param name="DisplayItems"/>
		<xsl:variable name="ImageUrl" select="ImageUrl"/>
		<xsl:if test="count(msxsl:node-set($DisplayItems)/node()[ImageUrl = $ImageUrl]) &gt; 0">
			<div class="resultGroup">
				<div class="resultImage">
				<img alt="">
					<xsl:attribute name="src">
						<xsl:choose>
							<xsl:when test="string-length(ImageUrl) &gt; 0">
								<xsl:value-of select="ImageUrl"/>
							</xsl:when>
							<xsl:otherwise>##root##/Assets/Common/Images/RecipeSearch/no_image_200.jpg</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</img>
				</div>
				<div class="resultItemList">
				<xsl:for-each select="msxsl:node-set($DisplayItems)/node()[ImageUrl = $ImageUrl]">
					<xsl:call-template name="ResultItem"/>
				</xsl:for-each>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="SearchResults" match="GenericSearch">
		<xsl:variable name="SearchTypeID" select="SearchTypeID"/>
	<div id="searchResults">
		<div class="categoryDisplayContainer sideLeft">
			<h3>Refine Search</h3>
			<ul class="categoryTopList">
			<!-- <li class="separator"></li> -->
			<li class="categoryTopItem" style="cursor:pointer;">
				<a href="#"><xsl:text>All Items (</xsl:text>
				<xsl:value-of select="count(//SearchResult[SearchTypeID = $SearchTypeID])" />
				<xsl:text>)</xsl:text></a>
			</li>
			<!-- <li class="separator"></li> -->
			<xsl:for-each select="SearchCategories/SearchCategory[ParentSearchCategoryID = '']">
            <xsl:sort select="CategoryName" />
				<xsl:call-template name="SearchCategory">
					<xsl:with-param name="Level" select="'1'" />
                    <xsl:with-param name="Position" select="position()" />
				</xsl:call-template>					
			</xsl:for-each>
			</ul>
		</div>
		<xsl:call-template name="SearchItemsPaged"/>
	</div>
	</xsl:template>
<!-- ========================================================================================================================================= -->    

	<xsl:template match="SearchCategory" name="SearchCategory">
		<xsl:param name="Level" />
        <xsl:param name="Position" />
		<xsl:variable name="SearchCategoryID" select="SearchCategoryID" />
		<xsl:variable name="SearchTypeID" select="SearchTypeID" />
		<xsl:variable name="SelectedCategoryID" select="//SearchParameters/SearchCategoryID" />
		<xsl:variable name="ChildCount" select="count(//SearchCategory[SearchTypeID = $SearchTypeID and ParentSearchCategoryID = $SearchCategoryID])" />
		<xsl:variable name="SelectedChild" select="//SearchCategory[SearchTypeID = $SearchTypeID and ParentSearchCategoryID = $SearchCategoryID][SearchCategoryID = $SelectedCategoryID]" />
        <xsl:choose>
			<xsl:when test="$Level &gt; 0">
				<li style="cursor:pointer;">
					<xsl:attribute name="class">categoryTopItem selected<xsl:if test="$ChildCount &gt; 0"> parent</xsl:if></xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:choose>
							<xsl:when test="$ChildCount &gt; 0">ToggleChildren(this);</xsl:when>
							<xsl:otherwise><xsl:value-of select="concat('ChangeCategory(', SearchCategoryID, ');')"/></xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
                    <xsl:choose>
                      <xsl:when test="$ChildCount &gt; 0">
                        <span><xsl:value-of select="CategoryName"/></span>
                        <ul class="childCategories">
                        <xsl:attribute name="id"><xsl:value-of select="concat('category_',SearchCategoryID)" /></xsl:attribute>
                            <!-- <xsl:attribute name="style">display:none;</xsl:attribute> -->
                            <xsl:for-each select="//SearchCategory[SearchTypeID = $SearchTypeID and ParentSearchCategoryID = $SearchCategoryID]">
                                <xsl:sort select="CategoryName" />
                                <xsl:call-template name="SearchCategory">
                                    <xsl:with-param name="Level" select="$Level - 1" />
                                    <xsl:with-param name="Position" select="position()" />
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:if test="count(//SearchCategory[SearchTypeID = $SearchTypeID and ParentSearchCategoryID = $SearchCategoryID]) &gt; 5">
                            <li>
                                <a class="moreLink" href="#">
                                    <xsl:attribute name="onclick">ShowMoreCategories(<xsl:value-of select="SearchCategoryID" />,event);</xsl:attribute>
                                    <xsl:text>+ more...</xsl:text>
                                </a>
                            </li>
                            <li>
                                <a class="lessLink" href="#" style="display:none;">
                                    <xsl:attribute name="onclick">ShowLessCategories(<xsl:value-of select="SearchCategoryID" />,event);</xsl:attribute>
                                    <xsl:text>- less...</xsl:text>
                                </a>
                            </li>
                            </xsl:if>
                        </ul>
                      </xsl:when>
                      <xsl:otherwise>
                          <a href="#"><xsl:value-of select="CategoryName"/></a>
                      </xsl:otherwise>
                    </xsl:choose>
				</li>
			</xsl:when>
			<xsl:otherwise>
				<li>
                	<xsl:attribute name="style">
                		<xsl:choose>
                			<xsl:when test="$Position &lt; 6">
                    			<xsl:text>display:block</xsl:text>
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:text>display:none</xsl:text>
                    		</xsl:otherwise>
                		</xsl:choose>
                	</xsl:attribute>
					<a>
                    	<xsl:attribute name="id"><xsl:value-of select="concat('catLink',SearchCategoryID)" /></xsl:attribute>
						<xsl:attribute name="onclick">
                    		<xsl:value-of select="concat('ChangeCategory(', SearchCategoryID, ',event);')" />
                    	</xsl:attribute>
						<xsl:value-of select="CategoryName" />
						<xsl:text> (</xsl:text>
						<xsl:value-of select="count(//SearchResultCategory[SearchTypeID = $SearchTypeID and SearchCategoryID = $SearchCategoryID])" />
						<xsl:text>)</xsl:text>
					</a>
				</li>
			</xsl:otherwise>
		</xsl:choose>
		<!-- to only use separator for top level items... -->
		<!-- <xsl:if test="$Level = 1"><li class="separator"></li></xsl:if> -->
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    
	
	<xsl:template name="ResultItem" match="SearchResult">
    <xsl:variable name="RateID" select="concat('rate',ItemID)" />
		<div class="resultItem">
			<span>
				<xsl:attribute name="class">
					<xsl:if test="Rating &lt; 1">noRating</xsl:if>
					<xsl:text> ratingContainer</xsl:text>
				</xsl:attribute>		
				<xsl:choose>
					<xsl:when test="number(Rating)">
						<xsl:call-template name="Rating">
							<xsl:with-param name="RatingValue" select="Rating"/>
						</xsl:call-template>
                        <xsl:value-of select="concat('Rated ',Rating,' stars.')" />
					</xsl:when>
					<xsl:otherwise>
						<span class="no_rating">No rating</span>
					</xsl:otherwise>
				</xsl:choose>
			</span>
			<span class="name">
				<a>
                    <xsl:attribute name="href">javascript:SearchRedirect(<xsl:value-of select="ItemID"/>, <xsl:value-of select="SearchTypeID"/>);</xsl:attribute>
					<xsl:value-of select="ItemName"/>
				</a>
			</span>
			<xsl:choose>
				<xsl:when test="SearchTypeID = 3">
					<span class="attributes">
						<span>
                        	<xsl:attribute name="class">hasVideo
                        	<xsl:if test="contains(ItemAttributes, 'Videos')">
                            	<xsl:text> on</xsl:text>
                            </xsl:if>
                            </xsl:attribute>
                            <xsl:if test="contains(ItemAttributes, 'Videos')">
                                <xsl:text>[ V ]</xsl:text>
                            </xsl:if>
                        </span>
                        <span>
                        	<xsl:attribute name="class">hasSaleItem
                        	<xsl:if test="contains(ItemAttributes, 'SaleItem')">
                            	<xsl:text> on</xsl:text>
                            </xsl:if>
                            </xsl:attribute>
                            <xsl:if test="contains(ItemAttributes, 'SaleItem')">
                                <xsl:text>[ S ]</xsl:text>
                            </xsl:if>
                        </span>
						<!-- <xsl:if test="contains(ItemAttributes, 'ChainRecipe')"><span class="isChain">[ C ]</span></xsl:if> -->
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="itemText">
						<xsl:value-of select="ItemText" disable-output-escaping="yes"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</div>
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

	<xsl:template name="Pager">
		<xsl:param name="CurrentPage"/>
		<xsl:param name="Start"/>
		<xsl:param name="Increment"/>
		<xsl:param name="ItemCount"/>
		<ul class="pager">
			<xsl:call-template name="PagerItem">
				<xsl:with-param name="CurrentPage" select="$CurrentPage"/>
				<xsl:with-param name="Increment" select="$Increment"/>
				<xsl:with-param name="ItemCount" select="$ItemCount"/>
				<xsl:with-param name="Start" select="$Start"/>
			</xsl:call-template>
		</ul>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="Pager2">
		<xsl:param name="CurrentPage"/>
		<xsl:param name="Increment"/>
		<xsl:param name="ItemCount"/>
        <xsl:param name="Position" />
		<xsl:variable name="PageCount" select="ceiling(number($ItemCount div $Increment))" />
		<xsl:if test="$PageCount &gt; 1">
			<div>
            	<xsl:attribute name="class">
                	<xsl:text>pager</xsl:text>
                    <xsl:if test="$Position">
                    	<xsl:text> </xsl:text><xsl:value-of select="$Position" />
                    </xsl:if>
                </xsl:attribute>
				<xsl:if test="$CurrentPage &gt; 0">
					<a>
						<xsl:attribute name="href"><xsl:value-of select="concat('javascript:ChangePage(', $CurrentPage - 1, ');')" /></xsl:attribute>
                        <xsl:attribute name="title">previous</xsl:attribute>
						<xsl:text>previous</xsl:text>
					</a>
				</xsl:if>
				<span><xsl:value-of select="concat('Page: ', $CurrentPage + 1, '/', $PageCount)" /></span>
				<xsl:if test="$CurrentPage + 1 &lt; $PageCount">
					<a>
						<xsl:attribute name="href"><xsl:value-of select="concat('javascript:ChangePage(', $CurrentPage + 1, ');')" /></xsl:attribute>
                        <xsl:attribute name="title">next</xsl:attribute>
						<xsl:text>next</xsl:text>
					</a>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="PagerItem">
		<xsl:param name="CurrentPage"/>
		<xsl:param name="Start"/>
		<xsl:param name="Increment"/>
		<xsl:param name="ItemCount"/>
		<xsl:variable name="PageNumber" select="$Start + 1"/>
		<li style="cursor:pointer;">
			<xsl:attribute name="onclick">
				<xsl:value-of select="concat('ChangePage(', $Start, ');')"/>
			</xsl:attribute>
			<xsl:if test="$Start = $CurrentPage">
				<xsl:attribute name="class">Selected</xsl:attribute>
			</xsl:if>
			<span>
				<xsl:value-of select="$PageNumber"/>
			</span>
		</li>
		<xsl:if test="$PageNumber * $Increment &lt; $ItemCount">
			<xsl:call-template name="PagerItem">
				<xsl:with-param name="CurrentPage" select="$CurrentPage"/>
				<xsl:with-param name="Increment" select="$Increment"/>
				<xsl:with-param name="ItemCount" select="$ItemCount"/>
				<xsl:with-param name="Start" select="$PageNumber"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="SortSelector">
		<xsl:param name="SortBy"/>
		<div id="sortSelector">
		Sort By: <select id="ddlSortBy" name="SortBy" onchange="Sort();">
			<option value="Relevance">
				<xsl:if test="$SortBy = 'Relevance'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>Relevance</xsl:text>
			</option>
			<option value="Rating">
				<xsl:if test="$SortBy = 'Rating'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>Rating</xsl:text>
			</option>
			<option value="ItemName">
				<xsl:if test="$SortBy = 'ItemName'">
					<xsl:attribute name="selected"/>
				</xsl:if>
				<xsl:text>Title</xsl:text>
			</option>
		</select>
		</div>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

	<xsl:template name="SearchTypeSelect">
		<xsl:param name="SearchTypeID" />
		<ul id="searchTypes" class="clearfix">
			<li style="cursor:pointer;" class="searchType">
				<xsl:choose>
					<xsl:when test="$SearchTypeID = 3">
						<xsl:attribute name="id">current</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="onclick">ChangeSearchType(3);</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<span>Recipes</span>
			</li>
			<li class="separator"></li>
			<li style="cursor:pointer;" class="searchType">
				<xsl:choose>
					<xsl:when test="$SearchTypeID = 5">
						<xsl:attribute name="id">current</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="onclick">ChangeSearchType(5);</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<span>Articles</span>
			</li>
			<li class="separator"></li>
			<li style="cursor:pointer;" class="searchType">
				<xsl:choose>
					<xsl:when test="$SearchTypeID = 4">
						<xsl:attribute name="id">current</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="onclick">ChangeSearchType(4);</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<span>Videos</span>
			</li>
		</ul>
	</xsl:template>
    
<!-- ========================================================================================================================================= -->    

</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->