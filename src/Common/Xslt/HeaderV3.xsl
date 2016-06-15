<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
<!-- ======================================================================================================= -->	
	
	<xsl:template match="/">
		<div id="header-wrapper">
			<xsl:if test="//Header/Logo/Src">
				<a id="header-logo">
					<xsl:attribute name="href">##root##</xsl:attribute>
					<img>
						<xsl:attribute name="src"><xsl:value-of select="//Header/Logo/Src" /></xsl:attribute>
						<xsl:attribute name="alt"><xsl:value-of select="//Header/Logo/Alt" /></xsl:attribute>
						<xsl:attribute name="title"><xsl:value-of select="//Header/Logo/Title" /></xsl:attribute>
					</img>
				</a>
			</xsl:if>
			<div id="header-login-box">
				<xsl:choose>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
						<span class="login-text logged-in">
							<xsl:text>Welcome, </xsl:text>
							<xsl:choose>
								<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
									<xsl:value-of select="//GenericConsumer/FirstName"/>&#160;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
								<xsl:when test="//GenericConsumer/UserName = not('')">
									<xsl:value-of select="//GenericConsumer/UserName"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="//GenericConsumer/Email"/>
								</xsl:otherwise>
							</xsl:choose>
						</span><br/>
						<a class="edit" href="/Profile/SignUp.aspx" title="Edit account settings">My Account</a>
						<a class="logout" href="/Profile/SignOut.aspx" title="Logout">Logout</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="login-text">
							<xsl:text>Welcome, Guest </xsl:text>
						</span>
						<a class="login" title="Login">
							<xsl:attribute name="href">##root##/Profile/SignIn.aspx</xsl:attribute>
							<span>Login</span>
						</a>
						<span class="login-text">
							<xsl:text> or </xsl:text>
						</span>
						<a class="register" title="Register">
							<xsl:attribute name="href">##root##/Profile/SignUp.aspx</xsl:attribute>
							<span>Register</span></a>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div id="store-info">
				<xsl:variable name="StoreID">
					<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
				</xsl:variable>
				<xsl:variable name="GenericStore">
					<xsl:choose>
						<xsl:when test="$StoreID &gt; 0">
							<xsl:value-of select="//GenericStore[StoreID = $StoreID]" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//GenericStore[1]" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:call-template name="StoreInfo">
					<xsl:with-param name="GenericStore" select="$GenericStore" />
				</xsl:call-template>
			</div>
			<div id="primary-navigation" class="clearfix">
				<ul class="parent level0">
					<xsl:for-each select="//PrimaryNavigation/Item">
					<xsl:sort select="Order" data-type="number" />
					<xsl:call-template name="NavigationItem">
						<xsl:with-param name="Level" select="0" />
					</xsl:call-template>
					<xsl:if test="position() != last()">
						<li class="separator vertical"></li>
					</xsl:if>
					</xsl:for-each>
				</ul>
			</div>
		</div>
	</xsl:template>
	
<!-- ======================================================================================================= -->
	
	<xsl:template name="NavigationItem">
	<xsl:param name="Level" />
		<li>
		<xsl:attribute name="class">
			<xsl:value-of select="concat('level',$Level)" />
			<xsl:if test="position() = 1">
				<xsl:text> first</xsl:text>
			</xsl:if>
			<xsl:if test="count(SubNavigation) &gt; 0">
				<xsl:text> parent</xsl:text>
			</xsl:if>
		</xsl:attribute>
			<a>
				<xsl:attribute name="href"><xsl:value-of select="Url" /></xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="Title" /></xsl:attribute>
				<xsl:value-of select="Text" />
			</a>
			<xsl:if test="count(SubNavigation) &gt; 0">
				<ul>
				<xsl:attribute name="class">
					<xsl:text>child</xsl:text>
					<xsl:value-of select="concat(' level',$Level + 1)" />
				</xsl:attribute>
					<xsl:for-each select="SubNavigation/Item">
					<xsl:sort select="Order" data-type="number" />
						<xsl:call-template name="NavigationItem">
							<xsl:with-param name="Level" select="$Level + 1" />
						</xsl:call-template>
					</xsl:for-each>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
	
<!-- ======================================================================================================= -->	
	
	<xsl:template name="StoreInfo">
		<!-- <xsl:param name="GenericStore" />
		<xsl:for-each select="$GenericStore">
			<span id="store-address">
				<xsl:value-of select="concat(PrimaryAddress,' ',SecondaryAddress)"/>	
			</span>
			<span id="store-city-state">
				<xsl:value-of select="concat(City,', ',State,' ',PostalCode)"/>
			</span>
			<span id="store-phone">
				<xsl:value-of select="Phone"/>
			</span>
			<span id="store-hours">
				<xsl:value-of select="OpenHours" />
			</span>
		</xsl:for-each> -->
	</xsl:template>
	
</xsl:stylesheet>