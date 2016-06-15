<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<xsl:apply-templates select="//RecipeQuickSearches" />
	</xsl:template>
	<xsl:template name="RecipeQuickSearches" match="RecipeQuickSearches">
		<a href="javascript:;" style="text-decoration:none;cursor:pointer;">
			<h2 onclick="toggleQuickSearch();">Quick Search By Food Type: 		
				<xsl:comment>
					<![CDATA[[if lte IE 6]><span style="font-size:70%"> [click to expand/hide]</span><![endif]]]>
				</xsl:comment>
			</h2>
		</a><a href="javascript:;">
			<h1 id="toggler2" class="accordionToggle" onclick="toggleQuickSearch();"/>
		</a>
		<div id="PanelQuick">

			<xsl:for-each select="QuickSearches/QuickSearch">
				<xsl:sort select="Name" />

				<div id="{QuickSearchID}">
					<xsl:attribute name="class">
	                      <xsl:text>quickSearchCategory</xsl:text>
	                      <xsl:if test="position() = last()">
	                          <xsl:text> last</xsl:text>
	                      </xsl:if>
					</xsl:attribute>
					<h3>
						<xsl:value-of select="Name" />
					</h3>
					<ul>
						<xsl:for-each select="ChildSearches/QuickSearch">
							<xsl:sort select="Name" />
							
							<xsl:variable name="newQueryString" select="concat(QueryString, 'SearchType=3')" />
							<xsl:variable name="url" select="concat('##root##/Recipes/Search.aspx?', $newQueryString)" />
							<li>
								<a href="{$url}">
									<xsl:value-of select="Name" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</div>

			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-112-RecipeCenter.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->