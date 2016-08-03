<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:import href="http://localhost/assets/common/xslt/CouponsFAQ.xsl"/>
	<xsl:key name="CatID" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon" use="CategoryID"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="HelpText" select="//GenericChain/ChainSettings/Setting[SettingID=262]/Value"/>
		<div id="Coupons">
			<xsl:variable name="GridStyle">
				<xsl:choose>
					<xsl:when test="ExpressLane/GenericConsumer/ConsumerSettings/Setting[SettingID = 6]">
						<xsl:value-of select="ExpressLane/GenericConsumer/ConsumerSettings/Setting[SettingID = 6]/Value"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<script type="text/javascript" src="/Assets/Common/Js/Settings/ConsumerSettings.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Coupons/Coupons.js" />
			<script type="text/javascript" src="/Assets/Common/Js/YouTech/YouTechService.js" />
			<script type="text/javascript">
				states=new Array();
				<xsl:for-each select="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
					states[<xsl:value-of select="position()"/>]="leftCategory<xsl:value-of select="CategoryID"/>";
				</xsl:for-each>
			</script>

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
			<div class="couponsPageGrid">
				<div class="gridSwapLayout">
					<a href="#" id="swapGrid1" class="gridStyleIcon1" onclick="swapGridStyles(1);">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="$GridStyle = 1">gridStyleIcon1 active</xsl:when>
								<xsl:otherwise>gridStyleIcon1</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</a>
					<a href="#" id="swapGrid2" class="gridStyleIcon2" onclick="swapGridStyles(2);">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="$GridStyle = 2">gridStyleIcon2 active</xsl:when>
								<xsl:otherwise>gridStyleIcon2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</a>
					<a href="#" id="swapGrid3" class="gridStyleIcon3" onclick="swapGridStyles(3);">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="$GridStyle = 3">gridStyleIcon3 active</xsl:when>
								<xsl:otherwise>gridStyleIcon3</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</a>
					<a>
						<xsl:attribute name="id">help</xsl:attribute>
						<xsl:attribute name="class">lightwindow</xsl:attribute>
						<xsl:attribute name="href">#lightboxFAQ</xsl:attribute>
						<xsl:attribute name="title">Coupons Help</xsl:attribute>
						<xsl:attribute name="params">lightwindow_width=700,lightwindow_height=400</xsl:attribute>
						<xsl:choose>
							<xsl:when test="$HelpText">
								<xsl:value-of select="$HelpText"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Help</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</div>
				<div class="clear"></div>
				<!-- lets build the listing on the left -->
				<div class="CategoryDisplayContainer">
					<div class="couponsIntroCopy">Click below to sort coupons by a desired category. All other coupons follow.</div>
					<!-- store coupons need to be at the top -->
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
				<!-- then the grid of coupons itself -->
				<div id="gridLayout">
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="$GridStyle = 1">
								<xsl:text>CouponsGrid GridMode1 sort</xsl:text>
							</xsl:when>
							<xsl:when test="$GridStyle = 2">
								<xsl:text>CouponsGrid GridMode2 sort</xsl:text>
							</xsl:when>
							<xsl:when test="$GridStyle = 3">
								<xsl:text>CouponsGrid GridMode3 sort</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>CouponsGrid GridMode2 sort</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="count(//ChainCoupons/Coupons/YouTechCoupon) &gt; 0">
						<div class="card-coupons">
							<h2>Card Member Coupons</h2>
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
											<xsl:for-each select="//ChainCoupons/Coupons/YouTechCoupon">
												<xsl:variable name="ButtonContainerID" select="concat('buttonContainer',CouponID)" />
												<div class="couponsContainer">
													<h3 class="couponSavings">Save $<xsl:value-of select="format-number(number(SavingsAmount), '#.00')" /></h3>
													<p><xsl:value-of select="ShortDescription" disable-output-escaping="yes" /></p>
													<xsl:if test="string-length(ImageURL) &gt; 0">
														<img alt="" src="{ImageURL}" />
													</xsl:if>
													<xsl:variable name="YouTechCouponID" select="YouTechCouponID" />
													<div class="action-buttons" id="{$ButtonContainerID}">
														<xsl:choose>
															<xsl:when test="//ConsumerCoupons/TakenCoupons/YouTechCoupon[YouTechCouponID = $YouTechCouponID]">
																<span class="addCouponResponseMessage" id="couponResult{CouponID}">Added to Card</span>
															</xsl:when>
															<xsl:otherwise>
																<a class="button you-tech" href="javascript:void(0);" onclick="GSNServices.YouTechService.AddYouTechCoupon({CouponID}, '{$ButtonContainerID}');">
																	<span>Add Coupon to Card</span>
																</a>
															</xsl:otherwise>
														</xsl:choose>
													</div>
													<div id="loading{CouponID}" class="loading-animation"></div>
												</div>
											</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<p><a href="{//GenericChain/PreferredHost}/Profile/SignIn.aspx">Sign in</a> to add coupons to your card. Don't have a card? <a href="{//GenericChain/PreferredHost}/Profile/SignUp.aspx">Sign up</a> for free.</p>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</xsl:if>
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
				</div>
			</div>
			<div id="lightboxFAQ">
				<xsl:call-template name="CouponsFAQ"/>
			</div>
		</div>
	</xsl:template>
	<!-- creates the list -->
	<xsl:template name="CouponCategoryList" match="ExpressLane/DisplayCoupons/ArrayOfCategory/Category">
		<xsl:param name="CouponCatID"/>
		<xsl:if test="count(key('CatID',  $CouponCatID)) &gt; 0">
			<h3>
				<xsl:attribute name="id">leftCategory<xsl:value-of select="CategoryID"/></xsl:attribute>
				<a>
					<xsl:attribute name="href">#</xsl:attribute>
					<xsl:attribute name="onclick">sortItemsByClassName('Brand:<xsl:value-of select="CategoryID"/>'); BK_CategorySelected(<xsl:value-of select="ExportKeyID"/>);</xsl:attribute>
					<xsl:value-of select="CategoryName"/>
				</a>
			</h3>
		</xsl:if>
	</xsl:template>

	<!-- creates the coupon itself -->
	<xsl:template name="CouponDetail" match="ExpressLane/DisplayCoupons/ArrayOfCoupon/Coupon">
		<xsl:param name="CouponCatID"/>
		<div>
			<xsl:attribute name="class">Brand:<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:attribute name="id">couponCategory<xsl:value-of select="CategoryID"/></xsl:attribute>
			<xsl:for-each select="key('CatID',  $CouponCatID)">
				<div>
					<xsl:attribute name="class">couponsContainer Coupon:<xsl:value-of select="CouponID"/></xsl:attribute>
					<xsl:variable name="CouponItemID" select="CouponID"/>
					<xsl:variable name="ShoppingListItem" select="//GenericShoppingList/Items/GenericShoppingListItem[ItemID=$CouponItemID]"/>
					<div>
						<xsl:attribute name="class">couponsFrame <xsl:if test="number($ShoppingListItem/ShoppingListItemID)"> activeCoupon</xsl:if></xsl:attribute>
						<xsl:attribute name="id">couponsFrame<xsl:value-of select="CouponID"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="CategoryID = '-1' ">
								<div class="couponsStoreSavings">
									<span>STORE COUPON</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div>
									<xsl:attribute name="class">couponsSavings</xsl:attribute>SAVE
									<xsl:if test="number(SavingsAmount)&gt;0">
										<br/>
										<xsl:value-of select="format-number(SavingsAmount,'$#.00')"/>
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
						<a>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
									<xsl:otherwise>display:block;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="ID">addbutton<xsl:value-of select="CouponID"/></xsl:attribute>
							<xsl:attribute name="class">button</xsl:attribute>
							<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="CouponID"/>','<xsl:choose><xsl:when test="CouponType=1">2</xsl:when><xsl:when test="CouponType=2">10</xsl:when></xsl:choose>');</xsl:attribute>
							<xsl:attribute name="onclick">highlightCoupon(<xsl:value-of select="CouponID"/>);</xsl:attribute>
							<span>Add to List</span>
						</a>
						<a>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
									<xsl:otherwise>display:none;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="ID">removebutton<xsl:value-of select="CouponID"/></xsl:attribute>
							<xsl:attribute name="class">button added</xsl:attribute>
							<xsl:attribute name="href">javascript:RemoveFromShoppingListByID(<xsl:value-of select="CouponID"/>,<xsl:choose><xsl:when test="CouponType=1">2</xsl:when><xsl:when test="CouponType=2">10</xsl:when></xsl:choose>);</xsl:attribute>
							<xsl:attribute name="onclick">unhighlightCoupon(<xsl:value-of select="CouponID"/>);</xsl:attribute>
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
