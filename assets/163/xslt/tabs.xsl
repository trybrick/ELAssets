<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="nav-div">
			<ul id="navigation-list">
				<li class="nav-item"><a class="WeeklyAd"><xsl:attribute name="href">##root##/Shop/WeeklyAd.aspx</xsl:attribute>Weekly<br/>Ad</a></li>
				<li class="nav-item"><a class="Coupons"><xsl:attribute name="href">##root##/Shop/Coupons.aspx</xsl:attribute>Coupons</a></li>
				<li class="nav-item"><a class="Browse"><xsl:attribute name="href">##root##/Shop/Browse.aspx</xsl:attribute>Browse the Aisles</a></li>
				<li class="nav-item"><a class="Recipes"><xsl:attribute name="href">##root##/Recipes/RecipeCenter.aspx</xsl:attribute>Recipe Center</a></li>
				<li class="nav-item"><a class="Videos"><xsl:attribute name="href">##root##/Recipes/RecipeVideos.aspx</xsl:attribute>Cooking Videos</a></li>
				<li class="nav-item"><a class="Locator"><xsl:attribute name="href">##root##/StoreLocator.aspx</xsl:attribute>Store Locator</a></li>
			</ul>
		</div>
	</xsl:template>
</xsl:stylesheet>