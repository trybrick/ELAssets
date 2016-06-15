<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<h2>Advanced Search Tips</h2>
		<table>
			<tbody>
				<tr>
					<td>
						<h3>Search Criteria</h3>
					</td>
					<td>
						<h3>Search Results</h3>
					</td>
				</tr>
				<xsl:for-each select="ExpressLane/SearchCriteriaTips/SearchCriteriaTip">
					<tr>
						<td>
							<xsl:value-of select="Search"/>
						</td>
						<td>
								<xsl:value-of select="Result"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
        
        <a class="button" href="/Recipes/RecipeCenter.aspx"><span>Back to Recipe Center</span></a>
        
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Xml\RecipeSearchCriteriaTips.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\Xml\RecipeSearchCriteriaTips.xml" srcSchemaRoot="SearchCriteriaTips" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="xsl:for&#x2D;each" x="336" y="36"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->