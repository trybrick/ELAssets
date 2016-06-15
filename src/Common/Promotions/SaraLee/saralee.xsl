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
      .items{position:absolute; margin-left:18px; margin-top: -65px; }

      .content h3 {font-size:1.6em; font-family:"Times New Roman",Georgia,Serif;}
      .content ul {list-style-type: none;}
      .content li {float: left;}
      .content li img {margin: 10px 30px;}
      .content p {border-bottom: 1px solid black; padding-bottom: 16px;}
      .content h3, .content h4, .content p {text-align: center;}

      .facebook	{height: 41px; margin: -50px 545px 0;	position: absolute;}
      .promoLP-Item {float: left;	margin-left:0px;}
	  .coupon {margin-top:-20px; }
      ul { list-style-type: none; }
      .addBtn	{margin: 6px;}
      .s-container {width: 590px}
    </style>
			
		<div class="s-container">
	  <br/>
      <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/saralee/images/saralee-no-buttons.jpg"/>
      <div class="content">   
		<div class="items">
		  <ul id="promoLP-container">
				<div class="promoLP-Item coupon">
					<a href="http://bricks.coupons.com/Start.asp?tqnm=vd2lcko12577262&amp;bt=vg&amp;o=118342&amp;c=ZC&amp;p=zsYXh3Dk">
						<img class="promoLP-Product" src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/saralee/images/coupon-button.png"/>
					</a>
				</div>
			  <xsl:for-each select="//ProductGroup/Product">
				  <div class="promoLP-Item {Class}">
					  <xsl:if test="string-length(Description) &gt; 0">
						<a href="javascript:void(0)" class="buttonPromoLP">
							<xsl:attribute name="onclick">
								changeSrc('<xsl:value-of select="ClickCode"/>'); 
								clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="//Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>,<xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'0')"/>);</xsl:attribute>
							<img class="promoLP-Product" src="{concat(//ImagePath,Image)}" alt="{Description}"/>
						</a>
					  </xsl:if>
				  </div>
			  </xsl:for-each>
		  </ul>
		  <iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
		</div>
      </div>
		</div>
	</xsl:template>
</xsl:stylesheet>
