<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="GlobalQuickSearchDisplay">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<script type="text/javascript">
			function RunGlobalQuickSearch(){
				var searchterm = $('txtGlobalQuickSearch').value.strip();
				if(searchterm == ''){
					alert('Please enter a search term');
					return;
				}				
				var searchurl = '##root##' + '/Shop/ProductSearch.aspx?Keyword=' + searchterm;
				window.location.replace(searchurl);
			}
		</script>
		<div id="GlobalQuickSearch">
			<input id="txtGlobalQuickSearch" onkeypress="if (event.keyCode==13) RunGlobalQuickSearch(); return event.keyCode!=13;"/>
			<a class="button" href="javascript:RunGlobalQuickSearch();">
				<span>Product Search</span>
			</a>
			<div id="SearchOptions" style="display:none">
				<!-- hidden in the event we want to enable it later -->
				<span class="searchwithin">Search within:</span>
				<div class="productsearchoption"><input type="radio" name="globalQuickSearchGroup" value="Products" checked="true"/>Products
							</div>
				<div class="recipesearchoption"><input type="radio" name="globalQuickSearchGroup" value="Recipes"/>Recipes
							</div>
			</div>
			<div id="SearchTipsLink">
				<a class="searchTips" href="/SearchTips.aspx">Click here for Helpful Tips</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
