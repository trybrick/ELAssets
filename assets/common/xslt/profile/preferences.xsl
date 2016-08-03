<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/JS/Profile/Profiles.js"/>
		<script type="text/javascript" src="/Assets/Common/JS/Profile/ProfileService.js"/>
		<script type="text/javascript" src="/Assets/Common/JS/Signup/SignUp.js"/>
		<script type="text/javascript" src="/Assets/Common/JS/Registration/Popup.js"/>
		<script type="text/javascript">
		// page specific initialization
		function toggleDisplay(id) {
			var container = $('socialPrefs' + id);
			var item = $('sectionForm' + id);

			//only validate visible items
			var validateItem = (item.style.display != 'none');
			if(validateItem){
				var isValid = validateStep();
				
				if(!isValid){
					return;
				}
			}
			
			if (container.hasClassName('collapsed')){
				container.removeClassName('collapsed');
				item.style.display = 'block';
			}
			else {
				container.addClassName('collapsed');
				item.style.display = 'none';
			}
		}
		
		function submitPreferences(){
			var sections = new Array();
			
			<xsl:for-each select="//SignUpV2/Pages/Page"><xsl:variable name="id" select="concat('sectionForm', position())"/>
				sections.push(<xsl:value-of select="concat('&quot;', $id, '&quot;')"/>);
			</xsl:for-each>
			
			var isValid = validateStep();
			
			if(!isValid){
				for(a=0; a &lt; sections.length; a++){
					toggleDisplay(sections[a]);
				}
			}
			
			saveSignUp();
		}
	</script>
		<div id="SignUpV2" class="addinfocontainer">
			<div id="welcome">
				<xsl:if test="//SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value">
					<img class="profile" style="height:75px;width:75px;">
						<xsl:attribute name="src">
							<xsl:value-of select="concat('http://graph.facebook.com/', //SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=large')"/>
						</xsl:attribute>
					</img>
				</xsl:if>
				<h2>
					<xsl:text>Welcome </xsl:text>
					<span class="fbname">
						<xsl:choose>
							<xsl:when test="string-length(//Consumer/FirstName) &gt; 0 and string-length(//Consumer/LastName) &gt; 0">
								<xsl:value-of select="concat(//Consumer/FirstName, ' ', //Consumer/LastName)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//Consumer/UserName"/>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</h2>
				<xsl:choose>
					<xsl:when test="//SignUp/StatusCode = '1'">
						<h3>Your preferences have been saved.</h3>
						<h4>
						</h4>
					</xsl:when>
					<xsl:when test="not(number(//SignUp/StatusCode))">
						
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
					<xsl:call-template name="PageDisplay"/>
				</xsl:for-each>
			</div>
			<div id="submit">
				<div class="cancelButton" onclick="parent.location='/';"/>
				<div class="submitButton" onclick="submitPreferences();"/>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="PageDisplay" match="Page">
		<xsl:variable name="IsOGS" select="//GenericChain/ChainSettings/Setting[SettingID = 130]/Value"/>
		<div id="{concat('socialPrefs', position())}">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() = 1">section</xsl:when>
					<xsl:otherwise>section collapsed</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<h3 id="{concat('toggleSocial', position())}" onclick="{concat('toggleDisplay(', position(), ');')}">
				<span class="socialArrow"/>
				<xsl:value-of select="Name"/>
			</h3>
			<xsl:if test="string-length(Notes) &gt; 0">
				<p class="notes">
					<xsl:value-of select="Notes"/>
				</p>
			</xsl:if>
			<div id="{concat('sectionForm', position())}">
				<xsl:if test="position() &gt; 1">
					<xsl:attribute name="style">display:none;</xsl:attribute>
				</xsl:if>
				<xsl:if test="@type = 'formvalues'">
					<xsl:call-template name="DynamicFields">
						<xsl:with-param name="name" select="Name"/>
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
						<input type="text" id="txtExternalID" title="ExternalID" name="ExternalID" onblur="javascript:validateInput(this);" value="{//SignUp/ExternalID}">
						</input>
						<p class="signUpSml" style="color:#df5741;">New Members - Please leave this field blank.</p>
						<p class="signUpSml" style="color:#4783BA;">Existing Members - Please enter the 12 digit number from the back without spaces, periods, or dashes.</p>
					</div>
					<div class="signUpCard">
						<xsl:if test="string-length(//SignUp/ExternalIDImage) &gt; 0">
							<img alt="{//SignUp/ExternalIDLabel}" src="{//SignUp/ExternalIDImage}" width="100"/>
						</xsl:if>
					</div>
					<div class="fieldValidation">
						<div id="txtExternalID_validation">
							<xsl:if test="string-length(//SignUp/ExternalIDValidationJson) &gt; 0">
								<input type="hidden" title="txtExternalID" value="{//SignUp/ExternalIDValidationJson}"/>
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
				<div class="fieldLine">
					<div class="fieldNames">
						<label>
							<xsl:value-of select="concat('Receive ', //GenericChain/ChainName, ' Emails')"/>
						</label>
					</div>
					<div class="fieldInputs">
						<xsl:for-each select="//Emails/EmailRecord[Active = 'true']">
							<div>
								<input type="checkbox">
	                                <xsl:if test="(EmailID = //SignUp/ConsumerEmailWeekDays/ConsumerEmail/Email/EmailID)">
	                                	<xsl:attribute name="checked">
	                                    	checked
	                                    </xsl:attribute>
	                                </xsl:if>
									<xsl:attribute name="name">
										<xsl:choose>
											<xsl:when test="count(DailyEmailList/DailyEmail) &gt; 1">
												<!-- There is more than 1 day per week this is assigned-->
												<xsl:value-of select="concat('emaildailyglobal', '_', EmailID)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="Type='Daily'">
														<!-- there is only 1 day a week this is assigned, set the id to that-->
														<xsl:value-of select="concat('emaildaily_', EmailID, '_', DailyEmailList/DailyEmail[1]/WeekDay/WeekDayID)"/>
													</xsl:when>
													<xsl:when test="Type='Monthly'">
														<xsl:value-of select="concat('emailmonthly_', EmailID)"/>
													</xsl:when>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</input>
								<xsl:choose>
									<xsl:when test="Type='Daily'">
										<xsl:choose>
											<xsl:when test="count(DailyEmailList/DailyEmail) &gt; 1">Daily Email</xsl:when>
											<xsl:otherwise>Weekly Email (<xsl:value-of select="DailyEmailList/DailyEmail[1]/WeekDay/Name"/>)</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat(Type, ' Email')"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:for-each>
						<xsl:if test="count(//Emails/EmailRecord[Active = 'true' and Type='Daily']) &gt; 0">
							<input type="hidden" name="UpdateEmailDaily" value="true"/>
						</xsl:if>
						<xsl:if test="count(//Emails/EmailRecord[Active = 'true' and Type='Monthly']) &gt; 0">
							<input type="hidden" name="UpdateEmailMonthly" value="true"/>
						</xsl:if>
					</div>
					<div id="privacy">
						<p class="signUpSml">
							<xsl:text>*Our </xsl:text>
							<a href="/Profile/PrivacyPolicy.aspx" target="_blank">privacy policy</a>
							<xsl:text> states, we will not share your email address with third-party marketers.</xsl:text>
						</p>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
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
	<xsl:template name="dietarypreferencesdisplay">
		<xsl:call-template name="DietaryPreferences">
		</xsl:call-template>
		<xsl:call-template name="FoodExclusions">
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="DynamicFields" match="Page">
		<xsl:param name="name"/>
		<xsl:for-each select="//SignUpV2/Pages/Page[Name = $name]/Groups/Group">
			<xsl:variable name="group" select="."/>
			<div class="signUpForm">
				<xsl:for-each select="//SignUpV2/Pages/Page[Name = $name]/DisplayFields/DisplayField[Group = $group]">
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
							<div id="{concat(InputID, '_validationMessage')}">
							</div>
						</div>
						<div class="fieldValidation">
							<div id="{concat(InputID, '_validation')}">
								<xsl:for-each select="Validators/Validator">
									<input type="hidden" title="{../../InputID}" value="{JSONObject}">
									</input>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</xsl:for-each>
	</xsl:template>
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
	<xsl:template name="inputControlValues" match="PossibleValues/Value">
		<xsl:choose>
			<xsl:when test="DisplayText = '##States##'">
				<option/>
				<xsl:for-each select="//ExpressLane/States/GenericState">
					<xsl:sort select="FullName"/>
					<option value="{Abbreviation}">
						<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
							<xsl:if test="//GenericConsumer/State = Abbreviation">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
						</xsl:if>
						<xsl:value-of select="FullName"/>
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
	<xsl:template name="DietaryPreferences">
		<div class="signUpDietary">
			<xsl:for-each select="//SignUp/DietaryPreferences/DietaryPreference">
				<xsl:call-template name="DietaryPreference"/>
			</xsl:for-each>
		</div>
	</xsl:template>
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
	</xsl:template>
</xsl:stylesheet>