<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/" name="IconLegend">
<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
<xsl:variable name="HasUpromise" select="translate(//ChainSettings/Setting[Name='HasUPromise']/Value,$ucletters,$lcletters) = 'true'" />
<xsl:variable name="HasCoupons" select="string-length(//GenericChain/ManufacturerCouponSiteCode) &gt; 0" />
<xsl:if test="$HasUpromise or $HasCoupons">
<table id="icon-legend">
	<thead>
		<tr>
			<th scope="col">Icon</th>
			<th scope="col">Meaning</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<xsl:if test="$HasCoupons">
				<td>
					<xsl:choose>
						<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='ChainProductAttributeCouponHTML']/Value) &gt; 0">
							<!-- show chain setting defined icon -->
							<xsl:value-of select="//GenericChain/ChainSettings/Setting[Name='ChainProductAttributeCouponHTML']/Value" disable-output-escaping="yes" />
						</xsl:when>
						<xsl:otherwise>
							<!-- show default icon -->
							<img alt="Coupon Icon" class="couponAvailableIcon" src="/Assets/Common/Images/shoplist_coupons_icon.gif" border="0" />
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="couponAvailableText">Coupon Available</td>
				<td><img src="/Assets/Common/Images/spacer.gif" border="0" width="20" alt="" /></td>
			</xsl:if>
			<xsl:if test="$HasUpromise">
				<td>
					<xsl:choose>
						<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='ChainProductAttributeUPromiseHTML']/Value) &gt; 0">
							<!-- show chain setting defined icon -->
							<xsl:value-of select="//GenericChain/ChainSettings/Setting[Name='ChainProductAttributeUPromiseHTML']/Value" disable-output-escaping="yes" />
						</xsl:when>
						<xsl:otherwise>
							<!-- show default icon -->
							<img alt="UPromise Icon" class="upromiseEligibleIcon" src="/Assets/common/images/UPromiseIcon.gif" border="0" />
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="upromiseEligibleText">Upromise Eligible</td>
			</xsl:if>
		</tr>
	</tbody>
</table>
</xsl:if>
</xsl:template>
</xsl:stylesheet>