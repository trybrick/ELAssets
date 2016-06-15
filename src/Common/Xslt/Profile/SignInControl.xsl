<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
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
		<script type="text/javascript">
			document.observer('dom:loaded',function() {
				$('Password').observe('keypress', onLoginKeyPress);
				$('login-submit').observe('click', SubmitLogin);
			});
			
			function onLoginKeyPress() {
				if (event.keyCode == 13) {
					SubmitLogin();
				} 
			
				return event.keyCode != 13;
			}
			
			function SubmitLogin() {
				var username = $('UserName').value;
				var password = $('Password').value;
				GSNServices.ProfileService.AsyncSignIn(username, password);
			}
		</script>
		<div class="LogInControl">
			<div>E-mail Address or Username:<br/>
				<input id="UserName" type="text" class="UserName" name="userName" maxlength="100" />
				<span style="display: none;" id="rfvUserName" class="rfvMessage UserName">Required</span>
			</div>
			<div>Password:<br/>
				<input id="Password" type="password" class="Password" name="password" maxlength="100" />
				<span style="display: none;" class="rfvMessage Password">Required</span>
			</div>
			<div>
				<a id="login-submit" class="button" href="#">
					<span>Login</span>
				</a>
			</div>
			<xsl:if test="ExpressLane/Message[IsOk = 'false'] and ExpressLane/StaticPageType/StaticPageTypeID = 16">
				<div id="CtrlDivNotRegisteredError">
					<p>
						<span>E-mail Address/Username<br />or Password is incorrect.<br />Please try again.</span>
					</p>
				</div>
				<div id="CtrlDivLinkForgotPassword">
					<a href="/Profile/RecoverUsername.aspx">Forgot your Username?</a>
					<br/>
					<a href="/Profile/RecoverPassword.aspx">Forgot your Password?</a>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="SignOutControl">
		<div id="LoginLabelTextDiv">signed in as:</div>
		<div id="LoginAsLabelDiv">
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
		</div>
		<div id="LoginProfileLinkDiv">
			<a id="A2" runat="server" href="/Profile/SignUp.aspx">My Preferences</a>
			<xsl:text>|</xsl:text>
			<a id="A3" runat="server" href="javascript:GSNServices.ProfileService.AsyncSignOut();">Log Out</a>
		</div>
		<div style="display:none;" id="ConsumerGuid"><xsl:value-of select="ExpressLane/GenericConsumer/ConsumerGuid" disable-output-escaping="yes"/></div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-16-SignInResponse.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->