<?xml version="1.0"?><!-- DWXMLSource="../../../Desktop/xml/119-PageTypeId-89-Coupons.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:key name="CatIDTopN" match="ExpressLane/DisplayCoupons/CouponsTopN/ArrayOfCoupon/Coupon" use="CategoryID"/>
	<xsl:key name="CatIDStore" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon" use="CategoryID"/>
	<xsl:key name="CatID" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon" use="CategoryID"/>
	<xsl:output method="html"/>

	<xsl:template match="/">
	<script type="text/javascript">
		
		function highlightCoupon(couponID){
		$('couponsFrame'+couponID).addClassName('activeCoupon').show();
		$('couponsFrameButton'+couponID).addClassName('activeCoupon').show();
		$('couponsFrameTopN'+couponID).addClassName('activeCoupon').show();
		$('couponsFrameTopNButton'+couponID).addClassName('activeCoupon').show();
		}

	</script>
	<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
		<div class="StaticContent">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number" />
				<xsl:value-of select="Description" disable-output-escaping="yes" />
			</xsl:for-each>
		</div>
	</xsl:if>	
<!-- pull chain-specific coupons -->

	<xsl:if test="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon[CouponType=2]">
		<div class="CouponsGrid" id="gridLayout">
			<h2><xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> In-Store Coupons</h2>
			<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
					<xsl:call-template name="CouponDetailStore">
						<xsl:with-param name="CouponCatID" select="CategoryID"/>
					</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:if>

<!-- or... pull the four random coupons at the top -->

	<xsl:if test="count(ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon[CouponType=2])=0">
		<div class="CouponsGrid" id="gridLayout">
	    	<h2>Featured Coupons</h2>
			<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
				<xsl:call-template name="CouponDetailTopN">
					<xsl:with-param name="CouponCatIDTopN" select="CategoryID"/>
				</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:if>

