<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<!-- CMS generates Footer -->
		<div id="GsnFooter" class="clearfix">
			<a href="http://www.groceryshopping.net?click=footer" target="_blank">
				<img src="/assets/common/images/powered_by_gsn.gif" alt="" style="border-width:0px;"/>
			</a>
		</div>
		<div id="footer">
			<div id="links">
				<ul>
					<li>
						<a href="https://www.top-foods.com/TopWeb/ContactUs.aspx">Contact Us</a>
					</li>
					<li>
						<a href="https://www.top-foods.com/TopWeb/Privacy.aspx">Privacy Policy</a>
					</li>
					<li class="last">
						<a href="https://www.top-foods.com/TopWeb/Sitemap.aspx">Site Map</a>
					</li>
				</ul>
			</div>
			<div id="thanks">
				<img src="/assets/149/images/ThankYou.jpg" alt="Thank you!"/>
			</div>
		</div>
		<!-- CMS generates Copyright Information -->
		<div id="copyright">Copyright &#xA9; 2008 Haggen, Inc. <br/><br/><br/><br/></div>
		<script type="text/javascript">var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
		<script type="text/javascript">var pageTracker = _gat._getTracker("UA-373881-11");
		pageTracker._trackPageview();</script>
		<script type="text/javascript">var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
		<script type="text/javascript">var pageTracker = _gat._getTracker("UA-373881-12");
		pageTracker._trackPageview();</script>
		<xsl:call-template name="FacebookJsApi" />
	</xsl:template>
</xsl:stylesheet>