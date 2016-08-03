<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<MealPlannerList>
			<xsl:for-each select="ExpressLane/MealPlannerList/MealPlanner">
				<xsl:sort select="DisplayOrderDate"/>
				<xsl:call-template name="MealPlanner"/>
			</xsl:for-each>
		</MealPlannerList>
	</xsl:template>
	<xsl:template match="MealPlanner" name="MealPlanner">
		<MealPlanner>
			<xsl:choose>
				<xsl:when test="string-length(DisplayDate) &gt; 0">
					<DisplayDate>
						<xsl:value-of select="DisplayDate"/>
					</DisplayDate>
				</xsl:when>
				<xsl:otherwise>
					<DisplayDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(DisplayOrderDate)">
					<DisplayOrderDate>
						<xsl:value-of select="DisplayOrderDate"/>
					</DisplayOrderDate>
				</xsl:when>
				<xsl:otherwise>
					<DisplayOrderDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(RecipeTitle) &gt; 0">
					<RecipeTitle>
						<xsl:value-of select="RecipeTitle"/>
					</RecipeTitle>
				</xsl:when>
				<xsl:otherwise>
					<RecipeTitle/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(RecipeID)">
					<RecipeID>
						<xsl:value-of select="RecipeID"/>
					</RecipeID>
				</xsl:when>
				<xsl:otherwise>
					<RecipeID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(RecipeImageURL) &gt; 0">
					<RecipeImageURL>
						<xsl:value-of select="RecipeImageURL"/>
					</RecipeImageURL>
				</xsl:when>
				<xsl:otherwise>
					<RecipeImageURL/>
				</xsl:otherwise>
			</xsl:choose>
		</MealPlanner>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-155-ExternalMealPlanner.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
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