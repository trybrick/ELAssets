<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:variable name="UnsubscribeLink" select="'##root##/Profile/Unsubscribe.aspx?ConsumerID=%%= v(@consumerid) =%%'" />
		
		<xsl:variable name="ChainEmailAddress">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value) &gt; 0">
					<xsl:value-of select="concat(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value, '@grocerywebsites.com')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>gsn@grocerywebsites.com</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
	<hr style="width:100%; height:1px; color:gray; border:0; background-color:gray; clear:both; margin:4px 0 4px 0;"/>
		<table width="100%" cellSpacing="0" cellPadding="0" border="0" style="border:0; border-width:0; padding:0; vertical-align:top;">
			<tbody>
				<tr>
					<td>
						<xsl:if test="string-length(//ChainInformation/StoreSmallLogo) &gt; 0">
							<img  border="0" src="{//ChainInformation/StoreSmallLogo}" align="left" style="margin-right:6px;"/>
						</xsl:if>

						<small style="color:#000000; font-size:10px;">
							NOTE: To ensure delivery to your inbox (not bulk or junk folders), please add <xsl:value-of select="$ChainEmailAddress" /> to your address book or safelist.
							<br />
							<br />
							Email News is an opt-in, recurring email from <strong><xsl:value-of select="//GenericChain/ChainName"/></strong>. 
							This email address was obtained through e-mail sign up on our website located at <a href="{//GenericChain/PreferedHost}"><xsl:value-of select="//GenericChain/PreferedHost"/></a>.
							To unsubscribe from this email, please <a href="{$UnsubscribeLink}">click here</a>
						</small>
					</td>
				</tr>
				<tr>
					<td align="center">
						<hr style="width:100%; height:1px; color:gray; border:0; background-color:gray; clear:both; margin:4px 0 4px 0;"/>
						<font size="1" color="#9b9b9b">
							Copyright 2014 Grocery Shopping Network
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>