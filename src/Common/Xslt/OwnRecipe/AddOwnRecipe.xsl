<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="N" select="5" />
		<xsl:variable name="IngredientKeyWord" select="'ingredient'" />
		<xsl:variable name="InstructionKeyWord" select="'instruction'" />
		<xsl:variable name="NoteKeyWord" select="'note'" />
		<xsl:variable name="IngredientTitle" select="'Ingredient:'" />
		<xsl:variable name="InstructionTitle" select="'Instruction:'" />
		<xsl:variable name="NoteTitle" select="'Note:'" />
		<script type="text/javascript" src="/Assets/Common/Js/Recipe/AddRecipe.js"></script>
		<script type="text/javascript">
			var ingredientKeyWord = '<xsl:value-of select="$IngredientKeyWord" />';
			var instructionKeyWord = '<xsl:value-of select="$InstructionKeyWord" />';
			var noteKeyWord = '<xsl:value-of select="$NoteKeyWord" />';
			var ingredientTitle = '<xsl:value-of select="$IngredientTitle" />';
			var instructionTitle = '<xsl:value-of select="$InstructionTitle" />';
			var noteTitle = '<xsl:value-of select="$NoteTitle" />';
			var inputTemplate = '<xsl:call-template name="ElementInput"/>';
		</script>
		<xsl:if test="number(ExpressLane/OwnRecipe/OwnRecipeID)">
			<input type="hidden" name="RecipeID">
				<xsl:attribute name="value">
					<xsl:value-of select="ExpressLane/OwnRecipe/OwnRecipeID"/>
				</xsl:attribute>
			</input>
		</xsl:if>
		<div id="AddRecipe">
			<xsl:choose>
				<xsl:when test="number(ExpressLane/OwnRecipe/OwnRecipeID)">
					<h3>Edit Your Recipe</h3>
				</xsl:when>
				<xsl:otherwise>
					<h3>Add Your Own Recipe</h3>
				</xsl:otherwise>
			</xsl:choose>
			<div id="AddRecipeInstructions">
			<xsl:choose>
				<xsl:when test="count(ExpressLane/ArrayOfStaticContent/StaticContent) &gt; 0">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:value-of select="Description" disable-output-escaping="yes" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<p>Add/edit your custom recipe and click 'Save Recipe' (bottom) to save to your recipe box.</p>
				</xsl:otherwise>
			</xsl:choose>
			</div>
			<div id="RecipeData">
				<div id="title-input" class="user-input">
					<span class="label">Title:</span>
					<input type="text" id="RecipeTitle" name="RecipeTitle" onkeypress="if(event.keyCode == 13)return event.keyCode != 13;">
						<xsl:attribute name="onblur">
							if(this.value == '') {
								$('RecipeTitleInvalid').show();
							} else {
								$('RecipeTitleInvalid').hide();
							}
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/OwnRecipe/Title"/>
						</xsl:attribute>
					</input>
					<div id="RecipeTitleInvalidContainer" class="InvalidInputWrapper">
						<span id="RecipeTitleInvalid" class="InvalidInput Invalid" style="display:none;">Please enter a title!</span>
					</div>
				</div>
				<div id="image-input" class="user-input">
					<span class="label">Upload Image:</span>
					<div id="file-input-wrapper">
						<input onchange="UpdateFakeInput();" type="file" id="recipeImage" name="recipeimage" value="" />
						<input type="text" id="fakeFileUpload" name="fakeFileUpload" value="" />
						<a class="button"><span>Browse</span></a>				
					</div>
				</div>
				<xsl:if test="string-length(ExpressLane/OwnRecipe/Image) &gt; 0">
                <p>You must click 'Save Recipe' to update this image when choosing another.</p>
				<span class="label">Image:</span>
						<img>
							<xsl:attribute name="alt">
								<xsl:value-of select="ExpressLane/OwnRecipe/Title"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="ExpressLane/OwnRecipe/Image"/>
							</xsl:attribute>
						</img>
				</xsl:if>
			</div>
			<div id="OwnRecipeIngredients" class="OwnRecipePage">
				<h4>Ingredients</h4>
				<xsl:choose>
					<xsl:when test="ExpressLane/OwnRecipe/Ingredients/OwnRecipeIngredient">
						<xsl:for-each select="ExpressLane/OwnRecipe/Ingredients/OwnRecipeIngredient">
							<xsl:call-template name="ElementInput">
								<xsl:with-param name="ElementID" select="concat($IngredientKeyWord, ':', position())" />
								<xsl:with-param name="InputID" select="1" />
								<xsl:with-param name="Name" select="concat($IngredientKeyWord, ':', position())"/>
								<xsl:with-param name="Title" select="$IngredientTitle"/>
								<xsl:with-param name="value" select="ElementValue"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="ElementInput">
							<xsl:with-param name="ElementID" select="concat($IngredientKeyWord, ':', count(//OwnRecipe/Ingredients/OwnRecipeIngredient)+1)"/>
							<xsl:with-param name="InputID" select="1" />
							<xsl:with-param name="Name" select="concat($IngredientKeyWord, ':', count(//OwnRecipe/Ingredients/OwnRecipeIngredient)+1)"/>
							<xsl:with-param name="Title" select="$IngredientTitle"/>
							<xsl:with-param name="value" select="''"/>
						</xsl:call-template>
						<xsl:call-template name="ElementInput">
							<xsl:with-param name="ElementID" select="concat($IngredientKeyWord, ':', count(//OwnRecipe/Ingredients/OwnRecipeIngredient)+2)"/>
							<xsl:with-param name="InputID" select="1" />
							<xsl:with-param name="Name" select="concat($IngredientKeyWord, ':', count(//OwnRecipe/Ingredients/OwnRecipeIngredient)+2)"/>
							<xsl:with-param name="Title" select="$IngredientTitle"/>
							<xsl:with-param name="value" select="''"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//*">
						<xsl:if test="position() &lt;= $N">
						<xsl:call-template name="ElementInput">
							<xsl:with-param name="ElementID" select="concat($IngredientKeyWord, ':', position())"/>
							<xsl:with-param name="InputID" select="1" />
							<xsl:with-param name="Name" select="concat($IngredientKeyWord, ':', position())"/>
							<xsl:with-param name="Title" select="$IngredientTitle"/>
							<xsl:with-param name="value" select="''"/>
						</xsl:call-template>
						</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				
			</div>
			<a class="add-new" href="javascript:AddNewRecipeInput(1);">
					Add New Ingredient
			</a>
			<div id="OwnRecipeInstructions" class="OwnRecipePage">
				<h4>Instructions</h4>
				<xsl:choose>
					<xsl:when test="ExpressLane/OwnRecipe/Instructions/OwnRecipeInstruction">
						<xsl:for-each select="ExpressLane/OwnRecipe/Instructions/OwnRecipeInstruction">
							<xsl:call-template name="ElementInput">
								<xsl:with-param name="ElementID" select="concat($InstructionKeyWord, ':', position())"/>
								<xsl:with-param name="InputID" select="2" />
								<xsl:with-param name="Name" select="concat($InstructionKeyWord, ':', position())"/>
								<xsl:with-param name="Title" select="$InstructionTitle"/>
								<xsl:with-param name="value" select="ElementValue"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="ElementInput">
								<xsl:with-param name="ElementID" select="concat($InstructionKeyWord, ':', count(//OwnRecipe/Instructions/OwnRecipeInstruction)+1)"/>
								<xsl:with-param name="InputID" select="2" />
								<xsl:with-param name="Name" select="concat($InstructionKeyWord, ':', count(//OwnRecipe/Instructions/OwnRecipeInstruction)+1)"/>
								<xsl:with-param name="Title" select="$InstructionTitle"/>
								<xsl:with-param name="value" select="''" />
						</xsl:call-template>
						<xsl:call-template name="ElementInput">
								<xsl:with-param name="ElementID" select="concat($InstructionKeyWord, ':', count(//OwnRecipe/Instructions/OwnRecipeInstruction)+2)"/>
								<xsl:with-param name="InputID" select="2" />
								<xsl:with-param name="Name" select="concat($InstructionKeyWord, ':', count(//OwnRecipe/Instructions/OwnRecipeInstruction)+2)"/>
								<xsl:with-param name="Title" select="$InstructionTitle"/>
								<xsl:with-param name="value" select="''" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//*">
						<xsl:if test="position() &lt;= $N">
						<xsl:call-template name="ElementInput">
							<xsl:with-param name="ElementID" select="concat($InstructionKeyWord, ':', position())"/>
							<xsl:with-param name="InputID" select="2" />
							<xsl:with-param name="Name" select="concat($InstructionKeyWord, ':', position())"/>
							<xsl:with-param name="Title" select="$InstructionTitle"/>
							<xsl:with-param name="value" select="''"/>
						</xsl:call-template>
						</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				
			</div>
			<a class="add-new" href="javascript:AddNewRecipeInput(2);">
					Add New Instruction
			</a>
			<div id="OwnRecipeNotes" class="OwnRecipePage">
				<h4>Notes</h4>
				<xsl:choose>
					<xsl:when test="ExpressLane/OwnRecipe/Notes/OwnRecipeNote">
						<xsl:for-each select="ExpressLane/OwnRecipe/Notes/OwnRecipeNote">
							<xsl:call-template name="TextAreaInput">
								<xsl:with-param name="ElementID" select="concat($NoteKeyWord, ':', position())"/>
								<xsl:with-param name="InputID" select="3" />
								<xsl:with-param name="Name" select="concat($NoteKeyWord, ':', position())"/>
								<xsl:with-param name="Title" select="$NoteTitle"/>
								<xsl:with-param name="value" select="ElementValue"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="TextAreaInput">
							<xsl:with-param name="ElementID" select="concat($NoteKeyWord, ':', count(ExpressLane/OwnRecipe/Notes/OwnRecipeNote) + 1)"/>
							<xsl:with-param name="InputID" select="3" />
							<xsl:with-param name="Name" select="concat($NoteKeyWord, ':', count(ExpressLane/OwnRecipe/Notes/OwnRecipeNote) + 1)"/>
							<xsl:with-param name="Title" select="$NoteTitle"/>
							<xsl:with-param name="value" select="''"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<!-- <a class="add-new" href="javascript:AddNewRecipeInput(3);">
					Add New Note
			</a> -->
			<div id="OwnRecipeControls">
				<a class="button" href="javascript:SaveRecipe();">
					<span>Save Recipe</span>
				</a>
                <a class="button" href="/Recipes/RecipeCenter.aspx">
					<span>Cancel</span>
				</a>
				<!--
				<a class="BackLink" href="/Recipes/RecipeCenter.aspx">
					Recipe Center
				</a>
				-->
				<a class="BackLink" href="/Recipes/MyRecipes.aspx">
					My Recipes
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="ElementInput">
		<xsl:param name="InputID" select="'#inputid#'" />
		<xsl:param name="ElementID" select="'#elementid#'" />
		<xsl:param name="Name" select="'#name#'"/>
		<xsl:param name="value" select="'#value#'"/>
		<xsl:param name="Title" select="'#title#'"/>
		<div class="user-input">
			<input type="text" maxlength="500">
				<xsl:attribute name="onkeypress">
					if(event.keyCode == 13) AddNewRecipeInput(<xsl:value-of select="$InputID" />);return event.keyCode != 13;
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="$Name"/>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:value-of select="$ElementID"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="$value"/>
				</xsl:attribute>
			</input>
			<a class="DeleteX" href="javascript:void(0);" onclick="DeleteElement(this);" >
				<span>Delete</span>
			</a>
		</div>
	</xsl:template>
	<xsl:template name="TextAreaInput">
		<xsl:param name="InputID" select="'#inputid#'" />
		<xsl:param name="ElementID" select="'#elementid#'" />
		<xsl:param name="Name" select="'#name#'"/>
		<xsl:param name="value" select="'#value#'"/>
		<xsl:param name="Title" select="'#title#'"/>
		<div class="recipe-text-area user-input">
			<textarea rows="20" >
				<xsl:attribute name="name">
					<xsl:value-of select="$Name"/>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:value-of select="$ElementID"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="$value"/>
				</xsl:attribute>
				<xsl:if test="$value != '#value'">
					<xsl:value-of select="$value" />
				</xsl:if>
			</textarea>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-196-AddOwnRecipe.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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