<!-- pull the rest -->

	<div class="CouponsGrid" id="gridLayout">
		<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
			<xsl:sort select="CategoryName"/>
			<xsl:call-template name="CouponDetail">
				<xsl:with-param name="CouponCatID" select="CategoryID"/>
			</xsl:call-template>
		</xsl:for-each>
	</div>
	
	</xsl:template>


	<xsl:template name="CouponDetailTopN" match="ExpressLane/DisplayCoupons/CouponsTopN/ArrayOfCoupon/Coupon">
		<xsl:param name="CouponCatIDTopN"/>
			<xsl:for-each select="key('CatIDTopN',  $CouponCatIDTopN)">
				
				
				<div class="couponsContainer">
					<div>
						 	<xsl:attribute name = "class">couponsFrame</xsl:attribute>
							<xsl:if test="position() mod 4 = 0">
								<xsl:attribute name = "class">couponsFrame last</xsl:attribute>
							</xsl:if>
							<xsl:attribute name = "id">couponsFrameTopN<xsl:value-of select="CouponID" /></xsl:attribute>
							
							<div>
								<xsl:attribute name="class">couponsSavings</xsl:attribute>
								<xsl:if test="number(SavingsAmount)=0"><xsl:attribute name="style">padding-top:18px</xsl:attribute></xsl:if>
									SAVE<xsl:if test="number(SavingsAmount)=0">!</xsl:if>
									<xsl:if test="number(SavingsAmount)&gt;0"><br/>$<xsl:value-of select="format-number(SavingsAmount,'#.00')" /></xsl:if>
							</div>
							<div class="couponsImage">
									<img>
										<xsl:attribute name="src"><xsl:value-of select="ImageURL"/></xsl:attribute>
									</img>
							</div>
							<a>
								<xsl:attribute name = "id">couponsFrameTopNButton<xsl:value-of select="CouponID" /></xsl:attribute>
								<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="CouponID" />',<xsl:choose><xsl:when test="CouponType=1">2</xsl:when><xsl:when test="CouponType=2">10</xsl:when></xsl:choose>);</xsl:attribute>
								<xsl:attribute name = "onclick">highlightCoupon(<xsl:value-of select="CouponID" />);</xsl:attribute>
							</a>
							<div class="couponsDescription"><xsl:value-of select="Description"/></div>
					</div>
				</div>

			</xsl:for-each>
	</xsl:template>
 	<xsl:template name="CouponDetailStore" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon">
		<xsl:param name="CouponCatID"/>
			<xsl:for-each select="key('CatIDStore',  $CouponCatID)">
				<xsl:if test="CouponType=2">
				<div class="couponsContainer">
					<div>
						 	<xsl:attribute name = "class">couponsFrame</xsl:attribute>
							<xsl:if test="position() mod 4 = 0">
								<xsl:attribute name = "class">couponsFrame last</xsl:attribute>
							</xsl:if>
							<xsl:attribute name = "id">couponsFrame<xsl:value-of select="CouponID" /></xsl:attribute>
							
							<div class="couponsStoreSavings"> </div>
							<div class="couponsImage">
									<img>
											<xsl:if test="ImageURL != ''">									
												<xsl:attribute name="src"><xsl:value-of select="ImageURL"/></xsl:attribute>
											</xsl:if>
											<xsl:if test="ImageURL = false()">									
												<xsl:attribute name="src">/Assets/Common/Images/coupon_empty_image.gif</xsl:attribute>
											</xsl:if>
									</img>
							</div>
							<a>
								<xsl:attribute name = "id">couponsFrameButton<xsl:value-of select="CouponID" /></xsl:attribute>
								<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="CouponID" />', 10);</xsl:attribute>
								<xsl:attribute name = "onclick">highlightCoupon(<xsl:value-of select="CouponID" />);</xsl:attribute>
							</a>
							<div class="couponsDescription"><xsl:value-of select="Description"/></div>
					</div>
				</div>
					<xsl:if test="position() mod 4 = 0">
						<xsl:if test="position() != last()">
							<div class="couponClear" />
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:template>
		<xsl:template name="CouponDetail" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon">
			<xsl:param name="CouponCatID"/>

			<xsl:if test="CategoryID != '-1'">

				<xsl:if test="count(key('CatID',  $CouponCatID)) &gt; 0">
					<h2>
						<xsl:value-of select="CategoryName"/>
					</h2>
				</xsl:if>
				<xsl:for-each select="key('CatID',  $CouponCatID)">

					<div class="couponsContainer">
						<div>
							<xsl:attribute name = "class">couponsFrame</xsl:attribute>
							<xsl:if test="position() mod 4 = 0">
								<xsl:attribute name = "class">couponsFrame last</xsl:attribute>
							</xsl:if>
							<xsl:attribute name = "id">
								couponsFrame<xsl:value-of select="CouponID" />
							</xsl:attribute>

							<div>
								<xsl:attribute name="class">couponsSavings</xsl:attribute>
								<xsl:if test="number(SavingsAmount)=0">
									<xsl:attribute name="style">padding-top:18px</xsl:attribute>
								</xsl:if>
								SAVE<xsl:if test="number(SavingsAmount)=0">!</xsl:if>
								<xsl:if test="number(SavingsAmount)&gt;0">
									<br/>$<xsl:value-of select="format-number(SavingsAmount,'#.00')" />
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
								<xsl:attribute name = "id">couponsFrameButton<xsl:value-of select="CouponID" /></xsl:attribute>
								<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="CouponID" />', 2);</xsl:attribute>
								<xsl:attribute name = "onclick">highlightCoupon(<xsl:value-of select="CouponID" />);</xsl:attribute>
							</a>
							<xsl:if test="CouponType = 1">
								<div style="display:none;">
									<xsl:attribute name="class">
										<xsl:value-of select="concat('ItemData_', CouponID, '_2')" />
									</xsl:attribute>
									<span class="ExportKeyID"><xsl:value-of select="ExportKeyID" /></span>
								</div>
							</xsl:if>
							<div class="couponsDescription"><xsl:value-of select="Description"/></div>
					</div>
				</div>
								
				<xsl:if test="position() mod 4 = 0"><xsl:if test="position() != last()"><div class="couponClear" /></xsl:if></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
