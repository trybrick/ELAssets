<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">

		<div>
			<p>
				<xsl:value-of select="concat(count(ExpressLane/SearchResults/ProductSearchResults/Products/GenericProduct), ' ')"/>products found matching: "<xsl:value-of select="ExpressLane/SearchResults/ProductSearchResults/GenericProductHelper/SearchText"/>"<br/>organized by department and total matches.</p>
		</div>

		<div class="clear">
		</div>

		<div>
			<div id="productdescription"></div>
			<xsl:variable name="catid" select="ExpressLane/SearchResults/ProductSearchResults/CategoryID"/>

			<div class="CategoryDisplayContainer">
				<xsl:for-each select="ExpressLane/SearchResults/ProductSearchResults/Categories/Category">
					<xsl:sort select="CategoryName" data-type="text"/>
					<xsl:call-template name="CategoryDisplay">
						<xsl:with-param name="CategoryID" select="CategoryID"/>
						<xsl:with-param name="SelectedCategoryID" select="$catid" />
					</xsl:call-template>
				</xsl:for-each>
			</div>
			<xsl:if test="count(ExpressLane/SearchResults/ProductSearchResults/Brands/item) &gt; 1">
				<div>
					<xsl:attribute name="class">ProductLists</xsl:attribute>
					<td colspan="4">Sort: <select>
							<xsl:attribute name="id">GenericProductBrandsSelect</xsl:attribute>
							<!--<xsl:attribute name="onmouseup">displayBrands()</xsl:attribute>-->
							<xsl:attribute name="onchange">sortProductTable('GenericProductBrandsSelect', 'ProductDisplay')</xsl:attribute>

							<xsl:for-each select="ExpressLane/SearchResults/ProductSearchResults/Brands/item">
								<xsl:sort select="value/string"/>
								<option>
									<xsl:attribute name="value">
										Brand:<xsl:value-of select="key/int"/>
									</xsl:attribute>
									Brand:<xsl:value-of select="value/string"/>
								</option>
							</xsl:for-each>
							<option>
								<xsl:attribute name="value">Brand:other</xsl:attribute>Brand: Other
							</option>
							<option>
								<xsl:attribute name="value">Price:LowToHigh</xsl:attribute>
								Price: Ascending
							</option>								
							<option>
								<xsl:attribute name="value">Price:HighToLow</xsl:attribute>
								Price: Descending
							</option>
						</select>
					</td>
				</div>
			</xsl:if>
			<xsl:call-template name="CategoryProductDisplay">
				<xsl:with-param name="CategoryID" select="$catid"/>
			</xsl:call-template>

			<div id="UpdateProgress2" style="display: none; margin-top: 0px;">
				<div id="ProcessingPanel">
					<img src="../Assets/Common/Images/Wait.gif" alt="Wait"/>Processing...</div>
			</div>
		</div>

		<div class="clear">
		</div>
	</xsl:template>

	<xsl:template match="Category" name="CategoryDisplay">
		<xsl:param name="CategoryID"/>
		<xsl:param name="SelectedCategoryID" />
		<h3 style="cursor:pointer;">
			<xsl:if test="$SelectedCategoryID = $CategoryID">
				<xsl:attribute name="class">
					activeCategory
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">Products<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:attribute name="onclick">javascript:FilterSearchResults('<xsl:value-of select="CategoryID"/>');</xsl:attribute>
			<xsl:value-of select="concat(CategoryName, ' ')"/>
			<span>(<xsl:value-of select="count(//ExpressLane/SearchResults/ProductSearchResults/Products/GenericProduct[CategoryID = $CategoryID])"/>)</span>
		</h3>
	</xsl:template>

	<xsl:template match="Category" name="CategoryProductDisplay">
		<xsl:param name="CategoryID"/>

		<xsl:variable name="CategoryItems" select="//Products/GenericProduct[CategoryID = $CategoryID]" />

		<xsl:variable name="SaleItems" select="$CategoryItems[SaleItemID &gt; 0]" />
		<xsl:variable name="InventoryItems" select="$CategoryItems[SaleItemID = 0]" />

