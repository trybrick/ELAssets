<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../DietaryPreferenceTips.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
		<xsl:variable name="YouTechValidate" select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 318][translate(Value, 'TRUE', 'true') = 'true']/Value" />
		<script type="text/javascript" src="/Assets/Common/Js/Profile/ProfileService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/XMLBuilder.js"/>
		<xsl:if test="$YouTechValidate">
			<script type="text/javascript" src="/Assets/Common/Js/YouTech/YouTechService.js"></script>
		</xsl:if>
		<script type="text/javascript">
			<xsl:choose>
				<xsl:when test="$Consumer">var isNew = false;</xsl:when>
				<xsl:otherwise>var isNew = true;</xsl:otherwise>
			</xsl:choose><![CDATA[
			
			var formIsValid = false;	
			
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
					var storeid = Number($F('ddlStore'));
					
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
			} ]]>
			<xsl:if test="string-length(//SignUp/ExternalIDRegex) &gt; 0">try {
				var externalIDRegex = new RegExp('<xsl:value-of select="//SignUp/ExternalIDRegex"/>');
			} catch (e) {}</xsl:if>
		</script>
		<div class="myProfileImage"></div>
		<div id="SignUp">
			<xsl:call-template name="MainUserInfo"></xsl:call-template>

			<xsl:call-template name="EmailPreferences"></xsl:call-template>

			<xsl:call-template name="ButtonsControl"></xsl:call-template>

			<div id="DietaryPreferencesFullControl">

				<a href="javascript:;" style="text-decoration:none; cursor:pointer;">
					<h2 onclick="togglePanelOptionalInfo();">Dietary &amp; Optional Information
						<xsl:comment><![CDATA[[if lte IE 6]><span style="font-size:70%"> [click to expand/hide]</span><![endif]]]></xsl:comment>
					</h2>
				</a>
				<a href="javascript:;">
					<h1 id="toggler" class="accordionToggle" onclick="togglePanelOptionalInfo();"></h1>
				</a>If you wish to customize your sign-up profile you may fill in any or all of the
				information below. Then click the "Submit" button above.

				<div id="PanelOptionalInfo" class="accordion_content" style="display: none;">
					<xsl:call-template name="UserOptionalInfo"></xsl:call-template>

					<xsl:call-template name="DietaryPreferences"></xsl:call-template>

					<div class="InputControl">
						<xsl:call-template name="FoodExclusions"></xsl:call-template>
						<xsl:call-template name="DietaryPreferenceTips"></xsl:call-template>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="MainUserInfo">
		<xsl:variable name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
		<xsl:variable name="YouTechValidate" select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 318][translate(Value, 'TRUE', 'true') = 'true']/Value" />
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
					<span>Email Address:</span>
					<input type="text" id="txtEmailAddress" title="Email" name="Email">
						<xsl:attribute name="value">
							<xsl:value-of select="$Consumer/Email"/>
						</xsl:attribute>
					</input>&#x2020;*</div>
				<div class="InputControl" id="SignupStore">
					<span>Store:</span>
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
				<xsl:if test="string-length(//SignUp/ExternalIDLabel)&gt;0">
					<div class="InputControl">
						<xsl:if test="string-length(//SignUp/ExternalIDImage)&gt;0">
							<img>
								<xsl:attribute name="alt">
									<xsl:value-of select="//SignUp/ExternalIDLabel"/>
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:value-of select="//SignUp/ExternalIDImage"/>
								</xsl:attribute>
							</img>
						</xsl:if>
						<span>
							<xsl:value-of select="//SignUp/ExternalIDLabel"/>
						</span>
						<input type="text" id="txtExternalID" title="ExternalID" name="ExternalID">
							<xsl:attribute name="value">
								<xsl:value-of select="//SignUp/ExternalID"/>
							</xsl:attribute>
						</input>
						<xsl:if test="$YouTechValidate">
							<div class="signUpForm">
								<div id="cardValidationMessage"></div>
								<script type="text/javascript">
									youTechValidate = function() {
										var cardNumber = $('txtExternalID').value;
										var responseTarget = $('cardValidationMessage');

										GSNServices.YouTechService.ValidateCardNumber(cardNumber, responseTarget);
									};
				
									Event.observe($('txtExternalID'), 'change', youTechValidate);
								</script>
							</div>
						</xsl:if>
					</div>
				</xsl:if>
				<div id="UserNameInput" class="InputControl">
					<span>Username:</span>
					<input id="txtUserName" title="UserName" name="UserName">
						<xsl:attribute name="value">
							<xsl:value-of select="$Consumer/UserName"/>
						</xsl:attribute>
					</input>(Optional)</div>
				<xsl:if test="$Consumer">
					<div id="ChangePassword" class="InputControl">
						<a href="javascript:ChangePassword();">Click here to change password.</a>
					</div>
				</xsl:if>
				<div id="PasswordPanel">
					<xsl:if test="$Consumer">
						<xsl:attribute name="style">display:none;</xsl:attribute>
					</xsl:if>
					<div class="InputControl">
						<span>Password:</span>
						<input type="password" id="txtPassword" title="Password" name="Password" maxlength="20"/>
					</div>
					<div class="InputControl">
						<span>Confirm Password:</span>
						<input type="password" id="txtConfirmPassword" name="Password2" maxlength="20"/>
					</div>
				</div>
			</div>
			<div id="PrivacyDisclaimer">&#x2020; Per our
				<a href="/Profile/PrivacyPolicy.aspx">privacy policy</a>, we will not share your email address with third-party marketers.
				<br/>
				<br/>* Required field</div>
		</div>
	</xsl:template>

	<xsl:template name="UserOptionalInfo">
		<xsl:variable name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
		<div class="InputControl">
			<span>First Name:</span>
			<input type="text" id="txtFirstName" title="FirstName" name="FirstName">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/FirstName"/>
				</xsl:attribute>
			</input>
		</div>
		<div class="InputControl">
			<span>Last Name:</span>
			<input type="text" id="txtLastName" title="LastName" name="LastName">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/LastName"/>
				</xsl:attribute>
			</input>
		</div>
		<div class="InputControl">
			<span>Address 1:</span>
			<input type="text" id="txtPrimaryAddress" title="PrimaryAddress" name="PrimaryAddress">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/PrimaryAddress"/>
				</xsl:attribute>
			</input>
		</div>
		<div class="InputControl">
			<span>Address 2:</span>
			<input type="text" id="txtSecondaryAddress" title="SecondaryAddress" name="SecondaryAddress">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/SecondaryAddress"/>
				</xsl:attribute>
			</input>
		</div>
		<div class="InputControl">
			<span>City:</span>
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
			<span>Zip Code:</span>
			<input type="text" id="txtZip" title="PostalCode" name="PostalCode">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/PostalCode"/>
				</xsl:attribute>
			</input>
		</div>
		<div class="InputControl">
			<span>Phone Number:</span>
			<input type="text" id="txtPhone" title="Phone" name="Phone">
				<xsl:attribute name="value">
					<xsl:value-of select="$Consumer/Phone"/>
				</xsl:attribute>
			</input>
		</div>
	</xsl:template>

	<xsl:template name="EmailPreferences">
		<div id="EmailPreferences">
			<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']/Template">
				<h2>Daily Emails</h2>
				<div class="EmailOptIn">
					<span class="subtitle">
						<xsl:choose>
							<xsl:when test="string-length(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 245]/Value) &gt; 0">
								<xsl:value-of select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 245]/Value" disable-output-escaping="yes" />
							</xsl:when>
							<xsl:otherwise>Receive <xsl:value-of select="//GenericChain/ChainName"/> Email News on the following days:</xsl:otherwise>
						</xsl:choose>
					</span>
					<br/>
				</div>
				<input type="hidden" name="UpdateEmailDaily" value="true" />
				<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']">
					<xsl:call-template name="EmailDaily"/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']/Template">
				<h2>Weekly Emails</h2>
				<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']">
					<xsl:call-template name="EmailDaily"/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']/Template">
				<input type="hidden" name="UpdateEmailMonthly" value="true" />
				<h2>Monthly Emails</h2>
				<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']">
					<xsl:if test="MonthlyEmailList/MonthlyEmail">
						<xsl:call-template name="EmailMonthly"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']/Template">
				<h2>My Interests</h2>
				<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']">
					<xsl:call-template name="EmailMonthly"/>
				</xsl:for-each>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template name="ButtonsControl">
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
	</xsl:template>

	<xsl:template name="EmailDaily" match="EmailRecord">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:if test="Template and count(//DailyEmailList/DailyEmail[EmailID = $EmailID]) &gt; 0">
			<div class="EmailOptIn">
				<span>
					<xsl:for-each select="DailyEmailList/DailyEmail">
						<xsl:sort select="WeekDay/WeekDayID" data-type="number" />
						<xsl:call-template name="DailyEmailCheckBox"/>
					</xsl:for-each>
				</span>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template name="EmailMonthly" match="EmailRecord">
		<xsl:param name="EmailID" select="EmailID"/>
		<div class="EmailOptIn">
			<input type="checkbox">
				<xsl:attribute name="title">
					<xsl:value-of select="concat('EmailMonthly_', EmailID)"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="concat('EmailMonthly_', EmailID)"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="//Consumer/IsLoggedIn='true' and //SignUp/ConsumerEmailWeekDays/ConsumerEmail[Email/EmailID=$EmailID]">
						<xsl:attribute name="checked">true</xsl:attribute>
					</xsl:when>
					<xsl:when test="//Consumer/IsLoggedIn='false' and translate(//ChainSettings/Setting[SettingID = 196]/Value, 'TRUE', 'true') = 'true'">
						<xsl:attribute name="checked">true</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<xsl:value-of select="Description"/>
			</input>
		</div>
	</xsl:template>

	<xsl:template name="DailyEmailCheckBox" match="DailyEmail">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:param name="WeekDayID" select="WeekDay/WeekDayID"/>
		<input type="checkbox">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('EmailDaily_', EmailID, '_', $WeekDayID)"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('EmailDaily_', EmailID, '_', $WeekDayID)"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="//Consumer/IsLoggedIn='true' and //SignUp/ConsumerEmailWeekDays/ConsumerEmail[Email/EmailID = $EmailID and WeekDay/WeekDayID= $WeekDayID]">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:when>
				<xsl:when test="//Consumer/IsLoggedIn='false' and translate(//ChainSettings/Setting[SettingID = 196]/Value, 'TRUE', 'true') = 'true'">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:value-of select="//SignUp/WeekDays/WeekDay[WeekDayID=$WeekDayID]/WeekDayX"/>
		</input>
	</xsl:template>
	<xsl:template name="DietaryPreferences">
		<h3>My Dietary Preferences</h3>
		<xsl:for-each select="//SignUp/DietaryPreferences/DietaryPreference">
			<xsl:call-template name="DietaryPreference"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="DietaryPreference" match="DietaryPreference">
		<xsl:param name="DietaryPreferenceID" select="DietaryPreferenceID"/>
		<xsl:if test="//SignUp/DietaryPreferenceLevels/DietaryPreferenceLevel[DietaryPreference/DietaryPreferenceID=$DietaryPreferenceID]">
			<div class="DietaryPreference">
				<span>
					<xsl:value-of select="Description"/>:</span>
				<select>
					<xsl:attribute name="id">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID)"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID, '_')"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('DietaryPreference_', DietaryPreferenceID, '_value')"/>
					</xsl:attribute>
					<xsl:for-each select="//SignUp/DietaryPreferenceLevels/DietaryPreferenceLevel[DietaryPreference/DietaryPreferenceID = $DietaryPreferenceID]">
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
			<xsl:if test="//Consumer/IsLoggedIn='true' and //SignUp/ConsumerDietaryPreferences/ConsumerDietaryPreferenceLevel[DietaryPreferenceLevel/DietaryPreferenceLevelID=$DietaryPreferenceLevelID]">
				<xsl:attribute name="selected">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="Description"/>
		</option>
	</xsl:template>

	<xsl:template name="FoodExclusions">
		<xsl:variable name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
		<span>Always Exclude</span>
		<input type="text" id="txtAlwaysExclude" title="FoodExclusion" name="FoodExclusion">
			<xsl:if test="$Consumer">
				<xsl:attribute name="value">
					<xsl:value-of select="//SignUp/ConsumerFoodExclusion/ConsumerDietaryFoodExclusionDescription"/>
				</xsl:attribute>
			</xsl:if>
		</input>
	</xsl:template>

	<xsl:template name="DietaryPreferenceTips">
		<div id="DietaryPreferencesTip">
			<h2>Definitions</h2>
			<dl>
			<xsl:for-each select="ExpressLane/DietaryPreferencesList/DietaryPreference">
					<dt>
						<xsl:value-of select="Preference"/>
					</dt>
					<dd><xsl:value-of select="Definition"/></dd>
			</xsl:for-each>
			</dl>
		</div>
	</xsl:template>
</xsl:stylesheet>