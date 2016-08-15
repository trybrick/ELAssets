<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style type="text/css">
		/*override content pane table padding border and margin*/
		table.contentpaneopen {
			width: 100%;
			padding: 0px;
			border-collapse: collapse;
			border-spacing: 0px;
			margin: 0px;
		}
		/*override content pane table td margin and line height*/
		table.contentpaneopen td {
		   margin: 0px;
		   padding: 0px;
		   padding-right: 0px;
			line-height: normal;
		}
		/*override header content module table margin and border*/
		div.mod_contentitemhdr table {
			margin: 0px;
			padding: 0px;
			border: 0px;
			border-width: 0px;
			border-spacing: 0px;
			border-collapse: collapse;
			text-align: left;
		}
		/*override festival header styles*/
		#HeaderWelcome {
			top: 5px;
			width: 800px;
			position: absolute;
			font-family: Arial, Helvetica, sans-serif;
			font-size: 16px;
			font-style: normal;
			line-height: 1.4em;
			font-weight: bold;
			color: #FFCC00;
			display: none;
		}
		/*override content span article display*/
		span.article_seperator {
			display: none;
		}
		</style>
		<div id="header" style="width:940px; float:left; height:155px; margin-left:auto; margin-right:auto;">
			<div id="header_content" style="width:800px; height:132px; margin-left:auto; margin-right:auto;" align="center">
				<div id="StoreHeaderRightTop">
				    <xsl:choose>
				        <xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
				            <!-- <div style="color:#ffffcc">Not logged in</div> -->
				        </xsl:when>
				        <xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
				            <div style="color:#ffffcc">Welcome
				                <xsl:choose>
				                    <xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
				                        <xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
				                    <xsl:when test="//GenericConsumer/UserName = not('')">
				                        <xsl:value-of select="//GenericConsumer/UserName"/>
				                    </xsl:when>
				                    <xsl:otherwise>
				                        <xsl:value-of select="//GenericConsumer/Email"/>
				                    </xsl:otherwise>
				                </xsl:choose>&#xA0;&#xA0;
				                <a href="##root##/Profile/Signup.aspx" style="color:white">Edit Profile</a>&#xA0;|&#xA0;
				                <a href="##root##/Profile/SignOut.aspx" style="color:white">Log Out</a>
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
											<div id="HeaderWelcome" align="center">
												Welcome to Festival Foods, 
											</div>
											<div id="HeaderContent" style="position: relative; width: 800px;" align="center">
												<div id="HeaderIcons" style="position: absolute; left: 635px; top: 20px; width: 127px; height: 31px;">
													<div id="BlogIcon" style="position: absolute; left: 304px; width: 41px;">
														<a href="http://blog.festfoods.com" target="_blank">
															<img width="84" height="35" border="0" alt="" src="http://festfoods.com/images/template/_header_3.x/icon_blog.gif"/>
														</a>
													</div>
												</div>
												<div id="HeaderFestivalLogo" style="position: absolute; left: -84px; width: 260px; height: 117px;">
													<a href="http://festfoods.com/">
														<img width="260" height="117" border="0" alt="" src="/Assets/11/Images/logo.png"/>
													</a>
												</div>
												<div id="HeaderFestivalMemberLoginButton" style="position: absolute; left: 916px; top: 52px; width: 133px; height: 49px;">
													<img src="http://festfoods.com/images/template/_header_3.x/button_member_login.jpg" alt="" width="133" height="49" border="0" usemap="#Map"/>
													<map name="Map">
														<area shape="rect" coords="94,2,130,24" href="http://gsn.festfoods.com/Profile/SignIn.aspx"/>
														<area shape="rect" coords="7,30,52,48" href="http://gsn.festfoods.com/Profile/SignUp.aspx"/>
													</map>
												</div>
												<div id="HeaderFestivalContactUsButton" style="position: absolute; left: 916px; top: 102px; width: 133px; height: 26px;">
													<a href="http://crm.festfoods.com">
														<img width="133" height="26" border="0" alt="" src="http://festfoods.com/images/template/_header_3.x/button_contact_us.jpg"/>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<span class="article_seperator"> </span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="clear:both;"/>
			<div id="header_menu">
				
<style type="text/css">
		
/*---------- Footer Styles ----------*/

.footerSiteMap 
{
    clear: both;
    color: #669900;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    font-style: normal;
    font-weight: normal;
    line-height: 1.4em;
    text-align: center;
    width: 100%;
}

.footerSiteMap a:link 
{
	color: #588A2B;
	font-weight: bold;
	text-decoration: underline;
}

.footerSiteMap a:hover 
{
	color: #FE9506;
	font-weight: bold;
	text-decoration: underline;
}
		
/*---------- Navigation Styles ----------*/		
		
.menu120
{
	background: none repeat scroll 0 0 #fcac2d;
	border-top-right-radius: 10px; 
	height:30px; 
	left: 240px;
	position: absolute; 
	top: 53px;
	width:700px;
}

.menu120 a
{
	color: #FFFFFF !important;
	margin:0px !important; 
	padding: 0 10px;  
}

.menu120 li a:hover
{
	background-color: #fcc56c;
	color: #000000 !important;
	padding: 8px 10px;
	text-decoration: none !important; 
}

.menu120 ul
{
	height: 30px;
	margin: 8px -20px;
}

.menu120 li
{
	display: inline !important;
	float: left;
	text-decoration: none;
}


</style>
		<div id="wrap120" class="menu120" align="center">
			<ul>
				<li><a href="http://festfoods.com/shop-online/">Shop Online</a></li>
				<li><a href="http://gsn.festfoods.com/Shop/WeeklyAd.aspx">Savings Center</a></li>
				<li><a href="http://festfoods.com/locations/">Locations</a></li>
				<li><a href="http://gsn.festfoods.com/Recipes/RecipeCenter.aspx">Recipes</a></li>
				<li><a href="http://festfoods.com/departments/">Departments</a></li>
				<li><a href="http://crm.festfoods.com/">Contact Us</a></li>
				<li><a href="http://career.festfoods.com/">Join Our Team</a></li>
				<li><a href="http://festfoods.com/help/">Help</a></li>
			</ul>
		</div>
	
</div>
<div style="clear:both;"/></div>

<!-- 1315856481 -->
	</xsl:template>
</xsl:stylesheet>
