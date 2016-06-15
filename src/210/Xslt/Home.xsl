<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="SplashContainer">
			<xsl:call-template name="SlideShow"/>
			<div id="AdPromo">
				<a href="Shop/WeeklyAd.aspx">
					
					<img alt="Weekly Ad" src="/Assets/210/Images/online_weeklyad2.jpg"   width="100"/>
				</a>
				<a href="Shop/FeaturedProducts.aspx" >
					<img alt="Online Coupons" src="/Assets/210/Images/online_coupons2.jpg"   width="100"/>
				</a>
				
			</div>	
			<div id="GivesBack">	
				<a href="gordy's-gives-back.aspx">
					<img alt="Gordy’s Gives Back" src="/Assets/210/Images/gordys-gives-back-button.jpg" width="200"/>
				</a>
			</div>
			<div id="splashBox1">
				
				<div id="dualContent1">
					<a href="http://eepurl.com/bFfifv" target="_blank">
					<img alt="Weekly Email Newsletter">
						<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/weekly_email.jpg</xsl:attribute>
					</img>
				</a>
				</div>
				<div id="dualContent2">
					<a href="##root##/deli.aspx">
						<img alt="Donna Mae’s Deli">
							<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/donna_maes_deli.png</xsl:attribute>
							<xsl:attribute name="width">220px</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="splashBox2">			
				<div id="dualContent1">
					<a href="##root##/close-to-home.aspx">
					<img alt="Close to Home">
						<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/close_to_home.jpg</xsl:attribute>
					</img>
				</a>
				</div>
				<div id="dualContent2">
					<a href="##root##/profile/fuelrewards.aspx">
						<img alt="Pump Perks">
							<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/pump_perks.png</xsl:attribute>
							<xsl:attribute name="width">220px</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="splashBox3">				
				<div id="dualContent1">
					<a href="##root##/the-gordy's-guru.aspx ">
					<img alt="Matt the Gordy's guru">
						<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/gordys_guru.jpg</xsl:attribute>
					</img>
				</a>
				</div>
				<div id="dualContent2">
					<a href="##root##/gift-cards.aspx">
						<img alt="Gift Cards">
							<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/gift_cards.png</xsl:attribute>
							<xsl:attribute name="width">220px</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="splashBox4">
				<div id="dualContent1">
					<a href="http://lilliansshoppe.com/eauclaire/" target="_blank">
						<img alt="Lillians">
							<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/Eau_Claire_Lillians_Logo_2.png</xsl:attribute>
							<xsl:attribute name="width">205px</xsl:attribute>
							<xsl:attribute name="height">102px</xsl:attribute>
						</img>
					</a>
				</div>
				<div id="dualContent2">
					<a href="http://www.cygnetlake.com/" target="_blank">
						<img alt="Cygnet Lake Camp">
							<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/box5.jpg</xsl:attribute>
							<xsl:attribute name="width">205px</xsl:attribute>
							<xsl:attribute name="height">109px</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<iframe style="border-bottom: medium none; border-left: medium none; width: 910px; height: 587px; overflow: hidden; border-top: medium none; border-right: medium none" src="http://www.facebook.com/plugins/likebox.php?id=238760952464&amp;width=292&amp;connections=10&amp;stream=true&amp;header=true&amp;height=587" frameborder="0" allowtransparency="allowtransparency" scrolling="no"></iframe>
		</div>
	</xsl:template>
</xsl:stylesheet>
