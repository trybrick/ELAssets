<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
    <xsl:param name="PubSiteId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 238]/Value" />
	<xsl:param name="PrId" select="/ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 239]/Value" />
		<ul>
			<xsl:for-each select="ExpressLane/rss/channel/item">
			<xsl:sort select="title" />
				<li>
				<a>
					<xsl:attribute name="href">javascript:loadVideo('<xsl:value-of select="id"/>','<xsl:value-of select="title" />','<xsl:value-of select="$PubSiteId" />','<xsl:value-of select="$PrId" />');</xsl:attribute>
					<xsl:attribute name="onmouseover">doTipFromTag(this,'VideoDetailsHover:<xsl:value-of select="id" />');</xsl:attribute>
						<img>
							<xsl:attribute name="src">
							<xsl:choose>
								<xsl:when test="string-length(thumbnail) &gt; 0">
									<xsl:value-of select="thumbnail"/>
								</xsl:when>
								<xsl:otherwise>http://ucook.beta.groceryshopping.net/Assets/Common/images/jambo_default_thumb.gif</xsl:otherwise>
							</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="title"/>
							</xsl:attribute>
						</img>
					<h2>
						<xsl:value-of select="title"/>
					</h2>
				</a>
				</li>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/rss/channel/item">
				<xsl:call-template name="DetailsHover" />
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="DetailsHover" match="item">
		<div style="display:none;" class="detailsHover">
		<xsl:attribute name="id">VideoDetailsHover:<xsl:value-of select="id" /></xsl:attribute>
			<div class="clearfix" style="background:transparent url(/Assets/Common/Images/blackTransparent80.png) top left repeat;border:2px solid #fff; padding:1em 1em 2em; width:300px;">
				<h1 style="clear:both;color:#fff;float:left;font-size:14px;margin:0 0 1em 0;width:300px;"><xsl:value-of select="title" /></h1>
				<img style="background-color:#fff;float:left;padding:5px;width:100px;">
					<xsl:attribute name="src"><xsl:value-of select="thumbnail" /></xsl:attribute>
					<xsl:attribute name="alt"><xsl:value-of select="title" /></xsl:attribute>
				</img>
				<p style="color:#fff;font-size:14px;float:left;margin-left:10px; margin-top:0; width:180px"><xsl:value-of select="description" disable-output-escaping="yes" /></p>
			</div>
		</div>
	</xsl:template> 
	<xsl:template name="FirstNWords">
	<xsl:param name="TextData"/>
	<xsl:param name="WordCount"/>
	<xsl:param name="MoreText"/>
	<xsl:choose>
		<xsl:when test="$WordCount > 1 and
					(string-length(substring-before($TextData, ' ')) > 0 or
					string-length(substring-before($TextData, '  ')) > 0)
				">
			<xsl:value-of select="concat(substring-before($TextData, ' '), ' ')" disable-output-escaping="yes"/>
			<xsl:call-template name="FirstNWords">
				<xsl:with-param name="TextData" select="substring-after($TextData, ' ')"/>
				<xsl:with-param name="WordCount" select="$WordCount - 1"/>
				<xsl:with-param name="MoreText" select="$MoreText"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="(string-length(substring-before($TextData, ' ')) > 0 or
					string-length(substring-before($TextData, '  ')) > 0)">
			<xsl:value-of select="concat(substring-before($TextData, ' '), $MoreText)" disable-output-escaping="yes"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$TextData" disable-output-escaping="yes"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
