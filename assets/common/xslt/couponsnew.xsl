<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	
  <xsl:import href="/Assets/common/xslt/CouponsFAQ.xsl"/>
	<xsl:key name="CatID" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon" use="CategoryID"/>
	<xsl:output method="html"/>

	<xsl:template match="/" name="AdPodMaster">
		<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'9'"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template name="AdPod" match="ExternalAds">
		<xsl:param name="Tile"/>
		<xsl:param name="Request" select="AdPods/AdPod[Tile=$Tile]/Request"/>
		<xsl:param name="Zone" select="AdPods/AdPod[Tile=$Tile]/Zone"/>
		<xsl:param name="UnitName" select="AdPods/AdPod[Tile=$Tile]/UnitName"/>
		<xsl:param name="UnitNameRoot" select="AdPods/AdPod[Tile=$Tile]/UnitNameRoot"/>
		<xsl:param name="Departments" select="AdPods/AdPod[Tile=$Tile]/Departments"/>
		<xsl:param name="BrandName" select="AdPods/AdPod[Tile=$Tile]/BrandName"/>
		<xsl:param name="PageName" select="AdPods/AdPod[Tile=$Tile]/PageName"/>
		<xsl:variable name="sep" select='"&apos;,&apos;"'/>
		<xsl:variable name="apos" select='"&apos;"'/>
		<xsl:if test="$Request">
			<div id="brxLeaderboardSmall"></div>
		</xsl:if>
	</xsl:template>

