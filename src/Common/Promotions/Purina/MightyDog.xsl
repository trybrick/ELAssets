<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
	<style>
		#md-wrapper { background-color:#26A9E0; border:10px solid #F7D61D; font:12px Helvetica,Arial; padding:20px; -moz-border-radius:8px; -webkit-border-radius:8px; }
		#md-wrapper h1 { background:#F7D61D url('/Assets/Common/Promotions/Purina/Images/productsMain-h1.png') no-repeat 10px 10px; padding:10px; text-indent:-9999px; }
		#md-wrapper h2 { border:none; color:#F7D61D; margin:0 }
		#md-wrapper h6 { border:none; color:#E7275D; font-size:14px; font-weight:bold; margin:0; }
		#md-wrapper p.md-bodyCopy { color:#F7D61D; margin-top:2px; }
		#md-wrapper li { height:130px; margin:10px 0; }
		#md-wrapper li.clear { clear:both; height:10px; float:left; width:100%; }
		#md-wrapper li img { float:left; }
		#md-wrapper ul.md-product-list { list-style-type:none; margin:0; padding:0; }
		#md-wrapper .description-wrapper { background-color:#F7D61D; float:right; height:115px; padding:15px; width:270px; -moz-border-radius:8px; -webkit-border-radius:8px; }
		#md-wrapper .description-wrapper a:link,
		#md-wrapper .description-wrapper a:visited,
		#md-wrapper .description-wrapper a:hover,
		#md-wrapper .description-wrapper a:active { color:#E7275D; font-weight:bold; text-decoration:underline; }
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js"></script>
	<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    <script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
	<div id="md-wrapper" class="clearfix">
		<img src="/Assets/Common/Promotions/Purina/Images/mighty-dog-logo.png" alt="Purina Mighty Dog Logo" />
		<h1>Mighty Dog knows SMALL DOGS.</h1>
		<h2>MIGHTY DOG understands that your small dog is different.</h2>
		<p class="md-bodyCopy">
			Small dogs see their world from a different point of view; a big place full of big
			adventure. They work hard, play hard, and maintain an active lifestyle. Mighty Dog<sup>&#174;</sup>
			is packed with protein to help get your little guy through his day. Check out all
			the delicious varieties and discover what your Mighty<sup>&#174;</sup> dog is hungry
			for.
		</p>	
		<ul class="md-product-list">
			<xsl:for-each select="//Purina/Items/Item">
				<li class="clearfix">
					<img src="{concat('##root##/Assets/Common/Promotions/Purina/images/subNav/',Image)}" width="170" class="pngfix" alt="" />	
					<div id="{@id}" class="description-wrapper">
						<h6><xsl:value-of select="translate(Title,'\','')" disable-output-escaping="yes" /><xsl:if test="Title/@tm = 'true'"><sup>&#8482;</sup></xsl:if>:</h6>
						<p><xsl:value-of select="Description" disable-output-escaping="yes" /></p>
						<a href="#">
							<xsl:attribute name="onclick">clickThru('%c',10346,'Purina Mighty Dog',' - <xsl:value-of select="Title" />','',1,'','','','','','aid<xsl:value-of select="generate-id(.)" />','97862<xsl:value-of select="position()" />')</xsl:attribute>
							ADD TO LIST
						</a>
					</div>
				</li>
				<li class="clear"></li>
			</xsl:for-each>
		</ul>		
	</div>  	
</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->