<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="header">
			<a href="/?page=home">
				<img src="/Assets/193/Images/header.jpg" alt="Apple Market of St. Joseph, MO -- We're right on your way home!" width="910" height="108"/>
			</a>
			<div id="header-login">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
						<span class="not-logged-in-text">Not signed in</span><xsl:text> </xsl:text>
						<a href="##root##/Profile/SignIn.aspx">Sign In</a>
						<p id="LoginNewProfileLinkDiv">
							<a id="register-link" href="##root##/Profile/SignUp.aspx" runat="server">Not a member? Click here.</a>
						</p>
					</xsl:when>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
						<span class="welcome-text">Welcome, </span>
						<span class="consumer-name-text">
							<xsl:choose>
								<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
									<xsl:value-of select="//GenericConsumer/FirstName"/><xsl:text> </xsl:text><xsl:value-of select="//GenericConsumer/LastName"/>
								</xsl:when>
								<xsl:when test="//GenericConsumer/UserName = not('')">
									<xsl:value-of select="//GenericConsumer/UserName"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="//GenericConsumer/Email"/>
								</xsl:otherwise>
							</xsl:choose>
						</span>
                        <span class="header-links">
                            <a href="##root##/Profile/Signup.aspx">Edit Profile</a>
						    <a href="##root##/Profile/SignOut.aspx">Sign Out</a>
                        </span>
					</xsl:when>
				</xsl:choose>
			</div>
			<div id="top-nav">
				<ul>
					<xsl:for-each select="//TopLevelNavigation/MenuItem">
						<li>
							<a href="{concat('http://www.applemarketstjoe.com/?page=',Page)}">
								<img src="{concat('##root##/Assets/##chainid##/Images/',Image)}" alt="{Title}" height="{Image/@height}" width="{Image/@width}"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
