<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Profile/ProfileService.js" />
		<script type="text/javascript">
			<![CDATA[

			function RunRecoverUsername() {
			
				var requestArgs = GSNContext.RequestArguments;
				var email = $('txtEmail');

				if (email.value == '') {
					
					email.className = 'Invalid';
				}
				else {
					
					email.className = '';

					RecoverUsername(document.URL, requestArgs, email.value, HandleRecoverUsernameResponse, null);
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

			function HandleRecoverUsernameResponse(response) {

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
						<span>Recover Username</span>
					</h1>
				</div>
				<div>
					<span>Please enter your email address:</span>
					<p><input type="text" id="txtEmail" /></p>
				</div>
				<div>
					<a class="button" href="/Profile/Signin.aspx">
						<span>Cancel</span>
					</a>
					<a class="button" href="javascript:RunRecoverUsername();">
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
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\75\XmlData\75-PageTypeId-183-RecoverPassword.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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