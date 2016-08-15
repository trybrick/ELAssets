<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="ExpressLane/QuickSearch" />
	</xsl:template>
	<xsl:template name="QuickSearch" match="QuickSearch">
		<a href="javascript:;" style="text-decoration:none;cursor:pointer;"><h2 onclick="toggleQuickSearch();">Quick Search By Food Type: 		
		<xsl:comment><![CDATA[[if lte IE 6]><span style="font-size:70%"> [click to expand/hide]</span><![endif]]]></xsl:comment>
		</h2></a><a href="javascript:;"><h1 id="toggler2" class="accordionToggle" onclick="toggleQuickSearch();"></h1></a>
			<div id="PanelQuick" style="display: none;">
				<xsl:for-each select="QuickSearchCategory">
					<xsl:sort select="SortOrder" data-type="number" />
					<div>
						<xsl:attribute name="id"><xsl:value-of select="RecipeQuickSearchCategoryID" /></xsl:attribute>
						<xsl:if test="position() = last()">
							<xsl:attribute name="class">last</xsl:attribute>
						</xsl:if>
						<h3><xsl:value-of select="DisplayText" /></h3>
						<ul>
							<xsl:for-each select="QuickSearchItem">
								<xsl:sort select="SortOrder" data-type="number"/>
								<li>
									<a href="{concat('##root##/Recipes/RecipeSearchResults.aspx?QuickSearch=',RecipeQuickSearchItemID)}">
										<xsl:value-of select="DisplayText" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</xsl:for-each>
			</div>
				</xsl:template>
</xsl:stylesheet>