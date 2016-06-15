<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="OrderSlideShow">
		<xsl:param name="Delay"/>
		<script type="text/javascript">
		
		// Global variables
			var ordering_totalSlides = <xsl:value-of select="count(//OrderSlideShow/OrderSlide[Description != '' or Image != ''])"/>;
			var ordering_delay = 4;
		
		// CSS selectors - store id attributes as vars
			var ordering_slideIDPrefix = 'orderSlide';
			
		</script>
		<script src="##root##/Assets/228/JS/slideshow-redners.js" type="text/javascript"/>
		<div id="OrderSlideshow">
			<xsl:for-each select="//OrderSlideShow/OrderSlide">
				<xsl:sort data-type="number" select="SortBy"/>
				<div class="orderSlide" id="{concat('orderSlide',position()-1)}">
					<xsl:attribute name="style">
						<xsl:text>display:</xsl:text>
						<xsl:choose>
							<xsl:when test="position()-1 = 0">block</xsl:when>
							<xsl:otherwise>none</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="Description != ''">
							<xsl:value-of disable-output-escaping="yes" select="Description"/>
						</xsl:when>
						<xsl:otherwise>
							<p>
								<img alt="" id="slideBackupImage" src="{Image}"/>
							</p>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:for-each>
			<!--
		<div id="slideNav">
			<xsl:call-template name="SlideShowNav"/>
		</div>
		<div id="slideNavButtons">
			<xsl:call-template name="SlideShowNavButtons"/>
		</div>
		
		<a id="playpause" href="#" onclick="PlayPause();">
		</a>
		<img id="failover" alt="" class="slide" src="/Assets/Common/Images/SplashImage.jpg" style="display:none;"/>
		
		-->
		</div>
	</xsl:template>
	<!--
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
	-->
	<!--
	<xsl:template name="SlideShowNavButtons" match="/">	
			<a id="previous" href="#" onclick="Previous();">Previous</a>
			<a id="playorpause" href="#" onclick="PlayPause();">Play / Pause</a>
			<a id="next" href="#" onclick="Next();">Next</a>
	
	</xsl:template>
	-->
</xsl:stylesheet>
