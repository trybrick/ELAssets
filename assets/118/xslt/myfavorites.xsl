<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="MyFavoritesItems.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/">
		<script src="/Assets/Common/Js/MyFavorites/MyFavoritesService.js" type="text/javascript" />
		<script src="/Assets/Common/Js/MyFavorites/MyFavorites.js" type="text/javascript" />
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />	
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js" />	
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingListPage.js" />	
		<!-- Alternate spelling for Canada -->
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='MyFavoritesTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='MyFavoritesTitle']/Value"/>
				</xsl:when>
				<xsl:when test="//Setting/ChainCountries = 'CA'">My Favourites</xsl:when>
				<xsl:otherwise>My Favorites</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
    	<!-- Display 'cart' or 'list' in heading based on whether site is online grocery or not. -->
		<xsl:variable name="CartOrList">
			<xsl:choose>
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" /><span> View history of items added to your <xsl:value-of select="$CartOrList" />.</span></h2>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="//MyFavorites/Items/GenericShoppingListItem">
				<div id="CtrlDepartmentDropDown">
					<select id="ddlDepartment" onchange="DisplayDepartmentFavorites()">
						<option value="0">All Departments</option>
						<xsl:for-each select="//MyFavorites/Categories/Category[CategoryID = //MyFavorites/Items/GenericShoppingListItem/CategoryID]">
							<option>
								<xsl:attribute name="value">
									<xsl:value-of select="CategoryID" />
								</xsl:attribute>
								<xsl:attribute name="exportkeyid">
									<xsl:value-of select="ExportKeyID" />
								</xsl:attribute>
								<xsl:value-of select="CategoryName" />
							</option>
						</xsl:for-each>
					</select>
				</div>
				<div id="productdescription" />
				<div id="ProductsGrid">
					<xsl:apply-imports />
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div id="ProductsGrid">
					<p>You do not have any purchase history yet. Please check back later.</p>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>