<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="AdPodMaster">
		<div class="group leaderboard">
			<xsl:apply-templates select="//ExternalAds">
				<xsl:with-param name="Tile" select="'4'"/>
			</xsl:apply-templates>
		</div>
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
		<xsl:variable name="sep1" select='"&apos;:&apos;"'/>
		<xsl:variable name="sep2" select='"&apos;,&apos;"'/>
		<xsl:variable name="apos" select='"&apos;"'/>
		<xsl:if test="$Request">
			<div class="{concat('brickunit AdMaster Tile', $Tile)}" data-dimensions="300x250" data-targeting="{concat('{ ', $apos, 'dept', $sep1, $Departments, $sep2, 'kw', $sep1, $PageName, $apos, '}')}" data-store="{concat('', $Zone)}"></div>
			<div id="brxBox"></div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>