<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />	
	
		<script type="text/javascript">
			<![CDATA[
			function ToggleSpecialsGrid() {

				var categoryID = $('ddlDepartment').value;
				var categoryDivID = 'ProductsGrid:' + categoryID;

				var productGrids = document.getElementsByClassName('LineItem');

				if (typeof(productGrids) == 'object') {
					
					for ( var i = 0; i < productGrids.length; i++) {
						
						var productsDiv = productGrids[i];

						if (categoryID != 0) {
							if (productsDiv.id == categoryDivID) {
								productsDiv.show();
							}
							else {
								productsDiv.hide();
							}
						}
						else {
							productsDiv.show();
						}
					}
				}

				refreshAdPods();
			}
			]]>
		</script>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<div id="MySpecials">
			<div id="CtrlDepartmentDropDown">
				<select id="ddlDepartment" onchange="TogglePantryGrid();">
					<option value="0">
						Show All
					</option>
					<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory">
						<xsl:sort select="CategoryName" data-type="text" />
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="CategoryID" />
							</xsl:attribute>
							<xsl:value-of select="CategoryName" />
						</option>
					</xsl:for-each>
				</select>
			</div>
			<div id="ProductsGrid">
				<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory">
					<xsl:sort select="CategoryName" data-type="text" />
					<xsl:variable name="CategoryID" select="./CategoryID" />
					<div>
						<xsl:attribute name="id"><xsl:value-of select="concat('ProductsGrid:',$CategoryID)" /></xsl:attribute>
						<xsl:attribute name="class">LineItem</xsl:attribute>
						<xsl:call-template name="GenericProductTableByCategory">
							<xsl:with-param name="GenericProducts" select="//ShopperHistory/Products/GenericProduct"></xsl:with-param>
							<xsl:with-param name="GenericCategory" select="."></xsl:with-param>
						</xsl:call-template>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Xml\RecipeCenter.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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