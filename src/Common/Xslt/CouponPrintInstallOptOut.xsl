<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style type="text/css" media="print,screen">
			html,body		{background-color:#FFFFFF; background-image:none; }
			.row1 		{background-color:#EEEEEE;}
			.row0 		{background-color:#FFFFFF;}
			THEAD		{display: table-header-group }
			TBODY		{display: table-row-group }
			#container,
			#container-outer {background-color:#F0F0F0;background-image:none;margin:0;padding:0;text-align:left;width:100%;}
			#lightwindow, #lightwindow_overlay	{display:none}
			#CouponDisplayDiv	{background-color:#FFFFFF;border:solid #A0A0A0 5px;float:left;font-family:helvetica,arial,sans-serif;margin:10px;padding:10px;width:700px;}
			#CouponDisplayDiv h2, #CouponDisplayDiv h3	{border-bottom:none;margin:10px 0;text-align:center;}
			#CouponDisplayDiv img	{margin:10px;}
			#CouponDisplayDiv a {color:blue;text-decoration:underline;}
			#CouponDisplayDiv p {text-align:center;}
			#CouponDisplayDiv #optOutInstructions2 img	{margin:10px 80px;}
			#optOutInstructions1	{float:left;width:605px;}
			#optOutInstructions2	{float:left;width:100%;}
			#optOutInstructions2 a	{margin-left:310px;}
		</style>
		<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<div id="CouponDisplayDiv" style="display: none;">
					<img alt="" align="left" width="50" src="/Assets/Common/Images/dlIcon.png"/>
					<div id="optOutInstructions1">
						<h2>
						You have selected to print manufacturer coupons with your shopping list.
						</h2>
						<h3>
						In order to print these coupons from this computer, you will need to 
						install a one time printer application from Coupons Inc.
						</h3>
						<p>Download and install the Coupon Printing Plugin:<br/>
							<a href="http://cdn.coupons.com/ftp.coupons.com/Partners/CouponPrinter.exe">Windows Coupon Printing Plugin</a>
							<span> | </span>
							<a href="http://cdn.coupons.com/ftp.coupons.com/safari/MacCouponPrinter.dmg">Mac Coupon Printing Plugin</a>
						</p>
					</div>
					<div id="optOutInstructions2">
						<hr/>
						<h3>
						This may take a few minutes to download.  Should the initial attempt be
						blocked, you may be asked to verify acceptance of the download.
						</h3>
						<img align="center" alt="" src="/Assets/Common/Images/activex_message.jpg"/>
						<hr/>
						<h3>
						Please note &#x2013; to print your shopping list without downloading the software, click "Opt Out".
						</h3>
						<a class="button" href="/Shop/PrintList.aspx?nocoupons=true">
							<span>Opt Out</span>
						</a>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
