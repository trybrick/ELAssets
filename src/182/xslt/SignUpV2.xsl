<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/JS/Profile/Profiles.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Profile/ProfileService.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Signup/SignUp.js"></script>
		<script type="text/javascript" src="/Assets/Common/JS/Registration/Popup.js"></script>
		<div id="SignUpV2">
			<h2>Free Membership</h2>
			<div id="validationSummary">
			</div>
			<xsl:for-each select="//SignUpV2/Pages/Page">
				<xsl:call-template name="PageDisplay" />
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="PageDisplay" match="Page">
		<xsl:variable name="IsOGS" select="//GenericChain/ChainSettings/Setting[SettingID = 130]/Value"/>
		<div id="{Name}">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() = 1">
						<xsl:text>activeStep signUpStep</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>deactiveStep signUpStep</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<div>
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="position() = 5">
							<xsl:text>signUpSteps5</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>signUpSteps</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$IsOGS = 'True'">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="concat('/Assets/Common/Images/Registration/pReg_OGS_', Name, '.jpg')"/>
							</xsl:attribute>
						</img>
					</xsl:when>
					<xsl:otherwise>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="concat('/Assets/Common/Images/Registration/pReg_', Name, '.jpg')"/>
							</xsl:attribute>
						</img>
					</xsl:otherwise>
				</xsl:choose>
			</div>

			<div>
				<xsl:attribute name="class">
					<xsl:text>signUpDesc</xsl:text>
					<xsl:if test="position() = 3 or position() = 5">
						<xsl:text> deactiveStep</xsl:text>
					</xsl:if>
				</xsl:attribute>
				<p class="signUpSml">
					<xsl:value-of select="concat('Please enter the following ', Direction, ' information:')"/>
				</p>
				<p class="signUpWhy">
					<a href="#" target="_self">
						<xsl:attribute name="onclick">
							<xsl:value-of select="concat('setVisible(&quot;signUpPop', position(), '&quot;);')" />
						</xsl:attribute>
						<xsl:text>Why do we need this?</xsl:text>
					</a>
				</p>
			</div>
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
				<xsl:when test="@value = 'confirmdietarypreferences'">
					<xsl:call-template name="confirmdietarypreferences">
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="@value = 'dietarypreferences'">
					<xsl:call-template name="dietarypreferencesdisplay">
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="@value = 'thankyou'">
					<xsl:call-template name="thankyoudisplay">
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="otherRequiredInformation">
		<xsl:variable name="YouTechValidate" select="//GenericChain/ChainSettings/Setting[SettingID = 318][translate(Value, 'TRUE', 'true') = 'true']/Value" />
		
		<xsl:if test="string-length(//SignUp/ExternalIDLabel)&gt;0">
			<xsl:if test="$YouTechValidate">
				<script type="text/javascript" src="/Assets/Common/Js/YouTech/YouTechService.js"></script>
			</xsl:if>
			<div class="signUpForm">
				<div class="fieldNames">
					<label for="txtExternalID">
						<xsl:value-of select="concat(//SignUp/ExternalIDLabel, ':')"/>
					</label>
				</div>
				<div class="fieldInputCard">
					<input type="text" id="txtExternalID" title="ExternalID" name="ExternalID">
						<xsl:attribute name="value">
							<xsl:value-of select="//SignUp/ExternalID"/>
						</xsl:attribute>
						<xsl:attribute name="onblur">javascript:validateInput(this);</xsl:attribute>
					</input>
					
					<div id="txtExternalID_validationMessage" style="color:#E15438;"></div>
					<!-- <p class="signUpSml" style="color:#df5741;">New Members - Please leave this field blank.</p> -->
					<p class="signUpSml" style="color:#4783BA;">
						<xsl:text>Existing Members - Please enter the </xsl:text>
						<xsl:choose>
						 	<xsl:when test="string-length(//SignUpV2/RewardCardDigits) &gt; 0">
						 		<xsl:value-of select="//SignUpV2/RewardCardDigits" />
						 	</xsl:when>
						 	<xsl:otherwise>12</xsl:otherwise>
						 </xsl:choose> 
						 <xsl:text> digit number from the back without spaces, periods, or dashes.</xsl:text>
					</p>
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
						
						<!-- Default validator for max 50 char -->
						<input type="hidden" title="txtExternalID">
							<xsl:attribute name="value" >
								{type: "regex", regex: "^(.){0,50}$", validationfield: "", errormessage: "Can Not Exceed 50 Characters"}
							</xsl:attribute>
						</input>
					</div>
				</div>
			</div>
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
		</xsl:if>
		<div id="signUpPop1" style="display:none;">
			<div class="signUpPopText">
				<span id="close">
					<a href="javascript:setVisible('signUpPop1')" style="text-decoration: none">
						<strong>Hide</strong>
					</a>
				</span>
				<p>By providing us with your name, we can personalize our communication with you.</p>
			</div>
		</div>
		<div id="lower">
			<div id="signUpPhoto">
				<img src="/Assets/Common/Images/Registration/pReg_shopper.jpg" alt="Stock photo will go here"/>
			</div>
			<div id="selectStore">
				<!-- don't display this if there is only 1 store-->
				<xsl:if test="count(//ArrayOfGenericStore/GenericStore) &lt;= 1">
					<xsl:attribute name="style">display:none;</xsl:attribute>
				</xsl:if>
				<label>Select Your Store:</label>
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
				<div id="stores_validation">
				</div>
			</div>
			<xsl:if test="count(//Emails/EmailRecord[Active = 'true']/DailyEmailList/DailyEmail) &gt; 0">
				<div id="emails">
					<label>
						<xsl:text>Receive </xsl:text>
						<xsl:value-of select="//GenericChain/ChainName"/>
						<xsl:text> Emails:</xsl:text>
					</label>
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
									<xsl:value-of select="Type"/>
									<xsl:text> Email</xsl:text>
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
			</xsl:if>
			<div id="navigation">
				<div class="cancelButton" onclick="parent.location='/'"></div>
				<div class="nextButton" onclick="javascript:displayNextStep();"></div>
			</div>
			<div id="privacy">
				<p class="signUpSml">
					<xsl:text>*Our </xsl:text>
					<a href="{//SignUpV2/Links/PrivacyPolicy}" target="_blank">privacy policy</a>
					<xsl:text> states, we will not share your email address with third-party marketers.</xsl:text>
				</p>
			</div>
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
		<div id="lower">
			<div id="signUpPhoto">
				<img src="/Assets/Common/Images/Registration/pReg_shopper.jpg" alt="Grocery Shopper"/>
			</div>
		</div>
		<div id="navigation">
			<div class="backButton" onclick="javascript:displayPreviousStep();"></div>
			<div class="nextButton" onclick="javascript:displayNextStep();"></div>
		</div>
	</xsl:template>

	<xsl:template name="confirmdietarypreferences">
		<div>
			<div id="signUpPhoto">
				<img src="/Assets/Common/Images/Registration/pReg_fruit.jpg" alt="Fork w/ Fruit"/>
			</div>
			<div class="signUpText">
				<label>Would you like to create a personal dietary profile?  This allows us to customize recipes to fit your special diet.</label>
			</div>
			<div id="navigation">
				<div class="yesButton" onclick="javascript:displayNextStep();"></div>
				<div class="nothanksButton" onclick="javascript:saveSignUp();"></div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="dietarypreferencesdisplay">
		<xsl:call-template name="DietaryPreferences">
		</xsl:call-template>
		<xsl:call-template name="FoodExclusions">
		</xsl:call-template>
		<div id="signUpPop4" style="display:none;">
			<div class="signUpPopText">
				<span id="close">
					<a href="javascript:setVisible('signUpPop3')" style="text-decoration: none">
						<strong>Hide</strong>
					</a>
				</span>
				<p>Specifying your dietary information allows us to provide you with recipes customized to your specific dietary plan.</p>
			</div>
		</div>
		<div id="navigation5">
			<div class="backButton" onclick="javascript:displayPreviousStep();"></div>
			<div class="finishButton" onclick="javascript:saveSignUp();"></div>
		</div>
		<hr/>

		<xsl:call-template name="DietaryPreferenceTips">
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="thankyoudisplay">
		<div>
			<div id="signUpPhoto">
				<img src="/Assets/Common/Images/Registration/pReg_shopper2.jpg" alt="Grocery Shopper"/>
			</div>
			<div class="signUpText">
				<label>Thank you for registering.</label>
				<label>You may now use all of our features.</label>
			</div>
			<div id="navigation">
				<div class="homeButton" onclick="parent.location='/'"></div>
				<div class="profileButton" onclick="parent.location='/Profile/SignUp.aspx'"></div>
			</div>
		</div>
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
		<div class="signUpExclude">
			<span>Always Exclude:</span>
			<input type="text" id="txtAlwaysExclude" title="FoodExclusion" name="FoodExclusion">
				<xsl:if test="$Consumer">
					<xsl:attribute name="value">
						<xsl:value-of select="//SignUp/ConsumerFoodExclusion/ConsumerDietaryFoodExclusionDescription"/>
					</xsl:attribute>
				</xsl:if>
			</input>
		</div>
		<hr/>
	</xsl:template>

	<xsl:template name="DietaryPreferenceTips">
		<div id="DietaryPreferencesTip">
			<h2>Definitions</h2>
			<dl>
				<xsl:for-each select="//DietaryPreferencesList/DietaryPreference">
					<dt>
						<xsl:value-of select="concat(Preference,' - ')"/>
					</dt>
					<dd>
						<xsl:value-of select="Definition"/>
					</dd>
				</xsl:for-each>
			</dl>
		</div>
	</xsl:template>
</xsl:stylesheet>