<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../SignUp/SignUp.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript"><![CDATA[
			document.observe('dom:loaded',function(){
				$('Password').observe('keypress', onLoginKeyPress);
				$('login-submit').observe('click', SubmitLogin);
			});
			
			function onLoginKeyPress(event) {
				if (event.keyCode == 13) {
					SubmitLogin();
				} 

				return event.keyCode != 13;
			}

			function SubmitLogin() {
				var hasRequiredFields = CheckRequiredFields();
				var username = $('UserName').value;
				var password = $('Password').value;
				if(hasRequiredFields){		
				GSNServices.ProfileService.AsyncSignIn(username, password);
				}
			}
			
			function CheckRequiredFields(){
				var hasRequiredFields = true;
				
		        if ($('UserName').value == '') {
		            $('rfvUserName').removeClassName('hidden');
					hasRequirdFields = false;
		        }
		        else {
		            $('rfvUserName').addClassName('hidden');
		        }

				if ($('Password').value == '') {
					$('rfvPassword').removeClassName('hidden');
					hasRequiredFields = false;
				}
				else {
					$('rfvPassword').addClassName('hidden');
				}

				return hasRequiredFields;
				
			}	
			
			function hideErrorMessage(inputElem) {
				var errorElement = inputElem.nextSibling;
				var classAttr = '';
				var pattern = /\brfvMessage\b/;
				while(errorElement.nodeName.toLowerCase() == 'span'){
					classAttr = errorElement.getAttribute("class");
					if(classAttr == null) {
						classAttr = errorElement.className;
					}
					if(pattern.test(classAttr)){
						errorElement.addClassName('hidden');
					}

					errorElement = errorElement.nextSibling;
				}
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
		<div id="LoginBox">
			<div id="LogInControl" class="clearfix">
				<div id="ReturningUser">
					<label for="UserName">E-mail or Username:
					<span id="rfvUserName" class="rfvMessage hidden">Required</span></label>
					<input class="checkRequired" type="text" id="UserName" name="loginHeaderUserName" maxlength="100" onfocus="hideErrorMessage(this)"/>
					<label for="Password">Password:
					<span id="rfvPassword" class="rfvMessage hidden">Required</span></label>
					<input class="checkRequired" type="password" id="Password" name="loginHeaderPassword" maxlength="100" onfocus="hideErrorMessage(this)"/>
					<a id="login-submit" class="button" href="#">
						<span>Login</span>
					</a>
					<xsl:if test="ExpressLane/Message[IsOk = 'false'] and ExpressLane/StaticPageType/StaticPageTypeID = 16">
						<div id="CtrlDivNotRegisteredError">
							<p>
								<span>E-mail Address/Username<br/>or Password is incorrect.<br/>Please try again.</span>
							</p>
						</div>
					</xsl:if>
				</div>
				<div id="NewUser">
					<a href="/Profile/SignUp.aspx">Not a member? Click Here</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="SignOutControl">
		<div id="LoginBox">
			<div id="LoginLabelTextDiv">Signed in as:</div>
			<div id="LoginAsLabelDiv">
				<xsl:choose>
					<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))"><xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
					<xsl:when test="//GenericConsumer/UserName = not('')">
						<xsl:value-of select="//GenericConsumer/UserName"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="//GenericConsumer/Email"/>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div id="LoginProfileLinkDiv">
				<a id="A2" runat="server" href="/Profile/SignUp.aspx">My Preferences</a>
				<a id="A3" runat="server" href="javascript:GSNServices.ProfileService.AsyncSignOut();">Log Out</a>
			</div>
			<div style="display:none;" id="ConsumerGuid">
				<xsl:value-of select="ExpressLane/GenericConsumer/ConsumerGuid" disable-output-escaping="yes"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
