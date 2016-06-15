<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">

		<img src="/Assets/156/Images/RecipeVideosSubHeader.gif" border="0"/>
		<h3>We offer dozens of videos on all facets of food preparation and cooking tips. Click a video name below to watch. </h3>
		<div id="column1" style="width:46%; float:left;">
		<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
			<xsl:if test = "position() &lt;= count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 2">
				<ul>
					<li>
						<a>
							<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=<xsl:value-of select="VideoURL"/></xsl:attribute>
							<xsl:attribute name="title"><xsl:value-of select="@vtitle"/></xsl:attribute>
							<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
							<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
							<xsl:value-of select="@vtitle"/>
						</a>
					</li>
				</ul>
			</xsl:if>
			
		</xsl:for-each>
	</div>
		<div id="column2" style="width:46%; float:left;">
		<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
			<xsl:if test = "position() &gt; count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 2">
				<ul>
					<li>
						<a>
							<xsl:attribute name="href">http://upload.gsngrocers.com/elvs/video/gsn_player4.html?file=<xsl:value-of select="VideoURL"/></xsl:attribute>
							<xsl:attribute name="title"><xsl:value-of select="@vtitle"/></xsl:attribute>
							<xsl:attribute name="class">lightwindow page-options</xsl:attribute>
							<xsl:attribute name="params">lightwindow_width=420,lightwindow_height=335px; lightwindow_close=true</xsl:attribute>
							<xsl:value-of select="@vtitle"/>
						</a>
					</li>
				</ul>
			</xsl:if>
			
		</xsl:for-each>
		</div>
	</xsl:template>


</xsl:stylesheet>
