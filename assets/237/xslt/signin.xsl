<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template name="SignIn" match="/">
		<xsl:choose>
			<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
				<xsl:call-template name="SignOutControl"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="SignInControl"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SignInControl">
		<div class="account LoggedOut">
			<a class="button" href="/Profile/SignIn.aspx">
				<span>Sign In</span>
			</a>
			<a class="button" href="/Profile/SignUp.aspx">
				<span>Sign Up</span>
			</a>
			<p>Get personalized email specials and save your lists</p>
		</div>
	</xsl:template>
	<xsl:template name="SignOutControl">
		<div class="account LoggedIn">
			<div id="LoginGreeting">
				<span id="LoginLabelText">Welcome back, </span>
				<span id="LoginAsLabel">
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
				</span>
			</div>
			<div id="LoginProfile">
				<a id="preferences-link" href="/profile/preferences.aspx">
					<span>Your Account</span>
				</a>
				<span> | </span>
				<a id="signout-link" href="/profile/signout.aspx">
					<span>Sign Out</span>
				</a>
			</div>
			<xsl:if test="//GenericConsumer/PrimaryStoreID &gt; 0">
				<div id="LoginInfo">
					<span>Your Store Location:</span>
					<xsl:variable name="StoreID">
						<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
					</xsl:variable>
					<div id="StoreName">
						<xsl:if test="//GenericStore[StoreID = $StoreID]/StoreName != ''">
							<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]/StoreName,' ')"/>
						</xsl:if>
					</div>
					<div id="StoreAddress">
						<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]/PrimaryAddress,' ')"/>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/SecondaryAddress != ''">
							<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]/SecondaryAddress,' ')"/>
						</xsl:if>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/City != ''">
							<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]/City,', ')"/>
						</xsl:if>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/State != ''">
							<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]//StateAbbreviation,' ')"/>
						</xsl:if>
						<xsl:if test="//GenericStore[StoreID = $StoreID]/PostalCode != ''">
							<xsl:value-of select="concat(//GenericStore[StoreID = $StoreID]/PostalCode,' ')"/>
						</xsl:if>
					</div>
					<!--
						<div id="StorePhone">
							<xsl:if test="//GenericStore[StoreID = $StoreID]/Phone != ''">
								<xsl:value-of select="concat('Phone: ',//GenericStore[StoreID = $StoreID]/Phone,' ')"/>
							</xsl:if>
							<xsl:if test="//GenericStore[StoreID = $StoreID]/OpenHours != ''">
								<xsl:value-of select="concat('Store Hours: ',//GenericStore[StoreID = $StoreID]/OpenHours,' ')"/>
							</xsl:if>
						</div>
						-->
				</div>
			</xsl:if>
		</div>
	</xsl:template>
</xsl:stylesheet>
