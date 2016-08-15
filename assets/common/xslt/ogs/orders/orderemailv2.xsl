<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<body>
			<div>
				<img alt="">
					<xsl:attribute name="src"><xsl:value-of select="ExpressLane/Order/Chain/PreferedHost"/>/Assets/<xsl:value-of select="ExpressLane/Order/Chain/ChainID"/>/Images/email_receipt.jpg</xsl:attribute>
				</img>
			</div>
			<table cellpadding="2" cellspacing="0" width="625">
				<tr>
					<td>
						<h1 style="font-family:Arial,Helvetica,sans-serif;font-size:18px;margin-top:1em;">Customer Receipt</h1>
						<h3>Order #<xsl:value-of select="ExpressLane/Order/OrderInformation/CheckOutListID"/></h3>
						<!--<p style="font-size:12px;">Order time:<xsl:value-of select="ExpressLane/Order/OrderInformation/CreateDate"/></p>-->
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:14px;">Thank you for placing an order with <xsl:value-of select="ExpressLane/Order/Chain/ChainName"/>! Please review your order information below.</p>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Placed by</h2>
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px; text-transform:capitalize;">
							<xsl:for-each select="ExpressLane/Order/Consumer">
								<xsl:call-template name="InvoiceCustomerInformation"/>
							</xsl:for-each>
                            <xsl:choose>
                           	 	<xsl:when test="ExpressLane/Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
                            Date:
							<strong>
								<xsl:choose>
									<xsl:when test="string-length(ExpressLane/Order/FormattedDeliveryDate) &gt; 0">
										<xsl:value-of select="ExpressLane/Order/FormattedDeliveryDate"/>
									</xsl:when>
									<xsl:otherwise>Unknown. Please contact your store.</xsl:otherwise>
								</xsl:choose>
							</strong><br />
							<xsl:choose>
                           	 	<xsl:when test="ExpressLane/Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
							Time: <strong>
								<xsl:choose>
									<xsl:when test="contains(ExpressLane/Order/OrderInformation/DeliveryMessage, '##Fee##')">
										<xsl:value-of select="substring-before(ExpressLane/Order/OrderInformation/DeliveryMessage, '##Fee##')" />
										<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/AppliedDeliveryFee, '$##.00')" />
										<xsl:value-of select="substring-after(ExpressLane/Order/OrderInformation/DeliveryMessage, '##Fee##')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ExpressLane/Order/OrderInformation/DeliveryMessage" />
									</xsl:otherwise>
								</xsl:choose>
							</strong>
						</p>
						<br />
					</td>
				</tr>
				<tr>
					<td>
						<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Store Information</h2>
						<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px;">
							<xsl:value-of select="ExpressLane/Order/Store/StoreName"/>
							<br/>
							<xsl:value-of select="ExpressLane/Order/Store/PrimaryAddress"/>
							<br/>
							<xsl:value-of select="ExpressLane/Order/Store/City"/>, <xsl:value-of select="ExpressLane/Order/Store/State"/><xsl:text> </xsl:text><xsl:value-of select="ExpressLane/Order/Store/PostalCode"/> <br/>
							<xsl:value-of select="ExpressLane/Order/Store/Phone"/>
						</p>
					</td>
				</tr>
			</table>
			<br/>
			<table cellpadding="0" cellspacing="0" width="625">
				<tbody>
					<tr>
						<td>
							<h2 style="border-top:2px solid #999;border-bottom:2px solid #999;font-family:Arial,Helvetica,sans-serif;font-size:14px;padding:2px 0;">
								<xsl:text>Order Summary</xsl:text>
							</h2>
						</td>
					</tr>
				</tbody>
			</table>
			<xsl:for-each select="ExpressLane/ArrayOfCategory/Category[CategoryID = //OrderItem/CategoryID]">
				<xsl:call-template name="InvoiceCategoryItems" />
			</xsl:for-each>

			<xsl:if test="ExpressLane/Order/Items/OrderItem[count(CategoryID[text() = //Category/CategoryID]) = 0]">
				<h3>Department Info Unavailable</h3>
				<table cellpadding="5" cellspacing="0" width="625">
					<tr>
						<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">UPC</td>
						<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Description</td>
						<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Qty</td>
						<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Unit Price</td>
						<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left" width="75">Price</td>
					</tr>
					<xsl:for-each select="ExpressLane/Order/Items/OrderItem[count(CategoryID[text() = //Category/CategoryID]) = 0]">
						<xsl:call-template name="InvoiceListItems"/>
					</xsl:for-each>
				</table>
			</xsl:if>

			<xsl:if test="//OrderItem/DisplayWeight != ''">
				<xsl:value-of select="ExpressLane/Order/Chain/ChainSettings/Setting[SettingID = 141]/Value"/>
			</xsl:if>
			<table cellpadding="4" cellspacing="0" width="625" style="margin-top:10px;">
				<xsl:if test="string-length(ExpressLane/Order/OrderInformation/Comment) &gt; 0">
					<tr>
						<td colspan="2">
							<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Order Comments:</h2>
							<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px;">
								<strong>
									<xsl:value-of select="ExpressLane/Order/OrderInformation/Comment"/>
								</strong>
							</p>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(ExpressLane/Order/OrderInformation/SubstitutionTypeDescription) &gt; 0">
					<tr>
						<td colspan="2">
							<h2 style="font-family:Arial,Helvetica,sans-serif;font-size:14px;border-top:2px solid #999;border-bottom:2px solid #999;padding:2px 0;">Substitution Preference:</h2>
							<p style="font-family:Arial,Helvetica,sans-serif;font-size:12px;">
								<strong>
									<xsl:value-of select="ExpressLane/Order/OrderInformation/SubstitutionTypeDescription"/>
								</strong>
							</p>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td align="right">Subtotal:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="ExpressLane/Order/OrderInformation/SubTotal &gt; 0">
									<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/SubTotal, '##.00')"/>
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
								<xsl:when test="number(ExpressLane/Order/OrderInformation/DepositTotal)">
									<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/DepositTotal, '$##.00')"/>
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
								<xsl:when test="ExpressLane/Order/OrderInformation/TaxTotal &gt; 0">
									<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/TaxTotal, '##.00')"/>
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
                           	 	<xsl:when test="ExpressLane/Order/OrderInformation/DeliveryType = 'Delivery'">Delivery </xsl:when>
                            	<xsl:otherwise>Pickup </xsl:otherwise>
                            </xsl:choose>
					 Fee:</td>
					<td>
						<strong>$
							<xsl:choose>
								<xsl:when test="ExpressLane/Order/OrderInformation/AppliedDeliveryFee &gt; 0">
									<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/AppliedDeliveryFee, '##.00') "/>
								</xsl:when>
								<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
				<xsl:if test="count(ExpressLane/Order/Promotion/OrderPromotion) &gt; 0">
				<tr>
					<td align="right">
						Promotions:
						<ul>
							<xsl:for-each select="ExpressLane/Order/Promotion/OrderPromotion">
								<xsl:variable name="promototal" select="format-number(DiscountAmount, '$##.00')" />
								<li><xsl:value-of select="concat(Description, ' - ', $promototal)" /> </li>
							</xsl:for-each>
						</ul>
					</td>
					<td>
						<xsl:variable name="promotiontotal" select="sum(ExpressLane/Order/Promotion/OrderPromotion/DiscountAmount)" />
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
								<xsl:when test="ExpressLane/Order/OrderInformation/Total &gt; 0">
									<xsl:value-of select="format-number(ExpressLane/Order/OrderInformation/Total, '##.00')"/>
								</xsl:when>
								<xsl:otherwise>
									0.00
								</xsl:otherwise>
							</xsl:choose>
						</strong>
					</td>
				</tr>
			</table>

		    <xsl:if test="count(//ArrayOfCoupon/Coupon) &gt; 0">
				<div class="store-coupons">
					<h2>Store Coupons</h2>
					<xsl:for-each select="//ArrayOfCoupon/Coupon">
						<xsl:call-template name="StoreCoupon" />
					</xsl:for-each>
				</div>
			</xsl:if> 

			<p>
				<em>Items without prices will be specified at time of <xsl:choose>
                           	 	<xsl:when test="ExpressLane/Order/OrderInformation/DeliveryType = 'Delivery'"> delivery. </xsl:when>
                            	<xsl:otherwise> pickup. </xsl:otherwise>
                            </xsl:choose></em>
			</p>
			<xsl:if test="number(//Order/ReservedPoints)">
				<p>
					<em>** Points discounts will be calculated at delivery/pickup.</em>
				</p>
			</xsl:if>
			<p>Thank you for shopping with us at <a><xsl:attribute name="href"><xsl:value-of select="ExpressLane/Order/Chain/PreferedHost"/></xsl:attribute><xsl:value-of select="ExpressLane/Order/Chain/ChainName"/></a>.</p>
            
            <xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
					<div class="StaticContent">
						<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
							<xsl:sort select="SortBy" data-type="number"/>
							<xsl:value-of select="Description" disable-output-escaping="yes"/>
						</xsl:for-each>
					</div>
				</xsl:if>
                
                
		</body>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="InvoiceListItems" match="OrderItem">
		<tr>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:150px;">
				<xsl:value-of select="UPC11"/>
			</td>
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;width:250px;">
				<xsl:value-of select="Description"/>
				<xsl:if test="string-length(Comment) &gt; 0">
					<br /><strong>Comments: </strong><xsl:value-of select="Comment" />
				</xsl:if>
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
			<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px; width:75px;">
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
	
