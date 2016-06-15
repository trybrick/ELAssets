<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" />

<!--========================================================================================== -->

<xsl:template match="/">
	<style type="text/css">
		@import	url(##root##/assets/common/promotions/sargento/assets/css/screen.css);
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
	<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
	<div id="sargento-wrap">
	
		<div id="sargento-header">
			<img alt="Sargento Shredded Cheeses" src="##root##/assets/common/promotions/sargento/assets/images/sargento-header.jpg" />
		</div>
		
		<div id="sargento-main">
			<xsl:for-each select="//Categories/Category">
				<xsl:sort select="Order" data-type="number" />
				<xsl:call-template name="ProductSection" />
			</xsl:for-each>
		</div>
		
		<div id="sargento-footer">
		
		</div>
		
	</div>
</xsl:template>

<!-- ========================================================================================== -->

<xsl:template name="ProductSection" match="Category">
	<xsl:variable name="CatID" select="@id" />
	<xsl:variable name="CategoryTitle" select="Title" />
	<div class="section group">
		<h2><xsl:value-of select="//Brand" />
			<xsl:if test="//Brand/@reg = 'true'">
				<small>&#174;</small>
			</xsl:if> 
			<xsl:text> </xsl:text>
			<xsl:value-of select="$CategoryTitle" />
		</h2>
		<xsl:if test="string-length(Image) &gt; 0">
			<img alt="" border="0">
					<xsl:attribute name="src"><xsl:value-of select="concat(ancestor::Sargento/ImagePath,Image)" /></xsl:attribute>
			</img>
		</xsl:if>
		<div class="list-wrap">
			<ul>
				<xsl:for-each select="ancestor::Sargento/ProductList/Product[CategoryID = $CatID]">
					<xsl:sort select="Order" data-type="number" />
					<xsl:call-template name="ProductListItem">
						<xsl:with-param name="CategoryTitle" select="$CategoryTitle" />
					</xsl:call-template>
				</xsl:for-each>
			</ul>
		</div>
	</div>	
</xsl:template>

<!-- ========================================================================================== -->

<xsl:template name="ProductListItem" match="Product">
	<xsl:param name="CategoryTitle" />
	<xsl:variable name="AdID" select="concat(//ManufacturerCode,ProductCode,position(),'1')" />
	<xsl:variable name="CreativeID" select="concat(//ManufacturerCode,ProductCode,position(),'2')" />
	<li>
		<xsl:attribute name="class">
			<xsl:text>group</xsl:text>
			<xsl:if test="position() mod 2 = 0">
				<xsl:text> alt</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<em><xsl:value-of select="Title" /></em>
		<xsl:text> </xsl:text>
		<a class="add-button" href="#null">
			<xsl:attribute name="onclick">clickThru('%c','<xsl:value-of select="//DepartmentID" />','<xsl:value-of select="//Brand" />','<xsl:value-of select="concat(Title,' ',$CategoryTitle)" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />)</xsl:attribute>
			<xsl:text>Add</xsl:text>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>