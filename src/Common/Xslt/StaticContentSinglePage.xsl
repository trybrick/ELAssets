<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="singleDivParent">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="singleDiv">
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>