<!-- ================================================================= -->
	
  <xsl:template match="/">
	  <xsl:variable name="IsLoggedIn" select="//GenericConsumer/IsLoggedIn"></xsl:variable>
	  <xsl:variable name="HelpText" select="//GenericChain/ChainSettings/Setting[SettingID=262]/Value"></xsl:variable>
		<xsl:variable name="ConsumerCardNumber">
			<xsl:choose>
				<xsl:when test="$IsLoggedIn = 'true' and string-length(//GenericConsumer/ExternalID) &gt; 0">
					<xsl:value-of select="number(//GenericConsumer/ExternalID)" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="IsYouTechChain" select="string-length(//GenericChain/ChainSettings/Setting[SettingID=315]/Value) &gt; 0"></xsl:variable>
		<xsl:variable name="CardCouponsTitle">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=349]/Value) &gt; 0">
					<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=349]/Value" />	
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Card Member Coupons</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="CardCouponsdescription">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=350]/Value) &gt; 0">
					<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=350]/Value" disable-output-escaping="yes"/>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Add coupons to your Card and present it at checkout. &lt;br/&gt;No printing necessary.</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$IsYouTechChain = 'true'">
			<script type="text/javascript" src="/Assets/Common/js/YouTech/YouTechService.js" />
			<script type="text/javascript" src="/Assets/Common/js/YouTech/YouTechCoupons.js" />
		</xsl:if>
		<div id="Coupons">
			<xsl:variable name="GridStyle">
				<xsl:choose>
					<xsl:when test="ExpressLane/GenericConsumer/ConsumerSettings/Setting[SettingID = 6]">
						<xsl:value-of select="ExpressLane/GenericConsumer/ConsumerSettings/Setting[SettingID = 6]/Value"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<script type="text/javascript" src="/Assets/Common/js/Settings/ConsumerSettings.js"/>
			<script type="text/javascript" src="/Assets/Common/js/Coupons/Coupons.js" />
			<script type="text/javascript">
				states=new Array();
				<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
					states[<xsl:value-of select="position()"/>]="leftCategory<xsl:value-of select="CategoryID"/>";
				</xsl:for-each>
			</script>
			<xsl:call-template name="AdPodMaster"></xsl:call-template>
			<div class="couponsPageGrid">
				<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
					<div class="StaticContent">
						<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
							<xsl:sort select="SortBy" data-type="number"/>
							<xsl:value-of select="Description" disable-output-escaping="yes"/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="count(//ArrayOfGenericStore/GenericStore) &gt; 1">
					<div class="couponsDisclaimer">Some items may not be carried in all stores.</div>
				</xsl:if>
				<div class="gridSwapLayout">
          <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="id">swapGrid1</xsl:attribute>
            <xsl:attribute name="class">
              gridStyleIcon1<xsl:if test="$GridStyle = 1"> active</xsl:if>
            </xsl:attribute>
            <xsl:attribute name="onclick">swapGridStyles(1);</xsl:attribute>
          </xsl:element>
          <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="id">swapGrid2</xsl:attribute>
            <xsl:attribute name="class">
              gridStyleIcon2<xsl:if test="$GridStyle = 2"> active</xsl:if>
            </xsl:attribute>
            <xsl:attribute name="onclick">swapGridStyles(2);</xsl:attribute>
          </xsl:element>
          <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="id">swapGrid3</xsl:attribute>
            <xsl:attribute name="class">
              gridStyleIcon3<xsl:if test="$GridStyle = 3"> active</xsl:if>
            </xsl:attribute>
            <xsl:attribute name="onclick">swapGridStyles(3);</xsl:attribute>
          </xsl:element>
          <xsl:element name="a">
            <xsl:attribute name="href">#lightboxFAQ</xsl:attribute>
            <xsl:attribute name="title">Coupons Help</xsl:attribute>
            <xsl:attribute name="id">help</xsl:attribute>
            <xsl:attribute name="class">lightwindow</xsl:attribute>
            <xsl:attribute name="params">lightwindow_width=700,lightwindow_height=400</xsl:attribute>
            <xsl:choose>
              <xsl:when test="$HelpText">
                <xsl:value-of select="$HelpText"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>Help</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
				</div>
				<div class="clear"></div>
				<!-- lets build the listing on the left -->
				<div class="CategoryDisplayContainer" id="categoryDisplayContainer">
					<div class="couponsIntroCopy">Click below to sort store coupons by a desired category. All other coupons follow.</div>
					
					<!-- store coupons need to be at the top -->
					<xsl:if test="$IsYouTechChain = 'true'">
						<h2>Store Coupons</h2>
					</xsl:if>
					
					
					
					<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category[CategoryID='-1']">
						<xsl:sort select="CategoryName"/>
						<xsl:call-template name="CouponCategoryList">
							<xsl:with-param name="CouponCatID" select="CategoryID"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category[CategoryID !='-1']">
						<xsl:sort select="CategoryName"/>
						<xsl:call-template name="CouponCategoryList">
							<xsl:with-param name="CouponCatID" select="CategoryID"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
				<xsl:if test="$IsYouTechChain = 'true'">
					<div class="CouponsGrid gridLayout GridMode{$GridStyle}" id="cardCouponsGridWrapper">
						<div id="cardCouponsHeading">
							<h2>
								<xsl:value-of select="$CardCouponsTitle" />
							</h2>
							<a id="show-description" href="#">What is this?</a>
							<h3 class="description">
								<xsl:value-of select="$CardCouponsdescription"/>
							</h3>
						</div>
						<div id="card-validation-message" style="display:none"></div>
						<div id="card-coupons" class="sort"></div>
					</div>
				</xsl:if>
				<!-- then the grid of coupons itself -->
				<div class="CouponsGrid gridLayout sort GridMode{$GridStyle}" id="couponsGridWrapper">
					<!-- store coupons need to be at the top -->
					<h2>Store Coupons</h2>
					<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category[CategoryID='-1']">
						<xsl:sort select="CategoryName"/>
						<xsl:call-template name="CouponDetail">
							<xsl:with-param name="CouponCatID" select="CategoryID"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category[CategoryID != '-1']">
						<xsl:sort select="CategoryName"/>
						<xsl:call-template name="CouponDetail">
							<xsl:with-param name="CouponCatID" select="CategoryID"/>
						</xsl:call-template>
					</xsl:for-each>
				</div><!-- END #gridLayout -->
			</div><!-- END .couponsPageGrid -->
			<div id="lightboxFAQ">
				<xsl:call-template name="CouponsFAQ"/>
			</div>
		</div><!-- END #Coupons -->
	</xsl:template>
	
	<!-- creates the list -->
	<xsl:template name="CouponCategoryList" match="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
		<xsl:param name="CouponCatID"/>
		<xsl:if test="count(key('CatID',  $CouponCatID)) &gt; 0">
			<h3>
				<xsl:attribute name="id">leftCategory<xsl:value-of select="CategoryID"/></xsl:attribute>
				<a href="javascript:void(0);"><xsl:attribute name="onclick">sortItemsByClassName('Brand:<xsl:value-of select="CategoryID"/>');</xsl:attribute>
					<xsl:value-of select="CategoryName"/>
				</a>
			</h3>
		</xsl:if>
	</xsl:template>

