<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div id="NoItems">
			<div id="CtrlDivSubTitle">
				<h2>There are currently no items in your cart:</h2>
			</div>
			<p>Please choose one of the following options:</p>
			<ul id="ogsNoItemsLinks">	
				<li><a><xsl:attribute name="href">##root##/Shop/Product.aspx</xsl:attribute>Shop By Department</a></li>
				<li><a><xsl:attribute name="href">##root##/Shop/MyPantry.aspx</xsl:attribute>View previous order items</a></li>
				<li><a><xsl:attribute name="href">##root##/Shop/PersonalizedSpecials.aspx</xsl:attribute>View your Specials</a></li>		
				<li><a><xsl:attribute name="href">##root##/Shop/Specials.aspx</xsl:attribute>View In Store Specials</a></li>
				<li><a><xsl:attribute name="href">##root##/Shop/ProductSearch.aspx</xsl:attribute>Search for a Product</a></li>
			</ul>		
			<br />
		</div>
	</xsl:template>
</xsl:stylesheet>