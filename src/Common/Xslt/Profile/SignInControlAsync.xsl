<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="SignInControlMaster">
		<script type="text/javascript" src="/Assets/Common/Js/Profile/Profiles.js"/>
		<script type="text/javascript"><![CDATA[
			function onLoginKeyPress(event) {
				if (event.keyCode == 13) {
					SubmitLogin();
				} 

				return event.keyCode != 13;
			}
			
			function ToggleErrorMessage(inputElement, toggleOn) {
				var errorElement = $(inputElement).next('.rfvMessage');
				if(!errorElement) {
					return;
				} else {
					if(toggleOn) {
						$(errorElement).removeClassName('hidden');
					} else {
						$(errorElement).addClassName('hidden');
					}
				}
			}	

			function SubmitLogin() {
				var username = $('UserName').value;
				var password = $('Password').value;
				if(username != '' && password != '') {
					GSNServices.ProfileService.AsyncSignIn(username, password);
				} else {
					if(username == '') {
						ToggleErrorMessage('UserName',true);
					} 
					if (password == '') {
						ToggleErrorMessage('Password',true);
					}
				}
			}
			
			function clearLoginForm(fieldName) {
				$(fieldName).value = "";
			}
		]]></script>
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
		<div id="StoreHeaderLogin">
			<div id="StoreHeaderLoginLinks">
				<a class="register" href="##root##/Profile/SignUp.aspx">Register</a> |
				<a class="register" href="##root##/Profile/SignIn.aspx">Sign In Page</a> |
				<a class="recoverLink" href="##root##/Profile/RecoverUsername.aspx"><span>Forgot Username</span></a> |
				<a class="recoverLink" href="##root##/Profile/RecoverPassword.aspx"><span>Forgot Password</span></a> |
				<a class="helpLink" href="##root##/helpcenter.aspx"><span>Help</span></a>
			</div>
			<div id="StoreHeaderLoginInputs">
				<input id="UserName" type="text" name="loginHeaderUserName" value="Username or Email" onfocus="ToggleErrorMessage(this,false); clearLoginForm(this);"/>
				<span id="rfvUserName" class="rfvMessage hidden">*Required</span>
				<input id="Password" type="password" name="loginHeaderPassword" value="Password" onkeypress="onLoginKeyPress(event)" onfocus="ToggleErrorMessage(this,false); clearLoginForm(this);"/>
				<span id="rfvPassword" class="rfvMessage hidden">*Required</span>
				<a id="main-login-button" class="button" href="#" onclick="SubmitLogin()">
					<span>Sign In</span>
				</a>
			</div>
			<xsl:if test="ExpressLane/Message[IsOk = 'false'] and ExpressLane/StaticPageType/StaticPageTypeID = 16">
				<div id="CtrlDivNotRegisteredError">
					<p>
						<span>E-mail Address and/or Password is incorrect. Please try again.</span>
					</p>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template name="SignOutControl">
		<xsl:variable name="IsLoggedInFB">
			<xsl:choose>
				<xsl:when test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="StoreHeaderLogin" class="LoggedIn">
			<xsl:if test="$IsLoggedInFB = 'true'">
				<xsl:attribute name="class">LoggedIn LoggedInFB</xsl:attribute>
			</xsl:if>
			<div id="StoreHeaderLoggedIn">
				<div id="LoginGreeting">
					<span id="LoginLabelText">Welcome, </span>
					<span id="LoginAsLabel">
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
				<div id="LoginProfile">
					<a id="preferences-link" class="button" runat="server">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="$IsLoggedInFB = 'true'">/Social/FaceBookSignup.aspx</xsl:when>
								<xsl:otherwise>/Profile/SignUp.aspx</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>My Account</span>
					</a>
					<a id="signout-link" class="button" runat="server" href="javascript:void(0);">
								<xsl:attribute name="onclick">GSNServices.ProfileService.AsyncSignOut();</xsl:attribute>
						<span>Sign Out</span>
					</a>
				</div>
				<div id="loggedinLinks">
					<a id="loggedin-help-link" href="##root##/helpcenter.aspx">Help</a>
				</div>
			</div>
			<xsl:if test="$IsLoggedInFB = 'true'">
				<img id="fb-image" alt="My Profile Image">
					<xsl:attribute name="src">
						<xsl:value-of select="concat('http://graph.facebook.com/', //ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=small')"/>
					</xsl:attribute>
				</img>
			</xsl:if>
		</div>
	</xsl:template>
</xsl:stylesheet>
