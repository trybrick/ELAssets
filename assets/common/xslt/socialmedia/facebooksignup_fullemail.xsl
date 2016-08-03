<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="StatusCode" select="//SignUp/StatusCode"/>
		<script type="text/javascript" src="/Assets/Common/JS/Profile/Profiles.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Profile/ProfileService.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Signup/SignUp.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Registration/Popup.js"></script>
		<script type="text/javascript"><![CDATA[
		document.observe("dom:loaded", onPageLoad);
		
		// page specific initialization
		function onPageLoad() {
			var i=0;
			for (i=0;i<=3;i++)
			{
				AttachToggleListeners('toggleSocial'+i);
			}
		}
		
		function AttachToggleListeners(toggleID) {
			try {
				$(toggleID).observe('click',function(event){
					var overlay = Event.element(event).up('.section');
					var action = 'expand';
					if(overlay){
						if($(overlay).hasClassName('collapsed')){
							action = 'expand';
						}
						else {
							action = 'collapse';
						}

						ToggleOverlay(overlay,action);
					}
				});
			}

			catch(ex) {
				// exception
			}
		}


		function ToggleOverlay(element,action) {
			if(action == 'collapse') {
				$(element).addClassName('collapsed');
			}
			else if(action == 'expand') {
				$(element).removeClassName('collapsed');
			}
		}
	]]>
		</script>
		<div id="SignUpV2" class="addinfocontainer">
			<div id="socialwelcome">
				<xsl:if test="//SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value">
					<img class="profile" style="height:75px;width:75px;">
						<xsl:attribute name="src">
							<xsl:value-of select="concat('http://graph.facebook.com/', //SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=large')"/>
						</xsl:attribute>
					</img>
				</xsl:if>
				<h2>
					<xsl:text>Welcome, </xsl:text>
					<span class="fbname">
						<xsl:value-of select="concat(//Consumer/FirstName, ' ', //Consumer/LastName)"/>
						<xsl:text>!</xsl:text>
					</span>
				</h2>
				<xsl:choose>
					<xsl:when test="$StatusCode = '1'">
						<h3>Change your profile by selecting a preference below.</h3>
					</xsl:when>
					<xsl:when test="$StatusCode = '7'">
						<h3>That was easy! Thank you for joining us.</h3>
						<h4>We ask that you take one minute to fill out a few additional preferences. These extra preferences will help us personalize your experience on our site.</h4>
					</xsl:when>
					<xsl:otherwise>
						<h3>Your preferences could not be saved.</h3>
						<h4>
							<xsl:value-of select="//SignUp/ErrorMessage"/>
						</h4>
					</xsl:otherwise>
				</xsl:choose>
				<p>
					<span>
						<strong>*</strong>
						<xsl:text> fields are required.</xsl:text>
					</span>
					<br/>
					<xsl:text>Some website features that require this information may not be available until the preferences are complete.</xsl:text>
				</p>
			</div>
			<div id="formElements" class="activeStep">
				<xsl:for-each select="//SignUpV2/Pages/Page">
					<xsl:call-template name="PageDisplay">
						<xsl:with-param name="StatusCode" select="$StatusCode"/>
					</xsl:call-template>
				</xsl:for-each>
			</div>
			<div id="submit">
				<div class="cancelButton" onclick="parent.location='/';"/>
				<div class="saveButton" onclick="saveSignUp();">Save</div>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="PageDisplay" match="Page">
		<xsl:param name="StatusCode"/>
		<xsl:variable name="IsOGS" select="//GenericChain/ChainSettings/Setting[SettingID = 130]/Value"/>
		<xsl:variable name="id" select="concat('socialPrefs', position())"/>
		<div>
			<xsl:attribute name="id">
				<xsl:value-of select="$id"/>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:text>section</xsl:text>
			</xsl:attribute>
			<h3 style="cursor:pointer;" class="toggleSocial">
				<xsl:attribute name="id">
					<xsl:value-of select="concat('toggleSocial', position())"/>
				</xsl:attribute>
				<span class="socialArrow"></span>
				<xsl:value-of select="Name"/>
			</h3>
			<xsl:if test="string-length(Notes) &gt; 0">
				<p class="notes">
					<xsl:value-of select="Notes"/>
				</p>
			</xsl:if>
			<div class="secionForm">
				<xsl:attribute name="id">
					<xsl:value-of select="concat('sectionForm', position())"/>
				</xsl:attribute>
				<xsl:if test="@type = 'formvalues'">
					<xsl:call-template name="DynamicFields">
						<xsl:with-param name="name" select="Name"/>
						<xsl:with-param name="StatusCode" select="$StatusCode"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@value = 'otherRequiredInformation'">
						<xsl:call-template name="otherRequiredInformation">
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="@value = 'otherOptionalInformation'">
						<xsl:call-template name="otherOptionalInformation">
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="@value = 'dietarypreferences'">
						<xsl:call-template name="dietarypreferencesdisplay">
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="otherRequiredInformation">
		<div class="signUpForm">
			<xsl:if test="string-length(//SignUp/ExternalIDLabel)&gt;0">
				<div class="fieldLine">
					<div class="fieldNames">
						<label for="txtExternalID">
							<xsl:value-of select="concat(//SignUp/ExternalIDLabel, ':')"/>
						</label>
					</div>
					<div class="fieldInputs">
						<input type="text" id="txtExternalID" title="ExternalID" name="ExternalID">
							<xsl:attribute name="value">
								<xsl:value-of select="//SignUp/ExternalID"/>
							</xsl:attribute>
							<xsl:attribute name="onblur">javascript:validateInput(this);</xsl:attribute>
						</input>
						<p class="signUpSml" style="color:#df5741;">New Members - Please leave this field blank.</p>
						<p class="signUpSml" style="color:#4783BA;">Existing Members - Please enter the 12 digit number from the back without spaces, periods, or dashes.</p>
					</div>
					<div class="signUpCard">
						<xsl:if test="string-length(//SignUp/ExternalIDImage) &gt; 0">
							<img width="100">
								<xsl:attribute name="alt">
									<xsl:value-of select="//SignUp/ExternalIDLabel"/>
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:value-of select="//SignUp/ExternalIDImage"/>
								</xsl:attribute>
							</img>
						</xsl:if>
					</div>
					<div class="fieldValidation">
						<div>
							<xsl:attribute name="id">txtExternalID_validation</xsl:attribute>
							<xsl:if test="string-length(//SignUp/ExternalIDValidationJson) &gt; 0">
								<input type="hidden" title="txtExternalID" value="{//SignUp/ExternalIDValidationJson}"></input>
							</xsl:if>
						</div>
					</div>
				</div>
			</xsl:if>
			<div class="fieldLine">
				<!-- don't display this if there is only 1 store-->
				<xsl:if test="count(//ArrayOfGenericStore/GenericStore) &lt;= 1">
					<xsl:attribute name="style">display:none;</xsl:attribute>
				</xsl:if>
				<div class="fieldNames">
					<label>Select Your Store:</label>
				</div>
				<div class="fieldInputs">
					<select id="stores" title="primarystoreidvalue" name="primarystoreidvalue">
						<xsl:choose>
							<xsl:when test="count(//ArrayOfGenericStore/GenericStore) &gt; 1">
								<xsl:attribute name="required">required</xsl:attribute>
								<option value="">Select a Store</option>
								<xsl:for-each select="//ArrayOfGenericStore/GenericStore">
									<option value="{StoreID}">
										<xsl:if test="StoreID = //SignUp/Consumer/PrimaryStoreID">
											<xsl:attribute name="selected">selected</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="StoreName"/>
									</option>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="//ArrayOfGenericStore/GenericStore">
									<option value="{StoreID}" selected="selected">
										<xsl:value-of select="StoreName"/>
									</option>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</select>
				</div>
				<div id="stores_validation" class="fieldValidation">
				</div>
			</div>
			<xsl:if test="count(//Emails/EmailRecord[Active = 'true']/DailyEmailList/DailyEmail) &gt; 0">
				<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']/Template">
					<div class="fieldLine">
						<div class="fieldNames">
							<label>
								<xsl:text>Receive </xsl:text>
								<xsl:value-of select="//GenericChain/ChainName"/>
								<xsl:text> Emails:</xsl:text>
							</label>
						</div>
						<div class="fieldInputs">
							<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Daily']">
								<xsl:call-template name="EmailDaily"/>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']/Template">
					<div class="fieldLine">
						<div class="fieldNames">
							<label>
								<xsl:text>Receive </xsl:text>
								<xsl:value-of select="//GenericChain/ChainName"/>
								<xsl:text> Weekly Emails:</xsl:text>
							</label>
						</div>
						<div class="fieldInputs">
							<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Weekly']">
								<xsl:call-template name="EmailDaily"/>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']/Template">
					<div class="fieldLine">
						<div class="fieldNames">
							<label>
								<xsl:text>Receive </xsl:text>
								<xsl:value-of select="//GenericChain/ChainName"/>
								<xsl:text> Monthly Emails:</xsl:text>
							</label>
						</div>
						<div class="fieldInputs">
							<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='Monthly']">
								<xsl:if test="MonthlyEmailList/MonthlyEmail">
									<xsl:call-template name="EmailMonthly"/>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']/Template">
					<div class="fieldLine">
						<div class="fieldNames">
							<label>My Interests</label>
						</div>
						<div class="fieldInputs">
							<xsl:for-each select="//SignUp/Emails/EmailRecord[Active='true' and Type='AdHoc']">
								<xsl:call-template name="EmailMonthly"/>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="count(//Emails/EmailRecord[Active = 'true' and Type='Daily']) &gt; 0">
					<input type="hidden" name="UpdateEmailDaily" value="true"/>
				</xsl:if>
				<xsl:if test="count(//Emails/EmailRecord[Active = 'true' and Type='Monthly']) &gt; 0">
					<input type="hidden" name="UpdateEmailMonthly" value="true"/>
				</xsl:if>
			</xsl:if>
			<div id="privacy" class="fieldLine">
				<p class="signUpSml">
					<xsl:text>*Our </xsl:text>
					<a href="/Profile/PrivacyPolicy.aspx" target="_blank">privacy policy</a>
					<xsl:text> states, we will not share your email address with third-party marketers.</xsl:text>
				</p>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="otherOptionalInformation">
		<div id="signUpPop2" style="display:none;">
			<div class="signUpPopText">
				<span id="close">
					<a href="javascript:setVisible('signUpPop2')" style="text-decoration: none">
						<strong>Hide</strong>
					</a>
				</span>
				<p>Providing your address allows us to send you customized savings that are specific to your area.</p>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="dietarypreferencesdisplay">
		<xsl:call-template name="DietaryPreferences">
		</xsl:call-template>
		<xsl:call-template name="FoodExclusions">
		</xsl:call-template>
		<hr/>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="DynamicFields" match="Page">
		<xsl:param name="name"/>
		<xsl:param name="StatusCode"/>
		<xsl:for-each select="//SignUpV2/Pages/Page[Name = $name]/Groups/Group">
			<xsl:variable name="group" select="."/>
			<div class="signUpForm">
				<xsl:for-each select="//SignUpV2/Pages/Page[Name = $name]/DisplayFields[@statuscode = $StatusCode]/DisplayField[Group = $group]">
					<xsl:sort select="DisplayOrder" data-type="number" order="ascending"/>
					<div class="fieldLine">
						<div class="fieldNames">
							<label>
								<xsl:if test="IsRequired = 'true'">*</xsl:if>
								<xsl:value-of select="DisplayText"/>
							</label>
						</div>
						<div class="fieldInputs">
							<xsl:call-template name="inputControl">
							</xsl:call-template>
							<div>
								<xsl:attribute name="id">
									<xsl:value-of select="concat(InputID, '_validationMessage')"/>
								</xsl:attribute>
							</div>
						</div>
						<div class="fieldValidation">
							<div>
								<xsl:attribute name="id">
									<xsl:value-of select="concat(InputID, '_validation')"/>
								</xsl:attribute>

								<xsl:for-each select="Validators/Validator">
									<input type="hidden">
										<xsl:attribute name="title">
											<xsl:value-of select="../../InputID"/>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="JSONObject"/>
										</xsl:attribute>
									</input>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</xsl:for-each>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="inputControl" match="DisplayField">
		<xsl:variable name="type" select="InputType"/>

		<xsl:element name="{InputFieldType}">
			<xsl:attribute name="onblur">javascript:validateInput(this);</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select="InputID"/>
			</xsl:attribute>
			<xsl:if test="string-length(InputType)">
				<xsl:attribute name="type">
					<xsl:value-of select="InputType"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="string-length(InputTitle)">
				<xsl:attribute name="title">
					<xsl:value-of select="InputTitle"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="InputTitle"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="IsRequired = 'true'">
				<xsl:attribute name="required">required</xsl:attribute>
			</xsl:if>

			<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
				<xsl:if test="string-length(DataPath) &gt; 0">
					<xsl:variable name="NodeName" select="DataPath"/>

					<xsl:choose>
						<xsl:when test="DataSource = 'Consumer'">
							<xsl:for-each select="//SignUp/Consumer/child::*">
								<xsl:if test="$NodeName = name()">
									<xsl:attribute name="value">
										<xsl:value-of select="."/>
									</xsl:attribute>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="DataSource= 'ConsumerSetting'">
							<xsl:if test="//GenericConsumer/ConsumerSettings/Setting[Name = $NodeName]/Value">
								<xsl:choose>
									<xsl:when test="$type = 'checkbox'">
										<xsl:if test="//GenericConsumer/ConsumerSettings/Setting[Name = $NodeName]/Value = 'True'">
											<xsl:attribute name="checked">true</xsl:attribute>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="value">
											<xsl:value-of select="."/>
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
			</xsl:if>

			<xsl:if test="InputFieldType = 'select'">
				<xsl:for-each select="PossibleValues/Value">
					<xsl:call-template name="inputControlValues">
					</xsl:call-template>
				</xsl:for-each>
			</xsl:if>
		</xsl:element>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="inputControlValues" match="PossibleValues/Value">
		<xsl:choose>
			<xsl:when test="DisplayText = '##States##'">
				<option></option>
				<xsl:for-each select="//ExpressLane/States/GenericState">
					<xsl:sort select="Abbreviation"/>
					<option value="{Abbreviation}">
						<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
							<xsl:if test="//GenericConsumer/State = Abbreviation">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
						</xsl:if>

						<xsl:value-of select="Abbreviation"/>
					</option>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<option value="{DisplayValue}">
					<xsl:value-of select="DisplayText"/>
				</option>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="DietaryPreferences">
		<div class="signUpDietary">
			<xsl:for-each select="//SignUp/DietaryPreferences/DietaryPreference">
				<xsl:call-template name="DietaryPreference"/>
			</xsl:for-each>
		</div>
	</xsl:template>

	<!-- ================================================== -->

	<xsl:template name="DietaryPreference" match="DietaryPreference">
		<xsl:param name="DietaryPreferenceID" select="DietaryPreferenceID"/>
		<xsl:if test="//SignUp/DietaryPreferenceLevels/DietaryPreferenceLevel[DietaryPreference/DietaryPreferenceID=$DietaryPreferenceID]">
			<div class="DietaryPreference">
				<div class="fieldNames">
					<xsl:value-of select="Description"/>
					<xsl:text>:</xsl:text>
				</div>
				<div class="fieldInputs">
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
			</div>
		</xsl:if>
	</xsl:template>

	<!-- ================================================== -->

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

	<!-- ================================================== -->

	<xsl:template name="FoodExclusions">
		<xsl:variable name="Consumer" select="//SignUp/Consumer[IsLoggedIn = 'true']"/>
		<div class="signUpExclude">
			<div class="fieldNames">Always Exclude:</div>
			<div class="fieldInputs">
				<input type="text" id="txtAlwaysExclude" title="FoodExclusion" name="FoodExclusion">
					<xsl:if test="$Consumer">
						<xsl:attribute name="value">
							<xsl:value-of select="//SignUp/ConsumerFoodExclusion/ConsumerDietaryFoodExclusionDescription"/>
						</xsl:attribute>
					</xsl:if>
				</input>
			</div>
		</div>
		<hr/>
	</xsl:template>

	<xsl:template name="EmailDaily" match="EmailRecord">
		<xsl:param name="EmailID" select="EmailID"/>
		<xsl:if test="Template and count(//DailyEmailList/DailyEmail[EmailID = $EmailID]) &gt; 0">
			<div class="EmailOptIn">
				<span>
					<xsl:for-each select="DailyEmailList/DailyEmail">
						<xsl:sort select="WeekDay/WeekDayID" data-type="number"/>
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
				<xsl:when test="not(//SignUp/ConsumerEmailWeekDays/ConsumerEmail)">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:when>
				<xsl:when test="//Consumer/IsLoggedIn='true' and //SignUp/ConsumerEmailWeekDays/ConsumerEmail[Email/EmailID = $EmailID and WeekDay/WeekDayID= $WeekDayID]">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:when>
				<xsl:when test="//Consumer/IsLoggedIn='false' and translate(//ChainSettings/Setting[SettingID = 196]/Value, 'TRUE', 'true') = 'true'">
					<xsl:attribute name="checked">true</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:value-of select="//SignUp/WeekDays/WeekDay[WeekDayID=$WeekDayID]/WeekDayX"/>
		</input>
		<br/>
	</xsl:template>
</xsl:stylesheet>