<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<!--========================================================================================== -->

	<xsl:template match="/">
    	<xsl:call-template name="PageTitle" /> 
		<script src="http://localhost/Assets/Common/js/Circulars/Circulars.js" type="text/javascript"/>
		<p>
			<a id="LinkButtonBackToWeeklyAd" href="/Shop/WeeklyAd.aspx">Back to Weekly Ad</a>
		</p>
		<xsl:variable name="sdate" select="//StoreCircularPage/StartDate"/>
			<xsl:variable name="edate" select="//StoreCircularPage/EndDate"/>
			<div id="CircularAdDatesTextOnly">
				<xsl:text>Advertised Prices Effective </xsl:text>
				<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
			</div>
		<div id="CouponList">
			<xsl:for-each select="//StoreCircular/Categories/Category">
				<xsl:call-template name="CategoryList"/>
			</xsl:for-each>
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>

	<!--========================================================================================== -->

	<xsl:template name="CategoryList" match="Category">
		<xsl:param name="CategoryID" select="CategoryID"/>
		<xsl:if test="count(//StoreCircularItem[CategoryID=$CategoryID]) &gt; 0">
			<h3>
				<xsl:value-of select="CategoryName"/>
			</h3>
			<div>
				<table class="GridItem">
					<tbody>
						<tr>
							<th scope="col" class="AddButton"></th>
							<th scope="col" class="Item">Item</th>
							<th align="center" scope="col" class="ItemPrice">Price</th>
							<th scope="col" class="ItemSavings">Savings</th>
						</tr>
						<xsl:for-each select="//StoreCircularItem[CategoryID=$CategoryID]">
							<xsl:sort select="Name" data-type="text" order="ascending"/>
							<tr>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 0">GridAlternatingItem</xsl:when>
										<xsl:otherwise>GridItem</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="AddButton">
									<a class="button">
										<xsl:attribute name="class">button add</xsl:attribute>
										<xsl:attribute name="href">javascript:AddToShoppingList(<xsl:value-of select="CircularItemID"/>, 8);</xsl:attribute>
										<span>Add</span>
									</a>
									<div style="display:none;">
										<xsl:attribute name="class">
											<xsl:value-of select="concat('ItemData_', CircularItemID, '_8')"/>
										</xsl:attribute>
										<span class="ExportKeyID">
											<xsl:value-of select="ExportKeyID"/>
										</span>
										<xsl:if test="number(BrandExportKeyID)">
											<span class="ExportKeyID">
												<xsl:value-of select="BrandExportKeyID"/>
											</span>
										</xsl:if>
										<xsl:if test="number(DepartmentExportKeyID)">
											<span class="ExportKeyID">
												<xsl:value-of select="DepartmentExportKeyID"/>
											</span>
										</xsl:if>
										<xsl:if test="number(CategoryExportKeyID)">
											<span class="ExportKeyID">
												<xsl:value-of select="CategoryExportKeyID"/>
											</span>
										</xsl:if>
										<xsl:if test="number(AisleExportKeyID)">
											<span class="ExportKeyID">
												<xsl:value-of select="AisleExportKeyID"/>
											</span>
										</xsl:if>
										<xsl:if test="number(ShelfExportKeyID)">
											<span class="ExportKeyID">
												<xsl:value-of select="ShelfExportKeyID"/>
											</span>
										</xsl:if>
									</div>
								</td>
								<!--circularItem Info-->
								<td class="ItemName">
									<xsl:value-of select="Name"/>
									<xsl:if test="Description != ''">
										<xsl:value-of select="concat(', ', substring(Description, 0, 250))"/>
									</xsl:if>
								</td>
								<td class="ItemPrice">
									<!-- override with dealbuster string if exist -->
									<!-- Choose DealBuster String -->
									<xsl:variable name="circularItemID" select="CircularItemID" />
									<xsl:variable name="DealBusterPriceStr" select="//CircularItemDealBusters/GenericCircularItemDealBuster[CircularItemID = $circularItemID]/PriceString" />
									<xsl:choose>
										<xsl:when test="$DealBusterPriceStr != ''">
											<xsl:value-of select="$DealBusterPriceStr"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="PriceString"/>
										</xsl:otherwise>
									</xsl:choose>
									<!-- Choose DealBuster String -->
								</td>
								<td class="ItemSavings">
									<xsl:if test="number(Savings)">
										<xsl:value-of select="format-number(Savings, '$0.00')" />
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="PageTitle">
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
		<xsl:variable name="CartOrList">
			<xsl:choose>
				<!--isOGS = currently on OGS site-->
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageHeaderTitle" select="'Text Only Version - All Sale Items'"/>
		<xsl:variable name="PageHeaderDescription" select="concat('Click Add button to move to your ',$CartOrList,'.')"/>
		
		<!--Display command-->
		<h2 class="pageHeader">
			<xsl:value-of select="$PageHeaderTitle"/>
			<span>
				<xsl:value-of select="$PageHeaderDescription"/>
			</span>
		</h2>
	</xsl:template>
</xsl:stylesheet>