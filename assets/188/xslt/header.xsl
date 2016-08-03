<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="aTabPath" select="ExpressLane/ActiveTab/AbsolutePath" />
		<xsl:variable name="StoreID" select="//GenericConsumer/PrimaryStoreID" />
		<script id="jsShowDiv" language="javascript" type="text/javascript">
			<![CDATA[
				document.observe("dom:loaded",footerControl);
				function footerControl(){
	    			var sPath = new String(window.location.pathname);
		            var theFooter = $('GsnFooter');
		            //alert(sPath);

		            if (sPath == '/StoreLocator.aspx') {
		                theFooter.style.display = "none";
		            }
					else {
		                theFooter.style.display = "block";
					}
				}
			]]>
		</script>
		<div id="header" class="group">
			<a href="{//GenericChain/PreferredHost}" class="header-logo">
				<img border="0" src="/Assets/188/Images/apple_logo.jpg"/>
			</a>
			<div id="login-box">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
						<div id="login-welcome">
							<span class="signed-in-as-label"><xsl:text>Welcome, </xsl:text></span>
							<span class="consumer-name-text">
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
							</span>
						</div>
						<div id="logout-links" class="group links">
							<a id="preferences-link" runat="server" href="/Profile/SignUp.aspx">My Preferences</a>
							<a id="signout-link" runat="server" href="/Profile/SignOut.aspx">Sign Out</a>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div id="login-links" class="group links">
							<a id="signin-link" href="/Profile/SignIn.aspx" runat="server" title="Sign in with an existing account">Sign In</a>
							<span>or</span>
							<a id="register-link" href="/Profile/SignUp.aspx" runat="server" title="Create a profile to register">Register here</a>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="store-info">
				<xsl:if test="$StoreID &gt; 0">
				<ul class="adr">
					<li class="street-address">
						<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
					</li>
					<xsl:if test="//GenericStore[StoreID = $StoreID]/SecondaryAddress != ''">
						<li class="extended-address">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/SecondaryAddress"/>
						</li>
					</xsl:if>
					<li class="locality">
						<xsl:if test="//GenericStore[StoreID = $StoreID]/City != ''">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>
							<xsl:text>,</xsl:text>
						</xsl:if>
					</li>
					<li class="region">
						<xsl:if test="//GenericStore[StoreID = $StoreID]//State != ''">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]//State"/>
						</xsl:if>
					</li>
					<li class="postal-code">
						<xsl:if test="//GenericStore[StoreID = $StoreID]/PostalCode != ''">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PostalCode"/>
						</xsl:if>
					</li>
					<li class="tel">
						<xsl:if test="//GenericStore[StoreID = $StoreID]/Phone != ''">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/Phone"/>
						</xsl:if>
					</li>
				</ul>
				</xsl:if>
			</div>
		</div>
		<div id="primary-navigation">
			<ul>
				<xsl:for-each select="ExpressLane/tabs/tab">
					<xsl:variable name="tabPath" select="url" />
					<li>
						<xsl:if test="translate($aTabPath, $lcletters, $ucletters) = translate($tabPath, $lcletters, $ucletters)">
							<xsl:attribute name="id">
								<xsl:text>current</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a href="{url}">
							<xsl:value-of select="text" disable-output-escaping="yes"/>
						</a>
					</li>
				</xsl:for-each>
			</ul>
			<div id="module-images">
				<a href="http://www.fruitsandveggiesmorematters.org" target="_blank">
					<img>
						<xsl:attribute name="src">/Assets/188/Images/more_matters.jpg</xsl:attribute>
					</img>
				</a>
				<a href="http://www.mypyramid.gov" target="_blank">
					<img class="pyramid">
						<xsl:attribute name="src">/Assets/188/Images/my_pyramid.jpg</xsl:attribute>
					</img>
				</a>
				<a href="http://www.boxtops4education.com" target="_blank">
					<img>
						<xsl:attribute name="src">/Assets/188/Images/box_tops.jpg</xsl:attribute>
					</img>
				</a>
				<!--<a href="http://www.facebook.com/pages/Apple-Market-Heartland/140370982701345"><img src="/Assets/Common/Images/SocialNetworking/facebook_badge.gif" alt="Find us on Facebook"/></a>-->
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>