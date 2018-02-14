<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<div id="StoreHeader">
			<div id="StoreHeaderLogo">
				<a href="/">
					<img border="0">
						<xsl:attribute name="src">
							<xsl:value-of select="ExpressLane/header/logo"/>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div style="float:right">
				<a href="http://www.countymarketgood2go.com" target='_blank'>
					<img src="https://upload.brickinc.net/chainfiles/183/creative/201802/636541901958227454-cm_g2g_logo.jpg" width="125px"/>
				</a>
			</div>
			<div id="StoreHeaderRight" >
				<div id="StoreHeaderRightTop" style="margin-right:0px;">
					<div id="LoginBox" class="group facebook-login">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
									<div id="fb-image">
									<img class="profile" style="height:75px;width:75px;">
										<xsl:attribute name="src">
											<xsl:value-of select="concat('http://graph.facebook.com/', //ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=small')"/>
										</xsl:attribute>
									</img>
									</div>
								</xsl:if>
								<div id="LoginLabelTextDiv">Welcome back,</div>
								<div id="LoginAsLabelDiv">
									<xsl:choose>
										<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
											<xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
										<xsl:when test="//GenericConsumer/UserName = not('')">
											<xsl:value-of select="//GenericConsumer/UserName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="//GenericConsumer/Email"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div id="LoginProfileLinkDiv">
									<xsl:choose>
										<xsl:when test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
											<a id="A2" runat="server" href="/Social/FaceBookSignup.aspx">My Account</a>|
										</xsl:when>
										<xsl:otherwise>
											<a id="A2" runat="server" href="/Profile/SignUp.aspx">My Account</a>|
										</xsl:otherwise>
									</xsl:choose>
									<a id="A3" runat="server" href="/Profile/SignOut.aspx">
										<xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
											<xsl:attribute name="onclick">FB.logout()</xsl:attribute>
										</xsl:if>
										<xsl:text>Sign out</xsl:text>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="(ExpressLane/FacebookSettings/IsActive = 'true') and (ExpressLane/GenericConsumer/IsLoggedIn != 'true')">
								<div id="fb-button-wrap">
									<!-- <xsl:text>##facebooklogin##</xsl:text> -->
									<a id="fb-login-button" class="fb_button fb_button_medium" onclick="fbButtonClick()">
										<span class="fb_button_text">Login with Facebook</span>
									</a>
								</div>
								<a class="button" href="/Profile/SignIn.aspx" runat="server"><span>Sign In</span></a>
								<a class="non-member" href="/Profile/SignUp.aspx" runat="server">Register to personalize</a>
							</xsl:when>
						</xsl:choose>
					</div>

				</div>
			</div>
			<div style="clear: both;" />
			<div id="StoreHeaderMiddle">
				<div id="StoreInfoDiv" class="clearfix">
					<xsl:choose>
					<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
						<xsl:variable name="StoreID">
							<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
						</xsl:variable>
						<div id="StoreAddress1Div">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
						</div>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/SecondaryAddress != ''">
							<div id="StoreAddress2Div">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/SecondaryAddress"/>
							</div>
						</xsl:if>
						<div id="StoreCityStateZipDiv">
							<xsl:if test="//GenericStore[StoreID = $StoreID]/City != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:if test="//GenericStore[StoreID = $StoreID]//State != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]//State"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="//GenericStore[StoreID = $StoreID]/PostalCode != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PostalCode"/>
							</xsl:if>
						</div>
						<div id="StoreTelDiv">
							<xsl:if test="//GenericStore[StoreID = $StoreID]/Phone != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/Phone"/>
							</xsl:if>
						</div>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/OpenHours != ''">
							<div id="StoreOpenHours">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/OpenHours" />
							</div>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="count(//ArrayOfGenericStore/GenericStore)=1">
								<div id="StoreAddress1Div">
									<xsl:value-of select="//GenericStore/PrimaryAddress"/>
								</div>
								<xsl:if test="//GenericStore/SecondaryAddress != ''">
									<div id="StoreAddress2Div">
										<xsl:value-of select="//GenericStore/SecondaryAddress"/>
									</div>
								</xsl:if>
								<div id="StoreCityStateZipDiv">
									<xsl:if test="//GenericStore/City != ''">
										<xsl:value-of select="//GenericStore/City"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore//State != ''">
										<xsl:value-of select="//GenericStore//State"/>
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore/PostalCode != ''">
										<xsl:value-of select="//GenericStore/PostalCode"/>
									</xsl:if>
								</div>
								<div id="StoreTelDiv">
									<xsl:if test="//GenericStore/Phone != ''">
										<xsl:value-of select="//GenericStore/Phone"/>
									</xsl:if>
								</div>
								<xsl:if test="//GenericStore/OpenHours != ''">
									<div id="StoreOpenHours">
										<xsl:value-of select="//GenericStore/OpenHours" />
									</div>
								</xsl:if>
						</xsl:if>
					</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
			<xsl:comment><![CDATA[[if lt IE 7]>
			<script id="dropdowns" type="text/javascript" language="javascript">
				sfHover = function() {
					var sfEls = document.getElementById("nav").getElementsByTagName("LI");
					for (var i=0; i<sfEls.length; i++) {
						sfEls[i].onmouseover=function() {
							this.className+=" sfhover";
						}
						sfEls[i].onmouseout=function() {
							this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
						}
					}
				}
				if (window.attachEvent) window.attachEvent("onload", sfHover);
		</script>					
	<![endif]]]></xsl:comment>
			<div id="StoreMenu" class="clearfix">
				<ul>
							<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
								<li>
									<a class="nav-link">
										<xsl:attribute name="href">
											<xsl:value-of select="Link"/>
										</xsl:attribute>
										<xsl:if test="Target">
											<xsl:attribute name="target">
												<xsl:value-of select="Target"/>
											</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="Title"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
			</div>		
		</div>
	</xsl:template>
</xsl:stylesheet>