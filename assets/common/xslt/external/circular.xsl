<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:choose>
			<!-- ExternalAvailableVarieties -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 235">
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericProduct"/>
			</xsl:when>
			<!-- ExternalCircularItem -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 236">
				<xsl:for-each select="ExpressLane/StoreCircularItem">
					<xsl:call-template name="StoreCircularItemWithVarieties" />
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularCategories -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 237">
				<xsl:apply-templates select="ExpressLane/ArrayOfCategory"/>
			</xsl:when>
			<!-- ExternalCircular -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 238">
				<xsl:for-each select="ExpressLane/StoreCircular">
					<xsl:call-template name="StoreCircular"/>
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularWithVarieties -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 239">
				<xsl:for-each select="ExpressLane/StoreCircular">
					<xsl:call-template name="StoreCircularWithVarieties" />
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularSummary -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 240">
				<xsl:apply-templates select="ExpressLane/StoreCircularSummary" />
			</xsl:when>
			<!-- ExternalCircularPage -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 241">
				<xsl:for-each select="ExpressLane/StoreCircularPage">
					<xsl:call-template name="StoreCircularPage"/>
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularPageWithVarieties -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 242">
				<xsl:for-each select="ExpressLane/StoreCircularPage">
					<xsl:call-template name="StoreCircularPageWithVarieties"/>
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularItems -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 243">
				<xsl:for-each select="ExpressLane/ArrayOfStoreCircularItem">
					<xsl:call-template name="StoreCircularItems" />
				</xsl:for-each>
			</xsl:when>
			<!-- ExternalCircularItemsWithVarieties -->
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 244">
				<xsl:for-each select="ExpressLane/ArrayOfStoreCircularItem">
					<xsl:call-template name="StoreCircularItemsWithVarieties" />
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="StoreCircularItem" name="StoreCircularItem">
		<StoreCircularItem xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="CircularItemID"/>
			<xsl:copy-of select="CircularPageID"/>
			<xsl:copy-of select="SaleItemHeaderID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="Name"/>
			<xsl:copy-of select="Description"/>
			<xsl:copy-of select="ImageUrl"/>
			<xsl:copy-of select="Price"/>
			<xsl:copy-of select="AreaCoordinates"/>
			<xsl:copy-of select="ScaleFactor"/>
			<xsl:copy-of select="Shape"/>
			<xsl:copy-of select="PriceString"/>
			<xsl:copy-of select="BrandID"/>
			<xsl:copy-of select="BrandName"/>
			<xsl:copy-of select="CategoryID"/>
			<xsl:copy-of select="Quantity"/>
			<xsl:copy-of select="MaxQuantity"/>
			<xsl:copy-of select="SmallImageUrl"/>
			<xsl:copy-of select="ManufacturerCouponID"/>
			<xsl:copy-of select="ManufacturerCouponSavings"/>
			<xsl:copy-of select="LinkedItemCount"/>
			<xsl:copy-of select="ShelfID"/>
			<xsl:copy-of select="ExportKeyID"/>
			<xsl:copy-of select="BrandExportKeyID"/>
			<xsl:copy-of select="DepartmentExportKeyID"/>
			<xsl:copy-of select="AisleExportKeyID"/>
			<xsl:copy-of select="CategoryExportKeyID"/>
			<xsl:copy-of select="ShelfExportKeyID"/>
		</StoreCircularItem>
	</xsl:template>
	<xsl:template match="StoreCircularItem" name="StoreCircularItemWithVarieties">
		<StoreCircularItem xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="CircularItemID"/>
			<xsl:copy-of select="CircularPageID"/>
			<xsl:copy-of select="SaleItemHeaderID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="Name"/>
			<xsl:copy-of select="Description"/>
			<xsl:copy-of select="ImageUrl"/>
			<xsl:copy-of select="Price"/>
			<xsl:copy-of select="AreaCoordinates"/>
			<xsl:copy-of select="ScaleFactor"/>
			<xsl:copy-of select="Shape"/>
			<xsl:copy-of select="PriceString"/>
			<xsl:copy-of select="BrandID"/>
			<xsl:copy-of select="BrandName"/>
			<xsl:copy-of select="CategoryID"/>
			<xsl:copy-of select="Quantity"/>
			<xsl:copy-of select="MaxQuantity"/>
			<xsl:copy-of select="SmallImageUrl"/>
			<xsl:copy-of select="ManufacturerCouponID"/>
			<xsl:copy-of select="ManufacturerCouponSavings"/>
			<xsl:copy-of select="LinkedItemCount"/>
			<xsl:copy-of select="ShelfID"/>
			<xsl:copy-of select="ExportKeyID"/>
			<xsl:copy-of select="BrandExportKeyID"/>
			<xsl:copy-of select="DepartmentExportKeyID"/>
			<xsl:copy-of select="AisleExportKeyID"/>
			<xsl:copy-of select="CategoryExportKeyID"/>
			<xsl:copy-of select="ShelfExportKeyID"/>
			<xsl:copy-of select="AvailableVarieties"/>
		</StoreCircularItem>
	</xsl:template>
	<xsl:template match="StoreCircularPage" name="StoreCircularPage">
		<StoreCircularPage xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="CircularPageID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="SaleItemHeaderID"/>
			<xsl:copy-of select="CircularTypeID"/>
			<xsl:copy-of select="ImageUrl"/>
			<xsl:copy-of select="SmallImageUrl"/>
			<xsl:copy-of select="StartDate"/>
			<xsl:copy-of select="EndDate"/>
			<xsl:copy-of select="PageNumber"/>
			<xsl:copy-of select="ClientID"/>
			<xsl:copy-of select="ImageWidth"/>
			<Items>
				<xsl:for-each select="Items/StoreCircularItem">
					<xsl:call-template name="StoreCircularItem"/>
				</xsl:for-each>
			</Items>
		</StoreCircularPage>
	</xsl:template>
	<xsl:template match="StoreCircularPage" name="StoreCircularPageWithVarieties">
		<StoreCircularPage xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="CircularPageID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="SaleItemHeaderID"/>
			<xsl:copy-of select="CircularTypeID"/>
			<xsl:copy-of select="ImageUrl"/>
			<xsl:copy-of select="SmallImageUrl"/>
			<xsl:copy-of select="StartDate"/>
			<xsl:copy-of select="EndDate"/>
			<xsl:copy-of select="PageNumber"/>
			<xsl:copy-of select="ClientID"/>
			<xsl:copy-of select="ImageWidth"/>
			<Items>
				<xsl:for-each select="Items/StoreCircularItem">
					<xsl:call-template name="StoreCircularItemWithVarieties"/>
				</xsl:for-each>
			</Items>
		</StoreCircularPage>
	</xsl:template>
	<xsl:template match="ArrayOfGenericProduct" name="AvailableVarieties">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="ArrayOfCategory" name="Categories">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="StoreCircular" name="StoreCircular">
		<StoreCircular xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="ChainID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="BrandList"/>
			<xsl:copy-of select="Categories"/>
			<CircularTypes>
				<xsl:for-each select="CircularTypes/StoreCircularType[CircularTypeID = //StoreCircularPage/CircularTypeID]">
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</CircularTypes>
			<Pages>
				<xsl:for-each select="Pages/StoreCircularPage">
					<xsl:call-template name="StoreCircularPage"/>
				</xsl:for-each>
			</Pages>
		</StoreCircular>
	</xsl:template>
	<xsl:template match="StoreCircular" name="StoreCircularWithVarieties">
		<StoreCircular xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="ChainID"/>
			<xsl:copy-of select="StoreID"/>
			<xsl:copy-of select="BrandList"/>
			<xsl:copy-of select="Categories"/>
			<CircularTypes>
				<xsl:for-each select="CircularTypes/StoreCircularType[CircularTypeID = //StoreCircularPage/CircularTypeID]">
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</CircularTypes>
			<Pages>
				<xsl:for-each select="Pages/StoreCircularPage">
					<xsl:call-template name="StoreCircularPageWithVarieties"/>
				</xsl:for-each>
			</Pages>
		</StoreCircular>
	</xsl:template>
	<xsl:template match="StoreCircularSummary" name="StoreCircularSummary">
		<xsl:copy-of select="." />
	</xsl:template>
	<xsl:template match="ArrayOfStoreCircularItem" name="StoreCircularItems">
		<ArrayOfStoreCircularItem xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="StoreCircularItem">
				<xsl:call-template name="StoreCircularItem" />
			</xsl:for-each>
		</ArrayOfStoreCircularItem>
	</xsl:template>
	<xsl:template match="ArrayOfStoreCircularItem" name="StoreCircularItemsWithVarieties">
		<ArrayOfStoreCircularItem xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="StoreCircularItem">
				<xsl:call-template name="StoreCircularItemWithVarieties" />
			</xsl:for-each>
		</ArrayOfStoreCircularItem>
	</xsl:template>
</xsl:stylesheet>