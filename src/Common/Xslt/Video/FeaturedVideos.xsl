<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />

<xsl:template name="FeaturedVideos">
	<xsl:param name="PubSiteId" />
	<xsl:param name="PrId" />
	<!--div class="featuredVideosWrapper clearfix">
		<h1>Featured Videos</h1>
		<xsl:for-each select="//DisplayVideos/Video">
			<xsl:call-template name="FeaturedVideoItem">
            	<xsl:with-param name="PubSiteId" select="$PubSiteId" />
				<xsl:with-param name="PrId" select="$PrId" />
            </xsl:call-template>
		</xsl:for-each>
	</div-->
</xsl:template>

<xsl:template name="FeaturedVideoItem" match="Video">
	<xsl:param name="PubSiteId" />
	<xsl:param name="PrId" />
		<div class="featuredVideo">
			<xsl:variable name="title" select="concat('Click to watch video -', Title)" />
			
			<a class="video-thumb" title="{$title}">
				<xsl:attribute name="href">javascript:loadVideo('<xsl:value-of select="ExternalVideoID"/>','<xsl:value-of select="Title" />','<xsl:value-of select="$PubSiteId" />','<xsl:value-of select="$PrId" />');</xsl:attribute>
				<img class="thumbnail" alt="{title}">
				<xsl:attribute name="src">
				<xsl:choose>
					<xsl:when test="string-length(ThumbNail) &gt; 0">
						<xsl:value-of select="ThumbNail" />
					</xsl:when>
					<xsl:otherwise>##root##/Assets/Common/Images/RecipeSearch/no_image_200.jpg</xsl:otherwise>
				</xsl:choose>
				</xsl:attribute>
				</img>
				<img alt="" class="overlay" src="/Assets/Common/Images/Video/thumbnailOverlay.png" />	
			</a>
			<h2>
			<a class="video-thumb">
				<xsl:attribute name="href">javascript:loadVideo('<xsl:value-of select="ExternalVideoID"/>','<xsl:value-of select="Title" />','<xsl:value-of select="$PubSiteId" />','<xsl:value-of select="$PrId" />');</xsl:attribute>
				<xsl:value-of select="Title"/>
			</a>
			</h2>
		</div>
	</xsl:template>

</xsl:stylesheet>