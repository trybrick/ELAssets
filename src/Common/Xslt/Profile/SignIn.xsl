<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
    	<script type="text/javascript" src="/Assets/Common/Js/Profile/SignIn.js"></script>
		<script type="text/javascript">
			document.observe('dom:loaded',function(){
				$('txtUserName').observe('focus',hideError);
				$('txtPassword').observe('focus',hideError);
			});
		</script>
		<div id="SignInControl" class="group">
			<div id="signinWelcomeText">
        		<h2>Please Register or Sign In</h2>
       	</div>
			<xsl:if test="ExpressLane/Message[IsOk = 'true']">
				<div id="signin-message">
					<xsl:value-of select="ExpressLane/Message[IsOk = 'true']/Text" disable-output-escaping="yes" />
				</div>
			</xsl:if>
			<div id="register">
				<h1>New Account:</h1>
				<xsl:variable name="SignUpLink">
					<xsl:choose>
						<xsl:when test="string-length(//Uri/Query) &gt; 0">
							<xsl:value-of select="concat('SignUp.aspx', //Uri/Query)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>/Profile/SignUp.aspx</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<a href="{$SignUpLink}" class="button"><span>Register</span></a>
			</div>
			<div id="login">
				<h1><span>Existing Account:</span></h1>
				<fieldset id="signin-email">
					<label for="txtUserName">E-mail Address or Username:</label>
					<input type="text" id="txtUserName" name="UserName" maxlength="100" tabindex="1" onkeypress="if (event.keyCode == 13) LogIn(); return event.keyCode != 13;" />
					<a class="username forgot-link" title="Retrieve username" href="RecoverUsername.aspx" tabindex="3">Forgot?</a>
					<span style="display: none;" id="rfvUserName" class="rfvMessage">Required</span>
				</fieldset>
				<fieldset id="signin-password">
					<label for="txtPassword">Password:</label>
					<input type="password" id="txtPassword" name="Password" maxlength="100" tabindex="2" onkeypress="if (event.keyCode == 13) LogIn(); return event.keyCode != 13;" />
					<a class="password forgot-link" href="RecoverPassword.aspx" tabindex="4">Forgot?</a>
					<span style="display: none;" id="rfvPassword" class="rfvMessage">Required</span>
				</fieldset>
	      	<div id="login-button-wrap" class="group">
				<a id="login-button" href="javascript:LogIn();" class="button"><span>Sign In</span></a>
				<a href="/" class="button"><span>Cancel</span></a>
	         </div>
				<xsl:if test="ExpressLane/Message[IsOk = 'false']">
					<div id="CtrlDivNotRegisteredError">
						<p>
							<span>E-mail Address/Username<br />or Password is incorrect.<br />Please try again.</span>
						</p>
					</div>		
				</xsl:if>	
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
