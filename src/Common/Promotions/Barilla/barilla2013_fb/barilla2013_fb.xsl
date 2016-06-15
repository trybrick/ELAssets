<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<style type="text/css">
			#LandingPage{			
				background-image:url('http://upload.gsngrocers.com/elvs/assets/common/promotions/barilla/barilla2013_fb/images/bread.jpg');
				background-repeat:no-repeat;
				color:#FFF;
				flat:left;
				height:590px;
				padding:8px;
				position:relative;
				width: 590px;
			}
			
			#LandingPage a{			
				color:#FFF;
				text-decoration:none;
			}
									
			#LandingPage #OfferCopy{
				margin:250px auto;
				text-align:center;				
			}
			
			#LandingPage #LegalCopy{	
				color:#FFF;
				font-size:65%;
				line-height:1em;
				margin:0;
			}
			
			#LandingPage #RomanceCopy{
				color:#FFF;
				display:block;
				font-size:10px;
				line-height:2em;
				margin-top:360px;
				margin-left:-325px;				
				text-align:center;
			}
			
			#LandingPage #RomanceCopy h3{
				color:#FFF;
				display:block;
				font-size:10px;
				line-height:2em;
				margin-top:-118px;				
				text-align:center;
			}
			
			#LandingPage h2{
				border:none;
				color:#FFF;
				font-size:21px;
				margin:5px 0 0;
			}
			
			#LandingPage h1{
				color:#FFF;
				font-size:50px;
				margin:0;
			}
			
			.exclusiveoffer{
				color:#FFF;
				display:block;
				font-size:90%;
				line-height:1em;
				margin:-245px;
				text-align:center;
			}
		</style>
		<div id="LandingPage" style="width:590px;">
			<div id="OfferCopy">
				<h2>Complete your pasta meal with</h2>
				<h1>FREE BREAD<span style="font-size:20px; position:relative; top:-25px;">*</span></h1>
			</div>
			<div class="exclusiveoffer">
				<p>when you buy Barilla&#xAE; Pasta and Barilla&#xAE; Sauce products.</p>
				<p>*Fresh or frozen (Value $2)</p>
			</div>
			<div id="RomanceCopy">
				<h3>Barilla&#xAE; makes it simple to share the<br/>
					love with authentic Italian meals that start<br/>
					with delicious and end with a kiss.</h3>
				<h2>
					<a href="http://int.barilla.com/?/">
						<em>Barilla.com</em>
					</a>
				</h2>
			</div>
			<div id="LegalCopy">
				<p>Limit one offer per transaction. Offer valid 2/8/13-2/14/13 (Stop &amp; Shop/Giant Landover) and 2/10/13-2/16/13 (Giant Carlisle).</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
