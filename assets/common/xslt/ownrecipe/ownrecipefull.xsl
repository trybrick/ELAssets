<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<style>
	div#OwnRecipeFull div.OwnRecipePage p { margin-left:2em; }
</style>
<div id="OwnRecipeFull">
<h1><xsl:value-of select="//OwnRecipe/Title" /></h1>
<xsl:if test="string-length(ExpressLane/OwnRecipe/Image) &gt; 0">
<img>
	<xsl:attribute name="alt"><xsl:value-of select="//OwnRecipe/Title" /></xsl:attribute>
	<xsl:attribute name="src"><xsl:value-of select="//OwnRecipe/Image" /></xsl:attribute>
</img>
</xsl:if>
	<div id="IngredientDetails" class="OwnRecipePage">
	<h4>Ingredients</h4>
	<ul>
		<xsl:for-each select="//OwnRecipe/Ingredients/OwnRecipeIngredient">
			<li><xsl:value-of select="ElementValue" /></li>
		</xsl:for-each>
	</ul>
	</div>
	<div id="InstructionDetails" class="OwnRecipePage">
	<h4>Instructions</h4>
	<ol>
		<xsl:for-each select="//OwnRecipe/Instructions/OwnRecipeInstruction">
			<li><xsl:value-of select="ElementValue" /></li>
		</xsl:for-each>
	</ol>
	</div>
	<div id="NotesDetail" class="OwnRecipePage">
	<h4>Notes</h4>
		<xsl:for-each select="//OwnRecipe/Notes/OwnRecipeNote">
			<p><xsl:value-of select="ElementValue" /></p>
		</xsl:for-each>
	</div>
	<div id="OwnRecipeControls" class="OwnRecipePage">
		<a class="button">
		<xsl:attribute name="href">/Recipes/AddRecipe.aspx?RecipeID=<xsl:value-of select="//OwnRecipe/OwnRecipeID" /></xsl:attribute>
			<span>Edit Recipe</span>
		</a>
		<a class="BackLink" href="/Recipes/MyRecipes.aspx">
			Back to My Recipes
		</a>
	</div>
</div>

</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\24\XmlData\OwnRecipeFull.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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