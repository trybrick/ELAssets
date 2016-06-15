<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/ShoppingList/ShoppingListOGS2Buttons.xsl"/>
	<xsl:import href="/Assets/Common/Xslt/AdPod4.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
	<div id="home" class="main-wrapper">
		<div class="HomeGrid">
			<h2 class="pageHeader">
						<xsl:text>Online shopping made easy!</xsl:text>
						<span>
							<xsl:text>Click on a department below to start.</xsl:text>
						</span>
			</h2>
			<div id="Departments" class="clearfix">
				<xsl:for-each select="//ArrayOfGenericCategory/GenericCategory[string-length(ParentCategoryID) &lt; 1]">
					<xsl:sort select="Name"/>
					<xsl:variable name="CategoryID" select="CategoryID"/>
					<a class="grid_3">
						<xsl:attribute name="href">
							<xsl:value-of select="concat('/Shop/Product.aspx?Department=', $CategoryID)"/>
						</xsl:attribute>
						<img>
							<xsl:attribute name="alt">
								<xsl:value-of select="CatgoryName"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="SmallImageUrl"/>
							</xsl:attribute>
						</img>
						<span>
							<xsl:value-of select="CategoryName"/>
						</span>
					</a>
				</xsl:for-each>
			</div>
		</div>
		<div id="sidebar">
			<xsl:call-template name="ShoppingList"/>
			<xsl:apply-templates select="//ExternalAds">
				<xsl:with-param name="Tile" select="'4'"/>
			</xsl:apply-templates>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet>