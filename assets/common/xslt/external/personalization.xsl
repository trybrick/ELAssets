<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 230">
				<!-- Personalized Specials -->
				<xsl:apply-templates select="ExpressLane/PersonalizedSpecials" />
			</xsl:when>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 231">
				<!-- Circular Items -->
				<xsl:apply-templates select="ExpressLane/ArrayOfStoreCircularItem" />
			</xsl:when>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 232">
				<!-- Categories -->
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericCategory" />
			</xsl:when>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 233">
				<!-- Line Items -->
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericProduct" />
			</xsl:when>
			<xsl:when test="ExpressLane/StaticPageType/StaticPageTypeID = 234">
				<!-- Shopper History -->
				<xsl:apply-templates select="ExpressLane/ShopperHistory" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="PersonalizedSpecials">
		<xsl:copy-of select="." />
	</xsl:template>
	<xsl:template match="ArrayOfStoreCircularItem">
		<xsl:copy-of select="." />
	</xsl:template>
	<xsl:template match="ArrayOfGenericCategory">
		<xsl:copy-of select="." />
	</xsl:template>
	<xsl:template match="ArrayOfGenericProduct">
		<xsl:copy-of select="." />
	</xsl:template>
	<xsl:template match="ShopperHistory">
		<xsl:copy-of select="." />
	</xsl:template>
</xsl:stylesheet>