<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="JamboPlayer" match="/" >
	<xsl:param name="TopFeaturedVideoID" />
	<xsl:param name="TopFeaturedTitle" />
    <xsl:param name="PubSiteId" />
	<xsl:param name="PrId" />
	<xsl:param name="PlayerSource" select="concat('http://groceryshopping.jambocast.com/tower.php?pubsite_id=',$PubSiteId,'&amp;pr=',$PrId,'&amp;vcs_id=')" />
		<script type="text/javascript">
			// vars from XML values
			var defaultVideoID = <xsl:value-of select="$TopFeaturedVideoID" />;
			var defaultVideoTitle = '<xsl:value-of select="$TopFeaturedTitle" />';
			var playerSrc = '<xsl:value-of select="$PlayerSource" />';
			<![CDATA[
			
			document.observe('dom:loaded',function() {
				var qs = window.location.search.substring(1).toQueryParams();
				;
				var videoid = (qs.videoid != undefined) ? qs.videoid : defaultVideoID;
				var title = (qs.videotitle != undefined) ? qs.videotitle : defaultVideoTitle;
				
				$('CurrentVideoTitle').innerHTML = unescape(title);
				$('VideoPlayerTarget').writeAttribute('src',playerSrc + videoid);
			});
			
			]]>
		</script>
		<div class="videoWrapper clearfix">
			<h1>5 Minute Cooking Classes</h1>
			<div id="VideoPlayer" class="videoColumn">
				<h2><span id="CurrentVideoTitle"></span></h2>
				<iframe id="VideoPlayerTarget" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" src="" />
			</div>
			<div id="VideoNavigation" class="videoColumn">
				<div id="VideoBrowse" class="videoTabPage">
					<div class="breadcrumb">
						<a class="allCategoriesLink" href="javascript:switchDivs('CategoryList','PlayListTarget');updateCurrentCategory('');">Categories</a>
						<span id="CurrentCategory"></span>
					</div>
					<div id="PlayListTarget" style="display:none;">
					</div>
					<div id="CategoryList" style="display:block;">
						<ul>
						<xsl:for-each select="//playlists/playlist">
						<xsl:sort select="."/>
							<li>
								<a>
									<xsl:attribute name="href">javascript:LoadPlayList('<xsl:value-of select="@id"/>');updateCurrentCategory('<xsl:value-of select="." />');ResetScrollPos();</xsl:attribute>
									<xsl:value-of select="."/>
								</a>
							</li>
						</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
