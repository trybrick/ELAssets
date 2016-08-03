<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<xsl:variable name="StoreID" select="//GenericStore/StoreID"/>
		<xsl:variable name="destination" select="'##root##/Shop/WeeklyAd.aspx'"/>
		<xsl:variable name="CircularURL">
			<xsl:choose>
				<xsl:when test="string-length(//ChainCircularSummary/Items/ChainCircularSummaryItem[StoreID = $StoreID]/ImageUrl) &gt; 0">
					<xsl:value-of select="//ChainCircularSummary/Items/ChainCircularSummaryItem[StoreID = $StoreID]/ImageUrl"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'##root##/Assets/Common/Images/CircularThumb.png'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="podWeeklyAd" class="EmailPod">
			<h2>Weekly Ad</h2>
			<a href="{$destination}">
				<img src="{$CircularURL}" alt="Weekly Ad"/>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
