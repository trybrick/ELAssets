<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="ManageListTable.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingListPage.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AdInternal.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Ad.js"/>
		<script type="text/javascript">function LoadInternalAd(){
				var staticpagetypeid = <xsl:value-of select="//StaticPageType/StaticPageTypeID"/>;
				LoadAdInternal(staticpagetypeid);
			}
			LoadInternalAd();</script>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<div id="ManageList">
			<div id="ShoppingListHeaderLarge">
				<xsl:if test="$IsOGS = 'true'">
					<xsl:attribute name="class">ShopListHeaderOGS</xsl:attribute>
				</xsl:if>
			</div>
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
		<div id="adInternal"/>
	</xsl:template>
</xsl:stylesheet>
