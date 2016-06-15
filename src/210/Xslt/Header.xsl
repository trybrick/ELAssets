<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<div id="StoreHeader">
			<div id="StoreHeaderLogo">
				<a href="/">
					<img src="/Assets/210/Images/LogoMain.jpg" alt="" border="0" />
				</a>
			</div>
			<div id="StoreHeaderRight">
				<div id="StoreHeaderRightTop">
					<div id="LoginBox">
						<xsl:attribute name="class">
							<xsl:text>group facebook-login</xsl:text>
						</xsl:attribute>
						<div class="inner-wrap group">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
									<xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
										<div id="fb-image">
											<img class="profile">
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
												<a id="preferences-link" runat="server" href="/Social/FaceBookSignup.aspx">My Account</a></xsl:when>
											<xsl:otherwise>
												<a id="preferences-link" runat="server" href="/Profile/SignUp.aspx">My Account</a></xsl:otherwise>
										</xsl:choose>
										<a id="signout-link" runat="server" href="/Profile/SignOut.aspx">
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
									<a class="button" href="/Profile/SignIn.aspx" runat="server">
										<span>Sign in</span>
									</a>
									<a class="non-member" href="/Profile/SignUp.aspx" runat="server">Register to personalize</a>
								</xsl:when>
							</xsl:choose>
						</div>
					</div>
					<div id="SocialBox">
						<div class="inner-wrap group">
							<span>Follow Us<br/>Online</span>
							<a class="Facebook" target="_blank" title="Follow Us on Facebook">
								<xsl:attribute name="href">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value"/>
								</xsl:attribute>
								<img src="##root##/Assets/210/Images/fb.jpg" alt="Facebook Icon" border="0" />
							</a>
							<a class="YouTube" target="_blank" title="Follow Us on You Tube">
								<xsl:attribute name="href">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=272]/Value"/>
								</xsl:attribute>
								<img src="##root##/Assets/210/Images/youtube-logo.png" alt="You Tube Icon" border="0" />
							</a>
							<a class="Printerest" target="_blank" title="Follow Us on Pinterest">
								<xsl:attribute name="href">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=367]/Value"/>
								</xsl:attribute>
								<img src="##root##/Assets/210/Images/pinterest-app-logo.png" alt="Pinterest Icon" border="0" />
							</a>
							<a class="Twitter" target="_blank" title="Follow Us Twitter">
								<xsl:attribute name="href">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
								</xsl:attribute>
								<img src="##root##/Assets/210/Images/tw.jpg" alt="Twitter Icon" border="0" />
							</a>						
						</div>
					</div>
				</div>
			</div>
			<div style="clear:both"></div>
			<xsl:comment><![CDATA[
				[if lt IE 7]>
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
			<div id="nav-wrap">
				<div id="nav-in">
					<div id="nav">
						<ul>
							<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
								<li>
									<a>
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
									<xsl:if test="SubLevelNavigation/MenuItem">
										<ul>
											<xsl:for-each select="SubLevelNavigation/MenuItem">
												<li>
													<a>
														<xsl:attribute name="href">
															<xsl:choose>
																<xsl:when test="Title='Corporate Newsletter'">
																	<xsl:value-of select="ancestor::ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="Link"/>
																</xsl:otherwise>
															</xsl:choose>
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
									</xsl:if>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
