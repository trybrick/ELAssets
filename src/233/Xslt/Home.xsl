<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="main-wrapper" id="home">
			<div id="SplashContainer">
				<div id="activityFeed">
					<iframe allowTransparency="true" frameborder="0" scrolling="no" src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fawgadvertising&amp;width=300&amp;height=295&amp;colorscheme=light&amp;show_faces=true&amp;border_color=%23FFF&amp;stream=true&amp;header=false&amp;appId=169059913187378" style="border:none; overflow:hidden; width:300px; height:295px;"/>
				</div>
				<xsl:call-template name="SlideShow"/>
				<div id="home-boxContainer">
					<xsl:for-each select="//HomeModules/HomeModule">
					<div class="home-box">
						<img src="{ImagePath}" alt="{ImagePath/@alt}"/>
					</div>
					</xsl:for-each>
				</div>
				<div id="home-boxContainer"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
