<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="AdPromo">
		<div id="AdPromo">
			<a href="Shop/WeeklyAd.aspx">
				<h2>Check Out our<br/>Weekly Ads!</h2>
			</a>
			<p>Click on the image below to view<br/>our weekly ads.</p>
			<a href="Shop/WeeklyAd.aspx">
				<img alt="Check Out Our Weekly Ads!">
					<xsl:attribute name="src">
						<xsl:choose>
							<xsl:when test="string-length(//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl) &gt; 0">
								<xsl:value-of select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>
							</xsl:when>
							<xsl:when test="string-length(//CircularPageSummary/SmallImageUrl) &gt; 0">
								<xsl:value-of select="//CircularPageSummary/SmallImageUrl"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>/Assets/Common/Images/CircularThumb.png</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>