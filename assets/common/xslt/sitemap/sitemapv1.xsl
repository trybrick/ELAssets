<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" />
	<xsl:template match="/">
		<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
			<xsl:for-each select="ExpressLane/ArrayOfPageInformation/PageInformation">
				<xsl:call-template name="Page">
					<xsl:with-param name="Domain" select="concat(//Uri/Scheme, '://', //Uri/Host)"/>
				</xsl:call-template>
			</xsl:for-each>
		</urlset>
	</xsl:template>
	<xsl:template match="PageInformation" name="Page">
		<xsl:param name="Domain"/>
		<xsl:variable name="Priority">
			<xsl:value-of select="number(Attributes/PageAttribute[PageAttributeTypeID = 8]/AttributeValue)" />
		</xsl:variable>
		<url xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
			<loc>
				<xsl:value-of select="concat($Domain, Stem)"/>
			</loc>
			<xsl:choose>
				<xsl:when test="string-length(LastModified) &gt; 0">
					<xsl:call-template name="LastMod">
						<xsl:with-param name="Input" select="LastModified" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="Attributes/PageAttribute[PageAttributeTypeID = 7]">
					<xsl:call-template name="LastMod">
						<xsl:with-param name="Input" select="Attributes/PageAttribute[PageAttributeTypeID = 7]/AttributeValue" />
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="Attributes/PageAttribute[PageAttributeTypeID = 9]">
					<changefreq>
						<xsl:value-of select="Attributes/PageAttribute[PageAttributeTypeID = 9]/AttributeValue"/>
					</changefreq>
				</xsl:when>
				<xsl:when test="IsStaticContent != 'true'">
					<changefreq>weekly</changefreq>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$Priority &gt;= 0 and $Priority &lt;= 1">
					<priority><xsl:value-of select="$Priority" /></priority>
				</xsl:when>
				<xsl:when test="$Priority &gt; 1">
					<priority>1.0</priority>
				</xsl:when>
				<xsl:when test="$Priority &lt; 0">
					<priority>0.0</priority>
				</xsl:when>
			</xsl:choose>
		</url>
	</xsl:template>
	<xsl:template name="LastMod">
		<xsl:param name="Input" />
		<xsl:variable name="Date">	
			<xsl:choose>
				<xsl:when test="contains($Input, 'T')">
					<xsl:value-of select="substring-before($Input, 'T')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$Input" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Year" select="substring-before($Date, '-')" />
		<xsl:variable name="MonthDay" select="substring-after($Date, '-')" />
		<xsl:variable name="Month" select="substring-before($MonthDay, '-')" />
		<xsl:variable name="Day" select="substring-after($MonthDay, '-')" />
		<xsl:if test="number($Year) and number($Month) and number($Day)">
			<lastmod xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"><xsl:value-of select="concat(format-number($Year, '0000'), '-', format-number($Month, '00'), '-', format-number($Day, '00'))" /></lastmod>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>