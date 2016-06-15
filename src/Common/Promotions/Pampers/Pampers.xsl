<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
	<style>
		#promo-header h1 { background:transparent url('/Assets/Common/Promotions/Pampers/images/Nprd_thickcare_wipes.jpg') no-repeat left top scroll; height:102px; text-indent:-9999px; width:590px; }
		#promo-main { color:#00A7AB; float:left; font-size:13px; margin-left:1.5em; }
		#promo-main h2 { border-bottom:2px dotted gray; color:#00A7AB; float:left; font-weight:bold; margin:1em 0; padding-bottom:10px; text-align:center; width:100%; }
		#promo-main img { margin:0 auto; }
		#addToList { background:transparent url('/Assets/Common/Promotions/Pampers/images/button_ATL.jpg') no-repeat left top scroll; display:block; float:left; height:46px; margin:20px 0 0 20px; text-indent:-9999px; width:200px; }
		#getCoupon { background:transparent url('/Assets/Common/Promotions/Pampers/images/button_Coupon.jpg') no-repeat left top scroll; display:block; float:left; height:46px; margin:10px 0 0 20px; text-indent:-9999px; width:200px; }
		#product-image { float:left; margin:0 30px; }
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js"></script>
	<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    <script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script> 
	<div id="promo-header">
		<h1>Pampers</h1>
	</div>
	<div id="promo-main">
		<img id="product-image" src="/Assets/Common/Promotions/Pampers/images/pack_shot.jpg" width="225" alt="Pampers ThickCare Wipes" />
		<a id="addToList" href="javascript:clickThru('%c','10353','Pampers','Wipes','','1','','','','','','324353938593845','324353938593846')">Add to List</a>
		<a id="getCoupon" target="_blank" href="http://www.pampers.com/en_US/thickcare-coupon">$1 Off Coupon</a>
		<h2>New Pampers ThickCare Wipes. Thick, strong and washcloth-like.</h2>
		<img src="##root##/Assets/Common/Promotions/Pampers/images/mainPampers.jpg" alt="" />
		<h2>Give baby a bath-like clean.</h2>
	</div>
</xsl:template>
</xsl:stylesheet>