<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
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
			<div id="StoreHeaderRight">
				<div id="StoreHeaderRightTop">
					<div id="LoginBox">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<div id="LoginLabelTextDiv">signed in as:</div>
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
									<a id="A2" runat="server" href="/Profile/Signup.aspx">My Preferences</a>|
									<a id="A3" runat="server" href="/Profile/SignOut.aspx">Log Out</a>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<p id="LoginButtonDiv">
									<a id="A4" href="/Profile/SignIn.aspx" runat="server">Sign-In</a>
								</p>
								<p id="LoginNewProfileLinkDiv">
									<a id="A4" href="/Profile/SignUp.aspx" runat="server">Not a member? Click here.</a>
								</p>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div style="clear: both;"/>
			<div id="nav-wrap">
				<div id="nav-in">
					<div id="nav">
						<ul>
							<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
								<li>
									<xsl:if test="position() = last()">
										<xsl:attribute name="style">border-right:none;</xsl:attribute>
									</xsl:if>
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
			<xsl:variable name="StoreID">
				<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
			</xsl:variable>
			<div id="StoreHeaderMiddle">
				<div id="StoreInfoDiv" class="StoreInfoDiv">
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
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Coborn's-Header.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->