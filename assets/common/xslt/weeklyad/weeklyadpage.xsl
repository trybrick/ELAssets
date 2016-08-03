<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"></xsl:output>
	<xsl:template match="/">
    <xsl:choose>
			<xsl:when test="//StoreCircular/Pages/StoreCircularPage">
				<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
					<xsl:sort select="PageNumber" data-type="number"/>
					<xsl:if test="position()=1">
						<xsl:apply-templates select="."/>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="//StoreCircularPage">
				<xsl:apply-templates select="//StoreCircularPage"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
<!--======================================================================= -->

	<xsl:template match="StoreCircularPage" name="PageDisplay">
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		
		<input type="hidden" id="hfCircularPageID">
			<xsl:attribute name="value">
				<xsl:value-of select="CircularPageID"/>
			</xsl:attribute>
		</input>
		<xsl:variable name="sdate" select="StartDate"/>
		<xsl:variable name="edate" select="EndDate"/>
		<div id="CircularAdDates">
			<xsl:text>Advertised Prices Effective </xsl:text>
			<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
			<xsl:text> - </xsl:text>
			<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
		</div>
		<img id="CircularImage" style="clear:both;" src="{ImageUrl}" alt="" title="{ClientID}">
			<xsl:attribute name="usemap">#CircularImageMap<xsl:value-of select="CircularPageID"/></xsl:attribute>
			<xsl:if test="number(ImageWidth)">
				<xsl:attribute name="style">
					<xsl:text>width:</xsl:text>
					<xsl:value-of select="ImageWidth"/>
					<xsl:text>px;</xsl:text>
				</xsl:attribute>
			</xsl:if>
		</img>
		<div style="display:none;visibility:hidden;">
			<xsl:for-each select="Items/StoreCircularItem">
				<span id="{concat(CircularItemID,'span')}">
					<div id="hoverAdPage" class="bigPage">
						<div class="top">
							<xsl:choose>
								<xsl:when test="LinkedItemCount &gt; 1">
									<h1>Click to view available varieties</h1>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$IsOGS = 'true'">
											<h1>Click to add to your cart</h1>
										</xsl:when>
										<xsl:otherwise>
											<h1>Click to add to your shopping list</h1>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="middle">
							<div class="circularHoversImage">
								<xsl:if test="SmallImageUrl">
									<img alt="{Name}" src="{SmallImageUrl}"/>
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
								</h4>
							</div>
						</div>
						<div class="bottom"></div>
					</div>
				</span>
			</xsl:for-each>
		</div>
		<map id="CircularImageMap">
			<xsl:attribute name="name">CircularImageMap<xsl:value-of select="CircularPageID"/></xsl:attribute>
			<xsl:for-each select="Items/StoreCircularItem">
				<xsl:call-template name="CircularItemArea"/>
			</xsl:for-each>
		</map>
		<!-- add Deal Buster Item Block -->
		<xsl:for-each select="CircularItemDealBusters/GenericCircularItemDealBuster">
			<xsl:if test="CircularItemDealBusterID != '0'">
				<xsl:call-template name="DealBusterItem"></xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<!-- add Deal Buster Item Block -->

		<!-- Start Blue Kai Export Data -->
		<xsl:for-each select="Items/StoreCircularItem">
			<div style="display:none;" class="{concat('ItemData_', CircularItemID, '_8')}">
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
		</xsl:for-each>
	</xsl:template>
	
<!--======================================================================= -->

	<xsl:template name="CircularItemArea">
		<xsl:param name="CircularItemID" select="CircularItemID"/>
		<xsl:param name="AddToList">
			<xsl:value-of select="concat('AddToShoppingList(', CircularItemID, ', 8);')"/>
      	</xsl:param>
		<area>
			<xsl:attribute name="onclick">
				<xsl:value-of select="$AddToList"/>
			</xsl:attribute>
			<xsl:attribute name="onmouseover">doTipFromTag(this, '<xsl:value-of select="CircularItemID"/>span')</xsl:attribute>
			<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
			<xsl:attribute name="coords">
				<xsl:value-of select="AreaCoordinates"/>
			</xsl:attribute>
			<xsl:attribute name="shape">
				<xsl:value-of select="Shape"/>
			</xsl:attribute>
		</area>
	</xsl:template>
	
<!--======================================================================= -->

	<!-- DealBuster Template -->
	<xsl:template name="DealBusterItem">
		<xsl:param name="CircularItemID" select="CircularItemID"/>
		<xsl:param name="AddToList">
			<xsl:value-of select="concat('AddToShoppingList(', CircularItemID, ', 8);')"/>
      	</xsl:param>
		<Div>
			<xsl:attribute name="id">DealBusterItem_<xsl:value-of select="CircularItemID"/>
			</xsl:attribute>
			<xsl:attribute name="onclick">
				<xsl:value-of select="$AddToList"/>
			</xsl:attribute>
			<xsl:attribute name="onmouseover">doTipFromTag(this, '<xsl:value-of select="CircularItemID"/>span')</xsl:attribute>
			<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:value-of select="HtmlStyle"/>position:absolute;
			</xsl:attribute>
			<xsl:value-of select="PriceString"/>
			<script type="text/javascript">
				getDealBusterStyle('<xsl:value-of select="CircularItemID"/>','<xsl:value-of select="HtmlStyle"/>');
			</script>
		</Div>
	</xsl:template>
</xsl:stylesheet>




