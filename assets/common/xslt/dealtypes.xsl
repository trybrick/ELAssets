<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/GenericProduct/GenericProductDisplayV2.xsl"/>
	<xsl:key name="CatID" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon" use="CategoryID"/>
	
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/DealTypeGenericProducts">
				<xsl:choose>
					<xsl:when test="ExpressLane/DealTypeGenericProducts/GenericProduct">
						<xsl:call-template name="GenericProductTable">
							<xsl:with-param name="GenericProducts" select="ExpressLane/DealTypeGenericProducts/GenericProduct"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<div style="text-align: center; color: #E22232;">
							<b>There is no Product with this Deal Type</b>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="MainPage"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="MainPage">
		<style type="text/css">
			.ProductDisplay {
				width: 100%;
			}   
		</style>
		<script type="text/javascript" src="/Assets/Common/Js/DealType.js"/>
		<div class="DealTypePageGrid">
			<div class="clear">
			</div>
			<!-- lets build the listing on the left -->
			<div class="CategoryDisplayContainer">
				<div class="couponsIntroCopy">
					Click below to Display Selected Deal Type Products.
				</div>
				<!-- List of DealTypes -->
				<xsl:for-each select="ExpressLane/ArrayOfStoreDealType/StoreDealType">
					<xsl:sort select="StoreDealType"/>
					<xsl:call-template name="DealTypeCategoryList"/>
				</xsl:for-each>
			</div>
			<!-- then the grid of coupons itself -->
			<div id="gridLayout">
				<div id="DealTypeProducts"/>
				<div style="display: none; margin-top:0px; position: absolute; width:80%;" id="UpdateProgress1">
					<div id="ProcessingPanel" style="width: 0"><img alt="Wait" src="/Assets/Common/Images/Wait.gif"/>Processing...
					</div>
				</div>
				<div id="productdescription"></div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="DealTypeCategoryList" match="ExpressLane/ArrayOfStoreDealType/StoreDealType">
		<h3>
			<a>
				<xsl:attribute name="id">DealType_<xsl:value-of select="DealTypeListID"/></xsl:attribute>
				<xsl:attribute name="href">#</xsl:attribute>
				<xsl:attribute name="onclick">
					<xsl:value-of select="concat('SetSelectedCategory(this, ', DealTypeListID, ', 0);' )" />
				</xsl:attribute>
				<xsl:value-of select="Description"/>
			</a>
		</h3>
		
		<xsl:for-each select="GenericCategories/GenericCategory">
			<a>
				<xsl:attribute name="id">DealTypeCategory_<xsl:value-of select="CategoryID" /></xsl:attribute>
				<xsl:attribute name="href">#</xsl:attribute>
				<xsl:attribute name="onclick">
					<xsl:value-of select="concat('SetSelectedCategory(this,',../../DealTypeListID,',',CategoryID,');')" />
				</xsl:attribute>
				<xsl:value-of select="CategoryName"/>
			</a>
			<br/>
		</xsl:for-each>
		
		
		
	</xsl:template>
</xsl:stylesheet>
