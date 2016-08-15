<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<div style="margin-left:20;">
			<h3 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:0 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:left;margin-bottom:10px;">
				<a href="##root##/recipes/MealsOfTheWeek.aspx">Meal Planner</a>
			</h3>

			<xsl:for-each select="//MealPlanner/Days/MealPlannerDay">
				<h5 style="text-align:left;">
					<xsl:value-of select="FormattedDate"/>
				</h5>
				
				<ul style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none;">
					<xsl:for-each select="Items/MealPlannerItem">
						<xsl:sort select="DisplayOrder" />
							<li style="margin-left:10px; font-size:11px;">
							<a style="color: #333366;" href="{ concat('##root##/Recipes/RecipeFull.aspx?RecipeID=', RecipeID) }">
								<xsl:value-of select="RecipeTitle" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\test\buildxml.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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