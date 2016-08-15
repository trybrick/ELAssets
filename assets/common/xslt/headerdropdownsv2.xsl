<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/Registration/RegistrationPopup.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">var isLoggedIn = <xsl:value-of select="//GenericConsumer/IsLoggedIn"/>;</script>
		<script src="/Assets/Common/Js/Registration/RegistrationPopup.js" type="text/javascript"/>
		<xsl:apply-imports/>
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
					<div id="LoginBox">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<div id="LoginAsLabelDiv">
									<strong>signed in as:</strong>
									<br/>
									<span>
										<xsl:choose>
											<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))"><xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
											<xsl:when test="//GenericConsumer/UserName = not('')">
												<xsl:value-of select="//GenericConsumer/UserName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="//GenericConsumer/Email"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
								<div id="LoginProfileLinkDiv"><a id="A2" runat="server" href="/Profile/SignUp.aspx">My Preferences</a>&#xA0;|&#xA0;
									<a id="A3" runat="server" href="/Profile/SignOut.aspx">Log Out</a>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<a class="button" href="/Profile/SignIn.aspx" runat="server">
									<span>
										<xsl:choose>
											<xsl:when test="ExpressLane/header/LoginBox/SignInLinkText != ''">
												<xsl:value-of select="ExpressLane/header/LoginBox/SignInLinkText"/>
											</xsl:when>
											<xsl:otherwise>Sign-In</xsl:otherwise>
										</xsl:choose>
									</span>
								</a>
								<a class="SignUpLink" href="/Profile/SignUp.aspx" runat="server">
									<xsl:choose>
										<xsl:when test="ExpressLane/header/LoginBox/SignUpLinkText != ''">
											<xsl:value-of select="ExpressLane/header/LoginBox/SignUpLinkText"/>
										</xsl:when>
										<xsl:otherwise>Not a member? Click here.</xsl:otherwise>
									</xsl:choose>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div style="clear: both;"/>
			<div id="StoreHeaderMiddle">
				<div id="StoreInfoDiv">
					<xsl:choose>
						<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
							<xsl:variable name="StoreID">
								<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
							</xsl:variable>
							<xsl:call-template name="StoreInformation">
								<xsl:with-param name="PrimaryAddress">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
								</xsl:with-param>
								<xsl:with-param name="SecondaryAddress">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/SecondaryAddress"/>
								</xsl:with-param>
								<xsl:with-param name="City">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>
								</xsl:with-param>
								<xsl:with-param name="State">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/State"/>
								</xsl:with-param>
								<xsl:with-param name="PostalCode">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PostalCode"/>
								</xsl:with-param>
								<xsl:with-param name="Phone">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/Phone"/>
								</xsl:with-param>
								<xsl:with-param name="StoreHours">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/OpenHours"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="count(//ArrayOfGenericStore/GenericStore)=1">
								<xsl:call-template name="StoreInformation">
									<xsl:with-param name="PrimaryAddress">
										<xsl:value-of select="//GenericStore/PrimaryAddress"/>
									</xsl:with-param>
									<xsl:with-param name="SecondaryAddress">
										<xsl:value-of select="//GenericStore/SecondaryAddress"/>
									</xsl:with-param>
									<xsl:with-param name="City">
										<xsl:value-of select="//GenericStore/City"/>
									</xsl:with-param>
									<xsl:with-param name="State">
										<xsl:value-of select="//GenericStore//State"/>
									</xsl:with-param>
									<xsl:with-param name="PostalCode">
										<xsl:value-of select="//GenericStore/PostalCode"/>
									</xsl:with-param>
									<xsl:with-param name="Phone">
										<xsl:value-of select="//GenericStore/Phone"/>
									</xsl:with-param>
									<xsl:with-param name="StoreHours">
										<xsl:value-of select="//GenericStore/OpenHours"/>
									</xsl:with-param>
								</xsl:call-template>
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
		<xsl:param name="StoreHours"/>
		<span id="primaryAddress">
			<xsl:value-of select="$PrimaryAddress"/>
		</span>
		<span id="secondaryAddress">
			<xsl:value-of select="$SecondaryAddress"/>
		</span>
		<span id="storeCity"><xsl:value-of select="$City"/>,
		</span>
		<span id="storeState">
			<xsl:value-of select="$State"/>
		</span>
		<span id="storeZip">
			<xsl:value-of select="$PostalCode"/>
		</span>
		<span id="storeTelephone">
			Tel: <xsl:value-of select="$Phone"/>
		</span>
		<xsl:if test="$StoreHours">
			<span id="storeHours">
				<xsl:value-of select="$StoreHours"/>
			</span>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
