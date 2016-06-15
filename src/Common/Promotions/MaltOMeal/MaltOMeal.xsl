<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
	<script type="text/javascript" src="##root##/Assets/Common/js/AdMasterFunctions.js"></script>
	<script type="text/javascript">
		document.observe("dom:loaded", init);
		function init() {
			Event.observe('cta-button','click', function(event){
				Event.stop(event);
				if(typeof(clickThru) != 'undefined') {
					clickThru('%c','10358','Malt-O-Meal',' Cereal','',1,'','','','','','098534209452034850293845029384059');
				}
				window.open('http://bagthebox.com');
			});
		}
	</script>
	<style>
		#mom-wrapper { background:transparent url(/Assets/Common/Promotions/MaltOMeal/mom_lp_bg.jpg) top left no-repeat; font-family:Arial, sans-serif; padding-top:15px; }
		#mom-wrapper h2 { border:none; color:#fff; font-size:15px; font-weight:bold; }
		#mom-wrapper p { color:#fff; font-size:14px; } 
		#mom-content { margin:0 10px 0 290px; }
		#mom-footer  { margin-top:30px; }
		#mom-footer p { color:#000; font-size:9px; font-style:italic; margin:0 5%; width:90%;}
		#cta-button { background:transparent url(/Assets/Common/Promotions/MaltOMeal/mom_button_bg.png) top left no-repeat; color:#fff; display:block; font-family:Georgia, serif; font-size:12px; height:21px; padding-top:5px; text-align:center; width:151px; }
		a#cta-button:hover { text-decoration:none; }
	</style>
	<div id="mom-wrapper">
		<div id="mom-content">
			<h2>75% less packaging.* 100% smarter.&#8482;</h2>
			<p>The leading box brand cereals come in a bag inside of a box. (Isn't that a little redundant?) But all varieties of Malt-O-Meal® cereals come without the box. Just a bag of great tasting cereal, which means 75% less packaging to dispose of.* Good for you, good for the environment.</p>
			<p>Recycling helps, but only 44% of the paper, corrugate and paperboard packaging consumed annually is actually recycled.**</p>
			<p>If all cereal came in bags alone, instead of boxes with bags, U.S. households could reduce their paperboard use by 375 million pounds per year.***</p>
			<p>Malt-O-Meal cereals are more than just a better value - they're an earth friendly choice!</p>
			<a id="cta-button" href="http://bagthebox.com" target="_blank">Find Out More</a>
		</div>
		<div id="mom-footer">
			<p>*75% less packaging based on the net weight of empty consumer packaging per pound of cereal delivered. Even when their box size is smaller, the net weight of their box and empty inner bag is still greater than the net weight of the larger Malt-O-Meal® bag when empty.<br/>
** Source: American Forest and Paper Association, 2007<br/>
*** Source: Based on A.C. Nielsen scan track data, 52 weeks ending 6/7/08</p>
		</div>
	</div>
</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->