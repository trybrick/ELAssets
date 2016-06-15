<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="ExpressLane/QuickSearch" />
	</xsl:template>
	<xsl:template name="QuickSearch" match="QuickSearch">
		<a href="javascript:;" style="text-decoration:none;"><h2 onclick="toggleQuickSearch();">Quick Search By Course:</h2></a><a href="javascript:;"><h1 id="toggler2" class="accordion_toggle" onclick="toggleQuickSearch();"></h1></a>
			<div id="PanelQuick" style="display: none;">
			
					<xsl:for-each select="QuickSearchCategory">
			<xsl:sort select="SortOrder" />

			<div>
				<xsl:attribute name="id"><xsl:value-of select="RecipeQuickSearchCategoryID" /></xsl:attribute>
				<h3><xsl:value-of select="DisplayText" /></h3>
				<ul>
					<xsl:for-each select="QuickSearchItem">
						<xsl:sort select="SortOrder" />
						<li>
							<a>
								<xsl:attribute name="href">
									##root##/Recipes/RecipeSearchResults.aspx?QuickSearch=<xsl:value-of select="RecipeQuickSearchItemID" />
								</xsl:attribute>
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
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-21-QuickSearch.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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