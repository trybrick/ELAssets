<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/Profile/SignInControlV2.xsl"/>
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
			<div id="lightwindow_registration" class="hidden">
			</div>
			<div id="StoreHeaderRight">
				<div id="StoreHeaderRightTop">
					<xsl:apply-imports/>
				</div>
			</div>
			<div style="clear: both;"/>
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
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/OpenHours"/>
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
										<xsl:value-of select="//GenericStore/OpenHours"/>
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
