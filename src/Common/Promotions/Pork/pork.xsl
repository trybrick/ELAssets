<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<style>
		#PorkContainer			{width:600px;overflow:hidden;}
		#PorkMain				{width:100%;}
		#PorkHeader				{width:590px;text-align:center;}
		#PorkHeader img			{margin:0 auto;}
		#PorkFooter				{width:590px;text-align:center;margin-top:2em;float:left;}
		#FooterText				{font-family:Verdana, Arial, sans-serif; font-size:12px; width:500px; padding:0; margin:0 auto;text-align:left;}
		.recipeLink				{float:left;width:300px;margin:0;padding:0;}
		.recipeLink img			{border:none;width:300px;}

	</style>
	<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
	<div id="PorkContainer">
		<div id="PorkHeader">
			<img src="/Assets/Common/Images/promotions/pork/images/pork_header.jpg" alt="" />
		</div>
		<div id="PorkMain">
			<xsl:for-each select="PorkRecipes/Recipe">
				<div class="recipeLink">
					<a href="#">
						<xsl:attribute name="onclick">javascript:recipeRedirect('%c','<xsl:value-of select="RecipeID" />');</xsl:attribute>
						<img><xsl:attribute name="src">/Assets/Common/Images/promotions/pork/images/<xsl:value-of select="Image" /></xsl:attribute></img>
					</a>
				</div>
			</xsl:for-each>
		</div>
		<div id="PorkFooter">
			<p id="FooterText">&#169;2008 National Pork Board, Des Moines, IA. This message funded by America’s Pork Checkoff program. The revised USDA Nutrient Data Set for Fresh Pork; USDA National Nutrient Database for Standard Reference, Release 20</p>
		</div>
	</div>

</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="pork_recipes" userelativepaths="yes" externalpreview="no" url="pork.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->