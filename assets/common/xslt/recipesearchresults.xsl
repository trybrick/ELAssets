<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="Results" select="ExpressLane/RecipeSearch/ArrayOfGenericRecipe/GenericRecipe"/>
		<xsl:variable name="TotalPages" select="ceiling(count($Results) div 25)"/>
		<script type="text/javascript">
			var totalPageCount = <xsl:value-of select="$TotalPages"/>;
			var pageNum = 1;
			String.prototype.contains = function(t) { return this.indexOf(t) &gt;= 0 ? true : false }

			function ShowResults(resultsID){
				for (var i=0; i &lt; totalPageCount; i++){
					var currentIdName = 'RecipeSearchResultsList' + (i+1);
					$(currentIdName).addClassName('hidden');
				}
			
				$(resultsID).removeClassName('hidden');

				var name = resultsID;
				pageNum = name.replace('RecipeSearchResultsList','');

				var currentClass = 'RecipeSearchResultsList' + pageNum;

				if (typeof(refreshAdPods) == 'function') {
					refreshAdPods();
				}

				SetPageAndCountDisplay();

				SetPagerActive();

			}

			function SetPagerActive(){
				var pager = $('RecipeSearchPager');
				
 				var currentID = "ShowResults('RecipeSearchResultsList" + pageNum + "');";

				if(pager != null){
					var items = pager.childElements();

					items.each(function(item){
						if(item.innerHTML.contains(currentID)){
							item.className = "activePager";
						}
						else{
							item.className = '';
						}	
					});
				}
			}

			function SetPageAndCountDisplay(){
				var div = $('viewingpage');

				if(div != 'undefined'){
					if(totalPageCount &gt; 1){
						div.innerHTML = 'Viewing page ' + pageNum + ' of ' + totalPageCount + ' page(s)';
					}
				}

				if(totalPageCount == 0){
					var pagerDiv = $('RecipeSearchPager');

					if(typeof(pagerDiv) == 'object'){
						pagerDiv.style.display = "none";
					}
				}
			}

			function RecipePreviousPage(){
				var divID = 'RecipeSearchResultsList';
			
				if(pageNum != 1){
					pageNum--;
					ShowResults(divID + pageNum);
				}
			}

			function RecipeNextPage(){
				var divID = 'RecipeSearchResultsList';

				if(pageNum != totalPageCount){
					pageNum++;
					ShowResults(divID + pageNum);
				}
			}

			function CheckQueryString(){
				var loadPageNumber = getQueryVariable('PageIndex');

				if(loadPageNumber == 'undefined' || loadPageNumber == null){
					ShowResults('RecipeSearchResultsList1');
				}
				else{
					ShowResults('RecipeSearchResultsList' + loadPageNumber);
				}
			}

			function getQueryVariable(variable) {
  				var query = window.location.search.substring(1);
  				var vars = query.split("&amp;");
  				for(var i=0;i&lt;vars.length;i++) {
    				var pair = vars[i].split("=");
    				if (pair[0] == variable) {
      					return pair[1];
    				}
  				}	
			} 

			function RedirectRecipe(recipeid){
				var advancedSearch = getQueryVariable('AdvancedSearch');
				var topRecipes = getQueryVariable('TopRecipes');

				var url = '##root##/Recipes/RecipeFull.aspx?RecipeID=' + recipeid;
				var quickSearch = getQueryVariable('QuickSearch');
				var keyword = getQueryVariable('KeyWord');
				var chainonlyrecipes = getQueryVariable('ChainOnlyRecipes');

				if(advancedSearch != undefined){
					url = url + '&amp;AdvancedSearch=' + advancedSearch;
				}

				if(quickSearch != undefined){
					url = url + '&amp;QuickSearch=' + quickSearch;
				}

				if(topRecipes != undefined){
					url = url + '&amp;TopRecipes=true';
				}

				if(keyword != undefined){
					url = url + '&amp;KeyWord=' + keyword;
				}

				if(chainonlyrecipes != undefined){
					url = url + '&amp;ChainOnlyRecipes=' + chainonlyrecipes;
				}

				if(pageNum != 1){
					url = url + '&amp;PageNumber=' + pageNum;
				}

				url = url + '&amp;Source=search';

				location.href = url;
			}
			
			function HideSearchResults(){
				var recipeDiv = $('RecipeSearchResults');
				var pagerDiv = $('RecipeSearchPager');

				if(typeof(recipeDiv) == 'object'){
					recipeDiv.style.display = "none";
				}

				if(typeof(pagerDiv) == 'object'){
					pagerDiv.style.display = "none";
				}
			}
		</script>
		<div id="SearchResults">
			<div id="RecipeSearchResultsGrid">
				<div class="SearchResults" id="RecipeSearchResults">
					<h3>Search Results</h3>
					<xsl:if test="ExpressLane/RecipeSearch/RecipeSearchDisplay/SearchTerm != ''"><xsl:value-of select="count($Results)"/> Matches for <xsl:value-of select="ExpressLane/RecipeSearch/RecipeSearchDisplay/SearchTerm"/><br/></xsl:if>
					<div id="viewingpage"/>
					<xsl:if test="string-length(ExpressLane/RecipeSearch/RecipeSearchDisplay/ConsumerCriteriaDisplay) &gt; 0">
						<strong>
							<xsl:value-of select="ExpressLane/RecipeSearch/RecipeSearchDisplay/ConsumerCriteriaDisplay"/>
						</strong>
						<br/>
					</xsl:if>
					<xsl:if test="ExpressLane/Common/Consumer/IsLoggedIn = 'true'">
						<xsl:if test="string-length(ExpressLane/RecipeSearch/RecipeSearchDisplay/ConsumerPreferencesDisplay) &gt; 0">
							<i>Your Preferences: <xsl:value-of select="ExpressLane/RecipeSearch/RecipeSearchDisplay/ConsumerPreferencesDisplay"/></i>
						</xsl:if>
					</xsl:if>
					<ul id="RecipeSearchPager" class="SearchResultsPager">
						<li id="ButtonPreviousResults">
							<a href="javascript:RecipePreviousPage()">
								<xsl:text>&lt;</xsl:text>
							</a>
						</li>
						<xsl:call-template name="SearchResultsPager">
							<xsl:with-param name="LastPageNum">
								<xsl:value-of select="$TotalPages"/>
							</xsl:with-param>
						</xsl:call-template>
						<li id="ButtonNextResults">
							<a href="javascript:RecipeNextPage()">
								<xsl:text>&gt;</xsl:text>
							</a>
						</li>
					</ul>
					<xsl:for-each select="$Results">
						<xsl:variable name="pageNumber" select="ceiling(position() div 25)"/>
							<xsl:if test="position() = 1 or (position() mod 25) = 1">
								<xsl:value-of disable-output-escaping="yes" select="concat('&lt;ul id=&quot;RecipeSearchResultsList', $pageNumber, '&quot;&gt;')"/>
							</xsl:if>
						<li>
							<xsl:attribute name="class">RecipeDisplay<xsl:value-of select="$pageNumber"/></xsl:attribute>
							<xsl:if test="CompanyID != 7 and string-length(/ExpressLane/GenericChain/ChainSettings/Setting[Name='ChainRecipeIcon']/Value) &gt; 0">
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="/ExpressLane/GenericChain/ChainSettings/Setting[Name='ChainRecipeIcon']/Value"/>
									</xsl:attribute>
								</img>
							</xsl:if>
							<a>
								<xsl:attribute name="href">javascript:RedirectRecipe(<xsl:value-of select="RecipeID"/>);</xsl:attribute>
								<xsl:value-of select="Title"/>
							</a>
						</li>
						<xsl:if test="(position() mod 25) = 0">
							<xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</div>
				<div class="clearfix">
					<xsl:choose>
						<xsl:when test="count($Results) = 0">
							<h2>
								<xsl:value-of select="ExpressLane/UserDisplayText/UserDisplay/NoResultsText"/>
							</h2>
							<xsl:call-template name="NoSearchResults"/>
							<script type="text/javascript">HideSearchResults();</script>
						</xsl:when>
						<xsl:otherwise>
							<script type="text/javascript">CheckQueryString();</script>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="SearchResultsPager">
		<!-- recursive template for numerical iterator -->
		<xsl:param name="LastPageNum"/>
		<xsl:param name="i" select="1"/>
		<li>
			<a>
				<xsl:attribute name="href">javascript:ShowResults('RecipeSearchResultsList<xsl:value-of select="$i"/>');</xsl:attribute>
				<xsl:value-of select="$i"/>
			</a>
		</li>
		<xsl:if test="$i &lt; $LastPageNum">
			<xsl:call-template name="SearchResultsPager">
				<xsl:with-param name="LastPageNum" select="$LastPageNum"/>
				<xsl:with-param name="i" select="$i +1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NoSearchResults">
		<div id="SearchTipsHelp">
			<h3>Sorry, no results for <em><xsl:value-of select="//RecipeSearch/RecipeSearchDisplay/SearchTerm"/></em> were found.</h3>
			<br/>
			<p>Please try the suggestions below, or type a new search term.</p>
			<ul>
				<li>Check your spelling</li>
				<li>Try more general words</li>
				<li>Try a different word that means the same thing</li>
				<li>Check Quick Search for more general recipe categories</li>
			</ul>
			<p>If you still can’t find what you’re looking for contact us at <a href="/Recipes/SubmitAskTheChef.aspx">‘Ask the Chef’</a> and we’ll see what we can find.</p>
		</div>
		<a>
			<xsl:attribute name="class">searchBack button</xsl:attribute>
			<xsl:attribute name="onClick">history.back()</xsl:attribute>
			<span>Back</span>
		</a>
	</xsl:template>
</xsl:stylesheet>
