<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<!-- this is used to set the active nav -->
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aNavPath">
			<xsl:choose>
				<!-- recipe and shop pages use the same navs -->
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.aspx'"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/shop/')">
					<xsl:value-of select="'/shop/weeklyad.aspx'"/>
				</xsl:when>
				<xsl:when test="$AbsolutePath = '/default.aspx'">
					<xsl:value-of select="'##root##'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="StoreHeader">
			<a href="{//GenericChain/PreferedHost}" id="StoreHeaderLogo">
				<img alt="Store Logo" border="0">
					<xsl:attribute name="src">
						<xsl:choose>
							<!-- test if header logo is defined in admin, use backup if not -->
							<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 181]/Value) &gt; 0">
								<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 181]/Value"/>
							</xsl:when>
							<xsl:otherwise>/Assets/##chainid##/Images/HeaderLogo.gif</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</img>
			</a>
			<xsl:choose>
				<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
					<xsl:variable name="StoreID">
						<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
					</xsl:variable>
					<div id="StoreHeaderMiddle">
						<div class="StoreInfoDiv" id="StoreInfoDiv">
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
								<xsl:if test="//GenericStore[StoreID = $StoreID]/State != ''">
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
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/OpenHours"/>
								</div>
							</xsl:if>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="StoreHeaderMiddle">
						<xsl:if test="count(//ArrayOfGenericStore/GenericStore) = 1">
							<div class="StoreInfoDiv" id="StoreInfoDiv">
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
									<xsl:if test="//GenericStore/State != ''">
										<xsl:value-of select="//GenericStore/State"/>
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
										<xsl:value-of select="//GenericStore/OpenHours"/>
									</div>
								</xsl:if>
							</div>
						</xsl:if>
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:comment>[if lt IE 7]&gt;
					&lt;script id="dropdowns" type="text/javascript" language="javascript"&gt;
						sfHover = function() {
							var sfEls = document.getElementById("primary-navigation").getElementsByTagName("LI");
							for (var i=0; i&lt;sfEls.length; i++) {
								sfEls[i].onmouseover=function() {
									this.className+=" sfhover";
								}
								sfEls[i].onmouseout=function() {
									this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
								}
							}
						}
						if (window.attachEvent) window.attachEvent("onload", sfHover);
					&lt;/script&gt;					
					&lt;![endif]</xsl:comment>
			<ul id="primary-navigation">
				<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
					<xsl:variable name="navPath" select="translate(Link, $ucletters, $lcletters)"/>
					<li>
						<xsl:choose>
							<xsl:when test="(position()=1) and (contains($navPath, $aNavPath))">
								<xsl:attribute name="class">firstNav currentNav</xsl:attribute>
							</xsl:when>
							<xsl:when test="(position()=last) and (contains($navPath, $aNavPath))">
								<xsl:attribute name="class">lastNav currentNav</xsl:attribute>
							</xsl:when>
							<xsl:when test="position()=1">
								<xsl:attribute name="class">firstNav</xsl:attribute>
							</xsl:when>
							<xsl:when test="position()=last()">
								<xsl:attribute name="class">lastNav</xsl:attribute>
							</xsl:when>
							<xsl:when test="contains($navPath, $aNavPath)">
								<xsl:attribute name="class">currentNav</xsl:attribute>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>
						<a class="nav-link">
							<xsl:attribute name="href">
								<xsl:value-of select="Link"/>
							</xsl:attribute>
							<xsl:if test="Target">
								<xsl:attribute name="target">
									<xsl:value-of select="Target"/>
								</xsl:attribute>
							</xsl:if>
							<span>
								<xsl:if test="string-length(NavImagePath) &gt; 0">
									<xsl:attribute name="style">
										background-image:url(<xsl:value-of select="NavImagePath"/>);height:<xsl:value-of select="concat(NavImageHeight,'px')"/>;text-indent:-9999px;width:<xsl:value-of select="concat(NavImageWidth,'px')"/>;
									</xsl:attribute>
								</xsl:if>
								<xsl:value-of disable-output-escaping="yes" select="Title"/>
							</span>
						</a>
						<xsl:if test="SubLevelNavigation/MenuItem">
							<ul>
								<xsl:for-each select="SubLevelNavigation/MenuItem">
									<li>
										<xsl:if test="position()=1">
											<xsl:attribute name="class">firstSubNav</xsl:attribute>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:attribute name="class">lastSubNav</xsl:attribute>
										</xsl:if>
										<xsl:if test="SubLevelNavigation/MenuItem">
											<xsl:attribute name="class">TertiaryNavLink</xsl:attribute>
										</xsl:if>
										<a class="subnav-link">
											<xsl:attribute name="href">
												<xsl:value-of select="Link"/>
											</xsl:attribute>
											<xsl:if test="Target">
												<xsl:attribute name="target">
													<xsl:value-of select="Target"/>
												</xsl:attribute>
											</xsl:if>
											<span>
												<xsl:value-of disable-output-escaping="yes" select="Title"/>
											</span>
										</a>
										<xsl:if test="SubLevelNavigation/MenuItem">
											<ul>
												<xsl:for-each select="SubLevelNavigation/MenuItem">
													<li>
														<xsl:if test="position()=1">
															<xsl:attribute name="class">firstSubNav</xsl:attribute>
														</xsl:if>
														<xsl:if test="position()=last()">
															<xsl:attribute name="class">lastSubNav</xsl:attribute>
														</xsl:if>
														<a class="subnav-link">
															<xsl:attribute name="href">
																<xsl:value-of select="Link"/>
															</xsl:attribute>
															<xsl:if test="Target">
																<xsl:attribute name="target">
																	<xsl:value-of select="Target"/>
																</xsl:attribute>
															</xsl:if>
															<span>
																<xsl:value-of disable-output-escaping="yes" select="Title"/>
															</span>
														</a>
													</li>
												</xsl:for-each>
											</ul>
										</xsl:if>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:if>
					</li>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
</xsl:stylesheet>
