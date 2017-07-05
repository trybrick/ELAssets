<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="59" rowspan="2" valign="bottom" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/footer_left.jpg" width="45" height="181" align="bottom" style="display:block;" border="0"/>
				</td>
				<td width="618" height="130" scope="col" align="center" style="font-size: 12px;">
					<xsl:variable name="ChainEmailAddress">
						<xsl:choose>
							<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value) &gt; 0">
								<xsl:value-of select="concat(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value, '@grocerywebsites.com')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>gsn@grocerywebsites.com</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="UnsubscribeLink" select="concat(//GenericChain/PreferedHost, '/Profile/Unsubscribe.aspx?ConsumerID=%%= v(@consumerid) =%%')"/>
					<table align="center">
						<xsl:call-template name="SocialFooterIcons"/>
					</table>
					<p><a href="{$UnsubscribeLink}">Unsubscribe</a> 
					| <a href="##root##/Profile/PrivacyPolicy.aspx">Privacy Policy</a> 
					| <a href="##root##/Contact">Contact Us</a> 
					| <a href="##root##/Profile/SignIn.aspx">Sign In to Your Account</a>
				</p>
					<p>NOTE: To ensure delivery to your inbox (not bulk or junk folders), please add <xsl:value-of select="$ChainEmailAddress"/> to your address book or safelist.</p>
					<p>Email News is an opt-in, reoccuring email from <xsl:value-of select="//GenericChain/ChainName"/>.  This email address was obtained through email sign-up on our website located at <a href="{//GenericChain/PreferedHost}"><xsl:value-of select="//GenericChain/PreferedHost"/></a></p>
				</td>
				<td width="43" rowspan="2" valign="bottom" scope="col">
					<img src="https://upload.brickinc.net/elvs/Common/footer_right.jpg" width="48" height="181" align="bottom" style="display:block;" border="0"/>
				</td>
			</tr>
			<tr>
				<td valign="bottom">
					<img src="https://upload.brickinc.net/elvs/Common/footer_bottom.jpg" width="634" height="38" align="bottom" style="display:block;" border="0"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="SocialFooterIcons">
		<xsl:variable name="FacebookUrl" select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value"/>
		<xsl:variable name="FacebookIcon" select="//GenericChain/ChainSettings/Setting[SettingID=267]/Value"/>
		<xsl:variable name="TwitterUrl" select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
		<xsl:variable name="TwitterIcon" select="//GenericChain/ChainSettings/Setting[SettingID=269]/Value"/>
		<tr>
			<td>
				<xsl:if test="string-length($FacebookUrl) &gt; 0">
					<a id="headerFBIcon" href="{$FacebookUrl}" target="_blank">
						<img alt="Facebook" style="display:block;" border="0">
							<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/fbIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="string-length($TwitterUrl) &gt; 0">
					<a id="headerTWIcon" href="{$TwitterUrl}" target="_blank">
						<img alt="Twitter" style="display:block;" border="0">
							<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/twIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="(string-length($TwitterUrl) &gt; 0) or (string-length($FacebookUrl) &gt; 0)">
					<img alt="Follow Us Online" style="display:block;" border="0">
						<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/followUs.jpg</xsl:attribute>
					</img>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
