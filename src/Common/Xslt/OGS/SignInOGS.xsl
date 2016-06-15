<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">
		<![CDATA[
			
			function LogIn() {
				
				if (ValidateForm()) {
					document.forms[0].submit();
				}
			}

			function ValidateForm() {
				
				var isValid = true;
				var txtUserName = $('txtUserName');
				var txtPassword = $('txtPassword');

				if (txtUserName.value == '') {
					isValid = false;
					$('rfvUserName').show();
				}
				else {
					$('rfvUserName').hide();
				}

				if (txtPassword.value == '') {
					isValid = false;
					$('rfvPassword').show();
				}
				else {
					$('rfvPassword').hide();
				}

				return isValid;
			}

		]]>
		</script>
		<div id="signinWelcomeText">
        	<h2>Register or Log In</h2>
			<ul>
				<li id="first"><em>You must be a registered user to view...</em></li>
				<li>Saved carts</li>
				<li>Previous orders</li>
				<li>"Things I Buy"</li>
			</ul>
        </div>
		<div id="SignInControl">
			<div id="register">
				<h1>New Account:</h1>
				<div>
					<xsl:variable name="SignUpLink">
						<xsl:choose>
							<xsl:when test="string-length(//Uri/Query) &gt; 0">
								<xsl:value-of select="concat('SignUp.aspx', //Uri/Query)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>SignUp.aspx</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<a href="{$SignUpLink}" class="button"><span>Register</span></a>
				</div>	
			</div>
			<div id="login">
				<div>
					<div id="CtrlDivTitle">
						<h1><span>Existing users, please Log In:</span></h1>
					</div>
					<div id="CtrlDivMyEmail">
						E-mail Address or Username:<br/>
						<input type="text" id="txtUserName" name="UserName" maxlength="100" onkeypress="if (event.keyCode == 13) LogIn(); return event.keyCode != 13;" />
						<span style="color: Red; display: none;" id="rfvUserName">required</span>
					</div>
					<div id="CtrlDivMyPassword">
						Password:<br/>
						<input type="password" id="txtPassword" name="Password" maxlength="100" onkeypress="if (event.keyCode == 13) LogIn(); return event.keyCode != 13;" />
						<span style="color: Red; display: none;" id="rfvPassword">required</span>
					</div>
					<div id="CtrlDivLinkForgotPassword">
						Forgot your Username? <a href="RecoverUsername.aspx">click here</a>
						<br/>
						Forgot your Password? <a href="RecoverPassword.aspx">click here</a>
					</div>
                    
                    <div style="width:100%; clear:both; float:left;">
                        <div style="float:left; margin-top:5px;">
                            <a href="javascript:LogIn();" class="button"><span>Log In</span></a><br/>
                        </div>
                        <div style="float:left; margin-top:5px;">
                            <a href="##root##" class="button red"><span>Cancel</span></a><br/>
                        </div>
                    </div>
                    
                    <xsl:if test="ExpressLane/Message[IsOk = 'false']">
						<div id="CtrlDivNotRegisteredError">
							<p>
								<span>Our records indicate that you have not signed up - </span>
								<a href="SignUp.aspx">Please Register</a>
							</p>
						</div>		
					</xsl:if>	
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\158\XmlData\158-PageTypeId-128-SignIn.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
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