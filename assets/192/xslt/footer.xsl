<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="footer">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" valign="top">
						<a href="http://www.raysapplemarkets.com/index.php5">
							<strong>
								<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Home</font>
							</strong>
						</a>
						<xsl:text> | </xsl:text>
						<a href="http://www.raysapplemarkets.com/aboutus.php5">
							<strong>
								<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">About</font>
							</strong>
						</a>
						<xsl:text> | </xsl:text>
						<a href="http://www.raysapplemarkets.com/career.php5">
							<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
								<strong>Career</strong>
							</font>
						</a>
						<xsl:text> | </xsl:text>
						<a href="http://www.raysapplemarkets.com/services.php5">
							<strong>
								<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Services</font>
							</strong>
						</a>
						<xsl:text> | </xsl:text>
						<a href="http://www.raysapplemarkets.com/legal.php5">
							<strong>
								<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Legal</font>
							</strong>
						</a>
						<xsl:text> | </xsl:text>
						<a href="http://www.raysapplemarkets.com/privacy.php5">
							<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
								<strong>Privacy</strong>
							</font>
						</a>
						<xsl:text> | </xsl:text>
						<strong>
							<a href="http://www.raysapplemarkets.com/contact.php5">
								<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Contact</font>
							</a>
						</strong>
					</td>
				</tr>
				<tr>
					<td align="left" valign="bottom">
						<div align="center">
							<p>
								<font size="-1" face="Georgia, Times New Roman, Times, serif" class="style9">Copyright&#xA9; 2016 Rays Apple Markets</font>
							</p>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<xsl:call-template name="FacebookJsApi" />
	</xsl:template>
</xsl:stylesheet>