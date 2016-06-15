<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
<xsl:variable name="Email" select="//ReferAFriendEmail/Referral/ReferrerConsumer/Email" />
	<div id="EmailHeader">
		<img alt="{//GenericChain/ChainName}" src="{//ReferAFriendEmail/EmailLogo}" border="0" />
	</div>
	<br />
	<div id="ReferAFriendContainer">
		Hi <xsl:value-of select="concat(//ReferAFriendEmail/Referral/FirstName, ' ', //ReferAFriendEmail/Referral/LastName)"/>,
		<p>Your friend (<a><xsl:attribute name="href">mailto:<xsl:value-of select="$Email" /></xsl:attribute><xsl:value-of select="$Email" /></a>) thought you might be interested in <xsl:value-of select="//GenericChain/ChainName" /> grocery services.<br />
		<a><xsl:attribute name="href"><xsl:value-of select="//GenericChain/PreferedHost" /></xsl:attribute>Click Here</a> to visit our website.</p>
	</div>
</xsl:template>
</xsl:stylesheet>