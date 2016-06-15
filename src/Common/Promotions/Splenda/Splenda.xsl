<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
<div id="Container" style="background-color:#fff;">
	<img name="splenda_landing_page" width="591" height="600" border="0" id="splenda_landing_page" usemap="#m_splenda_landing_page" alt="">
		<xsl:attribute name="src">##root##/Assets/Common/Promotions/Splenda/splenda_landing_page.jpg</xsl:attribute>
	</img>
<map name="m_splenda_landing_page" id="m_splenda_landing_page">
<area shape="rect" coords="432,442,574,532" href="javascript:clickThru('%c','10354', 'Splenda', 'No Calorie Sweetener, Granulated' , '72277', '1', '9.7 oz (235g)', '', '', '', '', '72277-1');" alt="" />
<area shape="rect" coords="273,508,420,592" href="javascript:clickThru('%c','10354', 'Splenda', 'No Calorie Sweetener, Packets ', '72277', '1', '200 packets', '', '', '', '', '72277-2');" alt="" />
</map>
<p style="color:#19469E; font-family:Verdana, Arial, sans-serif; font-size:10px; text-align:center;">Life is sweet - and Splenda® products make it even sweeter! <a style="margin-left:1em;text-decoration:underline; color:blue;" href="http://www.splenda.com" target="_blank">www.splenda.com</a></p>
</div>
</xsl:template>
</xsl:stylesheet>