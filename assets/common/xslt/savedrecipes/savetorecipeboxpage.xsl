<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="//SavedRecipe">
				<script type="text/javascript" src="/Assets/Common/Js/RecipeBox/RecipeBox.js" />
				<div id="SubmitAskChefControl">
				    <div id="CtrlDivSubTitle">
				        <h1>Save to Your Recipe Box</h1>
				    </div>
				    <div id="CtrlDivRecipeTitle">
				        <h3><xsl:value-of select="//SavedRecipe/RecipeTitle" /></h3>
				    </div>
					<div id="SaveRecipeResponse" />
				    <div id="CtrlDivRecipeImage">
		        		<xsl:if test="string-length(//SavedRecipe/ImageUrl) &gt; 0">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="//SavedRecipe/ImageUrl" />
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="//SavedRecipe/RecipeTitle" />
								</xsl:attribute>
							</img>
						</xsl:if>
				    </div>
				    <div id="CtrlDivComments">
				        <p>Please add/update this recipe with your comments &amp; click the <b>'Save to Recipe Box'</b> button below.</p>
				        <textarea>
							<xsl:attribute name="name">txtComment</xsl:attribute>
							<xsl:attribute name="id">txtComment</xsl:attribute>
							<xsl:attribute name="cols">40</xsl:attribute>
							<xsl:attribute name="rows">7</xsl:attribute>
							<xsl:choose>
								<xsl:when test="//SavedRecipe/Comment"><xsl:value-of select="//SavedRecipe/Comment" /></xsl:when>
								<xsl:otherwise><xsl:attribute name="onclick">javascript:this.value=''</xsl:attribute></xsl:otherwise>
							</xsl:choose>
						</textarea>

				    </div>
				    <div id="CtrlDivSubmit">
						<a class="button">
							<xsl:attribute name="href">
								<xsl:value-of select="concat('javascript:SaveRecipeToBox(', //SavedRecipe/RecipeID, ');')" />
							</xsl:attribute>
							<span>Save to Recipe Box</span>
						</a>
				        <a class="button">
							<xsl:attribute name="href">
								<xsl:value-of select="concat('/Recipes/RecipeFull.aspx', //Uri/Query)" />
							</xsl:attribute>
							<span>Back to Recipe</span>
						</a>
				        <a class="button" href="/Recipes/MyRecipes.aspx">
							<span>View My Recipe Box</span>
						</a>
				    </div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<p>
					The Recipe that you want to save to your recipe box is unavailable at this time.
					Please try again later.
				</p>
				<a class="button" href="/Recipes/RecipeCenter.aspx">
					<span>Back To The Recipe Center</span>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-182-SaveToRecipeBoxPage.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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