<!--		CategoryItems: <xsl:value-of select="count($CategoryItems)" />
		Sale Item Count: <xsl:value-of select="count($SaleItems)" />
		Inventory Item Count: <xsl:value-of select="count($InventoryItems)" /><br />-->
	

		<div>
			<xsl:attribute name="id">Products<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:attribute name="class">CategoryDisplayResultsContainer</xsl:attribute>
			<!--<xsl:attribute name="style">display:none</xsl:attribute> -->

			<div id="SaleItems">
			<h2>Top Sale Items</h2>
			<xsl:for-each select="$SaleItems">
				<xsl:variable name="ProductID" select="ProductID" />
				<div>
					<xsl:attribute name="class">saleItemsContainer</xsl:attribute>
					<xsl:if test="string-length(SmallImageURL) &gt; 0">
						<a>
							<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="$ProductID"/>);</xsl:attribute>
							<img>
								<xsl:attribute name="alt">
									<xsl:value-of select="UPC"/>
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="string-length(SmallImageURL) &gt; 0">
											<xsl:value-of select="SmallImageURL"/>
										</xsl:when>
										<xsl:otherwise>/Assets/Common/Images/no_image.gif</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="string-length(SalePriceString) > 0">
							<span class="SalePrice">SALE <xsl:value-of select="SalePriceString"/></span>
							<br/>
							<span class="RegPrice">Reg. <xsl:value-of select="RegularPriceString"/></span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="RegularPriceString"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:for-each>
		</div>
			<table id="ProductDisplay" class="CategoryDisplayResults">
				<tbody>
					<tr>
						<th scope="col" style="padding-left:8px">Item</th>
						<th scope="col">
						</th>
						<th scope="col">Price</th>
						<th scope="col" colspan="2">Quantity</th>
					</tr>
					<xsl:for-each select="$InventoryItems[BrandName != '']">
						<xsl:sort data-type="text" select="BrandName" order="ascending"/>
						<xsl:call-template name="ProductTableRow"/>
					</xsl:for-each>
					<xsl:for-each select="$InventoryItems[string-length(BrandName) &lt; 1]">
						<xsl:call-template name="ProductTableRow"/>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template match="GenericProduct" name="ProductTableRow">
		<xsl:param name="ProductID" select="ProductID"/>
		<xsl:param name="TextBoxID" select="concat('comment:', ProductID)"/>
		<xsl:param name="ShoppingListItem" select="//ExpressLane/Common/GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>

		<xsl:variable name="gridclass">
			<xsl:if test="position() mod 2 = 1">GridAlternatingItem</xsl:if>
			<xsl:if test="position() mod 2 != 1">GridItem</xsl:if>
		</xsl:variable>

		<xsl:variable name="brandclass">
			<xsl:if test="number(BrandID)">
				<xsl:text> Brand:</xsl:text>
				<xsl:value-of select="BrandID"/>
			</xsl:if>
			<xsl:if test="not(number(BrandID))">
				<xsl:text> Brand:other</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="priceclass">
			<xsl:if test="number(SalePrice)">
				<xsl:text> Price:</xsl:text>
				<xsl:value-of select="SalePrice"/>
			</xsl:if>
			<xsl:if test="not(number(SalePrice))">
				<xsl:text> Price:</xsl:text>
				<xsl:value-of select="RegularPrice"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="class1">
			<xsl:value-of select="concat($gridclass, $brandclass)"/>
		</xsl:variable>

		<tr>
			<xsl:attribute name="class">
				<xsl:value-of select="concat($class1, $priceclass)"/>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)"> activeProduct</xsl:if>
			</xsl:attribute>
			
			<xsl:attribute name="id">product<xsl:value-of select="$ProductID" /></xsl:attribute>
			<td class="ItemImage">
				<xsl:if test="string-length(SmallImageURL) &gt; 0">
					<a>
						<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="$ProductID"/>);</xsl:attribute>
						<img>
							<xsl:attribute name="alt">
								<xsl:value-of select="UPC"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:choose>
									<xsl:when test="string-length(SmallImageURL) &gt; 0">
										<xsl:value-of select="SmallImageURL"/>
									</xsl:when>
									<xsl:otherwise>/Assets/Common/Images/no_image.gif</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</img>
					</a>
				</xsl:if>
			</td>
			<td>
				<xsl:attribute name="class">ItemName</xsl:attribute>
				<xsl:if test="string-length(BrandName) &gt; 0">
					<b>
						<xsl:value-of select="concat(BrandName, ' ')"/>
					</b>
				</xsl:if>
				<xsl:value-of select="concat(Description, ' ')"/>
				<br/>
				<xsl:if test="//ExpressLane/Common/Consumer/IsLoggedIn = 'true'">
					<span class="comments">Comments:</span>
					<input type="text">
						<xsl:attribute name="id">
							<xsl:value-of select="$TextBoxID"/>
						</xsl:attribute>
						<xsl:attribute name="onkeypress">var key = event.keyCode ? event.keyCode : event.which; if (key == 13){ SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');} return key!=13;</xsl:attribute>
						<!--<xsl:attribute name="onkeypress">alert(event.keyCode);</xsl:attribute> -->
						<xsl:if test="//ExpressLane/Common/ConsumerComments/ProductComments/ConsumerProductComment[ProductID = $ProductID]">
							<xsl:attribute name="value">
								<xsl:value-of select="//ExpressLane/Common/ConsumerComments/ProductComments/ConsumerProductComment[ProductID = $ProductID]/Comment"/>
							</xsl:attribute>
						</xsl:if>
					</input>
					<!-- Scott requested that this be removed - 01/19/09 -->
					<!-- <a>
							<xsl:attribute name="href">javascript:SaveComment(<xsl:value-of select="$ProductID" />, '<xsl:value-of select="$TextBoxID" />');</xsl:attribute>
							<xsl:attribute name="class">button</xsl:attribute>
							<span>Save Comment</span>
						</a> -->
				</xsl:if>
			</td>
			<td class="ItemPrice">
				<xsl:choose>
					<xsl:when test="string-length(SalePriceString) > 0">
						<span class="SalePrice">SALE <xsl:value-of select="SalePriceString"/></span>
						<br/>
						<span class="RegPrice">Reg. <xsl:value-of select="RegularPriceString"/></span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RegularPriceString"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="AddButton">
				<xsl:choose>
					<xsl:when test="number(SoldByWeight)">
						<xsl:call-template name="AddToListWeightedControl"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="AddToListControl"/>
					</xsl:otherwise>
				</xsl:choose>
				<div style="display:none;">
					<xsl:attribute name="class">
						<xsl:value-of select="concat('ItemData_', ProductID, '_3')" />
					</xsl:attribute>
					<span class="ExportKeyID"><xsl:value-of select="ProductExportKeyID" /></span>
					<span class="ExportKeyID"><xsl:value-of select="BrandExportKeyID" /></span>
					<span class="ExportKeyID"><xsl:value-of select="DepartmentExportKeyID" /></span>
					<span class="ExportKeyID"><xsl:value-of select="AisleExportKeyID" /></span>
					<span class="ExportKeyID"><xsl:value-of select="CategoryExportKeyID" /></span>
					<xsl:if test="CategoryExportKeyID != ShelfExportCategoryID">
						<span class="ExportKeyID"><xsl:value-of select="ShelfExportKeyID" /></span>
					</xsl:if>
				</div>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="ListItems">
		<xsl:param name="Value"/>
		<xsl:param name="MaxValue"/>
		<xsl:param name="Increment"/>
		<xsl:param name="Selected"/>
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="$Value"/>
			</xsl:attribute>
			<xsl:if test="$Value = $Selected">
				<xsl:attribute name="selected">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="$Value"/>
			<!--<xsl:if test="floor($Value)&gt;0">
				<xsl:value-of select="floor($Value)" />
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$Value - floor($Value) = 0.25"> 1/4</xsl:when>
				<xsl:when test="$Value - floor($Value) = 0.5"> 1/2</xsl:when>
				<xsl:when test="$Value - floor($Value) = 0.75"> 3/4</xsl:when>
			</xsl:choose>-->
		</option>
		<xsl:if test="$Value &lt; $MaxValue">
			<xsl:call-template name="ListItems">
				<xsl:with-param name="MaxValue" select="format-number($MaxValue, '0.00')"/>
				<xsl:with-param name="Value" select="format-number($Value + $Increment, '0.00')"/>
				<xsl:with-param name="Increment" select="format-number($Increment, '0.00')"/>
				<xsl:with-param name="Selected" select="format-number($Selected, '0.00')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="ListItemsVariableWeight">
		<xsl:param name="Value"/>
		<xsl:param name="Display"/>
		<xsl:param name="Selected"/>
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="$Value"/>
			</xsl:attribute>
			<xsl:if test="$Value = $Selected">
				<xsl:attribute name="selected">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="$Display"/>
		</option>
	</xsl:template>
	<xsl:template match="GenericProduct" name="AddToListControl">
		<xsl:param name="ProductID" select="ProductID"/>
		<xsl:param name="AddToListDiv" select="concat('ProductAddDiv:', ProductID)"/>
		<xsl:param name="UpdateItemDiv" select="concat('ProductUpdateDiv:', ProductID)"/>
		<xsl:param name="QuantitySelectID" select="concat('quantity:', ProductID)"/>
		<xsl:param name="ShoppingListItem" select="//ExpressLane/Common/GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<xsl:param name="TextBoxID" select="concat('comment:', ProductID)"/>
		<div class="ProductAddToListControl">
			<div>
				<input type="text" maxlength="3">
					<xsl:attribute name="id">
						<xsl:value-of select="$QuantitySelectID"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/Quantity)">
								<xsl:value-of select="number($ShoppingListItem/Quantity)"/>
							</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<div id="ProductPlusMinusButtons">
					<a class="ProductAddToListPlus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', 1, 99);</xsl:attribute>
					</a>
					<a class="ProductAddToListMinus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', -1, 99);</xsl:attribute>
					</a>
				</div>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$AddToListDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ProductUpdateDivButtons</xsl:attribute>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
							<xsl:otherwise>display:block;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>

				<a>
					<xsl:attribute name="class">button add</xsl:attribute>
					<xsl:attribute name="href">javascript:AddProductLineItemToList(<xsl:value-of select="ProductID"/>, 'quantity:<xsl:value-of select="ProductID"/>', '<xsl:value-of select="$UpdateItemDiv"/>', '<xsl:value-of select="$AddToListDiv"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
					<span>Add Item</span>
				</a>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a>
					<xsl:attribute name="class">button update</xsl:attribute>
					<xsl:attribute name="href">javascript:UpdateQuantityInShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$QuantitySelectID"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
					<span>Update</span>
				</a>
				<a>
					<xsl:attribute name="class">button remove</xsl:attribute>
					<xsl:attribute name="href">javascript:RemoveProductFromShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Remove</span>
				</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="GenericProduct" name="AddToListWeightedControl">
		<xsl:param name="ProductID" select="ProductID"/>
		<xsl:param name="AddToListDiv" select="concat('ProductAddDiv:', ProductID)"/>
		<xsl:param name="UpdateItemDiv" select="concat('ProductUpdateDiv:', ProductID)"/>
		<xsl:param name="QuantitySelectID" select="concat('quantity:', ProductID)"/>
		<xsl:param name="WeightSelectID" select="concat('weight:', ProductID)"/>
		<xsl:param name="ShoppingListItem" select="//ExpressLane/Common/GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<div class="ProductAddToListControl">
			<input type="text" maxlength="3">
				<xsl:attribute name="id">
					<xsl:value-of select="$QuantitySelectID"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/Quantity)">
							<xsl:value-of select="number($ShoppingListItem/Quantity)"/>
						</xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</input>
			<div id="ProductPlusMinusButtons">
				<a class="ProductAddToListPlus">
					<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', 1, 99);</xsl:attribute>
				</a>
				<a class="ProductAddToListMinus">
					<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', -1, 99);</xsl:attribute>
				</a>
			</div>
			<select>
				<xsl:attribute name="id">
					<xsl:value-of select="$WeightSelectID"/>
				</xsl:attribute>

				<xsl:for-each select="VariableWieght/GenericFraction">
					<xsl:call-template name="ListItemsVariableWeight">
						<xsl:with-param name="Display" select="DisplayValue"/>
						<xsl:with-param name="Value" select="StoredValue"/>
						<xsl:with-param name="Selected" select="$ShoppingListItem/Weight"/>
					</xsl:call-template>
				</xsl:for-each>
			</select>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$AddToListDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ProductUpdateDivButtons</xsl:attribute>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
							<xsl:otherwise>display:block;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<a>
					<xsl:attribute name="class">button add</xsl:attribute>
					<xsl:attribute name="href">javascript:AddProductLineItemToListWithWeight(<xsl:value-of select="ProductID"/>, '<xsl:value-of select="$WeightSelectID"/>', '<xsl:value-of select="$QuantitySelectID"/>', '<xsl:value-of select="$UpdateItemDiv"/>', '<xsl:value-of select="$AddToListDiv"/>');</xsl:attribute>
					<span>Add Item</span>
				</a>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ProductUpdateDivButtons</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a>
					<xsl:attribute name="class">button update</xsl:attribute>
					<xsl:attribute name="href">javascript:UpdateWeightInShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$WeightSelectID"/>', '<xsl:value-of select="$QuantitySelectID"/>');</xsl:attribute>
					<span>Update</span>
				</a>
				<a>
					<xsl:attribute name="class">button remove</xsl:attribute>
					<xsl:attribute name="href">javascript:RemoveProductFromShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Remove</span>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\158\XmlData\158-PageTypeId-105-GenericProduct.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0"
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