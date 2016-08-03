<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="GenericProductDisplayFavoritesNoPrice.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/" name="SpecialsPageProducts">
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
		<script type="text/javascript" src="/Assets/Common/Js/GenericProduct/ProductSearchPage.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Inventory/InventoryPage.js" />
		<xsl:if test="ExpressLane/Specials/ArrayOfGenericProduct/GenericProduct">
			<div class="CategoryHeader">
				<h3>
					<xsl:choose>
						<xsl:when test="ExpressLane/Specials/Category">
							<xsl:value-of select="ExpressLane/Specials/Category/CategoryName" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ExpressLane/Specials/Settings/TopNText" />
						</xsl:otherwise>
					</xsl:choose>
				</h3>
			</div>
			<div>
				<xsl:if test="ExpressLane/Specials/Category/CategoryID">
					<xsl:if test="//Settings/DisplayMostPopular = 'True'">
						<a class="button">
							<xsl:attribute name="href">javascript:DisplayMostPopular();</xsl:attribute>
							<span>
								Display<xsl:value-of select="concat(' ', //Settings/TopNText)" />
							</span>
						</a>
					</xsl:if>
				</xsl:if>

				<xsl:call-template name="GenericProductTableAndBrands">
					<xsl:with-param name="GenericProducts" select="ExpressLane/Specials/ArrayOfGenericProduct/GenericProduct"></xsl:with-param>
					<xsl:with-param name="GenericBrands" select="ExpressLane/Specials/ArrayOfGenericBrand/GenericBrand"></xsl:with-param>
				</xsl:call-template>
			</div>
		</xsl:if>
		<div id="productdescription"></div>
	</xsl:template>
</xsl:stylesheet>