<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
  		<xsl:choose>
			<xsl:when test="//StoreCircular/Pages/StoreCircularPage">
				<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
					<xsl:sort select="PageNumber" data-type="number" />
					<xsl:if test="position()=1">
						<xsl:apply-templates select="." />
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="ExpressLane/StoreCircularPage">
				<xsl:apply-templates select="ExpressLane/StoreCircularPage" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="StoreCircularPage">
		<input type="hidden" id="hfCircularPageID">
			<xsl:attribute name="value">
				<xsl:value-of select="CircularPageID" />
			</xsl:attribute>
		</input>
		<img id="CircularImage" style="clear:both;">
			<xsl:attribute name="alt">
				<xsl:value-of select="ClientID" />
			</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl" />
			</xsl:attribute>
			<xsl:attribute name="usemap">#CircularImageMap<xsl:value-of select="CircularPageID" /></xsl:attribute>
			<xsl:attribute name="style">
				width:<xsl:value-of select="ImageWidth" />px;
			</xsl:attribute>
		</img>
		<div style="display:none;visiblity:hidden;">
			<xsl:for-each select="Items/StoreCircularItem">
				<span>
					<xsl:attribute name="id"><xsl:value-of select="CircularItemID" />span</xsl:attribute>
					<div class="circularHoversNew">
						<div class="circularHoversImage">
							<xsl:if test="SmallImageUrl">
								<img>
									<xsl:attribute name="alt"><xsl:value-of select="Name" /></xsl:attribute>
									<xsl:attribute name="src"><xsl:value-of select="SmallImageUrl" /></xsl:attribute>
								</img>
							</xsl:if>
						</div>
						<div class="circularHoversPricing">
							<h2><xsl:value-of select="Name" /></h2>
							<h3><xsl:value-of select="Description" disable-output-escaping="yes" /></h3>
							<h4><xsl:value-of select="PriceString" /></h4>
						</div>
						<xsl:choose>
							<xsl:when test="LinkedItemCount &gt; 1">
								<h5>Click to view available varieties</h5>
							</xsl:when>
							<xsl:otherwise>
								<h5>Click to add to your shopping list</h5>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</span>
			</xsl:for-each>
		</div>
		<map id="CircularImageMap">
			<xsl:attribute name="name">CircularImageMap<xsl:value-of select="CircularPageID" /></xsl:attribute>
			<xsl:for-each select="Items/StoreCircularItem">
				<area>
					<xsl:attribute name="onclick">AddToShoppingList(<xsl:value-of select="CircularItemID" /> ,8);</xsl:attribute>
					<xsl:attribute name="onmouseout">UnTip()</xsl:attribute>
					<xsl:attribute name="onmouseover">TagToTip('<xsl:value-of select="CircularItemID" />span')</xsl:attribute>
					<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
					<xsl:attribute name="coords"><xsl:value-of select="AreaCoordinates" /></xsl:attribute>
					<xsl:attribute name="shape"><xsl:value-of select="Shape" /></xsl:attribute>
				</area>
			</xsl:for-each>
		</map>
	</xsl:template>
</xsl:stylesheet>