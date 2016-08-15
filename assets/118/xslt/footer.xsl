<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
  <xsl:output method="html"/>  
  <xsl:template match="/" name="GSNFooter">
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <xsl:variable name="URLStoreName" select="translate(translate(//GenericStore/StoreName, $uppercase, $smallcase), ' -', '')" />
  
  <xsl:variable name="TwitterUrl" select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
  <xsl:variable name="PinterestUrl" select="//GenericChain/ChainSettings/Setting[SettingID=367]/Value"/>
  
    <div id="footer-wrap" class="fluid clearfix">
      <div class="container">
        <footer id="footer" class="normal sixteen columns">

          <div class="one_third">
            <div class="lw_contact_dfm-2 lambda_widget_contact_dfm">
              <h3 class="widget-title">
                <span>Our Address</span>
              </h3>
              <ul>
                <xsl:choose>                		 
					<xsl:when test="//GenericStore/PrimaryAddress">
                        <li class="lambda-address clearfix">
                            <xsl:value-of select="//GenericStore/PrimaryAddress"/><br/>
                            <xsl:value-of select="//GenericStore/City"/>, <xsl:value-of select="//GenericStore/StateAbbreviation"/>&#160;<xsl:value-of select="//GenericStore/PostalCode"/>
                        </li>
                        <li class="lambda-phone clearfix"><xsl:value-of select="//GenericStore/Phone"/></li>
					</xsl:when>
					<xsl:otherwise>
                        <li class="lambda-address clearfix">
                            <br/>
						</li>
						<li class="lambda-phone clearfix"></li>
					</xsl:otherwise>               
				</xsl:choose>
                <li class="lambda-email clearfix">
                  <a href="mailto:info@dicksfreshmarket.com" class="ui-link">info@dicksfreshmarket.com</a>
                </li>				
                <li class="lambda-internet clearfix last">
                  <a class="ui-link">
				  <xsl:attribute name="href">http://www.dicksfreshmarket.com/<xsl:value-of select="$URLStoreName"/></xsl:attribute>
				  www.dicksfreshmarket.com/<xsl:value-of select="$URLStoreName"/></a>
                </li>
              </ul>
            </div>
          </div>

          <div class="one_third">
              <xsl:choose>
                <xsl:when test="//GenericStore/OpenHoursDisplay">
                <div class="lw_hours_dfm-2 lambda_widget_hours_dfm">
                  <h3 class="widget-title">
                    <span>Our Hours</span>
                  </h3>
                  <div class="textwidget"><xsl:value-of select="//GenericStore/OpenHoursDisplay"/></div>
                </div>
                </xsl:when>
                <xsl:otherwise>
                </xsl:otherwise>
              </xsl:choose>           
          </div>
          <div class="one_third last">
            <div class="widget_text">
                <h3 class="widget-title">
                    <span>Connect with us</span>
                </h3>
                <ul class="sociallinks clearfix">
                    <li>
                      <a href="https://www.facebook.com/pages/Dicks-Fresh-Market/279824515316?ref=ts&amp;fref=ts" class="facebook ui-link" title="Facebook" target="_blank">Facebook</a>
                    </li>
                    <li>
                      <a href="{$TwitterUrl}" class="twitter ui-link" title="Twitter" target="_blank">Twitter</a>
                    </li>
                    <li>
                      <a href="https://plus.google.com/b/101953032155192569599/101953032155192569599/about/p/pub" class="googleplus ui-link" title="Googleplus" target="_blank">Googleplus</a>
                    </li>
                    <li class="last">
                      <a href="http://pinterest.com/dicksmarket/" class="pinterest ui-link" title="Pinterest" target="_blank">Pinterest</a>
                    </li>
                </ul>
            </div>
          </div>
          <div class="clear"></div>
        </footer>
        <!--/#footer-->
      </div>
      <!--/.container-->
        <script type="text/javascript" src="/assets/118/js/jquery.dcsmt.1.0.js?ver=3.8.1"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                var config = {
                    location: 'bottom',
                    align: 'left',
                    offset: 50,
                    speed: 600,
                    width: 285,
                    height: 245,
                    slider: 'dc_jqsocialmediatabs_widget-2-slide',
                    slides: 'dc_jqsocialmediatabs_widget-2-tab',
                    tabs: 'social-tabs',
                    slideWrap: 'dc_jqsocialmediatabs_widget-2-wrap',
                    direction: 'vertical',
                    autoClose: false,
                    method: 'static',
                    start: 0
                };
                if(!jQuery().dcSlickTabs) {
                    $.getScript('/assets/118/js/jquery.dcsmt.1.0.js', function(){
                        jQuery('#dc_jqsocialmediatabs_widget-2-item').dcSlickTabs(config);
                    }); 
                } else {
                    jQuery('#dc_jqsocialmediatabs_widget-2-item').dcSlickTabs(config);
                }
            });
        </script>
    </div>
    <div id="sub-footer-wrap" class="clearfix">	
      <div class="container">
        <div class="sixteen columns">
          <div class="scissors"></div>
          <div class="left">
            © 2016 <a href="##root##" class="ui-link">Dick's Fresh Market: A Hometown Proud Grocery Store</a>
          </div>
          <div class="right">
            Powered by <a href="http://www.designlovelife.com/" class="ui-link">Design Love Life</a>
          </div>
        </div>
      </div>
    </div>
	<div id="GsnFooter">
			<a href="http://trybrick.com?click=footer" target="_blank">
				<span class="FooterCopyright">&#xA9; 2016&#xA0;Brick, Inc.</span>
			</a>
			<xsl:text>&#xA0;&#xA0;</xsl:text>
			<a href="http://patft1.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=7734514.PN.&amp;OS=PN/7734514&amp;RS=PN/7734514" target="_blank">
				<span class="FooterCopyright">Patent No US 7,734,514 B2.</span>
			</a>
		</div>
    <xsl:call-template name="FacebookJsApi"/>
  </xsl:template>
</xsl:stylesheet>