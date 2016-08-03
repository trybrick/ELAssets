<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/"><style>.pollTextTitle		{font-size:160%; font-weight:bold; color:white;}
				.pollTextQuestion	{font-size:10px; font-weight:bold;}
				.pollTextAnswer		{font-size:10px; }</style>

		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
     			function changeDIV(hide, show)
        		{
            		var d = new Object();
            		d = document.getElementById(hide);
            		d.style.display = "none";

            		d = document.getElementById(show);
            		d.style.display = "";
        		}
				]]>
			</xsl:comment>
		</script>
		<div id="home" class="main-wrapper">
			<div id="SplashContainer" style="margin-bottom:1%;">
				<div id="AdPromo">
					<a href="Shop/WeeklyAd.aspx">
						<img src="Assets/196/Images/shopping_bag.jpg"/>
					</a>
				</div>
				<xsl:call-template name="SlideShow"/>
			</div>
			<div id="splashblocks">
				<div id="DualContentControlDiv" style="padding:0 0 0 0;">
					<div id="DualContentControlDivA" style="margin-bottom:0px;">
						<a href="/Recipes/RecipeCenter.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/recipeCenter.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivB">
						<a href="http://scolaris.lifepics.com/net/Default.aspx" target="_blank">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/online_photos_button.png</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivC">
						<a href="/saknsave.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/sakNSave.jpg</xsl:attribute>
							</img>
						</a>
					</div>
				</div>

				<div id="DualContentControlDiv" style="padding:0 0 0 0;">
					<div id="DualContentControlDivA">
						<a href="/pharmacy.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/pharmacy.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivB">
						<a href="/nuval.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/nuval.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivC">
						<a href="/made in NV.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/madeInNevada.jpg</xsl:attribute>
							</img>
						</a>
					</div>
				</div>

				<div id="DualContentControlDiv" style="padding:0 0 0 0;">
					<div id="DualContentControlDivA">
						<a href="/StoreLocator.aspx">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/storeLocations.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivB">
						<a href="http://www.redbox.com/Locations/" target="_blank">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/redboxNew.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="DualContentControlDivC">
						<a href="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/196/kiosk_reno.pdf" target="_blank">
							<img>
								<xsl:attribute name="src">/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/dmvkioskbutton.jpg</xsl:attribute>
							</img>
						</a>
					</div>
				</div>

				<div id="FeaturedRecipeTeaser">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>Recipe of the Day</a>
					</h2>
					<p>We offer a different recipe each day. Try something new tonight!</p>
					<a>
						<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</a>
					<p>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</a>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\Village Market-Home.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="div/div/div/a[1]/xsl:for-each" x="63" y="41"/>
				<block path="div/div/div/a[1]/xsl:for-each/xsl:if/=[0]" x="87" y="69"/>
				<block path="div/div/div/a[1]/xsl:for-each/xsl:if" x="133" y="71"/>
				<block path="div/div[2]/div/a/img/xsl:attribute/xsl:value-of" x="213" y="31"/>
				<block path="div/div[2]/div[1]/a/img/xsl:attribute/xsl:value-of" x="253" y="31"/>
				<block path="div/div[3]/div/a/img/xsl:attribute/xsl:value-of" x="173" y="31"/>
				<block path="div/div[3]/div[1]/a/img/xsl:attribute/xsl:value-of" x="133" y="31"/>
				<block path="div/div[4]/xsl:for-each" x="253" y="71"/>
				<block path="div/div[4]/xsl:for-each/h3/xsl:value-of" x="213" y="71"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each" x="173" y="71"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each/li/a/xsl:attribute/xsl:value-of" x="13" y="31"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each/li/a/xsl:value-of" x="13" y="71"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->
