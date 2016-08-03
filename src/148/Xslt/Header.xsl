<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/"><style type="text/css">
			@import url(/assets/148/Production/trigs-overrides.css);
		</style>
		<!--Import your own CSS file hosted on FTP-->

		<div id="header">
			<a id="logo" href="http://www.trigs.com">
				<img src="/assets/148/Production/images/logo.png" alt="Trigs : Fresh for you is what we do!"/>
			</a>
			<div id="location">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
						<xsl:variable name="StoreID">
							<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
						</xsl:variable>
						<div id="StoreAddress1Div">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
							<xsl:text>, </xsl:text>
						</div>
						<div id="StoreCityStateZipDiv">
							<xsl:if test="//GenericStore[StoreID = $StoreID]/City != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:if test="//GenericStore[StoreID = $StoreID]/State != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/StateAbbreviation"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="//GenericStore[StoreID = $StoreID]/PostalCode != ''">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PostalCode"/>
							</xsl:if>
						</div>
						<div id="StoreTelDiv">
							<xsl:if test="//GenericStore[StoreID = $StoreID]/Phone != ''">
								<xsl:text>Phone </xsl:text>
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/Phone"/>
							</xsl:if>
						</div>
						<br/>
						<a href="/storelocator.aspx" class="change">Change Locations</a>
						<xsl:text> | </xsl:text>
						<a href="#">Map</a>
						<xsl:text> | </xsl:text>
						<a href="#">Store Map</a>
					</xsl:when>
					<xsl:otherwise>
						<br/>
						<a href="/storelocator.aspx" class="change">Choose a Location</a>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div id="user_login_box">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
						<xsl:variable name="UserName">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/FirstName = not('')">
									<xsl:value-of select="//GenericConsumer/FirstName"/>
								</xsl:when>
								<xsl:when test="//GenericConsumer/UserName = not('')">
									<xsl:value-of select="//GenericConsumer/UserName"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="//GenericConsumer/Email"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<div id="ulb_top">
							<a href="/Profile/SignUp.aspx">Edit My Trig's Profile</a>
						</div>
						<div id="ulb_bottom">Hi, <xsl:value-of select="$UserName"/><xsl:text>! | </xsl:text><a href="/Profile/SignOut.aspx">Log Out</a></div>
					</xsl:when>
					<xsl:otherwise>
						<div id="ulb_top">
							<a href="/Profile/SignIn.aspx">Login to My Trig's Account</a>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<a href="#" id="help">Help</a>
			<div id="nav">
				<ul id="top">
					<li>
						<a href="http://www.trigs.com">Home</a>
					</li>
					<li>
						<a href="/Shop/WeeklyAd.aspx">Ads &amp; Coupons</a>
					</li>
					<li>
						<a href="/Recipes/RecipeCenter.aspx">Recipe Center</a>
					</li>
					<li>
						<a href="http://www.trigs.com/signature">Signature Items</a>
					</li>
					<li>
						<a href="http://www.trigs.com/department">Departments</a>
					</li>
					<li>
						<a href="http://www.trigs.com/service">Store Services</a>
					</li>
					<li>
						<a href="http://www.trigs.com/company">Company</a>
					</li>
					<li>
						<a href="http://www.trigs.com/careers">Careers</a>
					</li>
					<li>
						<a href="http://www.trigs.com/contact-us">Contact</a>
					</li>
				</ul>
				<ul id="sub">
					<li>
						<a href="#"> </a>
					</li>

				</ul>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
