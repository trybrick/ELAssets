<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:value-of select="ExpressLane/ApiResponse/Code" />
	</xsl:template>
</xsl:stylesheet>
