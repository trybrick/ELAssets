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
			#promoLP-subhead {background-image: url(http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/KelloggsTailgating/Images/kelloggs_subhead.jpg); height: 65px; width: 100%;}
			#promoLP-subhead img {float: right; margin: 10px 20px 0 0;}
			#promoLP-main {background-image: url(http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/KelloggsTailgating/Images/kelloggs_bkg.jpg); float:left; width: 100%;}
			.promoLP-product-listing {float:left; margin:20px 40px; text-align: center;}
			#promoLP-product-wrap2 .promoLP-product-listing {margin: 20px 15px;}
			.promoLP-product-listing img {display: inline;}
			.promoLP-button {background-image: url(http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/KelloggsTailgating/Images/Button_AddToList.png); display: block; height: 34px; margin: 5px 0 0; width: 115px;}
		</style>
		<div id="promoLP-wrap">
			<div id="promoLP-header">
				<img border="0" src="{concat(//ImagePath,//HeaderImage)}" alt="{//HeaderImage/@alt}" />
			</div>
			<div id="promoLP-subhead">
				<a class="promoLP-link" href="{//PromoLinkUrl}" target="_blank">
					<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="//SubheadClickCode" />');</xsl:attribute>
					<img border="0" src="{concat(//ImagePath,//SubheadImage)}" alt="{//SubheadImage/@alt}" />
				</a>
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
			<xsl:for-each select="Product">
				<xsl:call-template name="ProductDetail" />
			</xsl:for-each>
		</div>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductDetail" match="Product">
		<xsl:param name="AdID" select="concat(//ManufacturerCode,ProductCode,position(),'1')" />
		<xsl:param name="CreativeID" select="concat(//ManufacturerCode,ProductCode,position(),'2')" />
		<div class="promoLP-product-listing">		
			<img alt="{Description}" src="{concat(//ImagePath,Image)}" />
			<a class="promoLP-button" href="javascript:void(0);" title="Add Item to List">
				<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode" />'); clickThru('%c',<xsl:value-of select="//DepartmentID" />,'<xsl:value-of select="//Brand" />','<xsl:value-of select="Description" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />);</xsl:attribute>
			</a>
		</div>
	</xsl:template>
	
</xsl:stylesheet>