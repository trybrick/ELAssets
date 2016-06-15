<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<!-- ================================================================== -->

<xsl:template name="HorizontalBanners" match="/">
	<div class="clear" style="width:100%; height:20px;">&#xA0;</div>
	<div id="adInternal"/>
	<xsl:for-each select="//HorizontalBanners/AdPods/AdPod">
		<xsl:call-template name="HorizontalAds">
			<xsl:with-param name="Tile" select="Tile" />
			<xsl:with-param name="Request" select="Request" />
		</xsl:call-template>
	</xsl:for-each>
</xsl:template>

<!-- ================================================================== -->

<xsl:template name="HorizontalAds" match="AdPod">
	<xsl:param name="Tile" />
	<xsl:param name="Request" />
	<div class="{concat('Tile', $Tile)} group horizontal-banners">
		<iframe id="pixel" height="1" frameborder="0" width="1" scrolling="no" src="/Assets/Common/Images/pixel.gif" />
		<iframe frameborder="0" scrolling="no" src="{concat($Request, 'kw=shoppinglist;')}" class="{concat('adPodFrame', $Tile)}" width="468" height="60"></iframe>
	</div>
</xsl:template>

<!-- ================================================================== -->

</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
