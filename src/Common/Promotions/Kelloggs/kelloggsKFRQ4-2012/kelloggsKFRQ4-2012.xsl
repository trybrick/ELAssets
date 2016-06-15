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
		function changeSrcAndRedirect(newUrl, newSrc) {
			$('doubleClick').src=newSrc;
			window.open(newUrl, '_blank');
		}
		</script>
		<style>
			#promoLP-wrap {border: 1px solid #c9c9c9;float: left;width: 590px;}
			#promoLP-subhead {background-image: url(http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/kelloggsKFRQ4-2012/Images/kelloggs_subhead.jpg); height: 65px; width: 100%;}
			#promoLP-subhead img {float: right; margin: 10px 20px 0 0;}
			#promoLP-main {background: url(http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/kelloggsKFRQ4-2012/Images/bottom_copy.jpg) no-repeat 0 bottom; float:left; height: 630px; width: 100%;}
			.promoLP-product {float:left;width:575px;}
			#promoLP-product-wrap1 {margin:5px 0 0 15px;}
			#promoLP-product-wrap2 {margin:5px 0 0 10px;}
			#promoLP-product-wrap3 {margin:5px 0 0 20px;}
			.promoLP-product-listing {float:left; width:180px; text-align: center;}
			#promoLP-product-wrap2 .promoLP-product-listing {width:140px;}
			.promoLP-product-listing img {margin:0 auto;}
			.promoLP-button img {margin:5px auto;}
		</style>
		<div id="promoLP-wrap">
			<div id="promoLP-header">
				<a class="promoLP-link" href="javascript:void(0);">
					<xsl:attribute name="onclick">changeSrcAndRedirect('<xsl:value-of select="//PromoLinkUrl"/>','<xsl:value-of select="//PromoLinkClickTracker"/>')</xsl:attribute>
					<img border="0" src="{concat(//ImagePath,//HeaderImage)}" alt="{//HeaderImage/@alt}" />
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
		<table id="{concat('promoLP-product-wrap',position())}" class="promoLP-product">
			<tbody>
				<tr>
					<xsl:for-each select="Product">
						<xsl:call-template name="ProductDetail" />
					</xsl:for-each>
				</tr>
			</tbody>
		</table>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductDetail" match="Product">
		<xsl:param name="AdID" select="concat(//ManufacturerCode,ProductCode,position(),'1')" />
		<xsl:param name="CreativeID" select="concat(//ManufacturerCode,ProductCode,position(),'2')" />
		<td class="promoLP-product-listing">		
			<img alt="{Description}" src="{concat(//ImagePath,Image)}" />
			<a class="promoLP-button" href="javascript:void(0);" title="Add Item to List">
				<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode" />'); clickThru('%c',<xsl:value-of select="//DepartmentID" />,'<xsl:value-of select="//Brand" />','<xsl:value-of select="Description" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />);</xsl:attribute>
				<img alt="Add to List" src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/kelloggsKFRQ4-2012/Images/Button_AddToList.png" />
			</a>
		</td>
	</xsl:template>
	
</xsl:stylesheet>