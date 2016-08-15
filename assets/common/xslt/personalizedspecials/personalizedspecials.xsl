<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/GenericProduct/GenericProductDisplay.xsl"/>
	<xsl:import href="../IconLegend.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
		<script src="/assets/common/js/Circulars/Circulars.js" type="text/javascript"/>
		<xsl:variable name="PageHeaderText">My Specials</xsl:variable>
		<xsl:variable name="PageDescription">View items chosen for you based upon previous purchases.</xsl:variable>
		<h2 class="pageHeader">
			<xsl:value-of select="$PageHeaderText"/>
			<span>
				<xsl:value-of select="$PageDescription"/>
			</span>
		</h2>
		<div id="productdescription"></div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<div class="TopN">
			<xsl:for-each select="ExpressLane/PersonalizedSpecials">

				<xsl:call-template name="PersonalizedTopNHovers"/>
				<xsl:call-template name="PersonalizationTopN"/>
			</xsl:for-each>
		</div>
		<xsl:for-each select="ExpressLane/PersonalizedSpecials">
			<xsl:call-template name="LineItems"/>
		</xsl:for-each>
		<xsl:apply-imports/>
	</xsl:template>
	<xsl:template name="PersonalizedTopNHovers" match="PersonalizedSpecials">
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<div id="ToolTips" style="display:none">
			<xsl:for-each select="CircularItems/StoreCircularItem">
				<span>
					<xsl:attribute name="id">
						<xsl:value-of select="CircularItemID"/>span</xsl:attribute>
					<div id="hoverAdPage" class="bigPage">
						<div class="top">
							<xsl:choose>
								<xsl:when test="$IsOGS = 'true'">
									<h1>Click to add to your shopping cart</h1>
								</xsl:when>
								<xsl:otherwise>
									<h1>Click to add to your shopping list</h1>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="middle">
							<div class="circularHoversImage">
								<xsl:if test="SmallImageUrl">
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="Name"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="SmallImageUrl"/>
										</xsl:attribute>
									</img>
								</xsl:if>
							</div>
							<div class="circularHoversPricing">
								<h2>
									<xsl:value-of select="Name"/>
								</h2>
								<h3>
									<xsl:value-of select="Description" disable-output-escaping="yes"/>
								</h3>
								<h4>
									<xsl:value-of select="PriceString"/>
								</h4>
							</div>
							<xsl:choose>
								<xsl:when test="LinkedItemCount &gt; 1">
									<h5>Click to see available varieties and add to
										<xsl:choose>
											<xsl:when test="$IsOGS = 'true'">your cart</xsl:when>
											<xsl:otherwise>your list</xsl:otherwise>
										</xsl:choose>
									</h5>
								</xsl:when>
								<xsl:otherwise>
									<h5>Click to add to
										<xsl:choose>
											<xsl:when test="$IsOGS = 'true'">your cart</xsl:when>
											<xsl:otherwise>your list</xsl:otherwise>
										</xsl:choose>
									</h5>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="bottom"></div>
					</div>
				</span>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="PersonalizationTopN" match="PersonalizedSpecials">
		<div>
			<xsl:for-each select="CircularItems/StoreCircularItem">
				<div class="couponsContainer">
					<div class="couponsFrame">
						<div class="couponsImage">
							<img alt="">
								<xsl:attribute name="onmouseover">doTipFromTag(this, '<xsl:value-of select="CircularItemID"/>span')</xsl:attribute>

								<xsl:attribute name="onclick">
									<xsl:value-of select="concat('AddToShoppingList(', CircularItemID, ', 8);')"/>
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:value-of select="SmallImageUrl"/>
								</xsl:attribute>
							</img>
						</div>
						<a class="button">
							<xsl:attribute name="href">
								<xsl:value-of select="concat('javascript:AddToShoppingList(', CircularItemID, ', 8);')"/>
							</xsl:attribute>
							<span>Add</span>
						</a>
						<div class="couponsDescription">
							<xsl:value-of select="Name"/>
						</div>
						<span class="price">
							<xsl:value-of select="PriceString"/>
						</span>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="LineItems" match="PersonalizedSpecials">
		<xsl:if test="count(//ExpressLane/PersonalizedSpecials/LineItems/GenericProduct) &gt; 0">
			<div class="LineItems">
				<div id="ProductsGrid">
					<xsl:for-each select="LineItemCategories/GenericCategory[CategoryID = //PersonalizedSpecials/LineItems/GenericProduct/DepartmentCategoryID]">
						<xsl:sort select="CategoryName" data-type="text"/>
						<xsl:call-template name="GenericProductTableByCategory">
							<xsl:with-param name="GenericProducts" select="//ExpressLane/PersonalizedSpecials/LineItems/GenericProduct"></xsl:with-param>
							<xsl:with-param name="GenericCategory" select="."></xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>