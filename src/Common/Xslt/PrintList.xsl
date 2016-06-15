<?xml version="1.0"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/11-PageTypeId-27-ShoppingListPrint.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:key name="CatID" match="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem" use="CategoryID"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style type="text/css" media="print,screen">html,body		{background-color:#FFFFFF; background-image:none; }
			.row1 		{background-color:#EEEEEE;}
			.row0 		{background-color:#FFFFFF;}
			THEAD		{display: table-header-group }
			TBODY		{display: table-row-group }
			#container,
			#container-outer {background:none;left:0;margin:0;padding:0;text-align:left;width:100%;}
			#lightwindow, #lightwindow_overlay	{display:none}
			th 			{background-color:black;color:white;}</style>

		<xsl:if test="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[ItemTypeID!=10][IsVisible='true']">

			<table width="100%" border="0">
				<tbody>
					<tr>
						<td vAlign="bottom">
							<img id="logo">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//ChainSettings/Setting[Name='FeaturedProductsHeaderLogo']/Value">
											<xsl:value-of select="//ChainSettings/Setting[Name='FeaturedProductsHeaderLogo']/Value"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ExpressLane/GenericChain/DomainName"/>/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/printlogo.gif</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</td>
						<td vAlign="bottom">
							<div style="font-weight: bold; font-size: 24px; font-family: verdana">My Shopping List</div>

							<xsl:if test="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[string-length(Price) &gt; 0 or string-length(PriceString) &gt; 0]/PriceStartDate != ''">
								<p id="ValidDates">

									<!-- Get the min date.-->
									<xsl:variable name="sdate">
										<xsl:for-each select="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[string-length(Price) &gt; 0 or string-length(PriceString) &gt; 0]" >
											<xsl:sort select="PriceStartDate" data-type="text" order="ascending"/>
											<xsl:if test="position() = 1">
												<xsl:value-of select="PriceStartDate"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<!-- Get the max date.-->
									<xsl:variable name="edate">
										<xsl:for-each select="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[string-length(Price) &gt; 0 or string-length(PriceString) &gt; 0]" >
											<xsl:sort select="PriceEndDate" data-type="text" order="descending"/>
											<xsl:if test="position() = 1">
												<xsl:value-of select="PriceEndDate"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<b>
										<xsl:text>Ad Prices Valid </xsl:text>
										<xsl:if test="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem/PriceStartDate">
											<div id="weeklyCircularStartDate">
												<xsl:text>from&#xA0;</xsl:text>
												<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
											</div>
											<div id="weeklyCircularEndDate">
												<xsl:text>&#xA0;through&#xA0;</xsl:text>
												<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
											</div>
										</xsl:if>
										<xsl:text>&#xA0;at:</xsl:text>
									</b>
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
					<tr>
						<td colSpan="3" vAlign="bottom" height="12">
							<img height="2" src="/Assets/Common/Images/black_pixel.gif" width="100%"/>
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

			<xsl:for-each select="ExpressLane/GenericShoppingList/Categories/Category">
				<xsl:sort select="CategoryName"/>
				<div style="font-size: 14px; margin-bottom: 4px; margin-top:24px; font-family: 'arial black'">
					<xsl:value-of select="CategoryName"/>
				</div>
				<xsl:call-template name="ShoppingListDetail">
					<xsl:with-param name="ShoppingListCatID" select="CategoryID"/>
				</xsl:call-template>
			</xsl:for-each>
			<div class="clear" style="width:100%; height:20px;">&#xA0;</div>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ShoppingListDetail" match="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem">
		<xsl:param name="ShoppingListCatID"/>
		<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<table cellSpacing="0" cellPadding="0" width="100%" style="font-size: 12px; ; font-family: arial" border="0">
			<tr>
				<th align="left" style="font-weight: bold; font-size: 10px; border-bottom: #999999 1px solid; font-family: verdana; text-align: center">&#xA0;</th>
				<th align="left" style="font-weight: bold; font-size: 10px; border-bottom: #999999 1px solid; font-family: verdana; text-align: left">Qty.</th>
				<th align="left" style="font-weight: bold; font-size: 10px; border-bottom: #999999 1px solid; font-family: verdana; text-align: left">Item</th>
				<th align="left" style="font-weight: bold; font-size: 10px; border-bottom: #999999 1px solid; font-family: verdana; text-align: left">Price</th>
				<th align="left" style="font-weight: bold; font-size: 10px; border-bottom: #999999 1px solid; font-family: verdana; text-align: center">&#xA0;</th>
			</tr>
			<xsl:for-each select="key('CatID',  $ShoppingListCatID)[IsVisible='true']">
				<xsl:sort select="Description"/>
				<tr height="38" valign="middle">
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">row0</xsl:when>
							<xsl:otherwise>row1</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<td align="center" width="50px" valign="middle" style="font-weight: bold; font-size: 11px; border-bottom: #999999 1px solid; font-family: verdana">
						<div class="box" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; width: 20px; border-bottom: gray 1px solid; height: 20px; background-color: white">&#xA0;</div>
					</td>
					<td width="50px" valign="middle" style="border-bottom: #999999 1px solid; text-align: left">
						<xsl:value-of select="Quantity"/>
						<xsl:if test="number(Weight)">
							<xsl:variable name="Weight" select="number(Weight)"/>- <xsl:value-of select="VariableWeight/GenericFraction[StoredValue = $Weight]/DisplayValue"/>
							<xsl:choose>
								<xsl:when test="string-length(PriceUnit) &gt; 0">
									<xsl:value-of select="concat(' ', PriceUnit)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="' lbs.'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</td>
					<td valign="middle" style="border-bottom: #999999 1px solid; padding-right:12px; text-transform:capitalize;">
						<xsl:value-of select="translate(Description,$upper,$lower)"/>
						<xsl:choose>
							<xsl:when test="Comment != ''">
								<br/>
								<span class="ShoppingListComment">
									<xsl:value-of select="Comment"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="ShoppingListComment">
									<xsl:with-param name="ItemID" select="ItemID"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="160px" valign="middle" style="border-bottom: #999999 1px solid; text-align: left; ">
						<xsl:choose>
							<xsl:when test="Price&gt;0">
								<xsl:if test="PriceMultiple&gt;1">
									<xsl:value-of select="PriceMultiple"/>/</xsl:if>$<xsl:value-of select="format-number(Price, '#.00')"/></xsl:when>
							<xsl:when test="string-length(PriceString)&gt;1">
								<xsl:value-of select="PriceString"/>
							</xsl:when>
							<xsl:otherwise>&#xA0;</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="60px" valign="middle" style="border-bottom: #999999 1px solid; text-align: center;">
						<xsl:choose>
							<xsl:when test="ItemTypeID='2'">
								<xsl:choose>
									<xsl:when test="//ChainSettings/Setting/Name = 'StoreCouponIcon'">
										<img>
											<xsl:attribute name="id">logo1a</xsl:attribute>
											<xsl:attribute name="src">
												<xsl:value-of select="//GenericChain/DomainName"/>
												<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponIcon']/Value"/>
											</xsl:attribute>
											<xsl:attribute name="border">0</xsl:attribute>
										</img>
									</xsl:when>
									<xsl:otherwise>
										<img>
											<xsl:attribute name="id">logo1b</xsl:attribute>
											<xsl:attribute name="src">
												<xsl:value-of select="//GenericChain/DomainName"/>/Assets/Common/Images/manufacturercouponicon.gif</xsl:attribute>
										</img>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="ItemTypeID='10'">
								<xsl:choose>
									<xsl:when test="//ChainSettings/Setting/Name = 'StoreCouponIcon'">
										<img>
											<xsl:attribute name="id">logo2a</xsl:attribute>
											<xsl:attribute name="src">
												<xsl:value-of select="//GenericChain/DomainName"/>
												<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponIcon']/Value"/>
											</xsl:attribute>
											<xsl:attribute name="border">0</xsl:attribute>
										</img>
									</xsl:when>
									<xsl:otherwise>
										<img>
											<xsl:attribute name="id">logo2b</xsl:attribute>
											<xsl:attribute name="src">/Assets/Common/Images/store_coupons.gif</xsl:attribute>
										</img>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>&#xA0;</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="ShoppingListComment" match="GenericShoppingListItem">
		<xsl:param name="ItemID"/>
		<xsl:if test="//ProductComments/ConsumerProductComment[ProductID = $ItemID]">
			<br/>
			<span class="ShoppingListComment">
				<xsl:value-of select="//ProductComments/ConsumerProductComment[ProductID = $ItemID]/Comment"/>
			</span>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>