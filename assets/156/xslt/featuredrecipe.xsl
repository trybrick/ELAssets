<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:if test="ExpressLane/FeaturedRecipeList/FeaturedRecipe">
			<xsl:apply-templates select="ExpressLane/FeaturedRecipeList/FeaturedRecipe" />
		</xsl:if>
	</xsl:template>
	<xsl:template match="FeaturedRecipe" name="FeaturedRecipeTeaser">
		<h2 class="header">Featured Recipe</h2>
		<a>
			<xsl:attribute name="href">
				##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/>
			</xsl:attribute>
			<img alt="">
				<xsl:attribute name="src">
					<xsl:value-of select="RecipeImageURL"/>
				</xsl:attribute>
			</img>
		</a>
		<h3>
			<a>
				<xsl:attribute name="href">
					##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/>
				</xsl:attribute>
				<xsl:value-of select="RecipeTitle"/>
			</a>
		</h3>
		
		    <p>Yield: <strong><xsl:value-of select="YieldText" /></strong></p>
			
			<xsl:if test="PrepTime != '0'">
				<p>Prep Time: <strong><xsl:value-of select="PrepTime" /> mins.</strong> </p>
			</xsl:if>
			<xsl:if test="CookTime != '0'">
				<p>Cook Time: <strong><xsl:value-of select="CookTime" /> mins.</strong> </p>
			</xsl:if>
			<xsl:if test="TotalTime != '0'">
				<p>Total Time: <strong><xsl:value-of select="TotalTime" /> mins.</strong> </p>
			</xsl:if>
			
			<a class="more">
				<xsl:attribute name="href">
					##root##/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/>
				</xsl:attribute>
				View this recipe
			</a>
			
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-17-RecipeFeaturedRecipeTeaser.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0"
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