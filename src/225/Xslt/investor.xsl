<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<style>
			#container {
				padding-bottom: 0 !important;
			}
			#mainContent {
				padding-left: 0 !important;
			}
		</style>
		<script src="/Assets/225/Scripts/iframeResizer.min.js" type="text/javascript" />
		<link rel="stylesheet" href="/Assets/225/Styles/chaininvestorPage.css" media="screen" />
		<img id="headerImage" alt="Roundy's Header Image" src="/Assets/225/Images/main_roundys.jpg"/>
		<div id="mainContent">
			<img id="mainLogo" alt="Roundy's Logo" src="/Assets/225/Images/krogerRoundyLogo.jpg"/>
			<div style="height: 100%;">
				<iframe id="brick-frame" src="http://roundys.brickinc.net/" width="785" frameborder="0" scrolling="no" />
				<script>
					iFrameResize({
						log: true,
						enablePublicMethods     : true,
						heightCalculationMethod : 'bodyScroll',
						checkOrigin: false
					});
				</script>
			</div>
        </div>	
	</xsl:template>
</xsl:stylesheet>
