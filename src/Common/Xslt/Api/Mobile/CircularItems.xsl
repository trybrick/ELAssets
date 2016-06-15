<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<CircularItems>
			<xsl:for-each select="//ArrayOfStoreCircularItem/StoreCircularItem">
				<CircularItem>
					<CircularItemID><xsl:value-of select="CircularItemID" /></CircularItemID>
					<CircularPageID><xsl:value-of select="CircularPageID" /></CircularPageID>
					<Name><xsl:value-of select="Name" /></Name>
					<Description><xsl:value-of select="Description" /></Description>
					<ImageUrl><xsl:value-of select="ImageUrl" /></ImageUrl>
					<SmallImageUrl><xsl:value-of select="SmallImageUrl" /></SmallImageUrl>
					<Price><xsl:value-of select="Price" /></Price>
					<PriceString><xsl:value-of select="PriceString" /></PriceString>
					<BrandID><xsl:value-of select="BrandID" /></BrandID>
					<BrandName><xsl:value-of select="BrandName" /></BrandName>
					<CategoryID><xsl:value-of select="CategoryID" /></CategoryID>
					<MaxQuantity><xsl:value-of select="MaxQuantity" /></MaxQuantity>
					<RecipeSearch><xsl:value-of select="RecipeSearch" /></RecipeSearch>
					<ManufacturerCouponID><xsl:value-of select="ManufacturerCouponID" /></ManufacturerCouponID>
					<ManufacturerCouponSavings><xsl:value-of select="ManufacturerCouponSavings" /></ManufacturerCouponSavings>
				</CircularItem>
			</xsl:for-each>
		</CircularItems>
	</xsl:template>
</xsl:stylesheet>