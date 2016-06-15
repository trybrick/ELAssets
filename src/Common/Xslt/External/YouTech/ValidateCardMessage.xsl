<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:variable name="cardNumber">
			<xsl:if test="string-length(//GenericConsumer/ExternalID) &gt; 0">
				<xsl:value-of select="//GenericConsumer/ExternalID"/>
			</xsl:if>
		</xsl:variable>
    
		<xsl:choose>
			<xsl:when test="((number($cardNumber) &gt; 0) and (number($cardNumber) &lt; 48203769258))">
				<p class="invalid-card">We've noticed you have an out-of-date Roundy's Rewards card number <br />in your profile. To use Loadable Coupons, you must <a href="/Profile/Signup.aspx">update your profile</a><br /><xsl:text>with your current Fresh Perks number.</xsl:text></p>
			</xsl:when>
			<xsl:when test="(ExpressLane/ValidateCardResponse/Code != 100) or (string-length($cardNumber) &lt; 1)">
				<p class="invalid-card">Your loyalty card number <xsl:value-of select="$cardNumber"/> could not be validated. <br />Please <a href="/Profile/Signup.aspx">update your profile</a><xsl:text> or visit a store to sign up for a card.</xsl:text></p>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
