<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../GenericProduct/GenericProductDisplay.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="SearchResultsHeader">
			<xsl:variable name="CircularItemCount" select="count(//CircularItems/GenericCircularItem)"/>
			<xsl:variable name="ProductCount" select="count(//ExpressLane/SearchResults/GlobalSearchResults/Products/GenericProduct)"/>
			<p>These products are authorized for sale at your Pick 'n Save store. It is possible that items on this list are currently out of season or out of stock.</p>
			<h4>
				<xsl:value-of select="concat($CircularItemCount + $ProductCount, ' ')"/>items found matching: "<xsl:value-of select="ExpressLane/SearchResults/GlobalSearchResults/GenericProductHelper/SearchText"/>"</h4>
			<p><!--Organized first by relevance, then alphabetically by department.<br /> -->Choose from the list of departments on the left to narrow your search results.</p>
			<div id="HowToSearchImage" style="display:block;">
			</div>
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<div class="clear"></div>

		<div>
			<div id="productdescription"></div>
			<xsl:variable name="catid" select="ExpressLane/SearchResults/GlobalSearchResults/CategoryID"/>

			<div class="CategoryDisplayContainer">
				<h3 style="cursor:pointer;">
					<xsl:attribute name="id">TopProducts</xsl:attribute>
					<xsl:attribute name="onclick">javascript:FilterSearchResults('0');</xsl:attribute>
					<xsl:if test="$catid = 0">
						<xsl:attribute name="class">activeCategory</xsl:attribute>
					</xsl:if>Top Matches</h3>
				<br/>
				<br/>
				<xsl:for-each select="ExpressLane/SearchResults/GlobalSearchResults/Categories/GenericCategory">
					<xsl:sort select="CategoryName" data-type="text"/>
					<xsl:call-template name="CategoryDisplay">
						<xsl:with-param name="CategoryID" select="CategoryID"/>
						<xsl:with-param name="SelectedCategoryID" select="$catid"/>
					</xsl:call-template>
				</xsl:for-each>
			</div>

			<xsl:choose>
				<xsl:when test="$catid != 0">
					<xsl:call-template name="CategoryProductDisplay">
						<xsl:with-param name="CategoryID" select="$catid"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CategoryProductDisplayDefault"/>
				</xsl:otherwise>
			</xsl:choose>


			<div id="UpdateProgress2" style="display: none; margin-top: 0px;">
				<div id="ProcessingPanel">
					<img src="../Assets/Common/Images/Wait.gif" alt="Wait"/>Processing...</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="GenericCategory" name="CategoryDisplay">
		<xsl:param name="CategoryID"/>
		<xsl:param name="SelectedCategoryID"/>
		<h3 style="cursor:pointer;">
			<xsl:if test="$SelectedCategoryID = $CategoryID">
				<xsl:attribute name="class">activeCategory</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">Products<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:attribute name="onclick">FilterSearchResults('<xsl:value-of select="CategoryID"/>');</xsl:attribute>
			<xsl:value-of select="concat(CategoryName, ' ')"/>

			<xsl:variable name="CircularItemCount" select="count(//CircularItems/GenericCircularItem[CategoryID = $CategoryID])"/>
			<xsl:variable name="ProductCount" select="count(//ExpressLane/SearchResults/GlobalSearchResults/Products/GenericProduct[DepartmentCategoryID = $CategoryID])"/>

			<span>(<xsl:value-of select="$ProductCount + $CircularItemCount"/>)</span>
		</h3>
	</xsl:template>

	<xsl:template name="CategoryProductDisplayDefault">
		<div>
			<xsl:attribute name="id">Products</xsl:attribute>
			<xsl:attribute name="class">CategoryDisplayResultsContainer</xsl:attribute>

			<xsl:variable name="CircularItems" select="//CircularItems/GenericCircularItem[position() &lt; 5]"/>
			<xsl:variable name="SaleItems" select="//Products/GenericProduct[SaleItemID &gt; 0]"/>
			<xsl:variable name="InventoryItems" select="//Products/GenericProduct[SaleItemID = 0]"/>
			<xsl:call-template name="CircularItems">
				<xsl:with-param name="CircularItems" select="$CircularItems"/>
				<xsl:with-param name="HeaderText" select="'Top Circular Items'"/>
			</xsl:call-template>

			<xsl:call-template name="SaleItems">
				<xsl:with-param name="SaleItems" select="$SaleItems[position() &lt; 4]"/>
				<xsl:with-param name="HeaderText" select="'Top Items on Sale'"/>
			</xsl:call-template>

			<xsl:call-template name="InventoryItems">
				<xsl:with-param name="InventoryItems" select="$InventoryItems[position() &lt; 51]"/>
				<xsl:with-param name="HeaderText" select="'Top Item Matches'"/>
			</xsl:call-template>
		</div>
	</xsl:template>

	<xsl:template match="Category" name="CategoryProductDisplay">
		<xsl:param name="CategoryID"/>

		<xsl:variable name="CategoryItems" select="//Products/GenericProduct[DepartmentCategoryID = $CategoryID]"/>
		<xsl:variable name="SaleItems" select="$CategoryItems[SaleItemID &gt; 0]"/>
		<!--<xsl:variable name="InventoryItems" select="$CategoryItems[SaleItemID = 0]" />-->
		<xsl:variable name="InventoryItems" select="$CategoryItems[SaleItemID = 0]"/>
		<xsl:variable name="CircularItems" select="//CircularItems/GenericCircularItem[DepartmentCategoryID = $CategoryID]"/>

		<div>
			<xsl:attribute name="id">Products<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:attribute name="class">CategoryDisplayResultsContainer</xsl:attribute>

			<xsl:if test="string-length(CategoryName) &gt; 0">
			<h2>
				<value-of select="CategoryName"/>
			</h2>
			</xsl:if>

			<div id="SearchResultsSort">
				<xsl:call-template name="GenericProductSortSelect">
					<xsl:with-param name="GenericBrands" select="ExpressLane/SearchResults/GlobalSearchResults/Brands/GenericBrand"/>
				</xsl:call-template>
			</div>

			<xsl:call-template name="CircularItems">
				<xsl:with-param name="CircularItems" select="//CircularItems/GenericCircularItem[CategoryID = $CategoryID]"/>
			</xsl:call-template>

			<xsl:call-template name="SaleItems">
				<xsl:with-param name="SaleItems" select="$SaleItems"/>
			</xsl:call-template>

			<!--<xsl:call-template name="InventoryItems">
			<xsl:with-param name="InventoryItems" select="$InventoryItems" />
		</xsl:call-template>-->

			<xsl:call-template name="InventoryItemsCategory">
				<xsl:with-param name="InventoryItems" select="$InventoryItems"/>
				<xsl:with-param name="CategoryID" select="$CategoryID"/>
			</xsl:call-template>
		</div>
	</xsl:template>

	<xsl:template name="InventoryItems">
		<xsl:param name="InventoryItems"/>
		<xsl:param name="HeaderText"/>
		<xsl:if test="count($InventoryItems) &gt; 0">
			<h2>
				<xsl:value-of select="$HeaderText"/>
			</h2>
			<xsl:call-template name="GenericProductTableRelevance">
				<xsl:with-param name="GenericProducts" select="$InventoryItems"></xsl:with-param>
				<xsl:with-param name="AutoSort" select="'false'"></xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="InventoryItemsCategory">
		<xsl:param name="InventoryItems"/>
		<xsl:param name="CategoryID"/>

		<xsl:variable name="Category" select="//Categories/GenericCategory[CategoryID = $CategoryID]"/>
		<xsl:if test="count($InventoryItems) &gt; 0">
			<h2>
				<xsl:value-of select="$Category/CategoryName"/>
			</h2>
			<xsl:call-template name="GenericProductTable">
				<xsl:with-param name="GenericProducts" select="$InventoryItems"></xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template match="GenericProduct" name="SaleItems">
		<xsl:param name="SaleItems"/>
		<xsl:param name="HeaderText"/>

		<xsl:variable name="DefaultHeader" select="'Items on Sale'"/>

		<xsl:if test="count($SaleItems) &gt; 0">
			<div id="SaleItems">
				<xsl:attribute name="class">sort</xsl:attribute>
				<h2>
					<xsl:choose>
						<xsl:when test="string-length($HeaderText) &gt; 0">
							<xsl:value-of select="$HeaderText"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$DefaultHeader"/>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
				<xsl:for-each select="$SaleItems[position() &lt; 5]">
					<xsl:call-template name="SaleItem">
						<xsl:with-param name="SaleItem" select="."/>
					</xsl:call-template>
                    <xsl:if test="position() mod 2 = 0"><div class="clear"></div></xsl:if>
				</xsl:for-each>

				<xsl:if test="count($SaleItems) &gt; 4">
					<a href="javascript:togglePanelSaleItems();" id="toggler" style="text-decoration:none; cursor:pointer;">
						<h3 style="clear:both; float:left; width:100%;">Click here for more...</h3>
					</a>

					<div id="PanelSaleItems" class="accordion_content" style="display: none;">
						<xsl:for-each select="$SaleItems[position() &gt; 3]">
							<xsl:call-template name="SaleItem">
								<xsl:with-param name="SaleItem" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="GenericProduct" name="SaleItem">
		<xsl:param name="SaleItem"/>
		<xsl:variable name="ProductID" select="ProductID"/>
		<xsl:variable name="brandclass">
			<xsl:if test="number(BrandID)">
				<xsl:value-of select="concat(' Brand:', BrandID)"/>
			</xsl:if>
			<xsl:if test="not(number(BrandID))">
				<xsl:text> Brand:other</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="priceclass">
			<xsl:if test="number(SalePrice)">
				<xsl:value-of select="concat(' Price:', SalePrice)"/>
			</xsl:if>
			<xsl:if test="not(number(SalePrice))">
				<xsl:value-of select="concat(' Price:', RegularPrice)"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="relevanceclass">
			<xsl:choose>
				<xsl:when test="number(Relevance)">
					<xsl:value-of select="concat(' Relevance:', Relevance)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Relevance:0</xsl:text>
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
		<div>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('SaleItem:', ProductID)"/>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:text>couponsFrame </xsl:text>
				<xsl:value-of select="$priceclass"/>
				<xsl:value-of select="$brandclass"/>
				<xsl:value-of select="$relevanceclass"/>
			</xsl:attribute>


			<div class="couponsDescription">
				<strong>
					<xsl:value-of select="BrandName"/>
				</strong>&#xA0;<xsl:value-of select="Description"/><br/>
				<em>
					<xsl:value-of select="ItemExtendedSize"/>
				</em>
			</div>

			<span class="price">
				     <xsl:if test="string-length(DealType/ImageUrl) &gt; 0">
                    <img>
						<xsl:attribute name="align">right</xsl:attribute>
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
                
                <xsl:choose>
					<xsl:when test="string-length(SalePriceString) > 0">
						<span class="SalePrice">SALE - <xsl:value-of select="SalePriceString"/></span>
						<xsl:if test="string-length(Points) > 0">
							<br/>
							<span class="SalePrice">with <xsl:value-of select="Points"/> points</span>
						</xsl:if>
						<xsl:if test="string-length(RegularPriceString) > 0">
							<br/>
							<span class="RegPrice">REG. - <xsl:value-of select="RegularPriceString"/></span>
						</xsl:if>
						<xsl:if test="string-length($Saving) &gt; 0">
							<br />
							<span class="SavingsAmount"><xsl:value-of select="$Saving" /></span>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RegularPriceString"/>
					</xsl:otherwise>
				</xsl:choose>
                
		
                
                
                </span>
            
            <!-- hide rating and relevance stars
			<xsl:if test="Relevance &gt; 0">
				<div>
					<xsl:attribute name="id">
						<xsl:value-of select="concat('ProductRating', ProductID)"/>
					</xsl:attribute>
					<xsl:attribute name="class">rating_container</xsl:attribute>
				</div>
				<input>
					<xsl:attribute name="type">hidden</xsl:attribute>
					<xsl:attribute name="class">productrelevance</xsl:attribute>
					<xsl:attribute name="title">relevance</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="concat(ProductID, ':', Relevance)"/>
					</xsl:attribute>
				</input>
			</xsl:if>
            
			<a class="button">
				<xsl:attribute name="href">javascript:AddToShoppingList(<xsl:value-of select="ProductID"/> ,3);</xsl:attribute>
				<span>Add</span>
			</a>-->
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
		</div>
	</xsl:template>

	<xsl:template match="GenericCircularItem" name="CircularItems">
		<xsl:param name="CircularItems"/>
		<xsl:param name="HeaderText"/>

		<xsl:variable name="DefaultHeader" select="'Circular Items'"/>

		<xsl:if test="count($CircularItems) &gt; 0">
			<div id="CircularItems">
				<xsl:attribute name="class">circularitems sort</xsl:attribute>
				<h2>
					<xsl:choose>
						<xsl:when test="string-length($HeaderText) &gt; 0">
							<xsl:value-of select="$HeaderText"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$DefaultHeader"/>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
				<xsl:for-each select="$CircularItems[position() &lt; 5]">
					<xsl:call-template name="CircularItem">
						<xsl:with-param name="CircularItem" select="."></xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>

				<xsl:if test="count($CircularItems) &gt; 4">
					<a href="javascript:togglePanelCircularItems();" id="toggler2" style="text-decoration:none; cursor:pointer;">
						<h3 style="clear:both; float:left; width:100%;">Click here for more...</h3>
					</a>

					<div id="PanelCircularItems" class="accordion_content" style="display: none;">

						<xsl:for-each select="$CircularItems[position() &gt; 4]">
							<xsl:call-template name="CircularItem">
								<xsl:with-param name="CircularItem" select="."></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="GenericCircularItem" name="CircularItem">
		<xsl:param name="CircularItem"/>

		<xsl:variable name="brandclass">
			<xsl:if test="number(BrandID)">
				<xsl:value-of select="concat(' Brand:', BrandID)"/>
			</xsl:if>
			<xsl:if test="not(number(BrandID))">
				<xsl:text> Brand:other</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="priceclass">
			<xsl:if test="number(Price)">
				<xsl:value-of select="concat(' Price:', Price)"/>
			</xsl:if>
			<xsl:if test="not(number(Price))">
				<xsl:value-of select="concat(' Price:', '999.99')"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="relevanceclass">
			<xsl:choose>
				<xsl:when test="number(Relevance)">
					<xsl:value-of select="concat(' Relevance:', Relevance)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Relevance:0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('CircularItemID:', CircularItemID)"/>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:text>couponsFrame</xsl:text>
				<xsl:value-of select="$priceclass"/>
				<xsl:value-of select="$brandclass"/>
				<xsl:value-of select="$relevanceclass"/>
			</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('CircularItem', CircularItemID)"/>
			</xsl:attribute>
			<div class="couponsImage">
				<img>
				<xsl:attribute name="alt">
					<xsl:value-of select="UPC"/>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:choose>
						<xsl:when test="string-length(SmallImageUrl) &gt; 0"><xsl:value-of select="SmallImageUrl"/></xsl:when>
						<!-- this is necessary because of case sensitivity and inconsistent column names -->
						<xsl:when test="string-length(SmallImageURL) &gt; 0"><xsl:value-of select="SmallImageURL"/></xsl:when>
	        			<xsl:otherwise>##root##/Assets/Common/Images/no_image.jpg</xsl:otherwise>
	    			</xsl:choose>
				</xsl:attribute>
				</img>
 			</div> 
			<div class="couponsDescription">
				<xsl:value-of select="CircularItemName"/>
			</div>
			<span class="price">
				<!-- Check for dealbuster price -->
				<xsl:if test="//CircularItemDealBusters/GenericCircularItemDealBuster">
					<xsl:choose>
						<xsl:when test="//CircularItemDealBusters/GenericCircularItemDealBuster[CircularItemID = $CircularItem/CircularItemID]/PriceString">
							<b style="color:red;">Deal Buster Price!</b><br/>
							<xsl:value-of select="//CircularItemDealBusters/GenericCircularItemDealBuster[CircularItemID = CircularItemID]/PriceString"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="PriceString"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				
			</span>
			<xsl:if test="Relevance &gt; 0">
				<div>
					<xsl:attribute name="id">
						<xsl:value-of select="concat('ProductRating', CircularItemID)"/>
					</xsl:attribute>
					<xsl:attribute name="class">rating_container</xsl:attribute>
				</div>
				<input>
					<xsl:attribute name="type">hidden</xsl:attribute>
					<xsl:attribute name="class">productrelevance</xsl:attribute>
					<xsl:attribute name="title">relevance</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="concat(CircularItemID, ':', Relevance)"/>
					</xsl:attribute>
				</input>
			</xsl:if>
			<a class="button">
				<xsl:attribute name="href">javascript:AddToShoppingList(<xsl:value-of select="CircularItemID"/>, 8);</xsl:attribute>
				<span>Add</span>
			</a>
			<div style="display:none;">
				<xsl:attribute name="class">
					<xsl:value-of select="concat('ItemData_', CircularItemID, '_8')"/>
				</xsl:attribute>
				<span class="ExportKeyID">
					<xsl:value-of select="ExportKeyID"/>
				</span>
				<xsl:if test="number(BrandExportKeyID)">
					<span class="ExportKeyID">
						<xsl:value-of select="BrandExportKeyID"/>
					</span>
				</xsl:if>
				<xsl:if test="number(DepartmentExportKeyID)">
					<span class="ExportKeyID">
						<xsl:value-of select="DepartmentExportKeyID"/>
					</span>
				</xsl:if>
				<xsl:if test="number(CategoryExportKeyID)">
					<span class="ExportKeyID">
						<xsl:value-of select="CategoryExportKeyID"/>
					</span>
				</xsl:if>
				<xsl:if test="number(AisleExportKeyID)">
					<span class="ExportKeyID">
						<xsl:value-of select="AisleExportKeyID"/>
					</span>
				</xsl:if>
				<xsl:if test="number(ShelfExportKeyID)">
					<span class="ExportKeyID">
						<xsl:value-of select="ShelfExportKeyID"/>
					</span>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
<xsl:template match="NewTemplate">
</xsl:template>
</xsl:stylesheet>