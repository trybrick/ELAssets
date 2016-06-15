<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/InventoryProductsPaged">
				<xsl:copy-of select="ExpressLane/InventoryProductsPaged" />
			</xsl:when>
			<xsl:when test="ExpressLane/SpecialsProductsPaged">
				<xsl:copy-of select="ExpressLane/SpecialsProductsPaged" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>