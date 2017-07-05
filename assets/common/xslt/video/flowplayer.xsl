<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- ================================================================= -->
	<xsl:template match="/" name="AdPodMaster">
		<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'9'"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template name="AdPod" match="ExternalAds">
		<xsl:param name="Tile"/>
		<xsl:param name="Request" select="AdPods/AdPod[Tile=$Tile]/Request"/>
		<xsl:param name="Zone" select="AdPods/AdPod[Tile=$Tile]/Zone"/>
		<xsl:param name="UnitName" select="AdPods/AdPod[Tile=$Tile]/UnitName"/>
		<xsl:param name="UnitNameRoot" select="AdPods/AdPod[Tile=$Tile]/UnitNameRoot"/>
		<xsl:param name="Departments" select="AdPods/AdPod[Tile=$Tile]/Departments"/>
		<xsl:param name="BrandName" select="AdPods/AdPod[Tile=$Tile]/BrandName"/>
		<xsl:param name="PageName" select="AdPods/AdPod[Tile=$Tile]/PageName"/>
		<xsl:variable name="sep" select='"&apos;,&apos;"'/>
		<xsl:variable name="apos" select='"&apos;"'/>
		<xsl:if test="$Request">
			<div id="{concat('div-gpt-ad-', $Tile)}" class="{concat('AdMaster Tile', $Tile)}" data-size="[400,50]" data-info="{concat('[', $apos, $Tile, $sep, $Zone, $sep, $UnitName, $sep, $UnitNameRoot, $sep, $Departments, $sep, $BrandName, $sep, $PageName, $apos, ']')}"></div>
		</xsl:if>
	</xsl:template>
<!-- ================================================================= -->
	<xsl:template name="FlowPlayer" match="/" >
	<xsl:param name="TopFeaturedVideoID" />
	<xsl:param name="TopFeaturedTitle" />
    <xsl:param name="PubSiteId" />
	<xsl:param name="PrId" />

		<div class="videoWrapper clearfix">

			<h1>5 Minute Cooking Classes</h1>
			    <div id="VideoPlayer" class="videoColumn">
				<h2><span id="CurrentVideoTitle"></span></h2>
				<a href="#"
				   style="display:block;width:325px;height:250px;"
				   id="VideoPlayerTarget">
				</a>
			</div>

 			<div id="VideoNavigation" class="videoColumn">
				<div id="VideoBrowse" class="videoTabPage">
					<div class="breadcrumb">
						<a class="allCategoriesLink">Videos</a>
						<span id="CurrentCategory"></span>
					</div>
					<div id="CategoryList" style="display:block;">
						<xsl:for-each select="ExpressLane/FlashPlayerConfig/VideoPlaylist">
							<ul>
								<li>
									<a onClick="play('{@vtitle}','{VideoURL}');">
										<xsl:attribute name="title"><xsl:value-of select="@vtitle"/></xsl:attribute>
										<xsl:value-of select="@vtitle"/>
									</a>
								</li>
							</ul>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
		<xsl:call-template name="AdPodMaster"></xsl:call-template>
		<script type="text/javascript">

			function play(title, name) {
				name = name.toLowerCase();
				var url = 'https://upload.brickinc.net/elvs/video/flvs/' + name + '.flv';

				$('CurrentVideoTitle').innerHTML = unescape(title);

				flowplayer("VideoPlayerTarget", "/assets/common/flash/flowplayer-3.2.18.swf", {
					clip: {
						url: url,
						autoPlay: true
					}
				});
			}

			window.onload = function() {
				play('Artichokes','GSN-Artichokes');
			}

		</script>
	</xsl:template>

</xsl:stylesheet>
