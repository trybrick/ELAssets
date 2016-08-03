<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="ManageListTableFavoritesNoPrice.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/ConsumerFavorites/ConsumerFavoritesService.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingListPage.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AdInternal.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/Ad.js"></script>
		<script type="text/javascript">function LoadInternalAd(){
				var staticpagetypeid = <xsl:value-of select="//StaticPageType/StaticPageTypeID"/>;
				LoadAdInternal(staticpagetypeid);
			}
			LoadInternalAd();</script>
			<xsl:variable name="IsOGS">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
		<div id="ManageList">
			<div id="ShoppingListHeaderLarge">
				<xsl:if test="$IsOGS = 'true'">
					<xsl:attribute name="class">ShopListHeaderOGS</xsl:attribute>
				</xsl:if>
			</div>
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number"/>
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<div id="ShoppingListItemsDisplay">
				<xsl:choose>
					<xsl:when test="//GenericShoppingList">
						<xsl:for-each select="//GenericShoppingList">
							<xsl:call-template name="ManageList"/>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="NoItems"/>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div id="ShoppingListFooterLarge"/>
		</div>
		<div id="productdescription"/>
		<div id="adInternal" />
	</xsl:template>
</xsl:stylesheet>