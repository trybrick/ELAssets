<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="no" />
	<xsl:template match="/">
		<xsl:variable name="type" select="//RegistrationIncentiveWebserviceType" />
		<xsl:choose>
			<xsl:when test="$type = 'all'">Your recipes have been saved and your shopping lists created!</xsl:when>
			<xsl:when test="$type = 'shoppinglists'">Your shopping lists have been created!</xsl:when>
			<xsl:when test="$type = 'recipes'">Your recipes have been saved!</xsl:when>
			<xsl:otherwise>An error has occured.  Please try again.</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>