<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style>
			body {font-family:Arial, Helvetica, sens-serif;}
			a {color:#666666;}
			a:hover {color:#000000;}
			h1, h3, h4 {margin: .25em 0; text-align: center;}
			ul {list-style:none; padding:0;}
			li {margin: .25em 0;}
		</style>
		<iframe width="100%" scrolling="auto" height="335" frameborder="0" id="VideoPlayer" name="VideoPlayer" src="https://upload.brickinc.net/elvs/video/gsn_player4.html?file=intro_999" marginwidth="0" marginheight="0"/>
		<h4 id="RecipeTitle">Select a Video</h4>
		<ul id="column1" style="width:25%; float:left;">
			<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
				<xsl:if test="position() &lt;= count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4">
					<xsl:call-template name="VideoLinks"/>
				</xsl:if>
			</xsl:for-each>
		</ul>
		<ul id="column2" style="width:25%; float:left;">
			<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
				<xsl:if test="(position() &gt; (count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4)) and (position() &lt; (count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4) * 2)">
					<xsl:call-template name="VideoLinks"/>
				</xsl:if>
			</xsl:for-each>
		</ul>
		<ul id="column3" style="width:25%; float:left;">
			<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
				<xsl:if test="(position() &gt; (count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4) * 2) and (position() &lt; (count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4) * 3)">
					<xsl:call-template name="VideoLinks"/>
				</xsl:if>
			</xsl:for-each>
		</ul>
		<ul id="column4" style="width:25%; float:left;">
			<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
				<xsl:if test="position() &gt; (count(/ExpressLane/FlashPlayerConfig/VideoPlaylist) div 4) * 3">
					<xsl:call-template name="VideoLinks"/>
				</xsl:if>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="VideoLinks">
		<li>
			<a href="javascript:void(0)">
				<xsl:attribute name="onclick">$('VideoPlayer').src = 'https://upload.brickinc.net/elvs/video/gsn_player4.html?file=<xsl:value-of select="VideoURL"/>';$('RecipeTitle').innerHTML = '<xsl:value-of select="@vtitle"/>'</xsl:attribute>
				<xsl:value-of select="@vtitle"/>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>
