<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<!--========================================================================================== -->

	<xsl:template match="/">		
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script>
		function changeSrc(newSrc) {
			$('doubleClick').src=newSrc;
		}
		</script>
		<style>
			@import url(<xsl:value-of select="//CSS" />);
		</style>
		<div id="promoLP-wrap">
			<div id="promoLP-header">
				<a class="promoLP-logo" href="{//BrandSiteUrl}" target="_blank">
					<img border="0" src="{concat(//ImagePath,//HeaderImage)}" alt="{//HeaderImage/@alt}" />
				</a>
				<xsl:if test="string-length(//PageDescriptionText) &gt; 0">
					<h2><xsl:value-of select="//PageDescriptionText"/></h2>
				</xsl:if>
			</div>
			<div id="promoLP-main">
				<xsl:for-each select="//ProductGroup">
					<xsl:call-template name="ProductGroupDetail" />
				</xsl:for-each>
			</div>
			<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"></iframe>
		</div>
	</xsl:template>
	
<!--========================================================================================== -->

	<xsl:template name="ProductGroupDetail" match="ProductGroup">
		<div id="{concat('promoLP-product-wrap',position())}" class="promoLP-product">
			<div class="promoLP-product-header">
				<h3><xsl:value-of select="Title" disable-output-escaping="yes" /></h3>
				<img src="{concat(//ImagePath,Image)}" alt="{Image/@alt}" />
			</div>
			<div class="promoLP-product-main">
				<xsl:for-each select="Product">
					<xsl:call-template name="ProductDetail" />
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductDetail" match="Product">
		<xsl:param name="AdID" select="concat(//ManufacturerCode,ProductCode,position(),'1')" />
		<xsl:param name="CreativeID" select="concat(//ManufacturerCode,ProductCode,position(),'2')" />
		<div class="promoLP-product-listing">		
			<p><xsl:value-of select="Description" /></p>
			<em><xsl:value-of select="SubHeading" /></em>
			<a class="promoLP-button" title="Add Item to List" src="#null">
				<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode" />'); clickThru('%c',<xsl:value-of select="//DepartmentID" />,'<xsl:value-of select="//Brand" />','<xsl:value-of select="../Title" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />);</xsl:attribute>
				<xsl:text>Add To List</xsl:text>
			</a>
		</div>
	</xsl:template>
	
</xsl:stylesheet>