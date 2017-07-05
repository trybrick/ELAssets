<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="Item.xsl"/>
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<table width="710" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="28%" rowspan="2" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/Featured_Items_Tag.jpg" width="207" height="71" align="right" style="display:block;" border="0"/>
				</td>
				<td width="72%" height="50" scope="col" style="font-size: 12px;" valign="bottom">
					<xsl:variable name="StoreID" select="//GenericStore/StoreID"/>
					<xsl:variable name="sdate" select="//ChainCircularSummary/Items/ChainCircularSummaryItem[StoreID = $StoreID]/StartDate"/>
					<xsl:variable name="edate" select="//ChainCircularSummary/Items/ChainCircularSummaryItem[StoreID = $StoreID]/EndDate"/>
					<xsl:variable name="StartDate" select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
					<xsl:variable name="EndDate" select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
					<xsl:variable name="EffectiveDates" select="concat($StartDate, ' - ', $EndDate)"/>
					<xsl:variable name="DisplayText" select="concat('Ad Prices Valid From ', $EffectiveDates)"/>
					<font face="Arial, Helvetica, sans-serif" color="#666666" size="1">
						<xsl:value-of select="$DisplayText"/>
					</font>
				</td>
			</tr>
			<tr>
				<td valign="bottom">
					<img src="https://upload.brickinc.net/elvs/Common/Featured_topr.jpg" width="520" height="16" align="left" style="display:block;" border="0"/>
				</td>
			</tr>
		</table>
		<table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="3%" rowspan="2" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/Featured_L.jpg" width="19" height="154" style="display:block;" border="0"/>
				</td>
				<td width="94%" height="138" scope="col">
					<table id="Body_Right_Specials" width="675" border="0" cellpadding="5" cellspacing="0" margin="0">
						<tr>
							<td width="20%"><xsl:text>##CircularItem_0## </xsl:text></td>
							<td width="20%"><xsl:text>##CircularItem_1## </xsl:text></td>
							<td width="20%"><xsl:text>##CircularItem_2## </xsl:text></td>
							<td width="20%"><xsl:text>##CircularItem_3## </xsl:text></td>
							<td width="20%"><xsl:text>##CircularItem_4## </xsl:text></td>
						</tr>
					</table>
				</td>
				<td width="3%" rowspan="2" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/Featured_r.jpg" width="23" height="154" style="display:block;" border="0"/>
				</td>
			</tr>
			<tr>
				<td valign="bottom" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/featured_bottom_17.jpg" width="685" height="10" align="bottom" style="display:block;" border="0"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
