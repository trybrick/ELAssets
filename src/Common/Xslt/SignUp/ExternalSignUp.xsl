<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="xml" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<div>
			<xsl:if test="ExpressLane/FacebookSettings/IsActive = 'true'">
				<xsl:call-template name="FacebookLoginButtonApi"/>
				<script type="text/javascript">
					Event.observe(window, 'load', fbButtonClick);
				</script>
			</xsl:if>
			<div id="SignInControl" class="group">
				<div id="signinWelcomeText">
					<h2>Welcome</h2>
				</div>
				<div id="register">
					<xsl:if test="ExpressLane/FacebookSettings/IsActive = 'true'">
						<fieldset id="register-facebook">
							<div id="fb-button-wrap">
								<a id="fb-login-button" class="fb_button fb_button_medium" onclick="fbButtonClick()">
									<span class="fb_button_text">Sign Up with Facebook</span>
								</a>
							</div>
						</fieldset>
					</xsl:if>
					<fieldset id="register-local">
						<xsl:variable name="SignUpLink">
							<xsl:choose>
								<xsl:when test="string-length(//Uri/Query) &gt; 0">
									<xsl:value-of select="concat('/Profile/SignUp.aspx', //Uri/Query)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>/Profile/SignUp.aspx</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<a href="{$SignUpLink}" class="button"><span>Sign Up Here</span></a>
					</fieldset>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>