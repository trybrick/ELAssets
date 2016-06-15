<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<Recipe>
			<xsl:apply-templates select="ExpressLane/RecipeData"/>
		</Recipe>
	</xsl:template>
	<xsl:template match="RecipeData" name="RecipeDetailList">
		<RecipeDetailList>
			<xsl:apply-templates select="GenericRecipe"/>
			<xsl:apply-templates select="GlobalRecipeRating"/>
			<xsl:apply-templates select="GenericRecipe/Images"/>
			<xsl:apply-templates select="GenericRecipe/Instructions"/>
			<xsl:apply-templates select="GenericRecipe/Notes"/>
			<xsl:apply-templates select="GenericRecipe/Ingredients"/>
			<xsl:apply-templates select="GenericRecipe/Categories"/>
		</RecipeDetailList>
		<xsl:apply-templates select="GenericRecipe/Nutrients"/>
	</xsl:template>
	<xsl:template match="Nutrients">
		<RecipeNutrition>
			<xsl:apply-templates/>
		</RecipeNutrition>
	</xsl:template>
	<xsl:template match="GenericRecipe">
		<RecipeDetails>
			<RecipeID>
				<xsl:value-of select="RecipeID"/>
			</RecipeID>
			<RecipeTitle>
				<xsl:value-of select="Title"/>
			</RecipeTitle>
			<RecipeDescription>
				<xsl:value-of select="Description"/>
			</RecipeDescription>
			<EstimatedTime>
				<xsl:value-of select="EstimatedTime"/>
			</EstimatedTime>
			<YieldText>
				<xsl:value-of select="YieldText"/>
			</YieldText>
			<SkillLevelID>
				<xsl:value-of select="SkillLevelID"/>
			</SkillLevelID>
			<CanScaleRecipe>
				<xsl:value-of select="CanScaleRecipe"/>
			</CanScaleRecipe>
			<CanChangeFoodName>
				<xsl:value-of select="CanChangeFoodName"/>
			</CanChangeFoodName>
			<PrepTime>
				<xsl:value-of select="PrepTime"/>
			</PrepTime>
			<CookTime>
				<xsl:value-of select="CookTime"/>
			</CookTime>
			<RestTime>
				<xsl:value-of select="RestTime"/>
			</RestTime>
			<TotalTime>
				<xsl:value-of select="TotalTime"/>
			</TotalTime>
		</RecipeDetails>
	</xsl:template>
	<xsl:template match="RecipeImage">
		<RecipeImages>
			<RecipeImageURL>
				<xsl:value-of select="RecipeImageURL"/>
			</RecipeImageURL>
			<DisplayOrder>
				<xsl:value-of select="DisplayOrder"/>
			</DisplayOrder>
		</RecipeImages>
	</xsl:template>
	<xsl:template match="RecipeInstruction">
		<RecipeInstructions>
			<RecipeInstruction>
				<xsl:value-of select="RecipeInstructionDescription"/>
			</RecipeInstruction>
			<DisplayOrder>
				<xsl:value-of select="DisplayOrder"/>
			</DisplayOrder>
		</RecipeInstructions>
	</xsl:template>
	<xsl:template match="RecipeNote">
		<RecipeNotes>
			<RecipeNote>
				<xsl:value-of select="RecipeNoteDescription"/>
			</RecipeNote>
			<DisplayOrder>
				<xsl:value-of select="DisplayOrder"/>
			</DisplayOrder>
		</RecipeNotes>
	</xsl:template>
	<xsl:template match="GenericRecipeIngredient">
		<RecipeIngredientLines>
			<RecipeIngredientID>
				<xsl:value-of select="RecipeIngredientID"/>
			</RecipeIngredientID>
			<IngredientText>
				<xsl:value-of select="StandardText"/>
			</IngredientText>
			<GSNFoodName>
				<xsl:value-of select="IngredientFoodDescription"/>
			</GSNFoodName>
			<DisplayOrder>
				<xsl:value-of select="DisplayOrder"/>
			</DisplayOrder>
			<CategoryID>
				<xsl:value-of select="CategoryID"/>
			</CategoryID>
		</RecipeIngredientLines>
	</xsl:template>
	<xsl:template match="GenericNutrient">
		<Nutrition>
			<NutrientDefinitionID>
				<xsl:value-of select="NutrientDefinitionID"/>
			</NutrientDefinitionID>
			<NutrientDescription>
				<xsl:value-of select="Description"/>
			</NutrientDescription>
			<NutrientAmount>
				<xsl:value-of select="Amount"/>
			</NutrientAmount>
			<DisplayNutrientAmount>
				<xsl:value-of select="DisplayAmount"/>
			</DisplayNutrientAmount>
			<MeasureUnit>
				<xsl:value-of select="MeasureUnit"/>
			</MeasureUnit>
			<PctDailyValue>
				<xsl:value-of select="PctDailyValue"/>
			</PctDailyValue>
			<RDA>
				<xsl:value-of select="RDA"/>
			</RDA>
		</Nutrition>
	</xsl:template>
	<xsl:template match="GlobalRecipeRating">
		<Rating>
			<AverageRating>
				<xsl:value-of select="AverageRating"/>
			</AverageRating>
			<TotalNumberOfRatings>
				<xsl:value-of select="TotalNumberOfRatings"/>
			</TotalNumberOfRatings>
		</Rating>
	</xsl:template>
	<xsl:template match="GenericRecipeCategory">
		<RecipeCategory>
			<RecipeCategoryID>
				<xsl:value-of select="RecipeCategoryID"/>
			</RecipeCategoryID>
			<RecipeCategoryDescription>
				<xsl:value-of select="RecipeCategoryDescription"/>
			</RecipeCategoryDescription>
			<xsl:choose>
				<xsl:when test="number(ParentRecipeCategoryID)">
					<ParentRecipeCategoryID>
						<xsl:value-of select="ParentRecipeCategoryID"/>
					</ParentRecipeCategoryID>
				</xsl:when>
				<xsl:otherwise>
					<ParentRecipeCategoryID/>
				</xsl:otherwise>
			</xsl:choose>
		</RecipeCategory>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-23-RecipeFull.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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