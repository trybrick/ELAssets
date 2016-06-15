<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="nutritionTableWrapper">
			<table id="nutrition-information-table" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top" class="attribute separator title">Nutritional Facts</td>
					<td class="attribute-value separator"></td>
				</tr>
				<tr>
					<td class="attribute separator">Servings</td>
					<td class="attribute-value separator">
						<xsl:value-of select="//GenericRecipe/YieldText"/>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" class="attribute separator title">Base Nutrients</td>
					<td class="attribute-value separator"></td>
				</tr>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'208'"/>
					<xsl:with-param name="NutrientName" select="'Calories'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'0'"/>
					<xsl:with-param name="NutrientName" select="'Calories from Fat'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'204'"/>
					<xsl:with-param name="NutrientName" select="'Total Fat'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'606'"/>
					<xsl:with-param name="NutrientName" select="'Saturated Fat'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'601'"/>
					<xsl:with-param name="NutrientName" select="'Cholesterol'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'307'"/>
					<xsl:with-param name="NutrientName" select="'Sodium'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'205'"/>
					<xsl:with-param name="NutrientName" select="'Total Carbohydrates'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'291'"/>
					<xsl:with-param name="NutrientName" select="'Dietary Fiber'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'203'"/>
					<xsl:with-param name="NutrientName" select="'Protein'"/>
				</xsl:call-template>
				<tr>
					<td class="attribute separator title">Vitamins</td>
					<td class="attribute-value separator"></td>
				</tr>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'318'"/>
					<xsl:with-param name="NutrientName" select="'Vitamin A'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'401'"/>
					<xsl:with-param name="NutrientName" select="'Vitamin C'"/>
				</xsl:call-template>
				<tr>
					<td class="attribute separator title">Minerals</td>
					<td class="attribute-value separator"></td>
				</tr>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'301'"/>
					<xsl:with-param name="NutrientName" select="'Calcium'"/>
				</xsl:call-template>
				<xsl:call-template name="NutrientDisplay">
					<xsl:with-param name="NutrientDefinitionID" select="'303'"/>
					<xsl:with-param name="NutrientName" select="'Iron'"/>
				</xsl:call-template>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="NutrientDisplay">
		<xsl:param name="NutrientDefinitionID"/>
		<xsl:param name="NutrientName"/>
		<xsl:variable name="Nutrient" select="//Nutrients/GenericNutrient[NutrientDefinitionID =  $NutrientDefinitionID]"/>
		<tr>
			<td class="attribute">
				<xsl:value-of select="$NutrientName"/>
			</td>
			<td class="attribute-value">
				<span class="amountWithUnit">
					<xsl:value-of select="concat($Nutrient/DisplayAmount, ' ', $Nutrient/MeasureUnit)"/>
				</span>
				<span class="PctDailyValue">
					<xsl:choose>
						<xsl:when test="$Nutrient/PctDailyValue">
							<xsl:text> (</xsl:text>
							<xsl:value-of select="$Nutrient/PctDailyValue"/>
							<xsl:text>%)</xsl:text>
						</xsl:when>
						<xsl:otherwise>n/a</xsl:otherwise>
					</xsl:choose>
				</span>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\123\XmlData\123-PageTypeId-23-RecipeFull.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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