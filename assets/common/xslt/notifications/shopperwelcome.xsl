<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Notifications/Notifications.js"/>
		<script src="/Assets/Common/Js/Ad.js" type="text/javascript"/>
		<script type="text/javascript">
			Event.observe(window, 'load', openNotificationPopup);

			if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
			    var GSNPageItems = new Object();
			}
			GSNPageItems.Notification = {
				clickBgToClose: false
			}
			function changeSrc1(newSrc) {
				$('bodTracking1').src=newSrc;
			}
			function changeSrc2(newSrc) {
				$('bodTracking2').src=newSrc;
			}
			function closeAndSetBrand(){
				closeNotificationPopup();
				refreshAdPods();
			}
		</script>
		<style>
			#BOD-wrapper {background-color:#777777;border:2px solid #333333;float:left;position:relative;width:540px;border-radius:7px;-moz-border-radius:7px;-webkit-border-radius:7px;}
			#BOD-wrapper h3 {color:#ffffff;font-family:Trebuchet MS,Helvetica,Arial,sans-serif;font-size:21px;font-weight:bold;margin:0;padding:10px 0;text-align:center;}
			#BOD-wrapper a#BOD-close {background:transparent url(https://upload.brickinc.net/elvs/assets/common/promotions/ShopperWelcome/Images/Close_X.png) top right no-repeat;display:block;height:30px;position:absolute;right:-15px;text-indent:-9999px;top:-15px;width:30px;}
			#BOD-wrapper ul {list-style:none;margin:0;padding:0;}
			#BOD-wrapper ul li {background-color:#ffffff;border-top:1px solid #f0f0f0;float:left;width:100%;}
			#BOD-wrapper ul li:hover {background:#f0f0f0 url(https://upload.brickinc.net/elvs/assets/common/promotions/ShopperWelcome/Images/Selected_Arrow.png) center right no-repeat;}
			#BOD-wrapper ul li.noThanks {background:#ffffff none;padding:5px 0 10px;text-align:center;border-radius:0 0 7px 7px;-moz-border-radius:0 0 7px 7px;-webkit-border-radius:0 0 7px 7px;}
			#BOD-wrapper ul li.noThanks:hover {background:#ffffff none;}
			#BOD-wrapper ul li a {color:#444444;float:left;font-weight:normal;height:100%;text-decoration:none;width:100%;}
			#BOD-wrapper ul li.noThanks a {display:inline;float:none;font-family:Trebuchet MS,Helvetica,Arial,sans-serif;font-size:14px;text-decoration:underline;}
			#BOD-wrapper ul li a:hover {color:#000000;font-weight:normal;}
			#BOD-wrapper ul li a:hover p {color:#000000;cursor:pointer;font-weight:normal;}
			#BOD-wrapper ul li img {float:left;max-height:65px;margin:5px 22px;}
			#BOD-wrapper ul li p {color:#444444;float:left;font-family:Trebuchet MS,Helvetica,Arial,sans-serif;font-size:16px;font-weight:normal;margin:15px 0 10px;max-width:400px;}
			#BOD-wrapper ul li p span {font-size:18px;font-weight:bold;margin:0 10px 0 0;}
			#BOD-wrapper ul li p b {color:red;font-size:18px;}
			#Notification_Popup {height:auto;top:100px;width:auto;}
			#Notification_Popup a {text-indent:0;}
		</style>
        <div id="lightwindow_registration" style="display:none;"></div>
		<div id="Notification_PopupOrig" style="display:none;">
			<div id="BOD-wrapper">
				<!--<a id="BOD-close" href="javascript:countClick('http://ad.doubleclick.net/clk;245591384;51543176;m?');closeNotificationPopup();">Close</a>-->
				<h3>Click For Exclusive Online Savings!</h3>
				<ul>
					<xsl:for-each select="//ArrayOfShopperWelcome/ShopperWelcome">
						<li>
							<script>setTimeout(function(){_gaq.push(['_trackEvent', 'Shopper Welcome Test', 'Impression', '<xsl:value-of select="BrandKeyValue"/>'])}, 1000);</script>
							<a href="javascript:void(0);">
								<xsl:attribute name="onclick">_gaq.push(['_trackEvent', 'Shopper Welcome Test', 'Click', '<xsl:value-of select="BrandKeyValue"/>']);changeSrc1('<xsl:value-of select="ClickTracker"/>');SetAdBranding('<xsl:value-of select="BrandKeyValue"/>',closeAndSetBrand);</xsl:attribute>
								<img alt="{BrandName}" src="{BrandLogo}"/>
								<p><span><xsl:value-of select="BrandName"/></span><xsl:value-of select="Message" disable-output-escaping="yes"/></p>
								<xsl:choose>
									<xsl:when test="string-length(ImpressionPixel) &gt; 0">
										<img src="{ImpressionPixel}" width="1" height="1" border="0" alt=""/>
									</xsl:when>
									<xsl:when test="string-length(ImpressionScript) &gt; 0">
										<xsl:value-of select="ImpressionScript" disable-output-escaping="yes"/>
									</xsl:when>
									<xsl:otherwise></xsl:otherwise>
								</xsl:choose>
							</a>
						</li>
					</xsl:for-each>
					<li class="noThanks">
						<a href="javascript:void(0);" onclick="closeNotificationPopup();">No Thanks<img src="http://ad.doubleclick.net/ad/6394.test/;kw=nationalnothanks;sz=1x1;ord=1234567?" width="1" height="1" border="0" alt="" style="margin:0;"/></a>
					</li>
				</ul>
			</div>
			<iframe width="1" height="1" id="bodTracking1" src="" style="display: none;"/>
			<iframe width="1" height="1" id="bodTracking2" src="" style="display: none;"/>
		</div>
	</xsl:template>
</xsl:stylesheet>
