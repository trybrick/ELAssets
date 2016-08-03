<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template name="PersonalizedItem" match="StoreCircularItem">
		<td width="20%" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td align="center" valign="middle" width="20%" style="border-top:1px dashed #CCCCCC;border-left:1px dashed #CCCCCC;border-right:1px dashed #CCCCCC;">
						<font face="Arial, Helvetica, sans-serif" size="3" color="#FF0000" style="letter-spacing:-1px;">
							<b><xsl:value-of select="PriceString"/></b>
						</font>
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" width="20%" style="border-left:1px dashed #DDDDDD;border-right:1px dashed #DDDDDD;">
						<img src="{SmallImageUrl}" style="display:block;max-height:110px;max-width:110px;" height="90"/>
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" width="20%" style="border-bottom:1px dashed #EEEEEE;border-left:1px dashed #EEEEEE;border-right:1px dashed #EEEEEE;">
						<font face="Arial, Helvetica, sans-serif" size="1" color="#4775b6">
							<xsl:value-of select="Name"/>
						</font>
					</td>
				</tr>
			</table>
		</td>
	</xsl:template>
</xsl:stylesheet>