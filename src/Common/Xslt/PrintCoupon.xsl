<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template name="PrintCoupon" match="/">
	<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingListPage.js"/>
	<script id="jsCouponsController" type="text/javascript" src="/Assets/Common/Js/Coupons/CouponPrintController.js"></script>
	<script id="jsCouponsInc" type="text/javascript" src="/Assets/Common/Js/Coupons/CouponPrinting.js"></script>	
	<iframe id="runhere" src="about:blank" width="1" height="1" style="visibility: hidden"></iframe>
	<iframe id="pmgr" src="about:blank" width="1" height="1" style="visibility: hidden"></iframe>
	<a href="javascript:void(0)" class="button" style="clear:left;float:right;">
		<xsl:attribute name="onclick">PrintShoppingListItems();</xsl:attribute>
		<span>Print</span>
	</a>
		<xsl:choose>
			<xsl:when test="ExpressLane/PrintCoupons/PrintTokenWithMsg/Status = 'OK'">
				<div style="margin: 0pt 0pt 0pt 15px;" class="print-help">
					<h3 style="clear:both">Manufacturer Coupon Print Status (must submit all coupons to redeem savings)</h3>
					<script type="text/javascript">
						var couponIds = '<xsl:for-each select="ExpressLane/PrintCoupons/ArrayOfCoupon/Coupon"><xsl:value-of select="CouponCode"/>,</xsl:for-each>';
					</script>
					<ul>						
						<xsl:for-each select="ExpressLane/PrintCoupons/ArrayOfCoupon/Coupon">
							<xsl:call-template name="CouponStatus" />
						</xsl:for-each>
					</ul>
					<p>Trouble printing manufacturer coupons? Download and install the Coupon Printing Plugin:<br/>
						<a href="http://cdn.coupons.com/ftp.coupons.com/Partners/CouponPrinter.exe">Windows Coupon Printing Plugin</a>
						<span> | </span>
						<a href="http://cdn.coupons.com/ftp.coupons.com/safari/MacCouponPrinter.dmg">Mac Coupon Printing Plugin</a>
					</p>
				    <ul id="log" style="display: none">
				      <li>Please view plugin data with javascript console.</li>
				    </ul>
				</div>
				<script type="text/javascript">
				</script>
			</xsl:when>
			<xsl:otherwise>
				<script type="text/javascript">Event.observe(window, 'load', GSN.CouponPrinting.AutoPrintList);</script>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CouponStatus" match="Coupon">
		<xsl:param name="CouponID" select="CouponID" />
		<xsl:param name="ExternalID" select="CouponCode" />
		<li>
			<xsl:value-of select="Description" />
			<xsl:choose>
				<xsl:when test="//PrintTokenWithMsg/ErrorCoupons/ErrorCoupon[CouponID = $ExternalID]">
					- Failed To Print: <xsl:value-of select="//PrintTokenWithMsg/ErrorCoupons/ErrorCoupon[CouponID = $ExternalID]/ErrorMessage" />
				</xsl:when>
				<xsl:otherwise>
					- Printing
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>
</xsl:stylesheet>
