<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
		<script type="text/javascript">try {
		var pageTracker = _gat._getTracker("UA-373881-14");
		pageTracker._trackPageview();
		} catch(err) {}</script>
		<xsl:call-template name="FacebookJsApi"/>
		<div id="footer-outer">
			<div class="container_16 footer">
				<ul class="links">
					<li><a href="http://www.haggen.com/find-our-stores/">Find our Stores</a></li>
					<li><a href="http://www.haggen.com/customer-care/contact-us-today/">Contact Us</a></li>
					<li><a href="http://www.haggen.com/discover-northwest-fresh/work-at-haggen/">Work for Us</a></li>
					<li><a href="http://www.haggen.com/customer-care/privacy-policy/">Privacy Policy</a></li>
					<li><a href="http://www.haggen.com/sitemap/">Site Map</a></li>
					<li><a href="http://www.haggen.com/hello-savings/">Weekly Ads</a></li>
				</ul>
				<div class="grid_3 legal">
					<a class="socNetButton" href="https://www.facebook.com/haggen" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-facebook.svg'); background-size:12px;" title="Friend us on Facebook"></a>
					<a class="socNetButton" href="https://twitter.com/haggenfood" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-twitter.svg');" title="Follow us on Twitter"></a>
					<a class="socNetButton" href="https://instagram.com/haggenfood/" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-instagram.svg');" title="See us on Instagram"></a>
					<a class="socNetButton" href="https://www.youtube.com/user/HaggenFoods1933" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-youtube.svg');" title="See us on You Tube"></a>
					<a class="socNetButton" href="https://www.pinterest.com/haggenfood/" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-pinterest.svg'); background-size:20px;" title="Pin us on Pinterest"></a>
					<a class="socNetButton" href="http://www.haggen.com/customer-care/contact-us-today/" style="background-image:url('http://www.haggen.com/content/themes/htf/images/icon-email.svg');" title="Email us"></a>
                	<br />
					<p>Haggen &#xA9; 2016 Haggen, Inc. All rights reserved.</p>
					<p>Registration on or use of this site constitutes acceptance of our Privacy Policy. Except where permitted by law, the material on this site may not be 
                	reproduced, distributed, transmitted, cached or otherwise used, except with the prior written permission of Haggen, Inc.</p>
				</div>
				<div class="clear"/>
			</div>
		</div>
		
	</xsl:template>
</xsl:stylesheet>
