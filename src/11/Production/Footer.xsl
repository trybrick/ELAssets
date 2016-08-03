<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div class="footer-wrap">
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number"/>
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<div class="footerlogo">
				<img height="60" width="420" src="/assets/11/images/logo_great_stuff.jpg" alt=""/>
			</div>
			<div class="footerStoreInfo">
				<span class="footerStoreInfoHeadline">
					<xsl:value-of select="//GenericStore/StoreName"/>
				</span>
				<span class="footerStoreInfoBody">
					<xsl:value-of select="//GenericStore/PrimaryAddress"/>
					<br/>
					<xsl:value-of select="//GenericStore/City"/>, <xsl:value-of select="//GenericStore/StateAbbreviation"/>&#xA0;<xsl:value-of select="//GenericStore/PostalCode"/>
					<br/>
					<strong>
						<xsl:value-of select="//GenericStore/Phone"/>
					</strong>
					<xsl:if test="//GenericStore/StoreHours != ''">
						<br/>
						<xsl:value-of select="//GenericStore/StoreHours"/>
					</xsl:if>
				</span>
				<div style="clear: left;">
				</div>
			</div>
			<div id="footerSiteMap"> 
			</div>
			<div id="GsnFooter" class="group">
				<a href="http://www.groceryshopping.net?click=footer" target="_blank">
					<img src="/assets/common/images/powered_by_gsn.gif" alt="Powered by Grocery Shopping Network" class="gsn-footer-image" />
				</a>
			</div>
		</div>
		<div id="festival-footer" class="footerSiteMap">
				<a href="http://www.festfoods.com/">home</a> | <a href="http://gsn.festfoods.com/Shop/WeeklyAd.aspx">ads/coupons</a> | <a target="_blank" href="http://gsn.festfoods.com/recipes/recipecenter.aspx">recipes</a> | <a href="http://crm.festfoods.com/ask-our-dieticians/">nutritionist</a> | <a href="http://www.festfoods.com/about/food-safety/">food safety</a> | <a href="http://www.festfoods.com/departments/">departments</a> | <a href="http://www.festfoods.com/about/big-cart/">big cart</a> | <a href="http://www.festfoods.com/departments/tot-spot/">tot spot</a> | <a href="http://www.festfoods.com/about/upromise/">upromise</a> | <a target="_blank" href="http://www.festfoods.com/services/view/name/Postal%20Sub-Station/id/5">postal services</a><br />
			<a href="http://career.festfoods.com/">employment</a> | <a href="http://www.festfoods.com/about/">about us</a> | <a href="http://www.festfoods.com/about/mission-values/">mission vision values</a> | <a href="http://crm.festfoods.com/" target="_blank">contact us</a> | <a href="http://schedule.festfoods.com/">employee section</a> | <a href="http://www.festfoods.com/about/privacy/">privacy policy</a>
			</div>
		<xsl:call-template name="FacebookJsApi" />
	</xsl:template>
</xsl:stylesheet>