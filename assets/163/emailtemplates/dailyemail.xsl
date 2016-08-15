<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
<xsl:template match="/">
	<!-- Start Header Section -->
	<div id="container" style="display:block; height:auto; width: 820px; margin-left:auto; margin-top:0px; margin-right:auto; border:0; padding:0; overflow:hidden;">
	<table>
		<tbody>
			<tr>					
				<td vAlign="top" width="820">
					<!-- Start User Customize Section -->
					<table>
						<tbody>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<xsl:for-each select="//DynamicContents/DynamicContent">
												<tr>
													<td align="center" style="text-align:center">
														<xsl:value-of select="Content" disable-output-escaping="yes"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
</xsl:template>
</xsl:stylesheet>