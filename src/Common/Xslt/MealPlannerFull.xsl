<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="DivMealPlanner">
			<h2>Meal Planner</h2>
			<xsl:for-each select="//ExpressLane/MealPlannerList/MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
				<xsl:sort select="DisplayOrderDate" order="ascending"/>
			<div class="MealPlannerDay">
				<h3>
					<xsl:value-of select="DisplayDate"/>
				</h3>
				<ul>
					<xsl:for-each select="key('meals-by-date', DisplayDate)">
						<xsl:sort select="RecipeTitle"/>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="concat('/Recipes/RecipeFull.aspx?RecipeID=', RecipeID)"/>
								</xsl:attribute>
								<xsl:value-of select="RecipeTitle"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</div>
			</xsl:for-each>
			<br/>
			<br/>
			<a href="/Recipes/RecipeCenter.aspx" class="button">
				<span>Back to Recipe Center</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\75\XmlData\75-PageTypeId-34-MealPlannerFull.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
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