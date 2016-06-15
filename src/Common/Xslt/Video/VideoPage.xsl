<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="FlowPlayer.xsl" />
	<xsl:import href="FeaturedVideos.xsl" />

	<xsl:template match="/">
		<xsl:call-template name="FlowPlayer">
			<xsl:with-param name="TopFeaturedVideoID" select="//ExpressLane/Video/ExternalVideoID" />
			<xsl:with-param name="TopFeaturedTitle" select="//ExpressLane/Video/Title" />
			<xsl:with-param name="PubSiteId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 238]/Value" />
			<xsl:with-param name="PrId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 239]/Value" />
		</xsl:call-template>

		<xsl:call-template name="FeaturedVideos">
			<xsl:with-param name="PubSiteId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 238]/Value" />
			<xsl:with-param name="PrId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 239]/Value" />
		</xsl:call-template> 

		<script src="/Assets/Common/Js/ActiveContent.js" type="text/javascript"></script>
		<script src="/Assets/Common/Js/Video/VideoService.js" type="text/javascript"></script>
		<script src="/Assets/Common/Js/Video/VideoPage.js" type="text/javascript"></script>
		<script src="/Assets/Common/Js/Video/flowplayer-3.2.13.min.js"></script>
	</xsl:template>
</xsl:stylesheet>
