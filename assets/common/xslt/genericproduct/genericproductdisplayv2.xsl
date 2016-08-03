<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:param name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:param>
<xsl:param name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:param>
	<xsl:template name="GenericProductTableAndBrands">
	<xsl:param name="GenericProducts" />
	<xsl:param name="GenericBrands" />

	 <xsl:call-template name="GenericProductSortSelect">
	 	<xsl:with-param name="GenericBrands" select="$GenericBrands" />
	 </xsl:call-template>	

	<xsl:call-template name="GenericProductTable">
		<xsl:with-param name="GenericProducts" select="$GenericProducts" />
	</xsl:call-template>
	</xsl:template>

	<xsl:template name="GenericProductSortSelect">
	<xsl:param name="GenericBrands" />
		<div>
			<xsl:attribute name="class">ProductLists</xsl:attribute>
			<xsl:variable name="RelevanceHits" select="count(//GenericProduct[number(Relevance)])" />
				
			<xsl:if test="count($GenericBrands) &gt; 1">
				<div id="GenericProductSelectContainer" style="display: none;">
					<select>
						<xsl:attribute name="id">GenericProductBrandsSelect</xsl:attribute>
						<xsl:attribute name="onchange">sortProducts('GenericProductBrandsSelect')</xsl:attribute>

						<option></option>
						<xsl:for-each select="$GenericBrands">
							<xsl:sort select="Name"/>
							<xsl:if test="string-length(Name) > 1">
								<option>
									<xsl:attribute name="value">
										Brand:<xsl:value-of select="BrandID"/>
									</xsl:attribute>
									<xsl:value-of select="Name"/>
								</option>
							</xsl:if>
						</xsl:for-each>
					</select>
					<span>Brand: </span>
				</div>
			</xsl:if>
			
			<div id="GenericProductPriceContainer" style="display: none;">
				<select>
					<xsl:attribute name="id">GenericProductPriceSelect</xsl:attribute>
					<xsl:attribute name="onchange">sortProducts('GenericProductPriceSelect')</xsl:attribute>
					<option></option>
					<option value="Price:ascending 1">Low to High</option>
					<option value="Price:descending">High to Low</option>
				</select>
				<span>Price:</span>
			</div>
			
			<!--<div id="GenericProductRelevanceContainer" style="display: none;">
				<select>
					<xsl:attribute name="id">GenericProductRelevanceSelect</xsl:attribute>
					<xsl:attribute name="onchange">sortProducts('GenericProductRelevanceSelect')</xsl:attribute>
					<option></option>
					<option value="Relevance:descending">Most Relevant</option>
					<option value="Relevance:ascending 1">Least Relevant</option>
				</select>
				<span>Relevance:</span>
			</div>-->			

			<select>
				<xsl:attribute name="id">GenericProductTopLvlSelect</xsl:attribute>
				<xsl:attribute name="onchange">displaySelectedSort()</xsl:attribute>
				<option value='default'>--Sort By--</option>
				<!--<xsl:if test="number($RelevanceHits)">
					<option value="relevance">Relevance</option>
				</xsl:if> -->
				<xsl:if test="count($GenericBrands) &gt; 1">
					<option value="brand">Brand</option>
				</xsl:if>
				<option value="price">Price</option>
			</select>
			<span>Sort: </span>

		</div>
	</xsl:template>

	<xsl:template name="GenericProductTable">
	<xsl:param name="GenericProducts" />
	<xsl:param name="AutoSort" />

	<xsl:call-template name="GenericProductTableWithTableID">
		<xsl:with-param name="GenericProducts" select="$GenericProducts" />
		<xsl:with-param name="AutoSort" select="$AutoSort" />
	</xsl:call-template>

	</xsl:template>


	<xsl:template name="GenericProductTableRelevance">
	<xsl:param name="GenericProducts" />
	<xsl:param name="AutoSort" />

	<xsl:call-template name="GenericProductTableWithTableIDRelevance">
		<xsl:with-param name="GenericProducts" select="$GenericProducts" />
		<xsl:with-param name="AutoSort" select="$AutoSort" />
	</xsl:call-template>

	</xsl:template>
    
    	<xsl:template name="GenericProductTableWithTableID">
		<xsl:param name="GenericProducts" />
		<xsl:param name="TableID" />
		<xsl:param name="AutoSort" />
		
		<table>
			<xsl:attribute name="id"><xsl:choose><xsl:when test="string-length($TableID) &gt; 0"><xsl:value-of select="$TableID" /></xsl:when><xsl:otherwise><xsl:value-of select="concat('Product', generate-id())" /></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:attribute name="class">ProductDisplay sort</xsl:attribute>
			<tbody>
				<tr>
					<th scope="col" class="header1"></th>
					<th scope="col" class="header2">Item</th>
					<th scope="col" class="header3"></th>
					<th scope="col" class="header4">Price</th>
					<th scope="col" class="header5"></th>
                    <th scope="col" class="header6" style="text-align:left;">Quantity</th>
					<!--<th scope="col" class="header6">
						<xsl:if test="count($GenericProducts[Relevance &gt; 0]) &gt; 0">
							Relevance
						</xsl:if>
					</th> -->
				</tr>
				<!-- 2 foreach loops on grid rows mess up the alternating row style because it's based on position() -->
				<!-- I had to comment this out for tasks 9499 and 8714 -->
				<!--
				<xsl:choose>
					<xsl:when test="$AutoSort = 'true'">
						
						
						<xsl:for-each select="$GenericProducts[BrandName != '']">
							<xsl:sort data-type="text" select="BrandName" order="ascending"/>
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>
						<xsl:for-each select="$GenericProducts[string-length(BrandName) &lt; 1]">
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>
						
					</xsl:when>
					<xsl:otherwise>-->
						<xsl:for-each select="$GenericProducts">
                        	<xsl:sort data-type="text" select="BrandName" order="ascending" />
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>					
					<!--</xsl:otherwise>
				</xsl:choose>-->
			</tbody>
		</table>
	</xsl:template>

