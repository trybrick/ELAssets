<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/215/scripts/prototype.js"></script>
		<script type="text/javascript" src="/Assets/215/scripts/scriptaculous.js?load=effects"></script>
		<script type="text/javascript" src="/Assets/215/scripts/lightwindow.js"></script>
		<link rel="stylesheet" href="/Assets/215/Styles/lightwindow.css" type="text/css" media="screen" />
		<style>
			#RoundysStaticContent {float:left;padding:0 20px;width:870px;}
			#RoundysStaticContentHeader h2 {color:#797979;font-size:24px;margin:15px 0;padding:0;}
			#RoundysStaticContentHeader p {color:#797979;font-size:12px;line-height:20px;margin:30px 0;padding:0;}
			.RoundysStaticBodyRow {float:left;margin:0 0 30px;width:100%;}
			#RoundysStaticContentBody {float:left;width:50%;}
			#RoundysStaticContentBody h3 {color:#797979;font-size:16px;margin:0;padding:0;}
			#RoundysStaticContentBody p {color:#797979;font-size:12px;line-height:20px;margin:10px 0;padding:0;}
			#RoundysStaticContentBody img {float:left;}
			.RoundysStaticContentBodyText {float:left;margin:0 0 0 15px;width:210px;}
		</style>
		<div id="RoundysStaticContent">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number"/>
				<xsl:choose>
					<xsl:when test="position() = 1">
						<xsl:call-template name="RoundysStaticHeader"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="position() mod 2 = 0">
							<xsl:text disable-output-escaping="yes">&lt;div class="RoundysStaticBodyRow"&gt;</xsl:text>
						</xsl:if>
						<xsl:call-template name="RoundysStaticBody"/>
						<xsl:if test="(position() = last()) or (position() mod 2 != 0)">
							<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="RoundysStaticHeader">
		<div id="RoundysStaticContentHeader">
			<h2>
				<xsl:value-of select="Title" disable-output-escaping="yes"/>
			</h2>
			<img alt="" class="RoundysStaticContentHeaderImg" src="{Image}"/>
			<xsl:value-of select="Description" disable-output-escaping="yes"/>
		</div>
	</xsl:template>
	<xsl:template name="RoundysStaticBody">
		<div id="RoundysStaticContentBody">
			<img alt="" class="RoundysStaticContentBodyImg" src="{Image}"/>
			<div class="RoundysStaticContentBodyText">
				<h3>
					<xsl:value-of select="Title" disable-output-escaping="yes"/>
				</h3>
				<xsl:value-of select="Description" disable-output-escaping="yes"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
