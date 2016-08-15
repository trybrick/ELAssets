<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<xsl:text>Title: </xsl:text>
		<xsl:value-of select="//ExpressLane/GenericRecipe/Title"/>
		<br/>
		<xsl:text>Description: </xsl:text>
		<xsl:value-of select="ExpressLane/GenericRecipe/Description"/>
		<table border="0">
			<tr>
				<td valign="top" width="15%">
					<h4>Image</h4>
					<xsl:if test="ExpressLane/GenericRecipe/Images/RecipeImage/RecipeImageURL != ''">
						<img width="150" height="150">
							<xsl:attribute name="src">
								<xsl:value-of select="ExpressLane/GenericRecipe/Images/RecipeImage/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</xsl:if>
					<xsl:if test="ExpressLane/GenericRecipe/Images/RecipeImage/RecipeImageURL = ''">
						<img src="http://localhost/Assets/Common/Images/Blank.gif" width="150" height="150"></img>
					</xsl:if>
				</td>
				<td valign="top" width="25%">
					<h4>Misc. Details</h4>
					<xsl:text>Skill Level: </xsl:text>
					<xsl:value-of select="ExpressLane/GenericRecipe/SkillLevel"/>
					<br/>
					<xsl:text>Recipe is: </xsl:text>
					<xsl:choose>
						<xsl:when test="ExpressLane/GenericRecipe/IsActive != 'true'">Not Active<br/></xsl:when>
						<xsl:otherwise>Active<br/></xsl:otherwise>
					</xsl:choose>
					<xsl:text>Recipe is: </xsl:text>
					<xsl:choose>
						<xsl:when test="ExpressLane/GenericRecipe/IsPublic != 'true'">Not Public</xsl:when>
						<xsl:otherwise>Public</xsl:otherwise>
					</xsl:choose>
					<br/>
					<xsl:value-of select="ExpressLane/GenericRecipe/YieldText"/>
				</td>
				<td valign="top">
					<h4>
						<xsl:text>Recipe Times</xsl:text>
					</h4>
					<table>
						<xsl:if test="ExpressLane/GenericRecipe/PrepTime != '0'">
							<tr>
								<td valign="top">Prep Time:</td>
								<td valign="top" align="right">
									<xsl:value-of select="ExpressLane/GenericRecipe/PrepTime"/>minutes</td>
							</tr>
						</xsl:if>
						<xsl:if test="ExpressLane/GenericRecipe/CookTime != '0'">
							<tr>
								<td valign="top">Cook Time:</td>
								<td valign="top" align="right">
									<xsl:value-of select="ExpressLane/GenericRecipe/CookTime"/>minutes</td>
							</tr>
						</xsl:if>
						<xsl:if test="ExpressLane/GenericRecipe/RestTime != '0'">
							<tr>
								<td valign="top">Rest Time:</td>
								<td valign="top" align="right">
									<xsl:value-of select="ExpressLane/GenericRecipe/RestTime"/>minutes</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" valign="top">
					<h4>Instructions</h4>
					<table>
						<xsl:for-each select="ExpressLane/GenericRecipe/Instructions/RecipeInstruction">
							<tr>
								<td>
									<xsl:value-of select="DisplayOrder"/>.
								</td>							
								<td>
									<xsl:value-of select="RecipeInstructionDescription"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
				<td valign="top">
					<h4>
						<xsl:text>Ingredients</xsl:text>
					</h4>
					<table>
						<xsl:for-each select="ExpressLane/GenericRecipe/Ingredients/GenericRecipeIngredient">
							<tr>
								<td>
									<xsl:value-of select="StandardText"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
			<!--RecipeNotes-->
			<tr>
				<td valign="top" colspan="3">
					<h4>
						<xsl:text>Notes</xsl:text>
					</h4>
					<table>
						<xsl:for-each select="ExpressLane/GenericRecipe/Notes/RecipeNote">
							<tr>
								<td>
									<xsl:value-of select="DisplayOrder"/>.
								</td>
								<td>
									<xsl:value-of select="RecipeNoteDescription"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" valign="top">
					<h4>
						<xsl:text>Categories </xsl:text>
					</h4>
					<xsl:for-each select="ExpressLane/GenericRecipe/Categories/GenericRecipeCategory">
						<br/>
						<xsl:value-of select="RecipeCategoryDescription"/>
					</xsl:for-each>
				</td>
				<td valign="top">
					<h4>
						<xsl:text>Nutrition</xsl:text>
					</h4>
					<xsl:for-each select="ExpressLane/GenericRecipe/Nutrients/GenericNutrient">
						<xsl:sort select="Description"/>
						<br/>
						<xsl:value-of select="Description"/>
						<xsl:text>: </xsl:text>
						<xsl:value-of select="PctDailyValue"/>
						<xsl:text>%</xsl:text>
					</xsl:for-each>
				</td>
			</tr>
			<xsl:if test="ExpressLane/GenericRecipe/RelatedRecipes/RecipeSummary">
				<tr>
					<td colspan="4">
						<h4>Related Recipes</h4>
						<xsl:for-each select="ExpressLane/GenericRecipe/RelatedRecipes/RecipeSummary">
							<xsl:value-of select="RecipeID"/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="RecipeTitle"/>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\expresslane\ExpressLaneAdmin\GSN.Website\Assets\7\XmlData\7-PageTypeId-6-AdminRecipePreviewV2.xml" htmlbaseurl="" outputurl=""
		          processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline=""
		          postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\..\Recipe.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="table/tr/td[3]/xsl:if/!=[0]" x="372" y="112"/>
				<block path="table/tr/td[3]/xsl:if" x="418" y="114"/>
				<block path="" x="368" y="104"/>
				<block path="table/tr/td[3]/xsl:if[1]/!=[0]" x="172" y="112"/>
				<block path="table/tr/td[3]/xsl:if[1]" x="218" y="114"/>
				<block path="table/tr/td[3]/xsl:if[2]/!=[0]" x="12" y="112"/>
				<block path="table/tr/td[3]/xsl:if[2]" x="58" y="114"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->