<xsl:template name="GenericProductTableWithTableIDRelevance">
		<xsl:param name="GenericProducts" />
		<xsl:param name="TableID" />
		<xsl:param name="AutoSort" />
		
		<table>
			<xsl:attribute name="id"><xsl:choose><xsl:when test="string-length($TableID) &gt; 0"><xsl:value-of select="$TableID" /></xsl:when><xsl:otherwise><xsl:value-of select="concat('Product', generate-id())" /></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:attribute name="class">ProductDisplay sort</xsl:attribute>
			<tbody>
				<tr>
					<th scope="col" class="header1">Item</th>
					<th scope="col" class="header2"></th>
					<th scope="col" class="header3"></th>
					<th scope="col" class="header4">Price</th>
					<th scope="col" class="header5"></th>
                    <th scope="col" class="header6" style="text-align:left;">Quantity</th>
					<!-- <th scope="col" class="header6">
						<xsl:if test="count($GenericProducts[Relevance &gt; 0]) &gt; 0">
							Relevance
						</xsl:if>
					</th> -->
				</tr>
				<!-- 2 foreach loops on grid rows mess up the alternating row style because it's based on position() -->
				<!-- I had to comment this out for tasks 9499 and 8714 -->
				<!--
				<xsl:choose>
					<xsl:when test="$AutoSort = 'true'">
						<xsl:for-each select="$GenericProducts[BrandName != '']">
							<xsl:sort data-type="text" select="BrandName" order="ascending"/>
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>
						<xsl:for-each select="$GenericProducts[string-length(BrandName) &lt; 1]">
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
					-->
						<xsl:for-each select="$GenericProducts">
                        	<xsl:sort data-type="number" select="Relevance" order="descending" />
							<xsl:call-template name="GenericProduct_DataRow"/>
						</xsl:for-each>					
					<!-- </xsl:otherwise>
				</xsl:choose> -->
			</tbody>
		</table>
	</xsl:template>
    
    
	<xsl:template match="GenericProduct" name="GenericProduct_DataRow">
	<!-- 
		Table Row Order:
			- Add Button
			- Image
			- Brand/Name/Comments
			- Price
	
	-->
		<xsl:variable name="ProductID" select="ProductID"/>
		<xsl:variable name="CategoryID" select="ShelfCategoryID" />
		<xsl:variable name="TextBoxID" select="concat('comment:', ProductID)"/>
		<xsl:variable name="ShoppingListItem" select="//GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<xsl:variable name="gridclass">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1"> GridAlternatingItem</xsl:when>
				<xsl:otherwise> GridItem</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="brandclass">
			<xsl:choose>
				<xsl:when test="number(BrandID)">
					<xsl:value-of select="concat(' Brand:', BrandID)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Brand:other</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="relevanceclass">
			<xsl:choose>
				<xsl:when test="number(Relevance)">
					<xsl:value-of select="concat(' Relevance:', Relevance)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Relevance:0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="priceclass">
			<xsl:choose>
				<xsl:when test="number(SalePrice)">
					<xsl:value-of select="concat(' Price:', SalePrice)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(' Price:', RegularPrice)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="HoverID" select="concat('ProductHover:', ProductID)" />
		<xsl:variable name="SmallImage">
			<xsl:choose>
				<xsl:when test="string-length(SmallImageURL) &gt; 0">
					<xsl:value-of select="SmallImageURL" />
				</xsl:when>
				<xsl:otherwise>/Assets/Common/Images/no_image_sm.jpg</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

  		<xsl:variable name="Image">
			<xsl:choose>
				<xsl:when test="string-length(ProductImageURL) &gt; 0">
					<xsl:value-of select="ProductImageURL" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="Brand/LargeImageUrl" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="Saving">
			<xsl:choose>
				<xsl:when test="string-length(SavingsAmount) &gt; 0">
					<xsl:value-of select="SavingsAmount" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="string-length(Savings) &gt; 0">
						<xsl:value-of select="concat('SAVINGS - ', Savings)" />
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<xsl:attribute name="class">
				<xsl:value-of select="$gridclass" />
				<xsl:value-of select="$priceclass" />
				<xsl:value-of select="$brandclass" />
				<xsl:value-of select="$relevanceclass" />
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)"> activeProduct</xsl:if>
			</xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="concat('product',$ProductID)" /></xsl:attribute>
			<td>
				<xsl:attribute name="align">center</xsl:attribute>
				<xsl:attribute name="valign">middle</xsl:attribute>
   				<xsl:attribute name="class">ItemImage</xsl:attribute>
				<xsl:if test="string-length($Image) &gt; 0">
                
                
                	
					<xsl:attribute name="onmouseover">
					<xsl:variable name="ShowProdNutrition" select="//GenericChain/ChainSettings/Setting[SettingID=172]/Value" />
                    	<xsl:choose>
                            <xsl:when test="translate($ShowProdNutrition,$ucletters,$lcletters) = 'false'">
                                <xsl:value-of select="concat('doTipFromImage(this, &quot;', $Image, '&quot;, &quot;Enlarged View&quot;);')" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('doTipFromImage(this, &quot;', $Image, '&quot;, &quot;Click for more information&quot;);')" />
                            </xsl:otherwise>
                      	</xsl:choose>
                    </xsl:attribute>
                    
					<!--<div style="display:none;">
						<xsl:attribute name="id"><xsl:value-of select="$HoverID" /></xsl:attribute>
						<div class="thumbNail">
							<div class="top"><h1>Click for more information</h1></div>
							<div class="middle">
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="Description" />
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="$Image" />
									</xsl:attribute>
								</img>
							</div>
							<div class="bottom" />
						</div>
					</div>-->
				</xsl:if>
				<xsl:if test="string-length($SmallImage) &gt; 0">
					<a>
						<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="$ProductID"/>);</xsl:attribute>
						<img>
							<xsl:attribute name="alt">
								<xsl:value-of select="UPC"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="$SmallImage"/>
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
				<span>
					<xsl:attribute name="title"><xsl:value-of select="UPC11" /></xsl:attribute>
					<xsl:value-of select="concat(Description, ' ')"/>
				</span>
				
				<xsl:if test="string-length(ItemExtendedSize) > 0">
					&#160;-&#160;<xsl:value-of select="ItemExtendedSize" />
				</xsl:if>
				<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
                <br/>
					<strong class="comment">Comments:</strong>
					<input type="text">
                    	<xsl:attribute name="class">comment</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:value-of select="$TextBoxID"/>
						</xsl:attribute>
						<xsl:attribute name="onkeypress">var key = event.keyCode ? event.keyCode : event.which; if (key == 13){ SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');} return key!=13;</xsl:attribute>
						<xsl:attribute name="onblur">if (this.value != '' ) SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
						<xsl:if test="//ConsumerComments/ProductComments/ConsumerProductComment[ProductID = $ProductID]">
							<xsl:attribute name="value">
								<xsl:value-of select="//ConsumerComments/ProductComments/ConsumerProductComment[ProductID = $ProductID]/Comment"/>
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
			
           
			<td>
				<xsl:attribute name="class">IconsHTML</xsl:attribute>
				
				<xsl:if test="string-length(DealType/ImageUrl) &gt; 0">
					<img>
						<xsl:attribute name="alt">
							<xsl:value-of select="DealType/Description" />
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="DealType/Description" />
						</xsl:attribute>						
						<xsl:attribute name="src">
							<xsl:value-of select="DealType/ImageUrl" />
						</xsl:attribute>
					</img>
				</xsl:if>			
				<xsl:value-of select="IconsHTML" disable-output-escaping="yes" />
			</td>
            
            <td>
				<xsl:attribute name="class">ItemPrice</xsl:attribute>
				<xsl:if test="string-length(SavingsStatement) &gt; 0">
					<xsl:value-of select="SavingsStatement" /><br />
				</xsl:if>
				<xsl:if test="string-length(PriceCompareMeasure) &gt; 0">
					<xsl:value-of select="PriceCompareMeasure" /><br />
				</xsl:if>
				<xsl:choose>
					<xsl:when test="string-length(SalePriceString) > 0">
						<xsl:if test="SalePriceString != RegularPriceString">
							<span class="SalePrice">SALE - <xsl:value-of select="SalePriceString"/></span>
						</xsl:if>
						<xsl:if test="string-length(RegularPriceString) > 0">
							<br class="RegPrice" />
							<span class="RegPrice">REG. - <xsl:value-of select="RegularPriceString"/></span>
						</xsl:if>
						<xsl:if test="string-length($Saving) &gt; 0">
							<br class="SavingsAmount" />
							<span class="SavingsAmount"><xsl:value-of select="$Saving" /></span>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RegularPriceString"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
            <td class="priceperunit">		
				<xsl:value-of select="ChainComment" disable-output-escaping="yes" />
			</td>
             <td>
				<xsl:attribute name="class">AddButton</xsl:attribute>
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
             
			<!--<td>
				<xsl:if test="Relevance &gt; 0">
					<div>
						<xsl:attribute name="id"><xsl:value-of select="concat('ProductRating', ProductID)" /></xsl:attribute>
						<xsl:attribute name="class">rating_container</xsl:attribute>
					</div>
					<input>
						<xsl:attribute name="type">hidden</xsl:attribute>
						<xsl:attribute name="class">productrelevance</xsl:attribute>
						<xsl:attribute name="title">relevance</xsl:attribute>
						<xsl:attribute name="value"><xsl:value-of select="concat(ProductID, ':', Relevance)" /></xsl:attribute>
					</input>
				</xsl:if>
			</td>-->
		</tr>
</xsl:template>

	<xsl:template match="GenericProduct" name="AddToListControl">
		<xsl:param name="ProductID" select="ProductID"/>
		<xsl:param name="AddToListDiv" select="concat('ProductAddDiv:', ProductID, ':', ShelfCategoryID)"/>
		<xsl:param name="UpdateItemDiv" select="concat('ProductUpdateDiv:', ProductID, ':', ShelfCategoryID)"/>
		<xsl:param name="QuantitySelectID" select="concat('quantity:', ProductID, ':', ShelfCategoryID)"/>
		<xsl:param name="ShoppingListItem" select="//GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<xsl:param name="TextBoxID" select="concat('comment:', ProductID, ':', ShelfCategoryID)"/>
		<xsl:variable name="Quantity" select="//ProductQuantity[ProductID = $ProductID]/Quantity" />
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
							<xsl:when test="number($Quantity)">
								<xsl:value-of select="$Quantity" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="SalePriceMultiple > 1">
										<xsl:value-of select="SalePriceMultiple" />
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
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
					<xsl:attribute name="href">javascript:AddProductLineItemToList(<xsl:value-of select="ProductID"/>, '<xsl:value-of select="$QuantitySelectID" />', '<xsl:value-of select="$UpdateItemDiv"/>', '<xsl:value-of select="$AddToListDiv"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
					<span>Add</span>
				</a>
			</div>
			<div id="{$UpdateItemDiv}" class="divRemoveUpdate">
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a class="button update">
					<xsl:attribute name="href">javascript:UpdateQuantityInShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$QuantitySelectID"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
					<span>Update</span>
				</a>
				<a class="button remove">
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
		<xsl:param name="ShoppingListItem" select="//GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<xsl:param name="Weight">
			<xsl:choose>
				<xsl:when test="number($ShoppingListItem/Weight)">
					<xsl:value-of select="$ShoppingListItem/Weight" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//ProductQuantity[ProductID = $ProductID]/Weight" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:variable name="Quantity" select="//ProductQuantity[ProductID = $ProductID]/Quantity" />
		<xsl:variable name="ShowQtyForWeightedItems">
			<xsl:value-of select="translate(//GenericChain/ChainSettings/Setting[SettingID=263]/Value,$ucletters,$lcletters)" />
		</xsl:variable>
		<div class="ProductAddToListControl">
			<xsl:variable name="IgnorePriceMultiple">
				<xsl:choose>
					<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=160]/Value) &gt; 0">
						<xsl:value-of select="translate(//GenericChain/ChainSettings/Setting[SettingID=160]/Value, $ucletters, $lcletters)" />
					</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				<input maxlength="3">
					<xsl:attribute name="id">
						<xsl:value-of select="$QuantitySelectID"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/Quantity)">
								<xsl:value-of select="$ShoppingListItem/Quantity" />
							</xsl:when>
							<xsl:when test="number($Quantity)">
								<xsl:value-of select="$Quantity" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="SalePriceMultiple > 1 and $IgnorePriceMultiple = 'false'">
										<xsl:value-of select="SalePriceMultiple" />
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>						
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="$ShowQtyForWeightedItems != 'true'">
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:if>
				</input>
				<div id="ProductPlusMinusButtons">
					<xsl:if test="$ShowQtyForWeightedItems != 'true'">
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:if>
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
						<xsl:with-param name="Weight" select="$Weight"></xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</select>
			<script type="text/javascript">
				// work around to display selects in light window
				if ($('lightwindow_contents') != null) {
					lightwindow.prototype._toggleTroubleElements('visible', true);
				}
			</script>
			<span class="unitOfMeasure">
			<xsl:choose>
				<xsl:when test="string-length(UnitOfMeasureAbbreviation) > 0">
					<xsl:value-of select="UnitOfMeasureAbbreviation" />
					<xsl:if test="not(contains(UnitOfMeasureAbbreviation,'.'))">
						<xsl:text>.</xsl:text>						
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>lb.</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			</span>
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
					<span>Add</span>
				</a>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">divRemoveUpdate</xsl:attribute>
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

	<xsl:template name="ListItemsVariableWeight" match="GenericFraction">
		<xsl:param name="Weight"/>
		
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="format-number(StoredValue, '0.##')" />
			</xsl:attribute>
			<xsl:if test="number(StoredValue) &gt;= number($Weight) and number(StoredValue) &lt; number($Weight) + 0.25" >
				<xsl:attribute name="selected" />
			</xsl:if>
			<xsl:value-of select="DisplayValue" />
		</option>	

	</xsl:template>

	<xsl:template name="GenericProductTableByCategory">
		<xsl:param name="GenericProducts" />
		<xsl:param name="GenericCategory" />

		<xsl:variable name="Products" select="$GenericProducts[DepartmentCategoryID = $GenericCategory/CategoryID]" />

		<xsl:if test="count($Products) > 0">
			<div class="CategoryHeader">
				<h3><xsl:value-of select="$GenericCategory/CategoryName" /></h3>
			</div>

			<xsl:call-template name="GenericProductTable">
				<xsl:with-param name="GenericProducts" select="$Products" />
				<xsl:with-param name="AutoSort" select="'true'" />
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>
