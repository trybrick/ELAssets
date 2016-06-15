<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:key name="CatID" match="ExpressLane/ConsumerCoupons/AvailableCoupons/YouTechCoupon" use="CategoryID"/>
	<xsl:key name="category" match="ExpressLane/ConsumerCoupons/AvailableCoupons/YouTechCoupon" use="Category" />
	<xsl:output method="html"/>
	
	<xsl:template name="YouTechCouponsDisplay" match="/">
		<xsl:if test="//GenericConsumer/IsLoggedIn != 'true'">
			<p class="signup-message group">
				<span>
					<a href="{//GenericChain/PreferredHost}/Profile/SignIn.aspx">Sign in</a>
					<xsl:text> to add coupons to your card. Need a card? Visit your nearest location to sign up. </xsl:text>
				</span>
				<!--<a class="button">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=334]/Value) &gt; 0">
								<xsl:value-of select="concat(//GenericChain/PreferredHost,//GenericChain/ChainSettings/Setting[SettingID=334]/Value)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(//GenericChain/PreferredHost,'/Profile/SignUp.aspx')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<span>Sign up for free</span>
				</a>-->
			</p>
		</xsl:if>
		<div id="youtechCategories">
			<h2>
				<xsl:choose>
					<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=349]/Value) &gt; 0">
						<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=349]/Value" />	
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Digital Coupons</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</h2>
			<xsl:if test="ExpressLane/ConsumerCoupons//YouTechCoupon[IsTargeted ='true']">
			<h3 id="leftCategoryExclusive">
				<a href="javascript:void(0);">
					<xsl:attribute name="onclick">sortDigitalCoupons('Brand:Exclusive');jQuery('.limitedcoupon').show();</xsl:attribute>
					limited time e-clips
					</a>
			</h3>
			</xsl:if>
			<xsl:call-template name="CouponList"/>	
			
		</div>
    <xsl:if test="ExpressLane/ConsumerCoupons//YouTechCoupon[IsTargeted = 'true']">
      <div class="Brand:Exclusive limitedcoupon" style="clear:both;">
        <h3 style="margin-bottom:-30px;padding-top:20px;clear:both;">limited time e-clips</h3>
        <div style=" overflow: hidden;">
        <xsl:for-each select="ExpressLane/ConsumerCoupons//YouTechCoupon[IsTargeted ='true']">			
          <xsl:call-template name="YouTechCouponDetails"/>		
        </xsl:for-each>	
        </div>
        <h3 style="margin-top:30px;margin-bottom:-30px;padding-top:40px;clear:both;">Digital Coupons</h3>
      </div>		
    </xsl:if>
		<xsl:for-each select="ExpressLane/ConsumerCoupons/AvailableCoupons/YouTechCoupon[generate-id(.)=generate-id(key('category',Category)[1])]">
			<xsl:call-template name="CouponCategory">
				<xsl:with-param name="Cat" select="Category"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!-- ================================================================= -->
	<!-- creates the list -->
	
	<xsl:template name="CouponList" match="ExpressLane/ConsumerCoupons/AvailableCoupons">

    <xsl:for-each  select="ExpressLane/ConsumerCoupons/AvailableCoupons/YouTechCoupon[generate-id(.)=generate-id(key('category',Category)[1])]">
      <xsl:sort select="Category" />
      <xsl:if test="count(key('category', Category)) &gt; 0">
        <h3>
          <xsl:attribute name="id">
            leftCategory<xsl:value-of select="Category"/>
          </xsl:attribute>
          <a href="javascript:void(0);">
            <xsl:attribute name="onclick">
              sortDigitalCoupons('Brand:<xsl:value-of select="Category"/>');jQuery('.limitedcoupon').hide();
            </xsl:attribute>
            <xsl:value-of select="Category"/>
          </a>
        </h3>
      </xsl:if>
    </xsl:for-each>  
			
	</xsl:template>
  
	<xsl:template  match="YouTechCoupon">        
            <xsl:if test="count(key('category', Category)) &gt; 0">
			<h3>
				<xsl:attribute name="id">leftCategory<xsl:value-of select="Category"/></xsl:attribute>
				<a href="javascript:void(0);">
					<xsl:attribute name="onclick">sortDigitalCoupons('Brand:<xsl:value-of select="Category"/>');jQuery('.limitedcoupon').hide();</xsl:attribute>
					<xsl:value-of select="Category"/>
				</a>
			</h3>
		</xsl:if>
    </xsl:template>
	
	
	<!-- ================================================== -->
	<xsl:template name="CouponCategory" match="ConsumerCoupons">
		<xsl:param name="Cat"/>
		<xsl:if test="count(//YouTechCoupon[Category = $Cat]) &gt; 0">
			<div class="Brand:{$Cat}">
				<xsl:for-each select="//YouTechCoupon[Category = $Cat and IsTargeted = 'false']">
					<xsl:sort select="Category"/>
					<xsl:call-template name="YouTechCouponDetails">
						<xsl:with-param name="CouponCat" select="Category"/>
					</xsl:call-template>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- ================================================== -->
	<xsl:template name="YouTechCouponDetails" match="YouTechCoupon">
		<xsl:variable name="apos">'</xsl:variable>
		<xsl:variable name="YouTechCouponID" select="YouTechCouponID"/>
		<xsl:variable name="AddCouponResultID" select="concat('addCouponResult', CouponID)"/>
		<xsl:variable name="LongDescription" select="LongDescription"/>
		<div class="couponsContainer youTechCoupon">
			<div class="couponsFrame">
				<div class="couponsSavings">
					<xsl:text>SAVE </xsl:text>
					<xsl:if test="number(SavingsAmount)&gt;0">
						<br/>
						<xsl:value-of select="format-number(number(SavingsAmount), '$#.00')"/>
					</xsl:if>
				</div>
				<xsl:if test="string-length(ImageURL) &gt; 0">
					<div class="couponsImage">
						<xsl:if test="string-length($LongDescription) &gt; 0">
							<xsl:attribute name="onmouseover">
								<xsl:value-of select="concat('doTipFromText(this, ', $apos, $LongDescription, $apos, ', ', $apos, 'Card Member Coupon', $apos, ');')"/>
							</xsl:attribute>
						</xsl:if>
						<img alt="" src="{ImageURL}"/>
					</div>
				</xsl:if>
				<div class="couponsDescription">
					<p class="shortDescription">
						<xsl:value-of select="ShortDescription" disable-output-escaping="yes"/>
					</p>
					<!--<a href="#">link to full description</a>-->
					<p>
						<xsl:value-of select="RequirementDescription" disable-output-escaping="yes"/>
					</p>
					<xsl:variable name="expDate">
						<xsl:value-of select="concat(substring(ExpirationDate, 6 , 2) , '/' , substring(ExpirationDate, 9 , 2) , '/', substring(ExpirationDate, 3, 2) )"/>
					</xsl:variable>
					<xsl:if test="string-length($expDate) &gt; 0">
						<p>Expiration Date: <xsl:value-of select="$expDate"/></p>
					</xsl:if>
				</div>
				<xsl:choose>
					<xsl:when test="(//GenericConsumer/IsLoggedIn = 'true') and (//ConsumerCoupons/Code = 100) and (string-length(//GenericConsumer/ExternalID) &gt; 0)">
						<xsl:choose>
							<xsl:when test="//ConsumerCoupons/TakenCoupons/YouTechCoupon[YouTechCouponID = $YouTechCouponID]">
								<p id="{$AddCouponResultID}" class="addCouponResult">
									<span class="addCouponResponseMessage">Coupon Added to Card</span>
								</p>
							</xsl:when>
							<xsl:otherwise>
								<p id="{$AddCouponResultID}" class="addCouponResult">
									<a class="button card" href="javascript:void(0);">
										<xsl:attribute name="onclick">GSNServices.YouTechService.AddYouTechCoupon(<xsl:value-of select="CouponID"/>, <xsl:value-of select="$YouTechCouponID"/>, '<xsl:value-of select="$AddCouponResultID"/>');</xsl:attribute>
										<span>Add Coupon to Card</span>
									</a>
								</p>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<a class="button card" href="{//GenericChain/PreferredHost}/Profile/SignIn.aspx">
							<span>Add Coupon to Card</span>
						</a>
					</xsl:otherwise>
				</xsl:choose>
				<div id="loading{CouponID}" class="loading-animation"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
