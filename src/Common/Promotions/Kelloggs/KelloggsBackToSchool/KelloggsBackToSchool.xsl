<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">

	<style type="text/css">
		img {border:none;}
		.clearFloat {clear:both;}
		.brandLanding_container {display:block; width:590px; margin:0 auto; background:#D31145;}
		a.brand_header {
			display:block; width:590px; height:355px; margin:0px 0px 20px 0px;
			background:url(http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/header_btn.jpg) 0px 0px no-repeat;
			text-decoration:none;
		}
		a.brand_header:hover {background:url(http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/header_btn.jpg) 0px -355px no-repeat; text-decoration:none;}
		.brand_content {display:block; width:575px; margin:0; padding:20px 0px 20px 15px;}
		.brand_product {display:block; width:140px; float:left; margin:0px 0px -10px 0px; text-align:center;}
		.lastRow {margin-left: 72px;}
		.brand_product a {
			display:block; width:140px; height:34px; margin:10px 0px 0px 0px;
			background:url(http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/add_to_list_btn.png) 0px 0px no-repeat; text-decoration:none;
		}
		.brand_product a:hover {background:url(http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/add_to_list_btn.png) 0px -34px no-repeat; text-decoration:none;}

		.brand_footer {display:block; width:590px; font-family:Arial, Helvetica, sans-serif; font-size:9px; font-weight:normal; color:#102741; padding:20px 0px;}
		.brand_footer_left {display:block; width:375px; margin:0px 0px 0px 14px; float:left;}
		.brand_footer_right {display:block; width:190px; margin:0px; float:left; text-align:right;}
		</style>
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script>
		function changeSrc(newSrc) {
			$('doubleClick').src=newSrc;
		}
		</script>

			<div class="brandLanding_container">
		    	<a class="brand_header" href="http://backtoschool.kelloggs.com" onclick="changeSrc('http://ad.doubleclick.net/clk;259660530;70975631;n?');" target="_blank"></a>
		      <div class="brand_content">
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_01.gif" width="140" height="153" alt="Kellogg’s Frosted Flakes" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660488;70975631;z?'); clickThru('%c',10358,'Kellogg’s','Frosted Flakes', '', 1, '','','','','', 111, 112);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_02.gif" width="140" height="153" alt="Kellogg’s Krave" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660489;70975631;a?'); clickThru('%c',10358,'Kellogg’s','Krave', '', 1, '','','','','', 121, 122);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_03.gif" width="140" height="153" alt="Kellogg’s Mini Wheats" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660490;70975631;s?'); clickThru('%c',10358,'Kellogg’s','Mini Wheats', '', 1, '','','','','', 131, 132);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_04.gif" width="140" height="153" alt="Kellogg’s Froot Loops" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660491;70975631;t?'); clickThru('%c',10358,'Kellogg’s','Froot Loops', '', 1, '','','','','', 141, 142);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_05.gif" width="140" height="153" alt="Eggo" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660492;70975631;u?'); clickThru('%c',10358,'Kellogg’s','Eggo', '', 1, '','','','','', 151, 152);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_06.gif" width="140" height="153" alt="Cheez-It" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660494;70975631;w?'); clickThru('%c',10369,'Kellogg’s','Cheez-It', '', 1, '','','','','', 161, 162);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_07.gif" width="140" height="153" alt="Kellogg’s Rice Krispies Treats" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660495;70975631;x?'); clickThru('%c',10369,'Kellogg’s','Rice Krispies Treats', '', 1, '','','','','', 171, 172);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_08.gif" width="140" height="153" alt="Kellogg’s Nutri Grain" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660496;70975631;y?'); clickThru('%c',10358,'Kellogg’s','Nutri Grain', '', 1, '','','','','', 181, 182);"></a>
		        </div>

		        <div class="brand_product lastRow">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_09.gif" width="140" height="153" alt="Variety Pack" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660497;70975631;z?'); clickThru('%c',10369,'Kellogg’s','Variety Pack', '', 1, '','','','','', 191, 192);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_10.gif" width="140" height="153" alt="Kellogg’s Pop Tarts" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660498;70975631;a?'); clickThru('%c',10358,'Kellogg’s','Pop Tarts', '', 1, '','','','','', 201, 202);"></a>
		        </div>
		        <div class="brand_product">
		       	  <img src="http://upload.gsngrocers.com/elvs/assets/common/promotions/kelloggs/kelloggsbacktoschool/Images/product_11.gif" width="140" height="153" alt="Keebler Chips Deluxe" />
		          <a href="javascript:void(0)" onclick="changeSrc('http://ad.doubleclick.net/clk;259660499;70975631;b?'); clickThru('%c',10369,'Keebler','Chips Deluxe', '', 1, '','','','','', 211, 212);"></a>
		        </div>
		        <div class="clearFloat"></div>
		      </div>
		      <div class="brand_footer">
		      	<div class="brand_footer_left">
		        	*Awarded in the form of a VISA&#174; gift card. No Purch Nec. Void where prohibited. 18 yrs+ and legal residents of U.S. and D.C. Ends 6/1/13. To enter for free and for full rules, go to www.kelloggs.com/promotions.
		        </div>
		        <div class="brand_footer_right">
		        	36USC220506<br />
					&#174;, &#8482;, &#169; 2012 Kellogg NA Co.<br />
					&#169; Copyright 2012 Visa. All Rights Reserved.
		        </div>
		        <div class="clearFloat"></div>
		      </div>
			<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
		
		    </div>
	</xsl:template>
</xsl:stylesheet>
