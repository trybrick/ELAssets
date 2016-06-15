<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:variable name="SpacerURL" select="'##root##/Assets/Common/EmailTemplates/DailyEmail/images/spacer.gif'"/>
	<xsl:template match="/">
		<xsl:call-template name="Specials"></xsl:call-template>
	</xsl:template>

	<xsl:template name="SpecialsHeader" match="StoreCircularItem">
		<td align="center" valign="middle" width="20%">
			<font face="Arial, Helvetica, sans-serif" size="2" color="#FF0000" style="letter-spacing:-1px;">
				<b><xsl:value-of select="PriceString"/></b>
			</font>
		</td>
	</xsl:template>

	<xsl:template name="SpecialsImage" match="StoreCircularItem">
		<td align="center" valign="middle" width="20%">
			<img src="{SmallImageUrl}" style="display:block;max-height:60px;max-width:110px;" height="60"/>
		</td>
	</xsl:template>

	<xsl:template name="SpecialsFooter" match="StoreCircularItem">
		<td align="center" valign="middle" width="20%">
			<font face="Arial, Helvetica, sans-serif" size="1" color="#4775b6">
				<xsl:value-of select="Name"/>
			</font>
		</td>
	</xsl:template>

	<xsl:template name="Specials">
		<xsl:variable name="sdate" select="//StoreCircularSummary/StartDate"/>
		<xsl:variable name="edate" select="//StoreCircularSummary/EndDate"/>

		<xsl:variable name="StartDate" select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
		<xsl:variable name="EndDate" select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
		<xsl:variable name="EffectiveDates" select="concat($StartDate, ' - ', $EndDate)"/>

		<!--<table border="0" cellpadding="0" cellspacing="0">
			<tr>
							<td width="19">
								<img src="{$SpacerURL}" width="19" style="display:block;"/>
							</td>
				<td>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="170">
								<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/personalizedTab.jpg" border="0" height="32" width="160" style="display:block;"/>-->
								<!--Need Logic for Personalized vs Top Picks
								<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/topTab.jpg" border="0" height="32" width="160" style="display:block;"/>			
			-->
						<!-->	</td>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="1">Ad Prices Valid From <xsl:value-of select="$EffectiveDates"/></font>
							</td>
						</tr>
					</table>
				</td>
							<td width="19">
								<img src="{$SpacerURL}" width="19" style="display:block;"/>
							</td>
			</tr>
			<tr>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
				<td align="left"> -->
					<table id="Body_Right_Specials" width="553" height="106" border="0" cellpadding="0" cellspacing="0" align="center" style="font-size: 12px;">
						<tr>
							<xsl:for-each select="//PersonalizedSpecials/CircularItems/StoreCircularItem">
								<xsl:if test="position() &lt; 6">
									<xsl:call-template name="SpecialsHeader"></xsl:call-template>
								</xsl:if>
							</xsl:for-each>
						</tr>
						<tr>
							<xsl:for-each select="//PersonalizedSpecials/CircularItems/StoreCircularItem">
								<xsl:if test="position() &lt; 6">
									<xsl:call-template name="SpecialsImage"></xsl:call-template>
								</xsl:if>
							</xsl:for-each>
						</tr>
						<tr>
							<xsl:for-each select="//PersonalizedSpecials/CircularItems/StoreCircularItem">
								<xsl:if test="position() &lt; 6">
									<xsl:call-template name="SpecialsFooter"></xsl:call-template>
								</xsl:if>
							</xsl:for-each>
						</tr>
					</table>
				<!-->	
				</td>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
			</tr>
		</table>-->
	</xsl:template>
</xsl:stylesheet>