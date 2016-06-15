<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Profile/ProfileService.js" />
		<script type="text/javascript">
			<![CDATA[

			function RunRecoverPassword() {
			
				var requestArgs = GSNContext.RequestArguments;
				var userName = $('txtUserName');

				if (userName.value == '') {
					
					userName.className = 'Invalid';
				}
				else {
					
					userName.className = '';

					RecoverPassword(document.URL, requestArgs, userName.value, HandleRecoverPasswordResponse, null);
				}
			}			

			function ResponseContent(response) {

				var responseContent = '';

				if (typeof(response.responseXML.firstChild.textContent) == 'string') {
					responseContent = response.responseXML.firstChild.textContent;
				}
				else {
					responseContent = response.responseXML.documentElement.firstChild.nodeValue;
				}

				return responseContent;
			}

			function HandleRecoverPasswordResponse(response) {

				var responseContent = ResponseContent(response);

				if (responseContent != '') {
					
					$('Response').innerHTML = responseContent;
				}
				
				if (typeof(refreshAdPods) == 'function') {
					refreshAdPods();
				}
			}
			]]>
		</script>
		<div id="SignIn">
			<div id="PasswordRecoverControl">
				<div id="CtrlDivTitle">
					<h1>
						<span>Recover Password</span>
					</h1>
				</div>
				<div>
					<span>Please enter your email address or Username:</span>
					<p><input type="text" id="txtUserName" /></p>
				</div>
				<div>
					<a class="button" href="/Profile/Signin.aspx">
						<span>Cancel</span>
					</a>
					<a class="button" href="javascript:RunRecoverPassword();">
						<span>Submit</span>
					</a>
                    <div id="Response" />
				</div>
			</div>
		</div>
	</xsl:template> 
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-183-RecoverPassword.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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