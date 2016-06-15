<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">

		<h2>Welcome to our Cooking Video Center</h2>
		<p>Our videos offer an array of food preparation and cooking tips. Click a video name to view.</p>
		<div id="column1" style="width:46%; float:left; margin-left:20px;">
		<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist[position() &lt;= count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 2 + 1]">
			<xsl:call-template name="VideoLink" />
		</xsl:for-each>
	</div>
		<div id="column2" style="width:46%; float:left;">
		<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist[position() &gt; count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 2 + 1]">
			<xsl:call-template name="VideoLink" />
		</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="VideoLink" match="VideoPlaylist">
		<ul>
			<li>
				<xsl:attribute name="onclick">javascript:refreshAdPods();</xsl:attribute>
				<a>
					<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player_v6.html?file=<xsl:value-of select="VideoURL"/></xsl:attribute>
					<xsl:attribute name="title"><xsl:value-of select="@vtitle"/></xsl:attribute>
					<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
					<xsl:attribute name="params">lightwindow_width=400px,lightwindow_height=300px; lightwindow_close=true</xsl:attribute>
					<xsl:value-of select="@vtitle"/>
				</a>
			</li>
		</ul>
	</xsl:template>
</xsl:stylesheet>
