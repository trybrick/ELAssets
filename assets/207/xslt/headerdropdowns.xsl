<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/Profile/SignInControlAsync.xsl"/>
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="FaceBookUrl" select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value" />
		<xsl:variable name="TwitterUrl" select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<script>(function() {
		var _fbq = window._fbq || (window._fbq = []);
		if (!_fbq.loaded) {
		var fbds = document.createElement('script');
		fbds.async = true;
		fbds.src = '//connect.facebook.net/en_US/fbds.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(fbds, s);
		_fbq.loaded = true;
		}
		_fbq.push(['addPixelId', '802251896559633']);
		})();
		window._fbq = window._fbq || [];
		window._fbq.push(['track', 'PixelInitialized', {}]);
		</script>
		<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?id=802251896559633&amp;ev=PixelInitialized" /></noscript>
		<script src="/Assets/Common/Js/Profile/Profiles.js" type="text/javascript"/>
		<div id="StoreHeader" class="clearfix">
			<div id="StoreHeaderLogo">
				<a href="/">
					<xsl:if test="ExpressLane/header/logo != ''">
						<img border="0">
							<xsl:attribute name="src">
								<xsl:value-of select="ExpressLane/header/logo"/>
							</xsl:attribute>
						</img>
					</xsl:if>
				</a>
			</div>
			<div id="StoreHeaderRight">
				<div id="StoreHeaderRightTop">
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
											<a id="A2" runat="server" href="/Social/FaceBookSignup.aspx">My Account</a></xsl:when>
										<xsl:otherwise>
											<a id="A2" runat="server" href="/Profile/SignUp.aspx">My Account</a></xsl:otherwise>
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
								<a id="login-submit" class="button" href="/Profile/SignIn.aspx" runat="server">
									<span>Sign In</span>
								</a>
								<a class="non-member" href="/Profile/SignUp.aspx" runat="server">Register to personalize</a>
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div style="clear: both;"/>
			<div id="StoreHeaderMiddle">
				<div id="StoreInfoDiv">
					<div id="StoreInfoWelcome"/>
					<div id="StoreInfoTwitter">
						<a href="{$TwitterUrl}">
							<img src="/Assets/207/Images/headerTwitterBtn.png" border="0"/>
						</a>
					</div>
					<div id="StoreInfoFacebook">
						<a href="{$FaceBookUrl}">
							<img src="/Assets/207/Images/headerFacebookBtn.png" border="0"/>
						</a>
					</div>
					<div id="StoreInfoFollow">
						<p>Follow Us On:</p>
					</div>
				</div>
			</div>
			<xsl:comment><![CDATA[[if lt IE 7]><script id="dropdowns" type="text/javascript" language="javascript">
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
			</script><![endif]]]></xsl:comment>
			<div id="nav-wrap">
				<div id="nav-in">
					<div id="nav" class="clearfix">
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
									<xsl:if test="SubLevelNavigation/MenuItem">
										<ul>
											<xsl:for-each select="SubLevelNavigation/MenuItem">
												<li>
													<a class="subnav-link">
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
									</xsl:if>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="StoreInformation">
		<xsl:param name="StoreID"/>
		<xsl:param name="PrimaryAddress"/>
		<xsl:param name="SecondaryAddress"/>
		<xsl:param name="City"/>
		<xsl:param name="State"/>
		<xsl:param name="PostalCode"/>
		<xsl:param name="Phone"/>
		<xsl:param name="Fax"/>
		<span id="primaryAddress">
			<xsl:value-of select="$PrimaryAddress"/>
		</span>
		<span id="secondaryAddress">
			<xsl:value-of select="$SecondaryAddress"/>
		</span>
		<span id="storeCity">
			<xsl:value-of select="$City"/>,</span>
		<span id="storeState">
			<xsl:value-of select="$State"/>
		</span>
		<span id="storeZip">
			<xsl:value-of select="$PostalCode"/>
		</span>
		<span id="storeTelephone">Tel: <xsl:value-of select="$Phone"/></span>
	</xsl:template>
</xsl:stylesheet>