<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="Consumer" select="ExpressLane/GenericConsumer[IsLoggedIn='true']"/>
		<script type="text/javascript" src="/Assets/Common/Js/Profile/ProfileService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/XMLBuilder.js"/>
		<script type="text/javascript"><![CDATA[
			
			var formIsValid = false;	
			var isNew = true;		


			function SubmitPreferences() {

				var requestArgs = GSNContext.RequestArguments;
				var xml = BuildXML(document.forms[0].elements);

				formIsValid = ValidateForm();

				if (formIsValid) {
					//SavePreferences(document.URL, requestArgs, xml, HandleSavePreferencesSuccess, HandleSavePreferencesFailure);

					document.forms[0].submit();
				}
			}

			function HandleSavePreferencesSuccess(result) {
				
				var responseContent = ResponseContent(result);

				if (responseContent.indexOf('Error~') == 0) {

					var message 
					alert(responseContent);
				}
				else {
					
					var requestArgs = responseContent;
					var redirect = 'SignUpThankYou.aspx?request=' + encodeURIComponent(requestArgs);

					if (isNew) {
						redirect += '&mode=addconsumer';
					}

					document.location = redirect;
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

			function HandleSavePreferencesFailure() {

				alert('The system could not save you preferences at this time, please try again later.');
			}

			function ResetPage() {

				for (i = 0; i < document.forms[0].elements.length; i++) {
					
					var element = document.forms[0].elements[i];

					if (element.tagName == 'SELECT') {
						
						element.selectedIndex = 0;
					}
					else if (element.tagName == 'INPUT') {
						
						if (element.type == 'text' || element.type == 'password') {
							element.value = '';
						}
						else if (element.type == 'checkbox') {
							element.checked = false;
						}
					}
				}	
			}
			
			function CancelPage() {
	
				document.location = document.referrer;
			}

			function ValidateForm() {

				var isValid = true;
				var emailAddress = $('txtEmailAddress');

				if (typeof(emailAddress) == 'object') {
					
					var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");

					var emailIsValid = emailValidator.test(emailAddress.value);

					if (!emailIsValid) {

						emailAddress.className = 'Invalid';

						alert('Please enter a valid email address.');
					}
					else {
						emailAddress.className = '';
					}

					isValid = isValid && emailIsValid;
				}

				var passwordPanel = $('PasswordPanel');

				if (typeof(passwordPanel) == 'object' && passwordPanel.visible()) {
					var password = $('txtPassword');
					var password2 = $('txtConfirmPassword');

					if (typeof(password) == 'object' && typeof(password2) == 'object') {

						var passwordValidator = new RegExp('^.{6,20}$');

						var passwordIsValid = passwordValidator.test(password.value);

						if (!passwordIsValid) {
							password.className = 'Invalid';

							alert('Your password must be at least six characters long.');
						}
						else {
							password.className = '';
						}

						isValid = isValid && passwordIsValid;

						var passwordMatches = password.value == password2.value;

						if (!passwordMatches) {
							password2.className = 'Invalid';

							alert("Passwords do not match.  Please re-enter to confirm your password.");
						}
						else {
							password2.className = '';
						}

						isValid = isValid && passwordMatches;
					}
				}

				var txtExternalID = $('txtExternalID');

				if (typeof(externalIDRegex) == 'object' && typeof(txtExternalID) == 'object') {
				
					if (typeof(txtExternalID.value) == 'string' && txtExternalID.value != '') {
						
						var externalIDIsValid = externalIDRegex.test(txtExternalID.value);

						if (!externalIDIsValid) {

							txtExternalID.className = 'Invalid';
						}
						else {
							txtExternalID.className = '';
						}

						isValid = isValid && externalIDIsValid;
					}
				}
				
				//we need to require a store selection of the user is signing up for email
				var emailPreferences = $$('div#EmailPreferences input[type="checkbox"]').reject(function (el) {return !(el.checked)});
				
				if(typeof(emailPreferences) == 'object' && emailPreferences.length > 0){
					var storevalue = $F('ddlStore');
					var storeid = Number(storevalue);
					
					var storeIsValid = storeid > 0;					

					if(!storeIsValid){
						$('ddlStore').className = 'Invalid';
					}else{
						$('ddlStore').className = '';
					}

					isValid = isValid && storeIsValid;
				}

				return isValid;
			}

			function ChangePassword() {

				var passwordPanel = $('PasswordPanel');

				if (typeof(passwordPanel) == 'object') {

					passwordPanel.show();
				}

				var changePassword = $('ChangePassword');

				if (typeof(changePassword) == 'object') {

					changePassword.hide();
				}
			}
			
			  function togglePanelOptionalInfo(){
				Element.toggleClassName('toggler', 'accordionActive');
			    Effect.toggle('PanelOptionalInfo','blind', {duration: 1.0});
			}
			
			
			
			
		]]>


			<xsl:if test="$Consumer">isNew = false;</xsl:if>
			<xsl:if test="string-length(ExpressLane/SignUp/ExternalIDRegex) &gt; 0">try {
				var externalIDRegex = new RegExp('<xsl:value-of select="ExpressLane/SignUp/ExternalIDRegex"/>');
			} catch (e) {}</xsl:if>
		</script>
		<div class="myProfileImage"></div>
		<div id="SignUp">
			<div id="CtrlDivTitle">
				<h2>
					<xsl:choose>
						<xsl:when test="$Consumer">View/Modify Account</xsl:when>
						<xsl:otherwise>Quick Sign-up</xsl:otherwise>
					</xsl:choose>
				</h2>
			</div>
			<xsl:if test="ExpressLane/SignUp/ErrorMessage != ''">
				<div class="Invalid">
					<xsl:value-of select="ExpressLane/SignUp/ErrorMessage" />
				</div>
			</xsl:if>
			<div id="SignUpPersonalInfo">
				<div id="SignUpNameAddressInfo">
					<div class="InputControl">
						<span>Email Address</span>
						<input type="text" id="txtEmailAddress" title="Email" name="Email">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Email"/>
							</xsl:attribute>
						</input>(Required) †</div>
					<div class="InputControl" id="SignupStore">
						<span>Store</span>
						<xsl:variable name="Stores" select="//ArrayOfGenericStore/GenericStore"/>
						<select id="ddlStore" title="PrimaryStoreID" name="PrimaryStoreIDvalue">
							<xsl:choose>
								<xsl:when test="count($Stores) &gt; 1">
									<option>
										<xsl:attribute name="value">
											<xsl:text> </xsl:text>
										</xsl:attribute>Select a Store</option>
									<xsl:for-each select="$Stores">
										<xsl:sort select="StoreName" data-type="text"/>
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="StoreID"/>
											</xsl:attribute>
											<xsl:if test="StoreID=$Consumer/PrimaryStoreID">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="StoreName"/>
										</option>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="Store" select="$Stores[1]"/>
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="$Store/StoreID"/>
										</xsl:attribute>
										<xsl:if test="$Store/StoreID=$Consumer/PrimaryStoreID">
											<xsl:attribute name="selected">true</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="$Store/StoreName"/>
									</option>
								</xsl:otherwise>
							</xsl:choose>
						</select>
					</div>
					<xsl:if test="string-length(ExpressLane/SignUp/ExternalIDLabel)&gt;0">
						<div class="InputControl">
							<xsl:if test="string-length(ExpressLane/SignUp/ExternalIDImage)&gt;0">
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="ExpressLane/SignUp/ExternalIDLabel"/>
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="ExpressLane/SignUp/ExternalIDImage"/>
									</xsl:attribute>
								</img>
							</xsl:if>
							<span>
								<xsl:value-of select="ExpressLane/SignUp/ExternalIDLabel"/>
							</span>
							<input type="text" id="txtExternalID" title="ExternalID" name="ExternalID">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/SignUp/ExternalID"/>
								</xsl:attribute>
							</input>
						</div>
					</xsl:if>
					<div id="UserNameInput" class="InputControl">
						<span>User Name</span>
						<input id="txtUserName" title="UserName" name="UserName">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/UserName"/>
							</xsl:attribute>
						</input>(Optional)</div>
					<!-- <xsl:if test="$Consumer">
						<div id="ChangePassword" class="InputControl">
							<a href="javascript:ChangePassword();">Click here to update profile information.</a>
						</div>
					</xsl:if> -->
					<div id="PasswordPanel">
						<!-- <xsl:if test="$Consumer">
							<xsl:attribute name="style">display:none;</xsl:attribute>
						</xsl:if> -->
						<div class="InputControl">
							<span>Password</span>
							<input type="password" id="txtPassword" title="Password" name="Password" maxlength="20"/>
						</div>
						<div class="InputControl">
							<span>Confirm Password</span>
							<input type="password" id="txtConfirmPassword" name="Password2" maxlength="20"/>
						</div>
						<xsl:if test="ExpressLane/SignUp/Emails/Email[IsDaily='true' and IsActive='true']/EmailDailyCollection/EmailDaily">
							<h2>Email Sign-Up</h2>
							<xsl:for-each select="ExpressLane/SignUp/Emails/Email[IsDaily='true' and IsActive='true']">
								<xsl:call-template name="EmailDaily"/>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ExpressLane/SignUp/Emails/Email[IsWeekly='true' and IsActive='true']/EmailDailyCollection/EmailDaily">
							<h2>Email Sign-Up</h2>
							<xsl:for-each select="ExpressLane/SignUp/Emails/Email[IsWeekly='true' and IsActive='true']">
								<xsl:call-template name="EmailDaily"/>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ExpressLane/SignUp/Emails/Email[IsMonthly='true' and IsActive='true']/EmailMonthlyCollection/EmailMonthly">
							<h2>Email Sign-Up</h2>
							<xsl:for-each select="ExpressLane/SignUp/Emails/Email[IsMonthly='true' and IsActive='true']">
								<xsl:if test="EmailMonthlyCollection/EmailMonthly">
									<xsl:call-template name="EmailMonthly"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ExpressLane/SignUp/Emails/Email[IsActive='true' and IsAdHoc='true']/EmailAdHocCollection/EmailAdHoc">
							<h2>My Interests</h2>
							<xsl:for-each select="ExpressLane/SignUp/Emails/Email[IsActive='true' and IsAdHoc='true']">
								<xsl:call-template name="EmailMonthly"/>
							</xsl:for-each>
						</xsl:if>
						<div class="InputControl">
							<span>First Name</span>
							<input type="text" id="txtFirstName" title="FirstName" name="FirstName">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/FirstName"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="InputControl">
							<span>Last Name</span>
							<input type="text" id="txtLastName" title="LastName" name="LastName">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/LastName"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="InputControl">
							<span>Address 1</span>
							<input type="text" id="txtPrimaryAddress" title="PrimaryAddress" name="PrimaryAddress">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/PrimaryAddress"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="InputControl">
							<span>Address 2</span>
							<input type="text" id="txtSecondaryAddress" title="SecondaryAddress" name="SecondaryAddress">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/SecondaryAddress"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="InputControl">
							<span>City</span>
							<input type="text" id="txtCity" title="City" name="City">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/City"/>
								</xsl:attribute>
							</input>
						</div>
						<xsl:if test="//SignUp/States/GenericState/Abbreviation">
			<div class="InputControl">
				<span>State:</span>
				<select id="ddlState" title="State" name="Statevalue">
					<xsl:for-each select="//SignUp/States/GenericState">
						<xsl:sort select="FullName" data-type="text"/>
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="Abbreviation"/>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$Consumer">
									<xsl:if test="Abbreviation=$Consumer/State">
										<xsl:attribute name="selected">true</xsl:attribute>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="Abbreviation=//ExpressLane/Common/ArrayOfGenericStore/GenericStore[position()=1]//State">
										<xsl:attribute name="selected">true</xsl:attribute>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="FullName"/>
						</option>
					</xsl:for-each>
				</select>
			</div>
		</xsl:if>
						<div class="InputControl">
							<span>Zip Code</span>
							<input type="text" id="txtZip" title="PostalCode" name="PostalCode">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/PostalCode"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="InputControl">
							<span>Phone</span>
							<input type="text" id="txtPhone" title="Phone" name="Phone">
								<xsl:attribute name="value">
									<xsl:value-of select="$Consumer/Phone"/>
								</xsl:attribute>
							</input>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="PrivacyDisclaimer">† Per our
			<a href="##root##/Profile/PrivacyPolicy.aspx">privacy policy</a>, we will not share your email address with third-party marketers.</div>
		<div id="PrivacyDisclaimer">
			<div class="Buttons">
				<a class="button submit" href="javascript:SubmitPreferences();">
					<span>Submit</span>
				</a>
				<a class="button reset" href="javascript:ResetPage();">
					<span>Reset</span>
				</a>
				<a class="button cancel" href="javascript:CancelPage();">
					<span>Cancel</span>
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="EmailDaily" match="Email">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:if test="EmailDailyCollection/EmailDaily">
			<div class="EmailOptIn">
				<input type="hidden" name="UpdateEmailDaily" value="true" />
				<span class="subtitle">
					<xsl:value-of select="//ExpressLane/Common/Chain/ChainName"/>Email News
					<!-- <xsl:value-of select="EmailDescription" /> -->
				</span>
				<br/>
				<span>
					<xsl:for-each select="EmailDailyCollection/EmailDaily">
						<xsl:call-template name="DailyEmailCheckBox"/>
					</xsl:for-each>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template name="EmailMonthly" match="Email">
		<xsl:param name="EmailID" select="EmailID"/>
		<div class="EmailOptIn">
			<input type="hidden" name="UpdateEmailMonthly" value="true" />
			<input type="checkbox">
				<xsl:attribute name="title">
					<xsl:value-of select="concat('EmailMonthly_', EmailID)"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="concat('EmailMonthly_', EmailID)"/>
				</xsl:attribute>
				<xsl:if test="//Consumer/IsLoggedIn='true' and //ExpressLane/SignUp/ConsumerEmailWeekDays/ConsumerEmailWeekDay[EmailID=$EmailID]">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="EmailDescription"/>
			</input>
		</div>
	</xsl:template>
	<xsl:template name="DailyEmailCheckBox" match="EmailDaily">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:param name="WeekDayID" select="WeekDayID"/>
		<input type="checkbox">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('EmailDaily_', EmailID, '_', $WeekDayID)"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('EmailDaily_', EmailID, '_', $WeekDayID)"/>
			</xsl:attribute>
			<xsl:if test="//Consumer/IsLoggedIn='true' and //ExpressLane/SignUp/ConsumerEmailWeekDays/ConsumerEmailWeekDay[EmailID=$EmailID and WeekDayID=$WeekDayID]">
				<xsl:attribute name="checked">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="//ExpressLane/SignUp/WeekDays/WeekDay[WeekDayID=$WeekDayID]/WeekDayAbbrev"/>
		</input>
	</xsl:template>
	<xsl:template name="DietaryPreference" match="DietaryPreference">
		<xsl:param name="DietaryPreferenceID" select="DietaryPreferenceID"/>
		<xsl:if test="//ExpressLane/SignUp/DietaryPreferenceLevels/DietaryPreferenceLevel[DietaryPreferenceID=$DietaryPreferenceID]">
			<div class="DietaryPreference">
				<span>
					<xsl:value-of select="DietaryPreferenceDescription"/>
				</span>
				<select>
					<xsl:attribute name="id">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID)"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID, '_')"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID, '_')"/>
					</xsl:attribute>
					<xsl:for-each select="//DietaryPreferenceLevel[DietaryPreferenceID=$DietaryPreferenceID]">
						<xsl:sort select="DisplayOrder" data-type="number"/>
						<xsl:call-template name="DietaryPreferencesListItem"/>
					</xsl:for-each>
				</select>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DietaryPreferencesListItem" match="DietaryPreferenceLevel">
		<xsl:param name="DietaryPreferenceLevelID" select="DietaryPreferenceLevelID"/>
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="DietaryPreferenceLevelID"/>
			</xsl:attribute>
			<xsl:if test="//Consumer/IsLoggedIn='true' and //ConsumerDietaryPreferenceLevel[DietaryPreferenceLevelID=$DietaryPreferenceLevelID]">
				<xsl:attribute name="selected">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="DietaryPreferenceLevelDescription"/>
		</option>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-114-SignUp.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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