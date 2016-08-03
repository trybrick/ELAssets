<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style>
			
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
			<!--<img alt="" class="RoundysStaticContentHeaderImg" src="{Image}"/>-->
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
