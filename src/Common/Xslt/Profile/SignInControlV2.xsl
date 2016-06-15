<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../SignUp/SignUp.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">
			
			var isLoggedIn = <xsl:value-of select="//GenericConsumer/IsLoggedIn"/>;	
			var myPathName = window.location.pathname;
			var optionsShowing = 0;
			
			<![CDATA[
			
			
			function checkLoggedIn(){
				if (!isLoggedIn){	
					$('StoreHeaderRightTop').addClassName('RegisterLoginWindow');
					$('lightwindow_registration').removeClassName('hidden');
					checkPathName();
				}
			}
			
			function checkPathName(){
				if ((myPathName == '/Profile/RecoverPassword.aspx') || (myPathName == '/Profile/RecoverUsername.aspx') || (myPathName == '/Profile/SignUp.aspx')){
					closeLoginWindow();
				}
				else{
					openLoginWindow();
				}
			}
						
			function closeLoginWindow(){
				$('lightwindow_registration').addClassName('hidden');
				$('LoginBox').addClassName('hidden');
				$('StoreHeaderRightTop').removeClassName('RegisterLoginWindow');
				$('LoginBoxAlt').removeClassName('hidden');
			}
			
			function openLoginWindow(){
				$('lightwindow_registration').removeClassName('hidden');
				$('LoginBox').removeClassName('hidden');
				$('StoreHeaderRightTop').addClassName('RegisterLoginWindow');
				$('LoginBoxAlt').addClassName('hidden');		
			}
			
			function ToggleOptionalInfo(){
				if (optionsShowing == 0){
				$('OptionalInfo').removeClassName('hidden');
				$('OptionalButton').addClassName('OptionsShowing');
				optionsShowing = 1;
				}
				else{
				$('OptionalInfo').addClassName('hidden');
				$('OptionalButton').removeClassName('OptionsShowing');
				optionsShowing = 0;
				}
			}

			function SubmitLoginWindow(){
				var username = $('UserName').value;
				var password = $('Password').value;
				GSNServices.ProfileService.AsyncSignIn(username,password);			
			}
			
			function SubmitRegistrationWindow(){
				var hasRequiredFields = CheckRequiredFields();
				var isValid = ValidateRegistration();

				if(isValid && hasRequiredFields){		
					GSNServices.ProfileService.SavePreferencesAsync('NewUserDiv');	
				}
			}
			
			function ValidateRegistration() {
				var isValid = true;
				var isValidEmail = ValidateEmail();
				var passwordsMatch = ValidatePasswordMatch();
				
				if(isValidEmail){
					$('invalidEmail').addClassName('hidden');
				} else {
					$('invalidEmail').removeClassName('hidden');
					isValid = false;
				}

				if (passwordsMatch) {
					$('invalidPassword').addClassName('hidden');	
					$('invalidConfirmPassword').addClassName('hidden');
				} else {
					$('invalidPassword').removeClassName('hidden');	
					$('invalidConfirmPassword').removeClassName('hidden');	
					isValid = false;
				}

				return isValid;

			}

			function CheckRequiredFields(){
				var hasRequiredFields = true;
				
		        if ($('txtPassword').value == '') {
		            $('rfvPassword2').removeClassName('hidden');
					hasRequirdFields = false;
		        }
		        else {
		            $('rfvPassword2').addClassName('hidden');
		        }

				if ($('txtConfirmPassword').value == '') {
					$('rfvConfPassword').removeClassName('hidden');
					hasRequiredFields = false;
				}
				else {
					$('rfvConfPassword').addClassName('hidden');
				}

				return hasRequiredFields;
				
			}	
			
			function ValidateEmail(){
				var UserEmail = $('txtEmailAddress').value;
				var pattern = /^[\w\.\-]+@([\w\-]+\.)+[a-zA-A]+$/;
				var isValidEmail = pattern.test(UserEmail);
				return isValidEmail;
			}

			function ValidatePasswordMatch(){
				var UserPassword = $('txtPassword').value;
				var UserConfirmPassword = $('txtConfirmPassword').value;
				var isValidPassword = (UserPassword == UserConfirmPassword);
				return isValidPassword;
			}
			
			function DisplaySavePreferencesResponse(successMsg) {
				$('lightwindow_registration').addClassName('hidden');
				$('StoreHeaderRightTop').removeClassName('RegisterLoginWindow');
				$('LoginBox').innerHTML = successMsg;
				GSNServices.ProfileService.SetConsumerGuid($('ConsumerGuid'));
			}

			function DisplaySavePreferencesError(errorMsg) {
				var errorSpanOld = $('LogInResponseSpan');
				if (!errorSpanOld){
				var errorSpan = document.createElement('span');
				errorSpan.setAttribute('class','LogInResponseSpan');
				errorSpan.setAttribute('id','LogInResponseSpan');
				var errorContent = document.createTextNode(errorMsg);
				errorSpan.appendChild(errorContent);
				$('LoginBox').appendChild(errorSpan);
				}
			}	

			function SignOutAsync(){
				GSNServices.ProfileService.AsyncSignOut();
				closeLoginWindow();
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
		<xsl:call-template name="SignInControlAlt"/>
		<xsl:choose>
			<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
				<xsl:call-template name="SignOutControl"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="SignInControl"/>
			</xsl:otherwise>
		</xsl:choose>
		<script type="text/javascript"><![CDATA[
			checkLoggedIn();
				]]></script>
	</xsl:template>
	<xsl:template name="SignInControl">
		<a id="xClose" href="javascript:closeLoginWindow();"/>
		<div id="LoginBox">
			<span class="LogInHeader">SIGN IN</span>
			<p>Log in to get additional coupon savings. It&#x2019;s free and easy!</p>
			<div id="LogInControl" class="clearfix">
				<div id="ReturningUser">
					<xsl:call-template name="ReturningUser"/>
				</div>
				<div id="NewUser">
					<xsl:call-template name="NewUser"/>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="ReturningUser">
		<div id="ReturningUserDiv">
			<span class="LogInSubheader">RETURNING USERS</span>
			<label for="UserName">E-mail or Username</label>
			<input class="checkRequired" type="text" id="UserName" name="userName" maxlength="100" onkeypress="if (event.keyCode == 13) SubmitLoginWindow(); return event.keyCode != 13;" onfocus="hideErrorMessage(this)" />
			<span id="rfvUserName" class="rfvMessage hidden">Required</span>
			<label for="Password">Password</label>
			<input class="checkRequired" type="password" id="Password" name="password" maxlength="100" onkeypress="if (event.keyCode == 13) SubmitLoginWindow(); return event.keyCode != 13;" onfocus="hideErrorMessage(this)" />
			<span id="rfvPassword" class="rfvMessage hidden">Required</span>
			<div id="CtrlDivLinkForgotPassword">
				<a href="/Profile/RecoverUsername.aspx">Forgot your Username?</a>
				<a href="/Profile/RecoverPassword.aspx">Forgot your Password?</a>
			</div>
			<div class="LogInButtons">
				<a class="LoginButts" href="javascript:SubmitLoginWindow();">
					<span>SUBMIT</span>
				</a>
				<!--				<a class="LoginButts" href="javascript:closeLoginWindow();">
					<span>CANCEL</span>
				</a>-->
			</div>
			<xsl:if test="ExpressLane/Message[IsOk = 'false'] and ExpressLane/StaticPageType/StaticPageTypeID = 16">
				<div id="CtrlDivNotRegisteredError">
					<p>
						<span>E-mail Address/Username<br />or Password is incorrect.<br />Please try again.</span>
					</p>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="NewUser">
		<div id="NewUserDiv">
			<span class="LogInSubheader">NEW USERS</span>
			<div id="NewUserPanel1">
				<label for="txtEmailAddress">E-mail Address</label>
				<input id="txtEmailAddress" class="checkRequired" type="text" title="Email" name="Email" onkeypress="if (event.keyCode == 13) SubmitRegistrationWindow(); return event.keyCode != 13;" onfocus="hideErrorMessage(this)"/>
				<span id="invalidEmail" class="rfvMessage hidden">Invalid E-mail Address</span>
				<label for="txtPassword">Password</label>
				<input id="txtPassword" class="checkRequired" type="password" title="Password" name="Password" maxlength="20" onkeypress="if (event.keyCode == 13) SubmitRegistrationWindow(); return event.keyCode != 13;" onfocus="hideErrorMessage(this)"/>
				<span id="invalidPassword" class="rfvMessage hidden">Passwords Do Not Match</span>
				<span id="rfvPassword2" class="rfvMessage hidden">Required</span>
				<label for="txtConfirmPassword">Confirm Password</label>
				<input id="txtConfirmPassword" class="checkRequired" type="password" name="Password2" maxlength="20" onkeypress="if (event.keyCode == 13) SubmitRegistrationWindow(); return event.keyCode != 13;" onfocus="hideErrorMessage(this)"/>
				<span id="invalidConfirmPassword" class="rfvMessage hidden ">Passwords Do Not Match</span>
				<span id="rfvConfPassword" class="rfvMessage hidden">Required</span>
				<div id="SignupStore" class="InputControl">
					<xsl:variable name="Stores" select="//ArrayOfGenericStore/GenericStore"/>
					<xsl:if test="count($Stores) &gt; 1">
						<label for="ddlStore">Store</label>
						<select id="ddlStore" title="PrimaryStoreID" name="PrimaryStoreIDvalue">
							<option value="0" selected="true">Select a Store</option>
							<xsl:for-each select="$Stores">
								<xsl:sort select="StoreName" data-type="text"/>
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="StoreID"/>
									</xsl:attribute>
									<xsl:value-of select="StoreName"/>
								</option>
							</xsl:for-each>
						</select>
					</xsl:if>
				</div>
				<div id="WeeklyEmailSignup">
					<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']/Template">
						<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']">
							<input type="hidden" name="UpdateEmailDaily" value="true"/>
							<xsl:for-each select="DailyEmailList/DailyEmail[1]">
								<xsl:sort select="WeekDay/WeekDayID" data-type="number"/>
								<xsl:call-template name="MyDailyEmailCheckBox"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']/Template">
						<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']">
							<xsl:call-template name="MyEmailDaily"/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']/Template">
						<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']">
							<xsl:if test="MonthlyEmailList/MonthlyEmail">
								<xsl:call-template name="MyEmailMonthly"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']/Template">
						<h2>My Interests</h2>
						<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']">
							<xsl:call-template name="MyEmailMonthly"/>
						</xsl:for-each>
					</xsl:if>
				</div>
				<p>Fill out Optional Information below to receive personalized content.</p>
				<div id="OptionalButton">
					<a class="OptionalButt" href="javascript:ToggleOptionalInfo();">
						<span>OPTIONAL INFORMATION</span>
					</a>
				</div>
				<div id="OptionalInfo" class="hidden">
					<xsl:call-template name="OptionalInfo"/>
				</div>
				<div class="LogInButtons">
					<a class="LoginButts" href="javascript:SubmitRegistrationWindow();">
						<span>SUBMIT</span>
					</a>
					<!--					<a class="LoginButts" href="javascript:closeLoginWindow();">
						<span>CANCEL</span>
					</a>-->
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="MyDailyEmailCheckBox" match="DailyEmail">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:param name="WeekDayID" select="WeekDay/WeekDayID"/>
		<label><xsl:attribute name="for"><xsl:value-of select="concat('EmailDaily_', EmailID, '_', $WeekDayID)"/></xsl:attribute>
				Weekly Email
				</label>
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
			<!--			<xsl:value-of select="//SignUp/WeekDays/WeekDay[WeekDayID=$WeekDayID]/WeekDayX"/>  -->
		</input>
	</xsl:template>
	<xsl:template name="MyEmailDaily" match="EmailRecord">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:if test="Template">
			<div class="EmailOptIn">
				<input type="hidden" name="UpdateEmailDaily" value="true"/>
				<span>
					<xsl:for-each select="DailyEmailList/DailyEmail">
						<xsl:sort select="WeekDay/WeekDayID" data-type="number"/>
						<xsl:call-template name="MyDailyEmailCheckBox"/>
					</xsl:for-each>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template name="MyEmailMonthly" match="EmailRecord">
		<xsl:param name="EmailID" select="EmailID"/>
		<div class="EmailOptIn">
			<input type="hidden" name="UpdateEmailMonthly" value="true"/>
			<label><xsl:attribute name="for"><xsl:value-of select="concat('EmailMonthly_', EmailID)"/></xsl:attribute>
					Monthly Email
					</label>
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
				<!--  <xsl:value-of select="Description"/>  -->
			</input>
		</div>
	</xsl:template>
	<xsl:template name="OptionalInfo">
		<div id="NewUserPanel2">
			<span class="NewUserSubhead">Personal Profile</span>
			<div class="NewUserColumn">
				<xsl:variable name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
				<label for="txtFirstName">First Name</label>
				<input type="text" id="txtFirstName" title="FirstName" name="FirstName"/>
				<label for="txtLastName">Last Name</label>
				<input type="text" id="txtLastName" title="LastName" name="LastName"/>
				<label for="txtPrimaryAddress">Address 1</label>
				<input type="text" id="txtPrimaryAddress" title="PrimaryAddress" name="PrimaryAddress"/>
				<label for="txtSecondaryAddress">Address 2</label>
				<input type="text" id="txtSecondaryAddress" title="SecondaryAddress" name="SecondaryAddress"/>
			</div>
			<div class="NewUserColumn">
				<label for="txtCity">City</label>
				<input type="text" id="txtCity" title="City" name="City"/>
				<label for="ddlState">State</label>
				<select id="ddlState" title="State" name="Statevalue">
					<xsl:for-each select="//SignUp/States/GenericState">
						<xsl:sort select="FullName" data-type="text"/>
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="Abbreviation"/>
							</xsl:attribute>
							<xsl:if test="Abbreviation=//ExpressLane/Common/ArrayOfGenericStore/GenericStore[position()=1]//State">
								<xsl:attribute name="selected">true</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="FullName"/>
						</option>
					</xsl:for-each>
				</select>
				<label for="txtZip">Zip Code</label>
				<input type="text" id="txtZip" title="PostalCode" name="PostalCode"/>
				<label for="txtPhone">Phone</label>
				<input type="text" id="txtPhone" title="Phone" name="Phone"/>
			</div>
		</div>
		<div id="NewUserPanel3">
			<span class="NewUserSubhead">Nutritional Preferences</span>
			<div class="NewUserColumn">
				<xsl:for-each select="//SignUp/DietaryPreferences/DietaryPreference">
					<xsl:if test="position() &lt; 7">
						<xsl:call-template name="MyDietaryPreferences"/>
					</xsl:if>
				</xsl:for-each>
			</div>
			<div class="NewUserColumn">
				<xsl:for-each select="//SignUp/DietaryPreferences/DietaryPreference">
					<xsl:if test="position() &gt; 6">
						<xsl:call-template name="MyDietaryPreferences"/>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="MyDietaryPreferences" match="DietaryPreference">
		<xsl:param name="DietaryPreferenceID" select="DietaryPreferenceID"/>
		<xsl:if test="//SignUp/DietaryPreferenceLevels/DietaryPreferenceLevel[DietaryPreference/DietaryPreferenceID=$DietaryPreferenceID]">
			<div class="DietaryPreference">
				<label>
					<xsl:value-of select="Description"/>
				</label>
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
	<xsl:template name="SignInControlAlt">
		<div id="LoginBoxAlt" class="hidden">
			<p id="LoginButtonDiv">
				<a id="A4" href="javascript:openLoginWindow();" runat="server">Sign-In</a>
			</p>
			<p id="LoginNewProfileLinkDiv">
				<a id="A4" href="/Profile/SignUp.aspx" runat="server">Not a member? Click here.</a>
				<!--				<a id="A4" href="javascript:openLoginWindow();" runat="server">Not a member? Click here.</a>-->
			</p>
		</div>
	</xsl:template>
	<xsl:template name="SignOutControl">
		<div id="LoginBox">
			<div id="LoginLabelTextDiv">signed in as:</div>
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
				<xsl:text> | </xsl:text>
				<a id="A3" runat="server" href="javascript:SignOutAsync();">Log Out</a>
				<!--			<a id="A3" runat="server" href="/Profile/SignOut.aspx">Log Out</a> 	-->
			</div>
			<div style="display:none;" id="ConsumerGuid">
				<xsl:value-of select="ExpressLane/GenericConsumer/ConsumerGuid" disable-output-escaping="yes"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
<!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->