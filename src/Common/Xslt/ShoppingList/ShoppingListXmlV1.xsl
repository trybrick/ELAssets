<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:apply-templates select="ExpressLane/GenericShoppingList"/>
	</xsl:template>
	<xsl:template name="GenericShoppingList" match="GenericShoppingList">
		<GenericShoppingList xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:choose>
				<xsl:when test="number(StoreID)">
					<StoreID>
						<xsl:value-of select="StoreID"/>
					</StoreID>
				</xsl:when>
				<xsl:otherwise>
					<StoreID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ChainID)">
					<ChainID>
						<xsl:value-of select="ChainID"/>
					</ChainID>
				</xsl:when>
				<xsl:otherwise>
					<ChainID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(SaleItemHeaderID)">
					<SaleItemHeaderID>
						<xsl:value-of select="SaleItemHeaderID"/>
					</SaleItemHeaderID>
				</xsl:when>
				<xsl:otherwise>
					<SaleItemHeaderID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(VisibleItems/GenericShoppingListItem) &gt; 0">
					<Items>
						<xsl:for-each select="VisibleItems/GenericShoppingListItem">
							<xsl:call-template name="GenericShoppingListItem"/>
						</xsl:for-each>
					</Items>
				</xsl:when>
				<xsl:otherwise>
					<Items/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(Categories/Category) &gt; 0">
					<Categories>
						<xsl:for-each select="Categories/Category">
							<xsl:call-template name="Category"/>
						</xsl:for-each>
					</Categories>
				</xsl:when>
				<xsl:otherwise>
					<Categories/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(PlanogramPositions/PlanogramPosition) &gt; 0">
					<PlanogramPositions>
						<xsl:for-each select="PlanogramPositions/PlanogramPosition">
							<xsl:call-template name="PlanogramPosition"/>
						</xsl:for-each>
					</PlanogramPositions>
				</xsl:when>
				<xsl:otherwise>
					<PlanogramPositions/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="//ArrayOfCoupon">
				<xsl:call-template name="ManufacturerCoupons"/>
			</xsl:for-each>
			<xsl:for-each select="//StoreFeaturedProducts">
				<xsl:call-template name="StoreCoupons" />
			</xsl:for-each>
			<xsl:choose>
				<xsl:when test="number(SubTotal)">
					<SubTotal>
						<xsl:value-of select="SubTotal"/>
					</SubTotal>
				</xsl:when>
				<xsl:otherwise>
					<SubTotal/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(Total)">
					<Total>
						<xsl:value-of select="Total"/>
					</Total>
				</xsl:when>
				<xsl:otherwise>
					<Total/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="ShoppingList"/>
		</GenericShoppingList>
	</xsl:template>
	<xsl:template name="Category" match="Category">
		<Category>
			<xsl:choose>
				<xsl:when test="number(CategoryID)">
					<CategoryID>
						<xsl:value-of select="CategoryID"/>
					</CategoryID>
				</xsl:when>
				<xsl:otherwise>
					<CategoryID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(CategoryName) &gt; 0">
					<CategoryName>
						<xsl:value-of select="CategoryName"/>
					</CategoryName>
				</xsl:when>
				<xsl:otherwise>
					<CategoryName/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(LargeImageUrl) &gt; 0">
					<LargeImageUrl>
						<xsl:value-of select="LargeImageUrl"/>
					</LargeImageUrl>
				</xsl:when>
				<xsl:otherwise>
					<LargeImageUrl/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(LegacyID)">
					<LegacyID>
						<xsl:value-of select="LegacyID"/>
					</LegacyID>
				</xsl:when>
				<xsl:otherwise>
					<LegacyID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(LegacyParentID)">
					<LegacyParentID>
						<xsl:value-of select="LegacyParentID"/>
					</LegacyParentID>
				</xsl:when>
				<xsl:otherwise>
					<LegacyParentID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(LegacyTypeID)">
					<LegacyTypeID>
						<xsl:value-of select="LegacyTypeID"/>
					</LegacyTypeID>
				</xsl:when>
				<xsl:otherwise>
					<LegacyTypeID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ParentCategoryID)">
					<ParentCategoryID>
						<xsl:value-of select="ParentCategoryID"/>
					</ParentCategoryID>
				</xsl:when>
				<xsl:otherwise>
					<ParentCategoryID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(SmallImageUrl) &gt; 0">
					<SmallImageUrl>
						<xsl:value-of select="SmallImageUrl"/>
					</SmallImageUrl>
				</xsl:when>
				<xsl:otherwise>
					<SmallImageUrl/>
				</xsl:otherwise>
			</xsl:choose>
		</Category>
	</xsl:template>
	<xsl:template name="GenericShoppingListItem" match="GenericShoppingListItem">
		<GenericShoppingListItem>
			<xsl:choose>
				<xsl:when test="number(ShoppingListItemID)">
					<ShoppingListItemID>
						<xsl:value-of select="ShoppingListItemID"/>
					</ShoppingListItemID>
				</xsl:when>
				<xsl:otherwise>
					<ShoppingListItemID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ItemID)">
					<ItemID>
						<xsl:value-of select="ItemID"/>
					</ItemID>
				</xsl:when>
				<xsl:otherwise>
					<ItemID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(Description) &gt; 0">
					<Description>
						<xsl:value-of select="Description"/>
					</Description>
				</xsl:when>
				<xsl:otherwise>
					<Description/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(Quantity)">
					<Quantity>
						<xsl:value-of select="Quantity"/>
					</Quantity>
				</xsl:when>
				<xsl:otherwise>
					<Quantity/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(Weight)">
					<Weight>
						<xsl:value-of select="Weight"/>
					</Weight>
				</xsl:when>
				<xsl:otherwise>
					<Weight/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(UnitOfMeasureID)">
					<UnitOfMeasureID>
						<xsl:value-of select="UnitOfMeasureID"/>
					</UnitOfMeasureID>
				</xsl:when>
				<xsl:otherwise>
					<UnitOfMeasureID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(CategoryID)">
					<CategoryID>
						<xsl:value-of select="CategoryID"/>
					</CategoryID>
				</xsl:when>
				<xsl:otherwise>
					<CategoryID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(PlanogramPositionID)">
					<PlanogramPositionID>
						<xsl:value-of select="PlanogramPositionID"/>
					</PlanogramPositionID>
				</xsl:when>
				<xsl:otherwise>
					<PlanogramPositionID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(Position)">
					<Position>
						<xsl:value-of select="Position"/>
					</Position>
				</xsl:when>
				<xsl:otherwise>
					<Position/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ItemTypeID)">
					<ItemTypeID>
						<xsl:value-of select="ItemTypeID"/>
					</ItemTypeID>
				</xsl:when>
				<xsl:otherwise>
					<ItemTypeID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(Price)">
					<Price>
						<xsl:value-of select="Price"/>
					</Price>
				</xsl:when>
				<xsl:otherwise>
					<Price/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(PriceMultiple)">
					<PriceMultiple>
						<xsl:value-of select="PriceMultiple"/>
					</PriceMultiple>
				</xsl:when>
				<xsl:otherwise>
					<PriceMultiple/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(PriceUnit) &gt; 0">
					<PriceUnit>
						<xsl:value-of select="PriceUnit"/>
					</PriceUnit>
				</xsl:when>
				<xsl:otherwise>
					<PriceUnit/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(Savings) &gt; 0">
					<Savings>
						<xsl:value-of select="Savings"/>
					</Savings>
				</xsl:when>
				<xsl:otherwise>
					<Savings/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(PriceStartDate) &gt; 0">
					<PriceStartDate>
						<xsl:value-of select="PriceStartDate"/>
					</PriceStartDate>
				</xsl:when>
				<xsl:otherwise>
					<PriceStartDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(PriceEndDate) &gt; 0">
					<PriceEndDate>
						<xsl:value-of select="PriceEndDate"/>
					</PriceEndDate>
				</xsl:when>
				<xsl:otherwise>
					<PriceEndDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ManufacturerCouponID)">
					<ManufacturerCouponID>
						<xsl:value-of select="ManufacturerCouponID"/>
					</ManufacturerCouponID>
				</xsl:when>
				<xsl:otherwise>
					<ManufacturerCouponID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ProductID)">
					<ProductID>
						<xsl:value-of select="ProductID"/>
					</ProductID>
				</xsl:when>
				<xsl:otherwise>
					<ProductID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ImageUrl) &gt; 0">
					<ImageUrl>
						<xsl:value-of select="ImageUrl"/>
					</ImageUrl>
				</xsl:when>
				<xsl:otherwise>
					<ImageUrl/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(SmallImageUrl) &gt; 0">
					<SmallImageUrl>
						<xsl:value-of select="SmallImageUrl"/>
					</SmallImageUrl>
				</xsl:when>
				<xsl:otherwise>
					<SmallImageUrl/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(UPC11) &gt; 0">
					<UPC11>
						<xsl:value-of select="UPC11"/>
					</UPC11>
				</xsl:when>
				<xsl:otherwise>
					<UPC11/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="IsVisible">
					<IsVisible>
						<xsl:value-of select="IsVisible"/>
					</IsVisible>
				</xsl:when>
				<xsl:otherwise>
					<IsVisible/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(CreateDate) &gt; 0">
					<CreateDate>
						<xsl:value-of select="CreateDate"/>
					</CreateDate>
				</xsl:when>
				<xsl:otherwise>
					<CreateDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ModifyDate) &gt; 0">
					<ModifyDate>
						<xsl:value-of select="ModifyDate"/>
					</ModifyDate>
				</xsl:when>
				<xsl:otherwise>
					<ModifyDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(CircularItemID)">
					<CircularItemID>
						<xsl:value-of select="CircularItemID"/>
					</CircularItemID>
				</xsl:when>
				<xsl:otherwise>
					<CircularItemID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(SoldByWeight) &gt; 0">
					<SoldByWeight>
						<xsl:value-of select="SoldByWeight"/>
					</SoldByWeight>
				</xsl:when>
				<xsl:otherwise>
					<SoldByWeight/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(MinimumBuyWeight)">
					<MinimumBuyWeight>
						<xsl:value-of select="MinimumBuyWeight"/>
					</MinimumBuyWeight>
				</xsl:when>
				<xsl:otherwise>
					<MinimumBuyWeight/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(MaximumBuyWeight)">
					<MaximumBuyWeight>
						<xsl:value-of select="MaximumBuyWeight"/>
					</MaximumBuyWeight>
				</xsl:when>
				<xsl:otherwise>
					<MaximumBuyWeight/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(MinimumBuyAmount)">
					<MinimumBuyAmount>
						<xsl:value-of select="MinimumBuyAmount"/>
					</MinimumBuyAmount>
				</xsl:when>
				<xsl:otherwise>
					<MinimumBuyAmount/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(MaximumBuyAmount)">
					<MaximumBuyAmount>
						<xsl:value-of select="MaximumBuyAmount"/>
					</MaximumBuyAmount>
				</xsl:when>
				<xsl:otherwise>
					<MaximumBuyAmount/>
				</xsl:otherwise>
			</xsl:choose>
		</GenericShoppingListItem>
	</xsl:template>
	<xsl:template name="PlanogramPosition" match="PlanogramPosition">
		<PlanogramPosition>
			<xsl:choose>
				<xsl:when test="number(ChainID)">
					<ChainID>
						<xsl:value-of select="ChainID"/>
					</ChainID>
				</xsl:when>
				<xsl:otherwise>
					<ChainID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(CreateDate) &gt; 0">
					<CreateDate>
						<xsl:value-of select="CreateDate"/>
					</CreateDate>
				</xsl:when>
				<xsl:otherwise>
					<CreateDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(IsDefaultPosition) &gt; 0">
					<IsDefaultPosition>
						<xsl:value-of select="IsDefaultPosition"/>
					</IsDefaultPosition>
				</xsl:when>
				<xsl:otherwise>
					<IsDefaultPosition/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ModifyDate) &gt; 0">
					<ModifyDate>
						<xsl:value-of select="ModifyDate"/>
					</ModifyDate>
				</xsl:when>
				<xsl:otherwise>
					<ModifyDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ParentPlanogramPositionID)">
					<ParentPlanogramPositionID>
						<xsl:value-of select="ParentPlanogramPositionID"/>
					</ParentPlanogramPositionID>
				</xsl:when>
				<xsl:otherwise>
					<ParentPlanogramPositionID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(PlanogramPositionID)">
					<PlanogramPositionID>
						<xsl:value-of select="PlanogramPositionID"/>
					</PlanogramPositionID>
				</xsl:when>
				<xsl:otherwise>
					<PlanogramPositionID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(PlanogramPositionName) &gt; 0">
					<PlanogramPositionName>
						<xsl:value-of select="PlanogramPositionName"/>
					</PlanogramPositionName>
				</xsl:when>
				<xsl:otherwise>
					<PlanogramPositionName/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(SortOrder)">
					<SortOrder>
						<xsl:value-of select="SortOrder"/>
					</SortOrder>
				</xsl:when>
				<xsl:otherwise>
					<SortOrder/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(StoreID)">
					<StoreID>
						<xsl:value-of select="StoreID"/>
					</StoreID>
				</xsl:when>
				<xsl:otherwise>
					<StoreID/>
				</xsl:otherwise>
			</xsl:choose>
		</PlanogramPosition>
	</xsl:template>
	<xsl:template name="ShoppingList" match="ShoppingList">
		<ShoppingList>
			<xsl:choose>
				<xsl:when test="number(ConsumerID)">
					<ConsumerID>
						<xsl:value-of select="ConsumerID"/>
					</ConsumerID>
				</xsl:when>
				<xsl:otherwise>
					<ConsumerID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(CreatedOn) &gt; 0">
					<CreatedOn>
						<xsl:value-of select="CreatedOn"/>
					</CreatedOn>
				</xsl:when>
				<xsl:otherwise>
					<CreatedOn/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(PrintedOn) &gt; 0">
					<PrintedOn>
						<xsl:value-of select="PrintedOn"/>
					</PrintedOn>
				</xsl:when>
				<xsl:otherwise>
					<PrintedOn/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ShoppingListID)">
					<ShoppingListID>
						<xsl:value-of select="ShoppingListID"/>
					</ShoppingListID>
				</xsl:when>
				<xsl:otherwise>
					<ShoppingListID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ShoppingListStatusID)">
					<ShoppingListStatusID>
						<xsl:value-of select="ShoppingListStatusID"/>
					</ShoppingListStatusID>
				</xsl:when>
				<xsl:otherwise>
					<ShoppingListStatusID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(ShoppingListTypeID)">
					<ShoppingListTypeID>
						<xsl:value-of select="ShoppingListTypeID"/>
					</ShoppingListTypeID>
				</xsl:when>
				<xsl:otherwise>
					<ShoppingListTypeID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="number(StoreID)">
					<StoreID>
						<xsl:value-of select="StoreID"/>
					</StoreID>
				</xsl:when>
				<xsl:otherwise>
					<StoreID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(Title) &gt; 0">
					<Title>
						<xsl:value-of select="Title"/>
					</Title>
				</xsl:when>
				<xsl:otherwise>
					<Title/>
				</xsl:otherwise>
			</xsl:choose>
		</ShoppingList>
	</xsl:template>
	<xsl:template name="ManufacturerCoupons" match="ArrayOfCoupon">
		<xsl:choose>
			<xsl:when test="Coupon[CouponID = //GenericShoppingListItem[ItemTypeID = 2]/ItemID]">
				<ManufacturerCoupons xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
					<xsl:for-each select="Coupon[CouponID = //GenericShoppingListItem[ItemTypeID = 2]/ItemID]">
						<xsl:call-template name="Coupon"/>
					</xsl:for-each>
				</ManufacturerCoupons>
			</xsl:when>
			<xsl:otherwise>
				<ManufacturerCoupons/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Coupon" name="Coupon">
		<Coupon xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="ImageURL"/>
			<xsl:copy-of select="CouponID"/>
			<xsl:copy-of select="SourceID"/>
			<xsl:copy-of select="CouponCode"/>
			<xsl:copy-of select="CategoryID"/>
			<xsl:copy-of select="Quantity"/>
			<xsl:copy-of select="SavingsAmount"/>
			<xsl:copy-of select="Description"/>
			<xsl:copy-of select="CouponType"/>
			<xsl:copy-of select="IconURL"/>
			<xsl:copy-of select="StartDate"/>
			<xsl:copy-of select="EndDate"/>
		</Coupon>
	</xsl:template>
	<xsl:template name="StoreCoupons" match="StoreFeaturedProducts">
		<xsl:choose>
			<xsl:when test="FeaturedProducts/FeaturedProduct[FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
				<StoreCoupons xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
					<xsl:for-each select="FeaturedProducts/FeaturedProduct[FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
						<xsl:call-template name="StoreCoupon" />
					</xsl:for-each>
				</StoreCoupons>
			</xsl:when>
			<xsl:otherwise>
				<StoreCoupons/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="StoreCoupon" match="FeaturedProduct">
		<StoreCoupon xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<CouponID><xsl:value-of select="FeaturedProductID" /></CouponID>
			<xsl:copy-of select="BrandName" />
			<xsl:copy-of select="ProductVariety" />
			<xsl:copy-of select="PrimarySavingDescription" />
			<xsl:copy-of select="SecondarySavingDescription" />
			<xsl:copy-of select="CategoryID" />
			<xsl:copy-of select="ImageURL" />
			<xsl:copy-of select="StartDate" />
			<xsl:copy-of select="EndDate" />
			<xsl:copy-of select="Quantity" />
			<xsl:copy-of select="TopTagLine" />
			<xsl:copy-of select="BottomTagLine" />
			<xsl:copy-of select="PLU" />
			<xsl:copy-of select="BarCodeImageURL" />
			<xsl:copy-of select="Points" />
		</StoreCoupon>
	</xsl:template>
</xsl:stylesheet>