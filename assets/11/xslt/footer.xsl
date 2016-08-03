<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl" />
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
			<div id="footerSiteMap"> <a href="/">home</a> | <a href="http://gsn.festfoods.com/Shop/WeeklyAd.aspx">ads/coupons</a> | <a target="_blank" href="http://gsn.festfoods.com/recipes/recipecenter.aspx">recipes</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=3274&amp;Itemid=197">nutritionist</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=1799&amp;Itemid=196">food safety</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=21&amp;Itemid=30">departments</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=75">big cart</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=34">tot spot</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=61">upromise</a> | <a target="_blank" href="http://www.festfoods.com/images/template/postal_services/postal_info.pdf">postal services</a><br />
			<a href="http://career.festfoods.com">employment</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=33&amp;Itemid=33">about us</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=3342">mission vision values</a> | <a href="http://crm.festfoods.com" target="_blank">contact us</a> | <a href="http://www.festfoods.com/associate/">employee section</a> | <a href="http://www.festfoods.com/index.php?option=com_content&amp;task=view&amp;id=22">privacy policy</a>
			</div>
			<div id="GsnFooter" class="group">
				<a href="http://trybrick.com?click=footer" target="_blank">
					<img src="/assets/common/images/powered_by_gsn.gif" alt="Powered by Brick, Inc." class="gsn-footer-image" />
				</a>
			</div>
		</div>
		<div id="festival-footer">
				<div id="bottom_content" style="padding-top:10px;">
					<div class="mod_contentitem">
						<table style="margin-left:10px; width:910px;">
							<tr>
								<td colspan="1" style="vertical-align:top;">
									<table class="contentpaneopen">

										<tr>
											<td valign="top" colspan="2">
												<div id="bottom_left" style="width: 395px; float: left; color: rgb(255, 255, 255);">&#xA9;2014 Festival Foods</div>
												<div style="clear: both;">
												</div>
											</td>
										</tr>
									</table>

									<span class="article_seperator">&#xA0;</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div style="clear:both;"/>
			</div>
		<xsl:call-template name="FacebookJsApi" />
	</xsl:template>
</xsl:stylesheet>