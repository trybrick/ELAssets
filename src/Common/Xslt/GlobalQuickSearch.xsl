<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="GlobalQuickSearchDisplay">
    
            <xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />


		<script type="text/javascript">
			function RunGlobalQuickSearch(){

				var searchterm = $('txtGlobalQuickSearch').value.strip();
				if(searchterm == ''){
					alert('Please enter a search term');
					return;
				}				
				
				var form = document.forms[0];
				if(form == null) {
					alert('Search Unavaliable');
					return;
				}
				
				var searchtype = Form.getInputs(form.id, 'radio', 'globalQuickSearchGroup').find(function(radio) {return radio.checked;}).value;
				
				var searchurl;
				
				switch(searchtype){
					case 'Products':
						searchurl = '/Shop/ProductSearch.aspx';
						break;
					case 'Recipes':
						searchurl = '/Recipes/RecipeSearchResults.aspx';
						break;
				}
				
				if(searchurl != 'undefined'){
					searchurl = searchurl + '?Keyword=' + searchterm;
				}
				
				document.location.replace(searchurl);
			}
		</script>
        
		<div id="GlobalQuickSearch">
			
			<h2>
				Quick Search
			</h2>
			
						<input id="txtGlobalQuickSearch" onkeypress="if (event.keyCode==13) RunGlobalQuickSearch(); return event.keyCode!=13;" />
						<a class="button" href="javascript:RunGlobalQuickSearch();"><span>Search</span></a>
												
						<div id="SearchOptions" style="display:none"><!-- hidden in the event we want to enable it later -->
							<span class="searchwithin">Search within:</span>
							<div class="productsearchoption">
								<input type="radio" name="globalQuickSearchGroup" value="Products" checked="true" />Products
							</div>
							<div class="recipesearchoption">
								<input type="radio" name="globalQuickSearchGroup" value="Recipes" />Recipes
							</div>
						</div>
						<div id="SearchTipsLink">
                        
                        	<xsl:choose>
                        		<xsl:when test="$IsOGS = 'true'">
									<a class="searchTips">
									<xsl:attribute name="href">##root##/SearchTips.aspx</xsl:attribute>
									Search Tips and Shopping Help
									</a>
                                </xsl:when>
                                <xsl:otherwise>
									<a class="searchTips">
									<xsl:attribute name="href">##root##/Shop/ProductSearch.aspx</xsl:attribute>
									Click here for Search Tips
									</a>                            	
                                 </xsl:otherwise>
                            </xsl:choose>
                           
						</div>
		</div>
	</xsl:template>
	
	<xsl:template name="QuickSearchByType">
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />
		
		<script type="text/javascript">
			function RunSearchV2ByType(){
			
				var typeid = $('globalquicksearchtypeid').value;
				var searchterm = $('txtGlobalQuickSearch').value;
				
				if(searchterm == 'undefined'){
					return;
				}
				
				var searchurl = '/Recipes/Search.aspx?SearchTerm=' + searchterm;
				
				searchurl = searchurl + '&amp;SearchType=' + typeid;
				
				document.location.replace(searchurl);
			}
		</script>
		
		<div id="GlobalQuickSearch">
			
			<h2>
				Quick Search
			</h2>
			
						<input id="txtGlobalQuickSearch" onkeypress="if (event.keyCode==13) RunGlobalQuickSearch(); return event.keyCode!=13;" />
						<a class="button" href="javascript:RunSearchV2ByType();"><span>Search</span></a>
												
						<div id="SearchOptions" style="display:none"><!-- hidden in the event we want to enable it later -->
							<span class="searchwithin">Search within:</span>
							<div class="productsearchoption">
								<input type="radio" name="globalQuickSearchGroup" value="Products" checked="true" />Products
							</div>
							<div class="recipesearchoption">
								<input type="radio" name="globalQuickSearchGroup" value="Recipes" />Recipes
							</div>
						</div>
						<div id="SearchTipsLink">
                        
                        	<xsl:choose>
                        		<xsl:when test="$IsOGS = 'true'">
									<a class="searchTips">
									<xsl:attribute name="href">##root##/SearchTips.aspx</xsl:attribute>
									Search Tips and Shopping Help
									</a>
                                </xsl:when>
                                <xsl:otherwise>
									<a class="searchTips">
									<xsl:attribute name="href">##root##/Shop/ProductSearch.aspx</xsl:attribute>
									Click here for Search Tips
									</a>                            	
                                 </xsl:otherwise>
                            </xsl:choose>
                           
						</div>
		</div>
	</xsl:template>
</xsl:stylesheet>	<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\204\XmlData\204-PageTypeId-3-Header.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->