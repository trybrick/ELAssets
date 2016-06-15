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
				background: URL("http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Kelloggs/Images/Summer_GSN_BrandLandingPageBackground.jpg"); height: 738px; width: 590px;
				float: left;
			}
			
			#promoLP-container {
			margin: 225px 0 0;
			}
			
			.promoLP-Item {
			float: left;
			margin: 0 -36px 10px;
			width: 33%;
			}
			
			.buttonPromoLP img {
			margin: 0 auto;
			}
			
			.promoLP-Product {
			margin: 0 auto;
			}
	
			
			
			
		</style>
		
		<div id="promoLP-wrap">
			<div id="promoLP-container">
				<xsl:for-each select="//ProductGroup/Product">
					<div class="promoLP-Item">
						<xsl:if test="(position() -1) mod 3 = 0">
							<xsl:attribute name="style">clear:left;</xsl:attribute>
						</xsl:if>
						<xsl:if test="string-length(Description) &gt; 0">
							<img class="promoLP-Product" src="{concat(//ImagePath,Image)}" alt="{Description}"/>
							<a href="javascript:void(0)" class="buttonPromoLP">
								<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode"/>'); clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="//Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'1')"/>, <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>);</xsl:attribute>
								<img src="{//ButtonImage}" alt="Add To List"/>
							</a>
						</xsl:if>
					</div>
				</xsl:for-each>
			</div>
			<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
		</div>
	</xsl:template>
</xsl:stylesheet>