<!-- ========================================================================================== -->

	<xsl:template name="InvoiceCategoryItems" match="Category">
		<xsl:variable name="CategoryID" select="CategoryID" />
		<h3><xsl:value-of select="CategoryName" /></h3>
		<table cellpadding="5" cellspacing="0" width="625">
			<tr>
				<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">UPC</td>
				<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Description</td>
				<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Qty</td>
				<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left">Unit Price</td>
				<td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;border:1px solid #999;" align="left" width="75">Price</td>
			</tr>
			<xsl:for-each select="//Order/Items/OrderItem[CategoryID = $CategoryID]">
				<xsl:call-template name="InvoiceListItems"/>
			</xsl:for-each>
		</table>
	</xsl:template>

<!-- ========================================================================================== -->

	<xsl:template name="InvoiceCustomerInformation" match="Consumer">
		<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:value-of select="FirstName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="LastName"/>
		<br/>
		<xsl:if test="translate(//GenericChain/ChainSettings/Setting[SettingID=333]/Value,$upper,$lower) = 'true'">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=8]/Value) &gt; 0">
					<xsl:value-of select="concat(//GenericChain/ChainSettings/Setting[SettingID=8]/Value, ' Number: ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Loyalty Card Number: </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="//GenericConsumer/ExternalID" />
			<br />
		</xsl:if>
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
<!-- ========================================================================================== -->
	<xsl:template name="StoreCoupon" match="//ArrayOfCoupon/Coupon">
		<div id="couponContainerDiv">
			<table border="0" cellpadding="4" cellspacing="0" width="100%">
				<tbody style="font-family: arial">
					<tr height="30">
						<td rowspan="3" align="center" width="150">
							<xsl:if test="ImageURL">
								<img id="productImage" src="{ImageURL}" border="0"/>
								<br/>
							</xsl:if>
							<xsl:if test="BarCodeImageURL != '' and BarCodeImageURL != ImageURL">
								<img id="barcodeImage" class="barcodeImage" src="{BarCodeImageURL}" border="0"/>
							</xsl:if>
						</td>
						<td align="center">
							<div style="background-color:black; width:auto; border:1px solid black; float:left; color:white; padding:4px 10px; text-align:center; text-transform:uppercase">
								<xsl:variable name="DisplayName">
									<xsl:choose>
										<xsl:when test="string-length(//ChainSettings/Setting[Name='StoreCouponChainName']/Value) &gt; 0">
											<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponChainName']/Value" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>STORE COUPON</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
							
								<xsl:value-of select="$DisplayName" />
							</div>
							<div style="background-color:white; width:180px; border:1px solid black; float:left; color:black; padding:4px 10px; text-align:center;">
								<xsl:if test="EndDate != ''">
									<xsl:variable name="edate" select="EndDate"/>EXPIRES
									<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
								</xsl:if>&#xA0;</div>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:if test="PLU != ''">
								<div class="PLU" style="clear:both; font-size:10px">
									<strong class="PLU">PLU:</strong>
									<xsl:value-of select="PLU"/>
								</div>
							</xsl:if>
							<xsl:if test="Plu != ''">
								<!-- XML node names are different in admin -->
								<div class="PLU" style="clear:both; font-size:10px">
									<strong class="PLU">PLU:</strong>
									<xsl:value-of select="Plu"/>
								</div>
							</xsl:if>
							<xsl:if test="BrandName">
								<div class="BN" style="clear:both; font-size:18px; font-weight:bold;">
									<xsl:value-of select="BrandName"/>
								</div>
							</xsl:if>
							<xsl:if test="ProductVariety">
								<div class="PV" style="clear:both; font-size:16px; font-weight:bold;">
									<xsl:value-of select="ProductVariety"/>
								</div>
							</xsl:if>
							<xsl:if test="TopTagLine">
								<div class="TTL" style="clear:both; font-size:16px">
									<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
								</div>
							</xsl:if>
							<xsl:if test="PrimarySavingDescription">
								<div class="PSDSSD" style="clear:both; font-size:9px; margin-top:10px; ">
									<xsl:value-of select="PrimarySavingDescription"/>
									<xsl:if test="SecondarySavingDescription">
										<br/>
										<xsl:value-of select="SecondarySavingDescription"/>
									</xsl:if>
								</div>
							</xsl:if>
							<xsl:if test="Price">
								<div class="PRICE" style="clear:both; font-size:10px">
									<xsl:variable name="price" select="Price"/>
									<xsl:value-of select="concat('$',substring($price,1,5))"/>
								</div>
							</xsl:if>
							<xsl:if test="PrimarySavingsDescription">
								<div class="SD" style="clear:both; font-size:10px">
									<xsl:value-of select="PrimarySavingsDescription"/>
								</div>
							</xsl:if>
							<xsl:if test="BottomTagLine">
								<div class="BTL" style="clear:both; font-size:8px">
									<xsl:value-of select="BottomTagLine" disable-output-escaping="yes"/>
								</div>
							</xsl:if>
							<!-- <xsl:value-of select="department_name"/><br/> -->
						</td>
					</tr>
					<tr>
						<td colSpan="2">
							<img>
								<xsl:attribute name="src">##root##/Assets/##chainid##/Images/printlogo.gif</xsl:attribute>
								<xsl:attribute name="align">right</xsl:attribute>
								<xsl:attribute name="border">0</xsl:attribute>
								<xsl:attribute name="style">max-height:40px; *height:40px;</xsl:attribute>
							</img>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- couponContainerDiv -->
		<xsl:if test="position() mod 4 = 0">
			<xsl:if test="position()!=last()">
				<div id="pagebreak" style="page-break-after:always"></div>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
