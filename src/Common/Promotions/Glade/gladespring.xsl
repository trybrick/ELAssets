<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script>
		function changeSrc(newSrc) {
			$('doubleClick').src=newSrc;
		}
		</script>
		<style>
			#promoLP-wrap {
			background: URL("http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/glade/gladeSpring.jpg") no-repeat; 
			height: 452px;
			position: absolute; 
			width: 590px;
			}
				
		</style>
			
		<div id="promoLP-wrap">
			<div class="coupon">
				
				
			</div>
			<div class="items">
				<ul id="promoLP-container">
					<xsl:for-each select="//ProductGroup/Product">
						<li class="promoLP-Item">
							<xsl:if test="(position() -1) mod 3 = 0">
								<xsl:attribute name="style">clear:left;</xsl:attribute>
							</xsl:if>
							<xsl:if test="string-length(Description) &gt; 0">
							<img class="promoLP-Product" src="{concat(//ImagePath,Image)}" alt="{Description}"/>
							<a href="javascript:void(0)" class="buttonPromoLP">
								<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode"/>'); clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>, <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'0')"/>);</xsl:attribute>
								<img class="addBtn" src="{//ButtonImage}" alt="Add To List"/>
							</a>
							</xsl:if>
						</li>
					</xsl:for-each>
				</ul>
				
			</div>
			<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
		</div>
	</xsl:template>
</xsl:stylesheet>
