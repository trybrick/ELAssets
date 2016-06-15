<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<style>
			@import url(##root##<xsl:value-of select="//LandingPage/Stylesheet"/>);
		</style>
		<div id="pinnacleContainer">
			<div id="pinnacleHeader">
				<img id="logo" alt="Mrs. Pauls">
					<xsl:attribute name="src">
						<xsl:value-of select="concat(LandingPage/imagePath,//LandingPage/Logo)"/>
					</xsl:attribute>
				</img>
			</div>
			<xsl:for-each select="//Category">
				<xsl:variable name="categoryIndex">
					<xsl:value-of select="concat('206299729',position())"/>
				</xsl:variable>
				<div class="category">
					<img class="categoryImage">
						<xsl:attribute name="alt">
							<xsl:value-of select="Name"/>
						</xsl:attribute>
						<xsl:attribute name="src">
							<xsl:value-of select="//LandingPage/imagePath"/>
							<xsl:value-of select="image"/>
						</xsl:attribute>
					</img>
					<div class="categoryBox">
						<xsl:attribute name="class">categoryBox <xsl:value-of select="className"/></xsl:attribute>
						<h2>
							<xsl:value-of select="Name"/>
						</h2>
						<div class="categoryProducts">
							<xsl:attribute name="class">categoryProducts <xsl:value-of select="className"/></xsl:attribute>
							<xsl:for-each select="Product">
								<xsl:call-template name="productRow">
									<xsl:with-param name="productKey" select="concat($categoryIndex,position())"/>
								</xsl:call-template>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="productRow" match="Product">
		<xsl:param name="productKey"/>
		<div class="categoryRow">
			<span class="productName">
				<strong>
					<xsl:value-of select="."/>
				</strong>
				<br/>
				<xsl:value-of select="@size"/>
			</span>
			<a><xsl:attribute name="href">javascript:clickThru('%c','10349','<xsl:value-of select="//LandingPage/Brand"/>','<xsl:value-of select="concat(.,' - ',@size)"/>','24842','1','<xsl:value-of select="@size"/>','','','','','<xsl:value-of select="$productKey"/>');</xsl:attribute>Add To List
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
