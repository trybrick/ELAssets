<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/PreviousOrders/Order.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="CheckOutListID" select="//ConsumerOrderHistory/Orders/ConsumerOrder[position() = 1]/CheckOutListID"/>
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/PreviousOrders/OrderHistory.js"/>
		<h2 class="pageHeader">Previous Orders<span> All items from completed orders listed by order date.</span></h2>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<div class="OrderDates">
			<ul>
			<xsl:for-each select="//ConsumerOrderHistory/Orders/ConsumerOrder">
				<xsl:call-template name="OrderListItem">
					<xsl:with-param name="CheckOutListID" select="$CheckOutListID"/>
				</xsl:call-template>
			</xsl:for-each>
			</ul>
		</div>

		<div id="OrderItems">
			<xsl:choose>
				<xsl:when test="//ConsumerOrderHistory/Orders/ConsumerOrder">
					<xsl:for-each select="//ConsumerOrderHistory/Orders/ConsumerOrder[CheckOutListID = $CheckOutListID]">
						<xsl:call-template name="OrderDisplay"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<h5>At this time, there are no previous orders available.<br/>
							Please check again later.</h5>
				</xsl:otherwise>
			</xsl:choose>
		</div>

		<div id="productdescription"/>
	</xsl:template>
	<xsl:template name="OrderListItem" match="ConsumerOrder">
		<xsl:param name="CheckOutListID"/>
		<xsl:variable name="ShortDate" select="substring(CreateDate,0,11)" />
		<xsl:variable name="Year" select="substring($ShortDate,0,5)" />
		<xsl:variable name="Month" select="substring($ShortDate,6,2)" />
		<xsl:variable name="Date" select="substring($ShortDate,9,11)" />
		<li>
			<!-- this is only set on page load so lets jsut disable it for now.
			<xsl:if test="CheckOutListID = $CheckOutListID">
				<xsl:attribute name="class">selected</xsl:attribute>
			</xsl:if> -->
			<a href="{concat('javascript:DisplayOrder(this, ', CheckOutListID, ');')}">
				<xsl:value-of select="concat($Month,'/',$Date,'/',$Year)"/>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>