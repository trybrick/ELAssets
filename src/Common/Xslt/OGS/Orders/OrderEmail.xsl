<?xml version="1.0"?><!-- DWXMLSource="http://giantogs.beta.groceryshopping.net/Assets/43/XmlData/43-PageTypeId-138-OGSInvoice.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<body>
			<div>
				<img alt="">
					<xsl:attribute name="src"><xsl:value-of select="//Order/Chain/PreferedHost"/>/Assets/<xsl:value-of select="ExpressLane/Order/Chain/ChainID"/>/Images/email_receipt.jpg</xsl:attribute>
				</img>
			</div>
			<table cellpadding="2" cellspacing="0" width="600">
				<tr>
					<td>
						<h1 style="font-family:Arial,Helvetica,sans-serif;font-size:18px;margin-top:1em;">Customer Receipt - Your order number is <xsl:value-of select="ExpressLane/Order/OrderInformation/CheckOutListID"/></h1>
						<!--<p style="font-size:12px;">Order time:<xsl:value-of select="ExpressLane/Order/OrderInformation/CreateDate"/></p>-->
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:14px;">Thank you for placing an order with <xsl:value-of select="//Order/Chain/ChainName"/>! Please review your order information below.</p>
						<br/>
						<strong>
									<xsl:value-of select="//Order/OrderInformation/Comment"/>
								</strong>
					</td>
				</tr>
				<tr>
					<td>
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Placed by</h2>
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px; text-transform:capitalize;">
							<xsl:for-each select="//Order/Consumer">
								<xsl:call-template name="InvoiceCustomerInformation"/>
							</xsl:for-each>
                            <xsl:choose>
                           	 	<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
                            Date and Time:
							<strong>
								<xsl:choose>
									<xsl:when test="string-length(//Order/OrderInformation/DeliveryDateDisplay) &gt; 0">
										<xsl:value-of select="ExpressLane/Order/OrderInformation/DeliveryDateDisplay"/>
									</xsl:when>
                                    
									<xsl:otherwise>Unknown. Please contact your store.</xsl:otherwise>
								</xsl:choose>
							</strong>
						</p>
						<br />
					</td>
				</tr>
				<tr>
					<td>
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Store Information</h2>
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px; text-transform:capitalize;">
							<xsl:value-of select="ExpressLane/Order/Store/StoreName"/>
							<br/>
							<xsl:value-of select="//Order/Store/PrimaryAddress"/>
							<br/>
							<xsl:value-of select="//Order/Store/City"/>, <xsl:value-of select="//Order/Store/State"/><xsl:text> </xsl:text><xsl:value-of select="//Order/Store/PostalCode"/> <br/>
							<xsl:value-of select="//Order/Store/Phone"/>
						</p>
					</td>
				</tr>
			</table>
			<br/>
			<table cellpadding="5" cellspacing="0" width="600">
				<tr>
					<td>
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Order Summary</h2>
					</td>
				</tr>
			</table>
			<table cellpadding="5" cellspacing="0" width="600">
				<tr>
					<td><span  colspan="5" style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;" align="left">Substitution Preferences:</span><br/><span style="font-family:Arial,Helvetica,sans-serif;font-size:12px;" align="left"><xsl:value-of select="//Order/OrderInformation/SubstitutionTypeDescription"/></span></td>
				</tr>
			</table>
			<p></p>
			<table cellpadding="5" cellspacing="0" width="600">
				<tr>
					<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">UPC</td>
					<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Description</td>
					<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Qty</td>
					<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Unit Price</td>
					<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left" width="75">Price</td>
				</tr>
				<xsl:for-each select="//Order/Items/OrderItem">
					<xsl:call-template name="InvoiceListItems"/>
				</xsl:for-each>
			</table>

			<xsl:if test="//OrderItem/DisplayWeight != ''">
				<xsl:value-of select="//Order/Chain/ChainSettings/Setting[SettingID = 141]/Value"/>
			</xsl:if>
			<table cellpadding="4" cellspacing="0" width="600" style="margin-top:10px;">
				<xsl:if test="string-length(//Order/OrderInformation/Comment) &gt; 0">
					<tr>
						<td colspan="2">
							<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Order Comments:</h2>
							<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px;">
								<strong>
									<xsl:value-of select="//Order/OrderInformation/Comment"/>
								</strong>
							</p>
						</td>
					</tr>
				</xsl:if>
				<!-- DELIVERY INSTRUCTIONS HERE -->
				<!-- Substitutions INSTRUCTIONS HERE -->
				<!--<tr>
					<td colspan="2">
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Order Summary</h2>
					</td>
				</tr>-->
				<!-- Credit card info would go here if we had it, but we don't -->
				<tr>
					<td align="right">Subtotal:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="//Order/OrderInformation/SubTotal &gt; 0">
									<xsl:value-of select="format-number(//Order/OrderInformation/SubTotal, '##.00')"/>
								</xsl:when>
								<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
				<tr>
					<td align="right">Deposit:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="number(//Order/OrderInformation/DepositTotal)">
									<xsl:value-of select="format-number(//Order/OrderInformation/DepositTotal, '$##.00')"/>
								</xsl:when>
								<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
				<tr>
					<td align="right">Tax:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="//Order/OrderInformation/TaxTotal &gt; 0">
									<xsl:value-of select="format-number(//Order/OrderInformation/TaxTotal, '##.00')"/>
								</xsl:when>
								<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>		
						</strong>
					</td>
				</tr>

				<tr>
					<td align="right">
                            <xsl:choose>
								<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 249]/Value) &gt; 0">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 249]/Value" />
								</xsl:when>
                           	 	<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
					 Fee:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="//Order/OrderInformation/AppliedDeliveryFee &gt; 0">
									<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '##.00') "/>
								</xsl:when>
								<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
				<xsl:if test="count(//Order/Promotion/OrderPromotion) &gt; 0">
				<tr>
					<td align="right">
						Promotions:
						<ul>
							<xsl:for-each select="//Order/Promotion/OrderPromotion">
								<xsl:variable name="promototal" select="format-number(DiscountAmount, '$##.00')" />
								<li><xsl:value-of select="concat(Description, ' - ', $promototal)" /> </li>
							</xsl:for-each>
						</ul>
					</td>
					<td>
						<xsl:variable name="promotiontotal" select="sum(//Order/Promotion/OrderPromotion/DiscountAmount)" />
						<strong>
							<xsl:value-of select="format-number($promotiontotal, '($##.00)')" />
						</strong>
					</td>
				</tr>
				</xsl:if>
				<xsl:if test="number(//Order/ReservedPoints)">
					<tr>
						<td align="right">Points:</td>
						<td>
							<strong><xsl:value-of select="//Order/ReservedPoints" />**</strong>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td align="right">* Estimated Total:</td>
					<td>
						<strong>$
							<xsl:choose> 
								<xsl:when test="//Order/OrderInformation/Total &gt; 0">
									<xsl:value-of select="format-number(//Order/OrderInformation/Total, '##.00')"/>
								</xsl:when>
								<xsl:otherwise>
									0.00
								</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
			</table>
			<p>
				<em>* Items without prices will be specified at time of <xsl:choose>
                           	 	<xsl:when test="//Order/OrderInformation/DeliveryType = 'Delivery'"> delivery. </xsl:when>
                            	<xsl:otherwise> pickup. </xsl:otherwise>
                            </xsl:choose></em>
			</p>
			<xsl:if test="number(//Order/ReservedPoints)">
				<p>
					<em>** Points discounts will be calculated at delivery/pickup.</em>
				</p>
			</xsl:if>
			<p>Thank you for shopping with us at <a><xsl:attribute name="href"><xsl:value-of select="//Order/Chain/PreferedHost"/></xsl:attribute><xsl:value-of select="//Order/Chain/ChainName"/></a>.</p>
            
            <xsl:if test="//ArrayOfStaticContent/StaticContent">
					<div class="StaticContent">
						<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
							<xsl:sort select="SortBy" data-type="number"/>
							<xsl:value-of select="Description" disable-output-escaping="yes"/>
						</xsl:for-each>
					</div>
				</xsl:if>
                
                
		</body>
	</xsl:template>

	<xsl:template name="InvoiceListItems" match="OrderItem">
		<tr>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px; width:150px;">
				<xsl:value-of select="UPC11"/>
			</td>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:250px;">
				<xsl:value-of select="Description"/>
			</td>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:75px;">
				<xsl:choose>
					<xsl:when test="string-length(SoldByWeight) &gt; 0 and DisplayWeight != ''">
						<xsl:choose>	
							<xsl:when test="Quantity &gt; 1">
								<xsl:value-of select="Quantity"/>
								<xsl:text>[</xsl:text>
								<xsl:value-of select="DisplayWeight"/>
								<xsl:choose>
									<xsl:when test="string-length(UnitOfMeasure) &gt; 0">
										<xsl:value-of select="concat(' ', UnitOfMeasure)" />
									</xsl:when>
									<xsl:otherwise> lb.</xsl:otherwise>
								</xsl:choose>
								<xsl:text>]</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="DisplayWeight"/>
								<xsl:choose>
									<xsl:when test="string-length(UnitOfMeasure) &gt; 0">
										<xsl:value-of select="concat(' ', UnitOfMeasure)" />
									</xsl:when>
									<xsl:otherwise> lb.</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="Quantity"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:75px;">
				<xsl:choose>
					<xsl:when test="number(Price)">
						<xsl:value-of select="format-number(Price, '$##.00')"/>
					</xsl:when>
					<xsl:otherwise>*</xsl:otherwise>
				</xsl:choose>
			</td>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:75px;">
				<xsl:choose>
					<xsl:when test="number(CalculatedPrice)">
						<xsl:value-of select="format-number(CalculatedPrice, '$##.00')" />
						<xsl:if test="number(PointsUsed)">**</xsl:if>
					</xsl:when>
					<xsl:otherwise>*</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="InvoiceCustomerInformation" match="Consumer">
		<xsl:value-of select="FirstName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="LastName"/>
		<br/>
		<xsl:value-of select="PrimaryAddress"/>
		<br/>
		<xsl:if test="string-length(SecondaryAddress) &gt; 0">
			<xsl:value-of select="SecondaryAddress"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="City"/>, <xsl:value-of select="State"/><xsl:text> </xsl:text><xsl:value-of select="PostalCode"/> <br/>
		<xsl:if test="string-length(Phone) &gt; 0">
			<xsl:value-of select="Phone" />
			<br/>
		</xsl:if>
		<xsl:if test="string-length(AlternatePhone) &gt; 0">
			<xsl:value-of select="AlternatePhone" />
			<br/>
		</xsl:if>
		<xsl:if test="string-length(Email) &gt; 0">
			<span><xsl:value-of select="Email"/></span>
			<br/>
		</xsl:if>
		<xsl:if test="string-length(AlternateEmail) &gt; 0">
        	<xsl:value-of select="AlternateEmail"/><br/>
         </xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->