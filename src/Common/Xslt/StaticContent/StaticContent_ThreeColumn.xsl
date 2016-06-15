<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
	
	
		<div id="ThreeColumnStaticContent">
		
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number"/>
					<xsl:if test="position() = 1">
						<xsl:call-template name="StaticLeftColumn"/>
					</xsl:if>
					<xsl:if test="position() = 2">
						<xsl:call-template name="StaticMiddleColumn"/>
					</xsl:if>
					<xsl:if test="position() = 3">
						<xsl:call-template name="StaticRightColumn"/>
					</xsl:if>
			</xsl:for-each>
		
		
		</div>
	</xsl:template>
	<xsl:template name="StaticLeftColumn">
		<div id="StaticLeft">
			<xsl:value-of select="Description" disable-output-escaping="yes"/>
		</div>
	</xsl:template>
	
	<xsl:template name="StaticMiddleColumn">
		<div id="StaticMiddle">
			<xsl:value-of select="Description" disable-output-escaping="yes"/>
		</div>
	</xsl:template>
	
	<xsl:template name="StaticRightColumn">
		<div id="StaticRight">
			<xsl:value-of select="Description" disable-output-escaping="yes"/>
		</div>
	</xsl:template>
	
	
	
	
	
	
	
	
	
	
</xsl:stylesheet>
