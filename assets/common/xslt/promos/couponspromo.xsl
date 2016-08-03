<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">
		<![CDATA[

			function HighlightCoupon(elementID) {
		
				var parentElement = $(elementID);

				if (parentElement == null) {
					return;
				}

				parentElement.addClassName('activeCoupon');

				var linksInParent = $$('#' + elementID + ' a');


				if (linksInParent != null) {
					
					for (var i = 0; i < linksInParent.length; i++) {
						linksInParent[i].addClassName('activeCoupon');
					}
				}
			}
		]]>
		</script>
		<div id="CouponPromo">
			<xsl:value-of select="//CouponPromo/PageCopy" disable-output-escaping="yes" />
			<xsl:for-each select="//CouponPromo/CouponHierarchy/Group[CouponCodes/Code = //Coupon/CouponCode]">
				<div class="CouponsGrid">
					<h2><xsl:value-of select="Title" /></h2>
					<xsl:for-each select="CouponCodes/Code">
						<xsl:call-template name="CouponByCode" />
					</xsl:for-each>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="Code" name="CouponByCode">
		<xsl:param name="Code" select="text()" />
		<xsl:apply-templates select="//ArrayOfCoupon/Coupon[CouponCode = $Code]" />
	</xsl:template>
	<xsl:template name="CouponDisplay" match="Coupon">
		<xsl:param name="couponID" select="CouponID" />
		<xsl:param name="InList" select="count(//VisibleItems/GenericShoppingListItem[ItemTypeID = 2][ItemID = $couponID])" />
		<div class="couponsContainer">
			<div>
				<xsl:choose>
					<xsl:when test="$InList &gt; 0">
						<xsl:attribute name="class">couponsFrame activeCoupon</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">couponsFrame</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="id">couponsFrameTopN<xsl:value-of select="CouponID"/></xsl:attribute>
				<div>
					<xsl:attribute name="class">couponsSavings</xsl:attribute>
					<xsl:if test="number(SavingsAmount)=0">
						<xsl:attribute name="style">padding-top:18px</xsl:attribute>
					</xsl:if>SAVE<xsl:if test="number(SavingsAmount)=0">!</xsl:if>
					<xsl:if test="number(SavingsAmount)&gt;0">
						<br/><xsl:value-of select="format-number(SavingsAmount,'$#.00')"/>
					</xsl:if>
				</div>
				<div class="couponsImage">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageURL"/>
						</xsl:attribute>
					</img>
				</div>
				<a>
					<xsl:if test="$InList &gt; 0">
						<xsl:attribute name="class">activeCoupon</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="id">couponsFrameTopNButton<xsl:value-of select="CouponID"/></xsl:attribute>
					<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="CouponID"/>', <xsl:choose><xsl:when test="CouponType=1">2</xsl:when><xsl:when test="CouponType=2">10</xsl:when></xsl:choose>);</xsl:attribute>
					<xsl:attribute name="onclick">HighlightCoupon('couponsFrameTopN<xsl:value-of select="CouponID"/>');</xsl:attribute>
				</a>
				<xsl:if test="CouponType = 1">
					<div style="display:none;">
						<xsl:attribute name="class">
							<xsl:value-of select="concat('ItemData_', CouponID, '_2')" />
						</xsl:attribute>
						<span class="ExportKeyID"><xsl:value-of select="ExportKeyID" /></span>
					</div>
				</xsl:if>
				<div class="couponsDescription">
					<xsl:value-of select="Description"/>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>