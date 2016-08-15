<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template name="SlideShow" match="/">
	<xsl:param name="Delay" />
		<script type="text/javascript"><![CDATA[
		
		// Global variables
			var totalSlides = ]]><xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent[Description != '' or Image != ''])"/><![CDATA[;
			var delay = ]]><xsl:choose>
			<xsl:when test="$Delay &gt; 0"><xsl:value-of select="$Delay" /></xsl:when>
			<xsl:otherwise>6</xsl:otherwise>
			</xsl:choose><![CDATA[;
		
		// CSS selectors - store id attributes as vars
			var playPauseID = 'playpause';
			var playPauseButtonID = 'playorpause';
			var slideIDPrefix = 'slide';
			var playingClass = 'playing';
			var failOverID = 'failover';
			
		]]></script>
		<script type="text/javascript" src="##root##/Assets/Common/js/slideshow-home.js"></script>
		<div id="slideshow">
		<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort data-type="number" select="SortBy"/>
			<div class="slide" id="{concat('slide',position()-1)}">
				<xsl:attribute name="style">
					<xsl:text>display:</xsl:text>
					<xsl:choose>
						<xsl:when test="position()-1 = 0">block</xsl:when>
						<xsl:otherwise>none</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="Description != ''">
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:when>
					<xsl:otherwise>
						<p>
							<img id="slideBackupImage" alt="" src="{Image}" />
						</p>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</xsl:for-each>
		<div id="slideNav">
			<xsl:call-template name="SlideShowNav"/>
		</div>
		<div id="slideNavButtons">
			<xsl:call-template name="SlideShowNavButtons"/>
		</div>
		
		<a id="playpause" href="#" onclick="PlayPause();">
		</a>
		<img id="failover" alt="" class="slide" src="/Assets/Common/Images/SplashImage.jpg" style="display:none;"/>
		</div>
	</xsl:template>

	<xsl:template name="SlideShowNav" match="/">	
		<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<a href="#">
				<xsl:attribute name="onclick">GoToSlide(<xsl:value-of select="position()-1"/>);</xsl:attribute>
				<xsl:if test="position() = 1">
					<xsl:attribute name="class">firstSlideNav</xsl:attribute>
				</xsl:if>
				<xsl:if test="position() = last()">
					<xsl:attribute name="class">lastSlideNav</xsl:attribute>
				</xsl:if>
				<span>
					<xsl:value-of select="position()"/>
				</span>
			</a>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="SlideShowNavButtons" match="/">	
			<a id="previous" href="#" onclick="Previous();">Previous</a>
			<a id="playorpause" href="#" onclick="PlayPause();">Play / Pause</a>
			<a id="next" href="#" onclick="Next();">Next</a>
	</xsl:template>
	
</xsl:stylesheet>