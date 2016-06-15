<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:if test="//ArrayOfCoupon">
			<ArrayOfCoupon xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
				<xsl:for-each select="//ArrayOfCoupon/Coupon">
					<xsl:sort select="CategoryID" data-type="number" />
					<xsl:call-template name="Coupon" />
				</xsl:for-each>
			</ArrayOfCoupon>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Coupon" match="Coupon">
		<Coupon xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<xsl:attribute name="type">
				<xsl:choose>
					<xsl:when test="CouponType = 1">ManufacturerCoupon</xsl:when>
					<xsl:otherwise>StoreCoupon</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:copy-of select="ImageURL" />
			<xsl:copy-of select="CouponID" />
			<xsl:if test="number(StoreID) &gt; 0">
				<xsl:copy-of select="StoreID" />
			</xsl:if>
			<xsl:copy-of select="CouponCode" />
			<xsl:copy-of select="CategoryID" />
			<xsl:copy-of select="Quantity" />
			<xsl:copy-of select="SavingsAmount" />
			<xsl:copy-of select="Description" />
			<xsl:copy-of select="CouponType" />
			<xsl:copy-of select="IconURL" />
			<xsl:copy-of select="BrandName" />
			<xsl:copy-of select="ProductVariety" />
			<xsl:copy-of select="PrimarySavingDescription" />
			<xsl:copy-of select="SecondarySavingDescription" />
			<xsl:copy-of select="TopTagLine" />
			<xsl:copy-of select="BottomTagLine" />
			<xsl:copy-of select="PLU" />
			<xsl:copy-of select="StartDate" />
			<xsl:copy-of select="EndDate" />
		</Coupon>
	</xsl:template>
</xsl:stylesheet>