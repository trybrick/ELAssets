<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="footerWrap">
			<div id="footer">
				<img alt="" src="/Assets/189/images/layout/logo_footer.png" id="logo_footer"/>
				<img alt="Low prices... Better choices... Super One Foods." src="/Assets/189/images/layout/tagline_footer.png" id="tagline_footer"/>
				<ul id="leftCol">
					<li>
						<a href="http://www.superonefoods.com/">Home</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/locator/">Store Locator</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/produce/">Produce</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/meat/">Meat</a>
					</li>
				</ul>
				<ul id="midCol">
					<li>
						<a href="http://www.superonefoods.com/bakery/">Bakery</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/deli/">Deli</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/employment/">Employment</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/contact/">Contact</a>
					</li>
				</ul>
				<ul id="rightCol">
					<li>
						<a href="http://www.superonefoods.com/assets/privacy-policy.html">Privacy Policy</a>
					</li>
					<li>
						<a href="http://www.superonefoods.com/assets/coupon-policy.html">Coupon Policy</a>
					</li>
				</ul>
			</div>
		</div>
		<xsl:call-template name="FacebookJsApi" />
	</xsl:template>
</xsl:stylesheet>