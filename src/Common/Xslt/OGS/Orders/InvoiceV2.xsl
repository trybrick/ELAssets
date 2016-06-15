<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
	<xsl:import href="http://localhost/Assets/Common/Xslt/Analytics/GoogleAnalytics_Objects.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<link rel="stylesheet" media="screen" href="##root##/Assets/Common/Layouts/300pxAdPods/default.css"/>
		<link rel="stylesheet" media="screen" href="##root##/Assets/##chainid##/Styles/chain.css"/>
		<!-- we NEED these hard links in here due to the way that Authorize.Net 
		 does their "redirect" after their form (aka, screen scrape the call, not redirect.
	-->
		<!-- Login box must be hidden on this page because of Authorize.net -->
		<style type="text/css">#StoreHeaderRightTop {visibility:hidden;}</style>
		<xsl:call-template name="GoogleAnalytics_OrderInvoice"/>
		<div id="OGSInvoice" class="main-wrapper">
			<div class="header">
				<img border="0" alt="Store Logo">
					<xsl:attribute name="src">
						<xsl:choose>
							<!-- test if header logo is defined in admin, use backup if not -->
							<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 181]/Value) &gt; 0">
								<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 181]/Value"/>
							</xsl:when>
							<xsl:otherwise>/Assets/##chainid##/Images/HeaderLogo.gif</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</img>
				<h1>Order Confirmation - Customer Receipt - <strong>Order #<xsl:value-of select="ExpressLane/Order/OrderInformation/CheckOutListID"/></strong></h1>
			</div>
			<div id="placed-by" class="order-information">
				<h2>Placed by</h2>
				<p>
					<strong>
						<xsl:value-of select="//Order/Consumer/FirstName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="//Order/Consumer/LastName"/>
					</strong>
					<br/>
					<xsl:value-of select="//Order/Chain/ChainName"/>
					<br/>
					<xsl:value-of select="//Order/OrderInformation/CreateDate"/>
				</p>
			</div>
			<div id="customer-information" class="order-information">
				<h2>Customer Information</h2>
				<xsl:for-each select="//Order/Consumer">
					<xsl:call-template name="InvoiceCustomerInformation"/>
				</xsl:for-each>
			</div>
			<div id="store-information" class="order-information">
				<h2>Store Information</h2>
				<p>
					<strong>
						<xsl:value-of select="//Order/Store/StoreName"/>
					</strong>
					<address>
						<xsl:value-of select="//Order/Store/PrimaryAddress"/>
						<br/>
						<xsl:value-of select="//Order/Store/City"/>, <xsl:value-of select="//Order/Store/State"/><xsl:text> </xsl:text><xsl:value-of select="//Order/Store/PostalCode"/> <br/></address>
					<xsl:value-of select="//Order/Store/Phone"/>
				</p>
			</div>
			<div class="invoiceitems">
				<h2>Order Summary</h2>
				<xsl:for-each select="ExpressLane/ArrayOfCategory/Category[CategoryID = //Order/Items/OrderItem/CategoryID]">
					<xsl:call-template name="InvoiceListItemsTable" />
				</xsl:for-each>
				<xsl:if test="ExpressLane/Order/Items/OrderItem[count(CategoryID[text() = //Category/CategoryID]) = 0]">
					<h4>Department Info Unavailable</h4>
					<table>
						<thead>
							<tr>
								<th class="upc" scope="col">UPC</th>
								<th class="itemName" scope="col">Description</th>
								<th class="itemQuantity" scope="col">Qty</th>
								<th class="itemPrice" scope="col">Price</th>
								<xsl:if test="number(//Order/ReservedPoints)">
									<th class="itemPoints" scope="col">Points **</th>
								</xsl:if>
								<th class="tax" scope="col">Tax</th>
								<th class="deposit" scope="col">Deposit</th>
								<th class="regPrice" scope="col">Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="ExpressLane/Order/Items/OrderItem[count(CategoryID[text() = //Category/CategoryID]) = 0]">
								<xsl:call-template name="InvoiceListItems"/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<xsl:if test="//Order/Chain/ChainSettings/Setting[SettingID = 141]/Value != ''">&#x2020; <xsl:value-of select="//Order/Chain/ChainSettings/Setting[SettingID = 141]/Value"/></xsl:if>
			</div>
			<div class="invoiceinformation">
				<table class="invoiceSubtotal">
					<xsl:if test="number(//Order/ReservedPoints)">
						<tr>
							<td class="invoiceLabel">Reserved Points:</td>
							<td>
								<xsl:value-of select="//Order/ReservedPoints"/>**</td>
						</tr>
					</xsl:if>
					<!-- Credit card info would go here if we had it, but we don't -->
					<tr>
						<td class="invoiceLabel">Subtotal:</td>
						<td>
							<xsl:value-of select="format-number(//Order/OrderInformation/SubTotal, '$#.00')"/>
						</td>
					</tr>
					<xsl:if test="number(//Order/OrderInformation/DepositTotal)">
						<tr>
							<td class="invoiceLabel">Deposit Total:</td>
							<td>
								<xsl:value-of select="format-number(//Order/OrderInformation/DepositTotal, '$#.00')"/>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td class="invoiceLabel">Tax:</td>
						<td>
							<xsl:value-of select="format-number(//Order/OrderInformation/TaxTotal, '$#.00')"/>
						</td>
					</tr>
					<xsl:if test="//Order/OrderInformation/AppliedDeliveryFee &gt; 0">
						<tr>
							<td class="invoiceLabel">
								<xsl:choose>
									<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 249]/Value) &gt; 0">
										<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 249]/Value"/>
									</xsl:when>
									<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">Delivery</xsl:when>
									<xsl:otherwise>Pickup</xsl:otherwise>
								</xsl:choose>Fee:</td>
							<td>
								<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '$#.00') "/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="count(//Order/Promotion/OrderPromotion) &gt; 0">
						<tr>
							<td class="invoiceLabel" colspan="2">Promotions:</td>
						</tr>
						<xsl:for-each select="//Order/Promotion/OrderPromotion">
							<xsl:variable name="promototal" select="format-number(DiscountAmount, '$#.00')"/>
							<tr>
								<td class="promoDescription">
									<xsl:value-of select="Description"/>:</td>
								<td>(<xsl:value-of select="$promototal"/>)</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="invoiceLabel">Promotions Total:</td>
							<td>
								<xsl:variable name="promotiontotal" select="sum(//Order/Promotion/OrderPromotion/DiscountAmount)"/>- <xsl:value-of select="format-number($promotiontotal, '$#.00')"/></td>
						</tr>
					</xsl:if>
					<tr>
						<td class="invoiceLabel">Total:</td>
						<td>
							<xsl:value-of select="format-number(//Order/OrderInformation/Total, '$#.00')"/>
						</td>
					</tr>
				</table>
				<table>
					<xsl:if test="string-length(//Order/OrderInformation/Comment) &gt; 0">
						<tr>
							<td class="invoiceLabel">Order Comments:</td>
							<td>
								<xsl:value-of select="//Order/OrderInformation/Comment"/>
							</td>
						</tr>
					</xsl:if>
					<!-- DELIVERY INSTRUCTIONS HERE -->
					<!-- Substitutions INSTRUCTIONS HERE -->
					<xsl:if test="string-length(//Order/OrderInformation/DeliveryDateDisplay) &gt; 0">
						<tr>
							<td class="invoiceLabel">
								<xsl:choose>
									<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
									<xsl:otherwise>Pickup </xsl:otherwise>
								</xsl:choose>Date:</td>
							<td>
								<xsl:value-of select="//Order/FormattedDeliveryDate"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="string-length(//Order/OrderInformation/DeliveryDateDisplay) &gt; 0">
						<tr>
							<td class="invoiceLabel">
							<xsl:choose>
                           	 	<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
							Time:</td>
							<td>
								<xsl:value-of select="//Order/OrderInformation/DeliveryMessage"/>
							</td>
						</tr>
					</xsl:if>
				</table>
				<table>
					<tr>
						<td class="invoiceLabel">Substitution Preferences:</td>
						<td>
							<xsl:value-of select="//Order/OrderInformation/SubstitutionTypeDescription"/>
						</td>
					</tr>
				</table>
			</div>
			<p class="disclaimer">
				<em>* Prices may not be specified for all items. Item price(s) will be calculated at
					<xsl:choose>
						<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">delivery.</xsl:when>
						<xsl:otherwise>pickup.</xsl:otherwise>
					</xsl:choose>
				</em>
			</p>
			<xsl:if test="number(//Order/ReservedPoints)">
				<p class="disclaimer">
					<em>** Points discounts will be calculated at
						<xsl:choose>
							<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">delivery.</xsl:when>
							<xsl:otherwise>pickup.</xsl:otherwise>
						</xsl:choose>
					</em>
				</p>
			</xsl:if>
			<xsl:if test="//ArrayOfStaticContent/StaticContent">
				<div class="StaticContent Footer">
					<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<h2>Thanks for your order!</h2>
			<div class="invoicebuttons">
				<a class="button" href="javascript:window.print();">
					<span>Print Receipt</span>
				</a>

				<a>
					<xsl:attribute name="class">button red</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="//Order/Chain/PreferedHost"/>
					</xsl:attribute>
					<span>Back To Home</span>
				</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="InvoiceListItemsTable" match="Category">
		<xsl:variable name="CategoryID" select="CategoryID" />
		<h4><xsl:value-of select="CategoryName" /></h4>
		<table>
			<thead>
				<tr>
					<th class="upc" scope="col">UPC</th>
					<th class="itemName" scope="col">Description</th>
					<th class="itemQuantity" scope="col">Qty</th>
					<th class="itemPrice" scope="col">Price</th>
					<xsl:if test="number(//Order/ReservedPoints)">
						<th class="itemPoints" scope="col">Points **</th>
					</xsl:if>
					<th class="tax" scope="col">Tax</th>
					<th class="deposit" scope="col">Deposit</th>
					<th class="regPrice" scope="col">Subtotal</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="//Order/Items/OrderItem[CategoryID = $CategoryID]">
					<xsl:call-template name="InvoiceListItems"/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="InvoiceListItems" match="OrderItem">
		<xsl:param name="Weight">

			<xsl:choose>
				<xsl:when test="number(Weight) &gt; 0">
					<xsl:value-of select="number(Weight)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="CalculatedPrice">
			<xsl:value-of select="Price * $Weight * Quantity"/>
		</xsl:param>
		<tr>
			<td class="upc">
				<xsl:value-of select="UPC11"/>
			</td>
			<td class="ItemName">
				<xsl:value-of select="Description"/>

				<xsl:if test="string-length(Comment) &gt; 0">
					<br/>
					<strong>Comments:</strong>
					<xsl:value-of select="Comment"/>
				</xsl:if>
			</td>
			<td class="ItemQuantity">
				<xsl:choose>
					<xsl:when test="string-length(SoldByWeight) &gt; 0 and DisplayWeight != ''">
						<!-- Always show quantity for weighted items, even if it's 1 (task#12050) -->
						<!-- <xsl:choose>	
							 <xsl:when test="Quantity &gt; 1"> -->
						<xsl:value-of select="Quantity"/>
						<xsl:text>[</xsl:text>
						<xsl:value-of select="DisplayWeight"/>
						<xsl:choose>
							<xsl:when test="string-length(UnitOfMeasure) &gt; 0">
								<xsl:value-of select="concat(' ', UnitOfMeasure)"/>
							</xsl:when>
							<xsl:otherwise>lb.</xsl:otherwise>
						</xsl:choose>
						<xsl:text>]</xsl:text>
						<!-- </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="DisplayWeight"/>
								<xsl:choose>
									<xsl:when test="string-length(UnitOfMeasure) &gt; 0">
										<xsl:value-of select="concat(' ', UnitOfMeasure)" />
									</xsl:when>
									<xsl:otherwise> lb.</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise> 
						</xsl:choose> -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="Quantity"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="ItemPrice">
				<xsl:choose>
					<xsl:when test="number(Price)">
						<xsl:value-of select="format-number(Price, '$#.00')"/>
						<xsl:if test="number(PointsUsed)">**</xsl:if>
					</xsl:when>
					<xsl:otherwise>*</xsl:otherwise>
				</xsl:choose>
			</td>
			<xsl:if test="number(//Order/ReservedPoints)">
				<td>
					<xsl:value-of select="PointsUsed"/>
				</td>
			</xsl:if>
			<td>
				<xsl:if test="number(TaxSum)">
					<xsl:value-of select="format-number(TaxSum, '$#.00')"/>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="number(DepositAmount)">
					<xsl:value-of select="format-number(DepositAmount, '$#.00')"/>
				</xsl:if>
			</td>
			<td class="RegPrice">
				<xsl:if test="number(CalculatedPrice)">
					<xsl:value-of select="format-number(CalculatedSum,'$#.00')"/>
					<xsl:if test="number(PointsUsed)">**</xsl:if>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="InvoiceCustomerInformation" match="Consumer">
		<p>
			<strong>
				<xsl:value-of select="FirstName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="LastName"/>
			</strong>
			<xsl:if test="string-length(//GenericChain/ChainSettings/Setting[SettingID=333]/Value) &gt; 0">
				<xsl:choose>
					<xsl:when test="string-length(//GenericChain/ChainSettings[SettingID=8]/Value) &gt; 0">
						<xsl:value-of select="concat(//GenericChain/ChainSettings[SettingID=8]/Value, ' Number: ')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Loyalty Card Number: </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=333]/Value" />
			</xsl:if>
			<address>
				<xsl:value-of select="PrimaryAddress"/>
				<xsl:if test="string-length(SecondaryAddress) &gt; 0">
					<br/>
					<xsl:value-of select="SecondaryAddress"/>
				</xsl:if>
				<br/>
				<xsl:value-of select="City"/>, <xsl:value-of select="State"/><xsl:text> </xsl:text><xsl:value-of select="PostalCode"/></address>
			<xsl:if test="string-length(Phone) &gt; 0">
				<xsl:value-of select="Phone"/>
				<br/>
			</xsl:if>
			<xsl:if test="string-length(AlternatePhone) &gt; 0">
				<xsl:value-of select="AlternatePhone"/>
				<br/>
			</xsl:if>
			<xsl:if test="string-length(Email) &gt; 0">
				<xsl:value-of select="Email"/>
				<br/>
			</xsl:if>
			<xsl:if test="string-length(AlternateEmail) &gt; 0">
				<xsl:value-of select="AlternateEmail"/>
				<br/>
			</xsl:if>
		</p>
	</xsl:template>
</xsl:stylesheet>