<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script type="text/javascript" src="http://malsup.github.com/jquery.cycle2.js"></script>
		<script>
		  function changeSrc(newSrc) {
			  $('doubleClick').src=newSrc;
		  }
		</script>
		<style>
			.content h3 {font-size:1.6em; font-family:"Times New Roman",Georgia,Serif;}
			
			.container {width: 590px;}
			.content ul {list-style-type: none;}
			.content li {float: left;}
			.content li img {margin: 10px 30px;}
			.content p {border-bottom: 1px solid black; padding-bottom: 16px;}
			.content h3, .content h4, .content p {text-align: center;}
		  
			.cycle-pager {text-align: center; width: 100%; z-index: 500; top: 420px; padding-bottom:30px; overflow:hidden; position:absolute; left:-154px;}
			.cycle-pager span { font-family: arial; font-size: 50px; width: 16px; height: 16px; display: inline-block; color: #ddd; cursor: pointer;}
			.cycle-pager span.cycle-pager-active { color: #350010;}
			.cycle-pager > * { cursor: pointer;}
				
			.facebook	{height: 41px; margin: -50px 545px 0;	position: absolute;}
			.items	{margin: 25px 0;}		
			.promoLP-Item {float: left;	width: 33%;	}			
			ul { list-style-type: none; }
			.addBtn	{margin: 6px;}
			.s-container {width: 590px}				
		</style>
			
		<div class="s-container">
      <div class="container">
	      <div class="cycle-slideshow"
          data-cycle-fx="scrollHorz"
          data-cycle-pause-on-hover="true"
          data-cycle-speed="1000"
          data-cycle-pager=".cycle-pager">
          <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/brookside/images/coffee.jpg"/>
          <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/brookside/images/granola.jpg"/>
          <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/brookside/images/icecream.jpg"/>
          <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/brookside/images/wine.jpg"/>
          <img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/brookside/images/yogurt.jpg"/>
        </div>
      </div>
	  <br/>
      <div class="cycle-pager"></div>
      <div class="content">
			  <h3>Experience Chocolate Like Never Before</h3>
			  <p>BROOKSIDE chocolatiers have artfully blended exotic fruit juices and flavors from around the world to create the ultimate chocolate experience. 
        The soft sweetened centers dipped in luscious dark chocolate provide an intriguing texture and exotic taste experience.</p>
        <h3>Find all three delicious flavors in store today!</h3>
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
								<xsl:attribute name="onclick">
									changeSrc('<xsl:value-of select="ClickCode"/>'); 
									clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="//Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>,<xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'0')"/>);</xsl:attribute>
								<img class="addBtn" src="{//ButtonImage}" alt="Add To List"/>
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
