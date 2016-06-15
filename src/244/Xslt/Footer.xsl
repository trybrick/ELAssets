<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="GSNFooter">
        <div id="GsnFooter">
			<div class="contentBottom"></div>
			<script language="JavaScript" type="text/javascript">today=new Date(); y0=today.getFullYear(); </script>
            <a href="http://trybrick.com?click=footer" target="_blank">
				<span class="FooterCopyright">&#xA9; <script language="JavaScript" type="text/javascript">document.write(y0);</script> Brick, Inc.</span>
			</a>
			<xsl:text>&#xA0; | &#xA0;</xsl:text>
			<a href="http://patft1.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=7734514.PN.&amp;OS=PN/7734514&amp;RS=PN/7734514" target="_blank">
				<span class="FooterCopyright">Patent No US 7,734,514 B2</span>
			</a>
            <xsl:text>&#xA0; | &#xA0;</xsl:text>
            <a href="/privacy.aspx">
				<span class="FooterCopyright">Privacy Policy</span>
			</a>
			<xsl:text>&#xA0; | &#xA0;</xsl:text>
            <a href="/Contact/">
				<span class="FooterCopyright">Contact Us</span>
			</a>
			<xsl:text>&#xA0; | &#xA0;</xsl:text>
            <a href="/faq.aspx">
				<span class="FooterCopyright">FAQ</span>
			</a>
		</div>
		<xsl:call-template name="FacebookJsApi"/>
	</xsl:template>
</xsl:stylesheet>