<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfGenericCategory">
				<xsl:apply-templates select="ExpressLane/ArrayOfGenericCategory" />
			</xsl:when>
			<xsl:when test="ExpressLane/ArrayOfCategory">
				<xsl:copy-of select="ExpressLane/ArrayOfCategory" />
			</xsl:when>
			<xsl:otherwise>
				<ArrayOfCategory xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ArrayOfGenericCategory">
		<ArrayOfCategory xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="GenericCategory">
				<xsl:call-template name="GenericCategory" />
			</xsl:for-each>
		</ArrayOfCategory>
	</xsl:template>
	<xsl:template name="GenericCategory" match="GenericCategory">
		<Category>
			<xsl:copy-of select="CategoryID" />
			<xsl:copy-of select="CategoryName" />
			<xsl:copy-of select="LegacyID" />
			<xsl:copy-of select="LegacyParentID" />
			<xsl:copy-of select="LegacyTypeID" />
			<xsl:copy-of select="ParentCategoryID" />
			<xsl:copy-of select="LargeImageUrl" />
			<xsl:copy-of select="SmallImageUrl" />
			<xsl:copy-of select="ExportKeyID" />
		</Category>
	</xsl:template>
</xsl:stylesheet>