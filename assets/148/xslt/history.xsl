<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="History" class="about">
				<h3 class="pageHeading">History</h3>
				<h4>Trig's and T.A. Solberg Company – Service Leaders</h4>
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>