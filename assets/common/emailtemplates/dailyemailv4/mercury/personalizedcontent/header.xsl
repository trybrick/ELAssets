<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<table width="720" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="24"/>
				<td width="429">
					<table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2" scope="col">
								<img src="https://upload.brickinc.net/elvs/Common/cliptop_1.jpg" width="429" height="83" style="display:block;" border="0"/>
							</td>
						</tr>
						<tr>
							<td rowspan="2">
								<img src="https://upload.brickinc.net/elvs/Common/cliptop_l.jpg" width="53" height="129" style="display:block;" border="0"/>
							</td>
							<td valign="top">
								<img src="##root##/Assets/##chainid##/images/headerlogo.gif" height="75" style="display:block; height: 75px; max-width: 365px;" border="0"/>
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td>
											<img src="https://upload.brickinc.net/elvs/Common/mini_coupon.jpg" style="display:block;" border="0"/>
										</td>
										<td>
											<a href="##root##/Shop/Coupons.aspx" style="text-decoration:none; color:black; font-size: 14px; font-style: italic;">
												<b>
													<i>
														<font face="Arial, Helvetica, sans-serif" color="#cc0000" size="5">##manufacturercoupontotalsavings##</font>
													</i>
												</b> 
												<font face="Arial, Helvetica, sans-serif"><i><xsl:text> in Coupon Savings!</xsl:text></i></font>
											</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="298">
					<table width="289" height="50" border="0" align="left" cellpadding="0" cellspacing="0">
						<tr>
							<th colspan="2" scope="col">
								<img src="https://upload.brickinc.net/elvs/Common/cliptop_2.jpg" width="298" height="104" style="display:block;" border="0" align="left"/>
							</th>
						</tr>
						<tr>
							<td width="244" align="right">
								<center>
									<font face="Arial, Helvetica, sans-serif" color="#4775b6" size="2">Hello, <xsl:value-of select="//GenericConsumer/FirstName"/></font>
									<br/>
									<a href="##root##/Profile/SignIn.aspx">
										<img src="https://upload.brickinc.net/elvs/Common/SignIn.jpg" alt="Sign In" style="display:block;" border="0"/>
									</a>
									<a href="##root##/Shop/WeeklyAd.aspx">
										<img src="https://upload.brickinc.net/elvs/Common/viewAd.jpg" style="display:block;" border="0"/>
									</a>
								</center>
							</td>
							<td>
								<img src="https://upload.brickinc.net/elvs/Common/cliptop_r.jpg" width="46" height="108" align="right" style="display:block;" border="0"/>
							</td>
						</tr>
					</table>
				</td>
				<td width="23"/>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
