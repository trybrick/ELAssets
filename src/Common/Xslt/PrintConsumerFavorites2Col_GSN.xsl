<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:import href="HorizontalBanners.xsl"/>
	<!-- <xsl:import href="http://localhost/Assets/Common/Xslt/HorizontalBanners.xsl"/>-->
	<xsl:key name="CategoryIDs" match="//ConsumerFavorite/GenericProduct" use="DepartmentCategoryID"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="StoreID" select="ExpressLane/PrintList/GenericShoppingList/StoreID"/>
		<style type="text/css" media="print,screen">
			html,body		{background-color:#FFFFFF; background-image:none; font: 9pt Arial, Helvetica, sans-serif}
			.row1 			{background-color:#EEEEEE;}
			.row0 			{background-color:#FFFFFF;}
			THEAD			{display: table-header-group }
			TBODY			{display: table-row-group }
			ul				{text-align:left; list-style:none; margin:0 0 6px 5px; padding:0 0 0 0.25em;}
			li				{clear:both; text-indent:-0.25em; margin:0; font-size:9pt}
			#categoryname	{font-size: 10pt; clear:both; width:100%; border-bottom:1px solid #CCCCCC; margin: 0 0 4px 0; font-family: 'arial black'}
			#column1,
			#column2		{display:inline; width:47%; float:left; margin-left:2%; margin-top:0; }
			#littlebox		{width:12px; float:left; height:12px; margin:0 4px 0 0; border:1px solid black;}
			#couponicon		{width:14px; float:left; height:14px; margin:0 4px 0 0; }
			#listcontent	{width:85%; float:left; margin:0 6px 0 0;}
			#lightwindow, #lightwindow_overlay	{display:none}
			#container,
			#container-outer {background:none;left:0;margin:0;padding:0;text-align:left;width:100%;}
			#container-inner {background:none;}
			th 			{background-color:black;color:white;}
			#footer-outer, .footer-bottom {display:none;}
		</style>
		<script type="text/javascript" src="/Assets/Common/Js/prototype.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AdInternal.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Ad.js"/>
		<script type="text/javascript">
			function LoadInternalAd(){
			var staticpagetypeid = <xsl:value-of select="//StaticPageType/StaticPageTypeID"/>;

			LoadAdInternal(staticpagetypeid);
			}

			LoadInternalAd();
		</script>
		<xsl:if test="ExpressLane/ConsumerFavorites/ConsumerFavorite/GenericProduct">
			<table width="100%" style="border-bottom:3px solid black; margin-bottom:12px;">
				<tbody>
					<tr>
						<td vAlign="middle">
							<img id="logo">
								<xsl:attribute name="src"><xsl:value-of select="ExpressLane/GenericChain/DomainName"/>/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/printlogo.gif
								</xsl:attribute>
							</img>
						</td>
						<td vAlign="middle">
							<div style="font-weight: bold; font-size: 24px; font-family: verdana">My Favorites Shopping List</div>
							<xsl:if test="ExpressLane/ConsumerFavorites/ConsumerFavorite/GenericProduct[string-length(RegularPrice) &gt; 0 or string-length(RegularPriceString) &gt; 0]/SaleStartDate != ''">
								<p id="ValidDates">
									<!-- Get the min date.-->
									<xsl:variable name="sdate">
										<xsl:for-each select="ExpressLane/ConsumerFavorites/ConsumerFavorite/GenericProduct[(string-length(RegularPrice) &gt; 0 or string-length(RegularPriceString) &gt; 0) and string-length(SaleStartDate) &gt; 0]">
											<xsl:sort select="SaleStartDate" data-type="text" order="ascending"/>
											<xsl:if test="position() = 1">
												<xsl:value-of select="SaleStartDate"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<!-- Get the max date.-->
									<xsl:variable name="edate">
										<xsl:for-each select="ExpressLane/ConsumerFavorites/ConsumerFavorite/GenericProduct[(string-length(RegularPrice) &gt; 0 or string-length(RegularPriceString) &gt; 0) and string-length(SaleEndDate) &gt; 0]">
											<xsl:sort select="SaleEndDate" data-type="text" order="ascending"/>
											<xsl:if test="position() = 1">
												<xsl:value-of select="SaleEndDate"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<div id="adValidDates">
										<b>
											<xsl:text>Ad Prices Valid </xsl:text>
											<xsl:if test="ExpressLane/ConsumerFavorites/ConsumerFavorite/GenericProduct/SaleStartDate">
												<div id="weeklyCircularStartDate">
													<xsl:text> from&#xA0;</xsl:text>
													<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
												</div>
												<div id="weeklyCircularEndDate">
													<xsl:text>&#xA0;through&#xA0;</xsl:text>
													<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
												</div>
											</xsl:if>
											<xsl:text>&#xA0;at:</xsl:text>
										</b>
									</div>
									<br/>
									<xsl:value-of select="concat(ExpressLane/GenericStore/PrimaryAddress, ' ')"/>
									<xsl:value-of select="ExpressLane/GenericStore/City"/>
									<xsl:text>, </xsl:text>
									<xsl:value-of select="concat(ExpressLane/GenericStore/State, ' ')"/>
									<xsl:value-of select="ExpressLane/GenericStore/PostalCode"/>
									<xsl:text> location only</xsl:text>
								</p>
							</xsl:if>
						</td>
						<td>
							<a href="javascript:window.print();" class="button" style="float:right;">
								<span>Print</span>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:if test="Image != ''">
					<div id="PromoImage" style="margin:1em; width:100%;">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="Image" disable-output-escaping="yes"/>
							</xsl:attribute>
						</img>
					</div>
				</xsl:if>
				<xsl:if test="Description != ''">
					<div id="PromoText" style="margin:1em; width:100%;">
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</div>
				</xsl:if>
			</xsl:for-each>
			<div id="column1">
				<xsl:for-each select="ExpressLane/ArrayOfCategory/Category">
					<xsl:if test="position() mod 2 = 1">
						<xsl:variable name="ItemCount" select="count(key('CategoryIDs', CategoryID))"/>
						<xsl:if test="$ItemCount &gt; 0">
							<xsl:call-template name="MainDisplayGroup">
								<xsl:with-param name="Category" select="."/>
								<xsl:with-param name="Products" select="key('CategoryIDs', CategoryID)"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</div>
			<div id="column2">
				<xsl:for-each select="ExpressLane/ArrayOfCategory/Category">
					<xsl:if test="position() mod 2 = 0">
						<xsl:variable name="ItemCount" select="count(key('CategoryIDs', CategoryID))"/>
						<xsl:if test="$ItemCount &gt; 0">
							<xsl:call-template name="MainDisplayGroup">
								<xsl:with-param name="Category" select="."/>
								<xsl:with-param name="Products" select="key('CategoryIDs', CategoryID)"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</div>
			<div class="clear" style="width:100%; height:20px;">&#xA0;</div>
		</xsl:if>
		<xsl:call-template name="HorizontalBanners"/>
	</xsl:template>
	<xsl:template name="MainDisplayGroup">
		<xsl:param name="Category"/>
		<xsl:param name="Products"/>
		<xsl:variable name="CategoryID" select="CategoryID"/>
		<xsl:variable name="CategoryName" select="CategoryName"/>
		<xsl:variable name="Items" select="//ConsumerFavorite/GenericProduct[DepartmentCategoryID = $CategoryID]"/>
		<div id="categoryname">
			<xsl:value-of select="$CategoryName"/>
		</div>
		<xsl:call-template name="ShoppingListDetail">
			<xsl:with-param name="ShoppingListCatID" select="$CategoryID"/>
			<xsl:with-param name="Items" select="$Items"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="ShoppingListDetail">
		<xsl:param name="ShoppingListCatID"/>
		<xsl:param name="Items"/>
		<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<ul>
			<xsl:for-each select="$Items">
				<xsl:sort select="Description"/>
				<li>
					<div id="littlebox"/>
					<div id="couponicon">
						<xsl:choose>
							<xsl:when test="../ItemTypeID='2'">
								<img height="14" src="{concat(//GenericChain/DomainName,'/Assets/Common/Images/manufacturercouponicon.gif')}"/>
							</xsl:when>
							<xsl:when test="../ItemTypeID='10'">
								<img height="14">
									<xsl:attribute name="src">
										<xsl:choose>
											<xsl:when test="string-length(//ChainSettings/Setting[Name = 'StoreCouponIcon']/Value) &gt; 0">
												<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponIcon']/Value"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>##root##/Assets/Common/Images/store_coupons.gif</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div id="listcontent" style="text-transform:capitalize;"><xsl:value-of select="SalePriceMultiple"/><xsl:if test="number(SoldByWeight)"><xsl:variable name="Weight" select="number(SoldByWeight)"/>- <xsl:value-of select="VariableWieght/GenericFraction[StoredValue = $Weight]/DisplayValue"/><xsl:choose><xsl:when test="string-length(UnitOfMeasureAbbreviation) &gt; 0"><xsl:value-of select="concat(' ', UnitOfMeasureAbbreviation)"/></xsl:when><xsl:otherwise><xsl:value-of select="' lbs.'"/></xsl:otherwise></xsl:choose></xsl:if>:&#xA0;
						<xsl:if test="string-length(Brand/BrandName) &gt; 0"><xsl:value-of select="concat(Brand/BrandName, ' ')"/></xsl:if>
						<span><xsl:attribute name="title"><xsl:value-of select="UPC11"/></xsl:attribute><xsl:value-of select="concat(Description, ' ')"/></span>

						<xsl:if test="string-length(ItemExtendedSize) &gt; 0">
							&#xA0;-&#xA0;<xsl:value-of select="ItemExtendedSize"/>
						</xsl:if>
						<xsl:choose><xsl:when test="SalePrice &gt; 0">
								,&#xA0;
								<xsl:if test="SalePriceMultiple &gt; 1"><xsl:value-of select="concat(SalePriceMultiple, '/')"/></xsl:if>$<xsl:value-of select="format-number(SalePrice, '#.00')"/>
							</xsl:when><xsl:when test="string-length(RegularPriceString) &gt; 1">
								,&#xA0;
								<xsl:value-of select="RegularPriceString"/>
							</xsl:when></xsl:choose>
						<xsl:choose><xsl:when test="Comment != ''"><br/><span class="ShoppingListComment"><xsl:value-of select="Comment"/></span></xsl:when><xsl:otherwise><xsl:call-template name="ShoppingListComment"><xsl:with-param name="ItemID" select="ItemID"/></xsl:call-template></xsl:otherwise></xsl:choose>
					</div>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="ShoppingListComment" match="GenericShoppingListItem">
		<xsl:param name="ItemID"/>
		<xsl:if test="//ProductComments/ConsumerProductComment[ProductID = $ItemID]">
			<br/>
			<span class="ShoppingListComment">
				<strong>Comment:</strong>
				<xsl:value-of select="//ProductComments/ConsumerProductComment[ProductID = $ItemID]/Comment"/>
			</span>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
