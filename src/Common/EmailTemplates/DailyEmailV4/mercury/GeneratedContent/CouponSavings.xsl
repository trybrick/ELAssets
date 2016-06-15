<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<xsl:variable name="destination" select="'##root##/Shop/Coupons.aspx'"/>
		<div id="podCouponSavings" class="EmailPod">
			<h2>Coupon Savings</h2>
			<a href="{$destination}">
				<table>
					<tr>
						<td>
							<xsl:text>You Could Save</xsl:text>
							<span>##manufacturercoupontotalsavings##</span>
							<xsl:text>This Week!</xsl:text>
						</td>
					</tr>
				</table>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
