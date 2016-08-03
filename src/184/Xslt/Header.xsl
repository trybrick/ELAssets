<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <style type="text/css">
      /*override content pane table padding border and margin*/ table.contentpaneopen { width: 100%; padding: 0px; border-collapse: collapse; border-spacing: 0px; margin: 0px; } /*override content pane table td margin and line height*/ table.contentpaneopen td { margin: 0px; padding: 0px; padding-right: 0px; line-height: normal; } /*override header content module table margin and border*/ div.mod_contentitemhdr table { margin: 0px; padding: 0px; border: 0px; border-width: 0px; border-spacing: 0px; border-collapse: collapse; text-align: left; } /*override festival header styles*/ #HeaderWelcome { top: 5px; width: 800px; position: absolute; font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-style: normal; line-height: 1.4em; font-weight: bold; color: #FFCC00; display: none; } /*override content span article display*/ span.article_seperator { display: none; } /*---------- Footer Styles ----------*/ .footerSiteMap { clear: both; color: #669900; font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-style: normal; font-weight: normal; line-height: 1.4em; text-align: center; width: 100%; } .footerSiteMap a:link { color: #588A2B; font-weight: bold; text-decoration: underline; } .footerSiteMap a:hover { color: #FE9506; font-weight: bold; text-decoration: underline; } /*---------- Navigation Styles ----------*/	 .menu120 { background: none repeat scroll 0 0 #fcac2d; border-top-right-radius: 10px; height:30px; left: 260px; position: absolute; top: 53px; width:700px; } .menu120 a { color: #FFFFFF !important; margin:0px !important; padding: 0 10px; } .menu120 li a:hover { background-color: #fcc56c; color: #000000 !important; padding: 8px 10px; text-decoration: none !important; } .menu120 ul { height: 30px; margin: 8px -20px; } .menu120 li { display: inline !important; float: left; text-decoration: none; }
    </style>
    <div id="header" style="width:940px; float:left; height:155px; margin-left:auto; margin-right:auto;">
      <div id="header_content" style="width:800px; height:132px; margin-left:auto; margin-right:auto;" align="center">
        <div id="StoreHeaderRightTop">
          <xsl:choose>
            <xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
                <!--  <div style="color:#ffffcc">Not logged in</div>  -->
                <div id="LoginBox">
                    <p id="LoginButtonDiv">
                        <a id="A4" href="/Profile/SignIn.aspx" runat="server">Sign-In</a>
                    </p>
                    <p id="LoginNewProfileLinkDiv">
                        <a id="A4" href="/Profile/SignUp.aspx" runat="server">Not a member? Click here.</a>
                    </p>
                </div>
            </xsl:when>
            <xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
              <div style="color:#ffffcc">
                Welcome
                <xsl:choose>
                  <xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
                    <xsl:value-of select="//GenericConsumer/FirstName"/> &#xA0;
                    <xsl:value-of select="//GenericConsumer/LastName"/>&#xA0;&#xA0;
                  </xsl:when>
                  <xsl:when test="//GenericConsumer/UserName = not('')">
                    <xsl:value-of select="//GenericConsumer/UserName"/>&#xA0;&#xA0;
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="//GenericConsumer/Email"/>&#xA0;&#xA0;
                  </xsl:otherwise>
                </xsl:choose>
                <a runat="server" href="/Profile/Signup.aspx" style="color:white">Edit Profile</a>
                |
                <a runat="server" href="/Profile/SignOut.aspx" style="color:white">Log Out</a>
              </div>
            </xsl:when>
          </xsl:choose>
        </div>
        <div class="mod_contentitemhdr">
          <table>
            <tr>
              <td colspan="1" style="vertical-align:top;">
                <table class="contentpaneopen">
                  <tr>
                    <td valign="top" colspan="2">
                      <div id="HeaderWelcome" align="center">Welcome to Festival Foods,</div>
                      <div id="HeaderContent" style="position: relative; width: 800px;" align="center">
                        <div id="HeaderIcons" style="position: absolute; left: 743px; top: 20px; width: 127px; height: 31px;">
                         	<a class="social" title="Visit Festival Foods on Pinterest" href="https://pinterest.com/festfoods/" target="_blank">
		<img src="/Assets/184/Images/pinterest.png" width="20" height="20"/> </a>
			<a class="social" title="Visit Festival Foods on Twitter" href="https://twitter.com/festfoods" target="_blank"><img src="/Assets/184/Images/twitter.png" width="20" height="20"/></a>
			<a class="social" title="Visit Festival Foods on Facebook" href="https://www.facebook.com/festfoods" target="_blank"><img src="/Assets/184/Images/facebook.png" width="20" height="20"/></a>
			<a class="social" title="Visit Festival Foods' Blog" href="http://blog.festfoods.com/" target="_blank"><img src="/Assets/184/Images/blog.png" width="20" height="20"/></a>
                        </div>
                        <div id="HeaderFestivalLogo" style="position: absolute; left: -84px; width: 260px; height: 117px;">
                          <a href="http://festfoods.gsnrecipes.com/ ">
                            <img width="260" height="117" border="0" alt="" src="/Assets/184/Images/logo.png"/>
                          </a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </table>
                <span class="article_seperator"></span>
              </td>
            </tr>
          </table>
        </div>
      </div>
      <div style="clear:both;"/>
      <div id="header_menu">
        <div id="wrap120" class="menu120" align="center">
          <ul>
            <xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="Link"/>
										</xsl:attribute>
										<xsl:value-of select="Title"/>
									</a>
								</li>
							</xsl:for-each>
          </ul>
        </div>
      </div>
      <div style="clear:both;"/>
    </div>
    <!--  1315856481  -->
  </xsl:template>
</xsl:stylesheet>
