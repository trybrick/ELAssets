<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
	<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
		<div class="StaticContent Footer">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:value-of select="Description" disable-output-escaping="yes" />
			</xsl:for-each>
		</div>
	</xsl:if>
	<div id="GsnFooter">
		<a href="http://www.groceryshopping.net?click=footer" target="_blank">
			<!-- need absolute image path to display image on authorize.net invoice page -->
			<div style="display:inline-block;font-size:14px;color:black;padding-right:11px;position:relative;top:-3px;"><xsl:text>&#169; 2016</xsl:text></div><img style="display:inline-block;" src="https://secure.gsn2.com/assets/common/images/brick_logo.png" alt="" height="16" />
		</a>
		<table class="ssl" width="135" border="0" cellpadding="2" cellspacing="0" >
		  <tr>
		    <td width="135" align="center" valign="top">
		      <script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=secure.gsn2.com&amp;size=M&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script>
		      <br />
		      <a href="http://www.verisign.com/ssl-certificate/" title="Click to Verify - This site chose VeriSign SSL for secure e-commerce and confidential communications." target="_blank" style="">
				  <xsl:text>ABOUT SSL CERTIFICATES</xsl:text>
				</a>
		    </td>
		  </tr>
		</table>
	</div>	
</xsl:template>

</xsl:stylesheet>
