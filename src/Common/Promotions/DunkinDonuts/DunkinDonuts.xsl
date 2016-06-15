<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<!--========================================================================================== -->

	<xsl:template match="/">
		<xsl:param name="NumberOfRows" select="round( ( count(//DunkinDonuts/ProductList/Product) + 1) div (//DunkinDonuts/MasterLayout/@columns ) )" />
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<style>
			@import url(<xsl:value-of select="//CSS/Stylesheet" />);
		</style>
		<div id="{//WrapID}">
			<div id="{//HeaderID}">
				<a class="logo" href="{//BrandSiteUrl}" target="_blank">
					<img border="0" src="{concat(//ImagePath,//Logo)}" alt="{//Logo/@alt}" />
				</a>
				<h1><span class="image-replacement"></span><xsl:value-of select="//HeadingText" /></h1>
			</div>
			<div id="{//MainID}">
				<xsl:call-template name="RowLoop">
					<xsl:with-param name="LastIndex" select="$NumberOfRows" />
					<xsl:with-param name="CurrentIndex" select="0" />
				</xsl:call-template>
			</div>
			<div id="{//FooterID}">
				<img src="{concat(//ImagePath,//FooterImage)}" alt="" />
			</div>
		</div>
	</xsl:template>
	
<!--========================================================================================== -->

	<xsl:template name="RowLoop">
		<xsl:param name="LastIndex" />
		<xsl:param name="CurrentIndex" />
		<xsl:variable name="Row" select="$CurrentIndex + 1" />
		<xsl:call-template name="ProductRow">
			<xsl:with-param name="Row" select="$Row" />
		</xsl:call-template>
		<xsl:if test="$CurrentIndex &lt; $LastIndex">
			<xsl:call-template name="RowLoop">
				<xsl:with-param name="LastIndex" select="$LastIndex" />
				<xsl:with-param name="CurrentIndex" select="$CurrentIndex + 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductRow">
		<xsl:param name="Row" />
		<div class="flavor-row group" id="{concat('row-',$Row)}">
			<xsl:for-each select="//ProductList/Product[Layout/@row = $Row]">
				<xsl:sort select="Order" data-type="number" />
				<xsl:call-template name="ProductDetail" />
			</xsl:for-each>
		</div>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductDetail" match="Product">
		<xsl:param name="AdID" select="concat(ManufacturerCode,ProductCode,position(),'1')" />
		<xsl:param name="CreativeID" select="concat(ManufacturerCode,ProductCode,position(),'2')" />
		<div>
			<xsl:attribute name="class">
				<xsl:value-of select="//ProductDetailClass" />
				<xsl:if test="Order mod 2 &gt; 0">
					<xsl:text> alternate</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<img src="{concat(//ImagePath,Image)}" alt="{Image/@alt}" />
			<h2>
				<xsl:value-of select="Title" disable-output-escaping="yes" />
				<xsl:choose>
					<xsl:when test="Title/@reg = 'true'">
						<small>&#174;</small>
					</xsl:when>
					<xsl:when test="Title/@tm = 'true'">
						<small>&#8482;</small>
					</xsl:when>
				</xsl:choose>
			</h2>
			<p><xsl:value-of select="Description" /></p>
			<em><xsl:value-of select="SubHeading" /></em>
			<a class="lp-button" href="#null" title="Add Item to List">
				<xsl:attribute name="onclick">
					clickThru('%c',10360,'<xsl:value-of select="//Brand" />','<xsl:value-of select="concat(Title,' Coffee')" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />)
				</xsl:attribute>
				Add To List
			</a>
		</div>
	</xsl:template>

<!--========================================================================================== -->

<xsl:template name="ClickFunction">
	<!-- clickThru(click, DepartmentID, BrandName, ProductDescription, ProductCode, Quantity, DisplaySize, RegularPrice, CurrentPrice, SavingsAmount, SavingsStatement, AdCode, CreativeID) -->
	
</xsl:template>

</xsl:stylesheet>