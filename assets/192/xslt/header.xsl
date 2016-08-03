<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<div align="center">
			<table cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr>
						<td valign="top" align="left">
							<img border="0" alt="Ray's Apple Market" src="/Assets/192/Images/logo.gif"/>
						</td>
						<td valign="top" align="left">
							<table width="100" cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td valign="top" align="left">
											<table width="800" cellspacing="0" cellpadding="0" border="0">
												<tbody>
													<tr>
														<td width="61" valign="top" align="left">
															<a href="http://www.raysapplemarkets.com">
																<img border="0" alt="Home" src="/Assets/192/Images/home.jpg"/>
															</a>
														</td>
														<td width="121" valign="top" align="left">
															<a href="/Shop/WeeklyAd.aspx">
																<img border="0" alt="Weekly Ads" src="/Assets/192/Images/ads.jpg"/>
															</a>
														</td>
														<td width="81" valign="top" align="left">
															<a href="/Recipes/RecipeCenter.aspx">
																<img border="0" alt="Recipes" src="/Assets/192/Images/recipes.jpg"/>
															</a>
														</td>
														<td width="116" valign="top" align="left">
															<a href="http://www.raysapplemarkets.com/community.php5">
																<img border="0" alt="Community" src="/Assets/192/Images/community.jpg"/>
															</a>
														</td>
														<td width="113" valign="top" align="left">
															<a href="http://www.raysapplemarkets.com/health_well.php5">
																<img border="0" alt="Health and Wellness" src="/Assets/192/Images/health.jpg"/>
															</a>
														</td>
														<td width="96" valign="top" align="left">
															<a href="/StoreLocator.aspx">
																<img border="0" alt="locations" src="/Assets/192/Images/locations.jpg"/>
															</a>
														</td>
														<td width="75" valign="top" align="left">
															<a href="http://www.raysapplemarkets.com/kids.php5">
																<img border="0" alt="Kids Stuff" src="/Assets/192/Images/kid.jpg"/>
															</a>
														</td>
														<td width="137" valign="top" align="left">
															<img border="0" src="/Assets/192/Images/top_left.gif"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td valign="top" align="left">
											<img src="/Assets/192/Images/header_space.gif"/>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="StoreHeaderRightTop">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
					<div style="margin-top:10px;">Not signed in | <a href="##root##/Profile/SignIn.aspx">Sign In</a>
						<p id="LoginNewProfileLinkDiv">
							<a id="A4" href="##root##/Profile/SignUp.aspx" runat="server">Not a member? Click here.</a>
						</p>
					</div>
				</xsl:when>
				<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
					<div style="margin-top:10px;">Welcome
						<xsl:choose>
							<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
								<xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
							<xsl:when test="//GenericConsumer/UserName = not('')">
								<xsl:value-of select="//GenericConsumer/UserName"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//GenericConsumer/Email"/>
							</xsl:otherwise>
						</xsl:choose> | <a href="##root##/Profile/Signup.aspx">Edit Profile</a> | <a href="##root##/Profile/SignOut.aspx">Sign Out</a></div>
				</xsl:when>
			</xsl:choose>
		</div>
		<xsl:choose>
			<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
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
			</xsl:when>
			<xsl:otherwise>
				<div id="StoreHeaderMiddle">
					<xsl:if test="count(//GenericStore)=1">
						<div id="StoreInfoDiv" class="StoreInfoDiv">
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
								</xsl:if>&#xA0;
								<xsl:if test="//GenericStore/OpenHours != ''">
									<xsl:value-of select="//GenericStore/OpenHours"/>
								</xsl:if>
							</div>
						</div>
					</xsl:if>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>