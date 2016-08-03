<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<div id="Community" class="departmentPage">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" />
				<div>
					<xsl:attribute name="id">div<xsl:value-of select="SortBy" /></xsl:attribute>
					<xsl:if test="SortBy &gt; 1">
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:if> 
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</div>
			</xsl:for-each>	
		</div>
	</xsl:template>
</xsl:stylesheet>
