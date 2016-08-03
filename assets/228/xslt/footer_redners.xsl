<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="GSNFooter">
		<div id="GsnFooter">
			<xsl:for-each select="ExpressLane/footer/FooterItem">
				<xsl:choose>
					<xsl:when test="string-length(FooterLink) &gt; 0">
						<a href="{FooterLink}">
							<xsl:if test="string-length(FooterTarget) &gt; 0">
								<xsl:attribute name="target">
									<xsl:value-of select="FooterTarget"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="string-length(FooterClass) &gt; 0">
								<xsl:attribute name="class">
									<xsl:value-of select="FooterClass"/>
								</xsl:attribute>
							</xsl:if>							
							<xsl:value-of select="FooterText"/>
							<xsl:value-of select="FooterImage"/>
						</a>		
					</xsl:when>
					<xsl:otherwise>
							<xsl:value-of select="FooterText"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position() != last()">				
					<span class="footerDivider">|</span>
				</xsl:if>
			</xsl:for-each>
			<div class="like">
			<a class="socialLink" href="http://www.facebook.com/RednersWarehouseMarkets" target="_blank">
				<img class="facebook" src="/Assets/Common/Images/SocialNetworking/facebook_icon.png" />
				
			</a>
			<a class="savinglLink" href="http://www.rednersmarkets.com/savingstar.aspx" target="_blank">
				<img class="saving" src="/Assets/228/Images/SavingStar_icon.png" />
				
			</a>			
		</div>
		</div>
		<xsl:call-template name="FacebookJsApi"/>
	</xsl:template>
</xsl:stylesheet>

