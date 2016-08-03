<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/ShoppingList/ShoppingListOGS2Buttons.xsl"/>
	<xsl:import href="http://localhost/Assets/Common/Xslt/AdPod.xsl"/>
	<xsl:import href="http://localhost/Assets/Common/Xslt/Tabs.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="HomeGrid">
		<xsl:variable name="PageHeaderText">Online shopping made easy!</xsl:variable>
		<xsl:variable name="PageSubHeaderText">Click on a tab or category below to start.</xsl:variable>
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" /><span><xsl:value-of select="$PageSubHeaderText" /></span></h2>
			<xsl:call-template name="Tabs"/>
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
			<xsl:call-template name="AdPodMaster"/>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->