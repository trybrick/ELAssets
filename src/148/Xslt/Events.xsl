<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<div id="InStoreSpecialsDiv" class="departmentPage">
			<h2>In-Store Specials</h2>
			<xsl:choose>
				<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Title != ''"><div class="leftnav">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
							<a>
								<xsl:attribute name="href"><xsl:value-of select="Image" /></xsl:attribute>
								<xsl:attribute name="target">_blank</xsl:attribute>
								<xsl:value-of select="Title" />
							</a>
					</xsl:for-each>
				</div></xsl:when>
				<xsl:otherwise><h3>There are no in-store specials at this time. Please check again later.</h3></xsl:otherwise>
			</xsl:choose>
			<div>
				<p>At Trig's and Trig's County Market we strive to bring you outstanding value every time you shop with us through superior customer service, convenience, quality products and competitive prices.  Hurry in for great savings with these unadvertised specials and many other exclusive offers throughout the store.  And, don't forget to check out the Wall of Values when you visit any of our locations.</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>