<!-- ================================================================= -->

	<!-- creates the coupon itself -->
	<xsl:template name="CouponDetail" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon">
		<xsl:param name="CouponCatID"/>
		<div id="couponCategory{CategoryID}" class="Brand:{CategoryID}">
			<xsl:for-each select="key('CatID',  $CouponCatID)">
				<div class="couponsContainer Coupon:{CouponID}">
					<xsl:variable name="CouponItemID" select="CouponID"></xsl:variable>
					<xsl:variable name="ShoppingListItem" select="//GenericShoppingList/Items/GenericShoppingListItem[ItemID=$CouponItemID]"></xsl:variable>
					<div id="couponsFrame{CouponID}">
						<xsl:attribute name="class">
							<xsl:text>couponsFrame</xsl:text>
							<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
								<xsl:text> activeCoupon</xsl:text>
							</xsl:if>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="CategoryID = '-1' ">
								<div class="couponsStoreSavings">
									<span>STORE COUPON</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="couponsSavings">
									<xsl:text>SAVE </xsl:text>
									<xsl:if test="number(SavingsAmount)&gt;0">
										<br/>
										<xsl:value-of select="format-number(SavingsAmount,'$#.00')"></xsl:value-of>
									</xsl:if>
								</div>
							</xsl:otherwise>
						</xsl:choose>
						<div class="couponsImage">
							<img>
								<xsl:if test="ImageURL != ''">
									<xsl:attribute name="src">
										<xsl:value-of select="ImageURL"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="ImageURL = false()">
									<xsl:attribute name="src">/Assets/Common/Images/coupon_empty_image.gif</xsl:attribute>
								</xsl:if>
							</img>
						</div>
						<xsl:variable name="CouponTypeID">
							<xsl:choose>
								<xsl:when test="CouponType=1">2</xsl:when>
								<xsl:when test="CouponType=2">10</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<a id="addbutton{CouponID}" class="button" href="javascript:void(0)">
							<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
								<xsl:attribute name="style">display:none;</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="onclick">highlightCoupon(<xsl:value-of select="CouponID"/>);AddToShoppingList('<xsl:value-of select="CouponID"/>', <xsl:value-of select="$CouponTypeID" />);</xsl:attribute>
							<span>Add to List</span>
							</a>
						<a id="removebutton{CouponID}" class="button added" href="javascript:void(0);">
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
									<xsl:otherwise>display:none;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="onclick">unhighlightCoupon(<xsl:value-of select="CouponID"/>);RemoveFromShoppingListByID(<xsl:value-of select="CouponID"/>, <xsl:value-of select="$CouponTypeID" />);
							</xsl:attribute>
							<span>Remove</span>
						</a>
						<xsl:if test="CouponType = 1">
							<div style="display:none;">
								<xsl:attribute name="class">
									<xsl:value-of select="concat('ItemData_', CouponID, '_2')"/>
								</xsl:attribute>
								<span class="ExportKeyID">
									<xsl:value-of select="ExportKeyID"/>
								</span>
							</div>
						</xsl:if>
						<div>
							<xsl:attribute name="class">couponsDescription</xsl:attribute>
							<xsl:choose>
								<xsl:when test="string-length(Description) &gt; 180">
									<xsl:attribute name="style">font-size:7px;</xsl:attribute>
								</xsl:when>
								<xsl:when test="string-length(Description) &gt; 140">
									<xsl:attribute name="style">font-size:8px;</xsl:attribute>
								</xsl:when>
								<xsl:when test="string-length(Description) &gt; 105">
									<xsl:attribute name="style">font-size:9px;</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<!-- standard size -->
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="Description"/>
						</div>
					</div>
				
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
