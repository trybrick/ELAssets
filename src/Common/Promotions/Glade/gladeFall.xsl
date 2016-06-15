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
			
			.facebook
			{ 
				height: 41px;
				margin: -50px 545px 0;
				position: absolute;
			}

			.items
			{
				margin: 225px -10px;
			}
		
			.promoLP-Item 
			{
				float: left;
				width: 33%;
			}
			
			ul 
			{ 
				list-style-type: none;
			}

			.addBtn
			{
				margin: 6px;
			}

			.s-container
			{
			background: URL("http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Glade/images/background.jpg") no-repeat; 
			height: 900px;
			position: relative; 
			width: 590px;
			float: left;
			}

			.coupon
			{
				float: left;
				margin: 160px 246px;
				position: absolute;
			}
				
		</style>
			
		<div class="s-container">
			
				<div class="clickThrough">
					<a href="http://www.giantfoodstores.com/shareddev/sharedcontent/savings/pah.cfm" target="_blank">
						<img class="coupon" src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/Glade/images/couponbtn.png" alt= "Coupons"/>
					</a>
				</div>
			<div class="items">
				<ul id="promoLP-container">
					<xsl:for-each select="//ProductGroup/Product">
					<div class="promoLP-Item">
						<xsl:if test="(position() -1) mod 3 = 0">
							<xsl:attribute name="style">clear:left;</xsl:attribute>
						</xsl:if>
						<xsl:if test="string-length(Description) &gt; 0">
							<img class="promoLP-Product" src="{concat(//ImagePath,Image)}" alt="{Description}"/>
							<a href="javascript:void(0)" class="buttonPromoLP">
								<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode"/>'); clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="//Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>, <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'0')"/>);</xsl:attribute>
								<img class="addBtn" src="{//ButtonImage}" alt="Add To List"/>
							</a>
						</xsl:if>
					</div>
				</xsl:for-each>
				</ul>
				<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
