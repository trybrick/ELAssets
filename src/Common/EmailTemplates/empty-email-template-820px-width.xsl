<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
 	<xsl:template match="/">
	<table width="100%">
		<tr>
			<td>
				<table width="820" align="center">
				<xsl:for-each select="//DynamicContents/DynamicContent">
					<tr>
						<td align="center" style="text-align:center">
							<xsl:value-of select="Content" disable-output-escaping="yes"/>
						</td>
					</tr>
				</xsl:for-each>
				</table>
			</td>
		</tr>
	</table>
</xsl:template>
</xsl:stylesheet>