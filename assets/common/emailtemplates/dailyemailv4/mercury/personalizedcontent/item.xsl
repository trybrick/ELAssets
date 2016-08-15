<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	
	<xsl:template match="/">
		<table border="0" cellpadding="0" cellspacing="0" height="100%">
			<tr>
				<td align="center" valign="middle" width="20%">
					<font face="Arial, Helvetica, sans-serif" size="2" color="#FF0000" style="letter-spacing:-1px;">
						<b><xsl:value-of select="//StoreCircularItem/PriceString"/></b>
					</font>
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" width="20%">
					<div style="height: 60px; width: 110px; overflow:hidden;" id="email-coupon-img">
						<img src="{//StoreCircularItem/ImageUrl}" style="display:block;max-width:110px;" width="50" border="0"/>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" width="20%">
					<xsl:variable name="Name">
							<xsl:value-of select="//StoreCircularItem/Name" />
					</xsl:variable>
					<div style="height: 25px; line-height: 1em; overflow:hidden;">
						<font face="Arial, Helvetica, sans-serif" size="1" color="#4775b6">
							<xsl:value-of select="substring($Name, 1, 45)"/>
							<xsl:if test="(string-length($Name)) &gt; 45">
								<xsl:text>...</xsl:text>
							</xsl:if>
						</font>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
