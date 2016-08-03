<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:param name="Consumer" select="ExpressLane/GenericConsumer[IsLoggedIn='true']"/>
		<script type="text/javascript"><![CDATA[
			
			function SubmitForm() {

				var isValid = ValidateEmail();
				
				//Validate Text Area
				//Validate Text Area
				var txtTextAreaInvalid, spamInvalid = false;
				txtTextAreaInvalid = TextAreaValidation("txtWeAreLucky");
				spamInvalid = SpamValidation("txtWeAreLucky");
				if(!txtTextAreaInvalid || !spamInvalid) {
					txtTextAreaInvalid = TextAreaValidation("txtComments");
					spamInvalid = SpamValidation("txtComments");
				}

				if (isValid) {
					if(!txtTextAreaInvalid && !spamInvalid) {
						document.forms[0].submit();
					}
				}
			}
			
			//Validate Text Area for Non-English Characters.
			function TextAreaValidation(txtfield) {
				var txtTextAreaValidator = new RegExp("[^\x0A\x20-\x7E]+");
				var txtTextAreaInvalid = txtTextAreaValidator.test(document.getElementById(txtfield).value);
				if(txtTextAreaInvalid) {
					$(txtfield).className = 'Invalid';
					return true;
				}
				$(txtfield).className = '';
				return false;
			}
			
			//Validate Text Area for Hyper Links, HTML Tags and Special Symbols
			function SpamValidation(txtfield) {
				var valueOf = document.getElementById(txtfield).value;
				var linksValidator = new RegExp("(http://|https://|ftp://)([a-zA-Z0-9]+\.[a-zA-Z0-9\-]+|[a-zA-Z0-9\-]+)\.[a-zA-Z\.]{2,6}(/[a-zA-Z0-9\.\?=/#%&\+-]+|/|)");
				var tagsValidator = new RegExp("<\s*?[^>]+\s*?>");
				var specValidator = new RegExp("[%^#*@_+=[{}><]");
				var testLinks = linksValidator.test(valueOf);
				var testTags = tagsValidator.test(valueOf);
				var testSpec = specValidator.test(valueOf);
				if(testLinks || testTags || testSpec) {
					$(txtfield).className = 'Invalid';
					return true;
				}
				$(txtfield).className = '';
				return false;
			}
			
			function ValidateEmail() {

				var email = $('txtEmail').value;
								
				var isValid = email != ''; 
				
				var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
				
				isValid = isValid && emailValidator.test(email);

				if (isValid) {
					$('rfvEmail').hide();
					$('txtEmail').className = '';
				}
				else {
					$('rfvEmail').show();
					$('txtEmail').className = 'Invalid';
				}

				return isValid;
			}

		]]>
		</script>
		<!-- Needed to hook the source Block for the FormHandler -->
		<input type="hidden" name="staticpagetypeid">
			<xsl:attribute name="value">
				<xsl:value-of select="ExpressLane/StaticPageType/StaticPageTypeID" />
			</xsl:attribute>
		</input>
		<style>.jsvalidation {color: red; margin-left: 5px;}</style>
		<h2>Employment Application</h2>
		<div id="EmploymentApplicationInstructions">
			<h3>Please fill out as completely as possible and click Submit.</h3>
			<em>*Required</em>
			<br/>
			<br/>
		</div>
		<div id="FirstName">
			<h2>Personal Information</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">First Name:</td>
					<td>
						<input id="txtFirstName" title="FirstName" name="firstname">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/firstname"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
		</div>
		<div id="LastName">
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Last Name:</td>
					<td>
						<input id="txtLastName" title="LastName" name="lastname">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/lastname"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
		</div>
		<div id="addressblock">
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Address:</td>
					<td>
						<input id="txtAddress" title="Address" name="address">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/address"/>
							</xsl:attribute>
						</input>
						<br/>
						<input id="txtAddress2" title="Address2" name="address2">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/address2"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">City:</td>
					<td>
						<input id="txtCity" title="City" name="city">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/city"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">State:</td>
					<td>
						<select title="State" name="state">
							<xsl:for-each select="ExpressLane/ArrayOfState/State">
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
											<xsl:if test="Abbreviation=//ExpressLane/ArrayOfGenericStore/GenericStore[position()=1]//State">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:value-of select="FullName"/>
								</option>
							</xsl:for-each>
						</select>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Zip:</td>
					<td>
						<input id="txtZip" title="ZipCode" maxLength="5" name="zipcode">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/zipcode"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Phone:</td>
					<td>
						<input id="txtAreaCode" title="AreaCode" size="3" maxLength="3" name="areacode">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/areacode"/>
							</xsl:attribute>
						</input>-
						<input id="txtPhoneCity" title="CityCode" size="3" maxLength="3" name="citycode">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/citycode"/>
							</xsl:attribute>
						</input>-
						<input id="txtPhoneHouse" title="HouseCode" size="4" maxLength="4" name="housecode">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/housecode"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">* Email Address:</td>
					<td>
						<input id="txtEmail" class="jsrequired jsvalidate_email" type="text" title="EmailAddress" name="emailaddress" onblur="ValidateEmail();">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/emailaddress"/>
							</xsl:attribute>
						</input>
						<br/>
						<span id="rfvEmail" style="display:none;">Please input a valid email address.</span>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Store:</td>
					<td>
						<select name="selStore" title="SelectedStore">
							<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="StoreID"/>
									</xsl:attribute>
									<xsl:if test="../Consumer/PrimaryStoreID = StoreID">
										<xsl:attribute name="selected">selected</xsl:attribute>
									</xsl:if>
									<xsl:if test="../formdata/selectedstorevalue = StoreID">
										<xsl:attribute name="selected">selected</xsl:attribute>
									</xsl:if>

									<xsl:value-of select="StoreName"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="StoreNumber"/>
								</option>
							</xsl:for-each>
						</select>
					</td>
				</tr>
			</table>
		</div>

		<div id="DesiredWork">
			<h2>Position: What would you most like to do for us? List top three choices.</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">
					</td>
					<td>
						<div id="Questions">1.
							<input id="txtQuestionOne" title="QuestionOne" name="QuestionOne">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/QuestionOne"/>
								</xsl:attribute>
							</input>
							<br/>2.
							<input id="txtQuestionTwo" title="QuestionTwo" name="QuestionTwo">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/QuestionTwo"/>
								</xsl:attribute>
							</input>
							<br/>3.
							<input id="txtQuestionThree" title="QuestionThree" name="QuestionThree">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/QuestionThree"/>
								</xsl:attribute>
							</input>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="Availability">
			<h2>Availability: List approximate times next to each day.</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Monday:</td>
					<td>
						<input id="txtAvailableMonday" type="text" name="AvailableMonday" title="AvailableMonday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableMonday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Tuesday:</td>
					<td>
						<input id="txtAvailableTuesday" type="text" name="AvailableTuesday" title="AvailableTuesday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableTuesday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Wednesday:</td>
					<td>
						<input id="txtAvailableWedday" type="text" name="AvailableWednesday" title="AvailableWednesday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableWednesday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Thursday:</td>
					<td>
						<input id="txtAvailableThursday" type="text" name="AvailableThursday" title="AvailableThursday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableThursday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Friday:</td>
					<td>
						<input id="txtAvailableFriday" type="text" name="AvailableFriday" title="AvailableFriday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableFriday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Saturday:</td>
					<td>
						<input id="txtAvailableSaturday" type="text" name="AvailableSaturday" title="AvailableSaturday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableSaturday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Sunday:</td>
					<td>
						<input id="txtAvailableSunday" type="text" name="AvailableSunday" title="AvailableSunday">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/AvailableSunday"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
		</div>

		<div id="PreviousEmploymentHere">
			<h2>Have you ever worked with us before? If so, when?</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">From:</td>
					<td>
						<input id="txtWorkedWithUsFrom" type="text" name="WorkedWithUsFrom" title="WorkedWithUsFrom">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/WorkedWithUsFrom"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">To:</td>
					<td>
						<input id="txtWorkedWithUsUntil" type="text" name="WorkedWwithUsUntil" title="WorkedWithUsUntil">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/WorkedWwithUsUntil"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
		</div>

		<div id="Education">
			<h2>Education</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Highest level of education completed:</td>
					<td>
						<select name="EducationLevel" id="_ctl0__educationLevel">
							<option value="in high school">
								<xsl:if test="ExpressLane/formdata/EducationLevel = 'in high school'">
									<xsl:attribute name="selected">true</xsl:attribute>
								</xsl:if>in high school</option>
							<option value="high school">
								<xsl:if test="ExpressLane/formdata/EducationLevel = 'high school'">
									<xsl:attribute name="selected">true</xsl:attribute>
								</xsl:if>high school</option>
							<option value="2-year college degree">
								<xsl:if test="ExpressLane/formdata/EducationLevel = '2-year college degree'">
									<xsl:attribute name="selected">true</xsl:attribute>
								</xsl:if>2-year college degree</option>
							<option value="4-year degree">
								<xsl:if test="ExpressLane/formdata/EducationLevel = '4-year degree'">
									<xsl:attribute name="selected">true</xsl:attribute>
								</xsl:if>4-year degree</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Where?</td>
					<td>
						<input id="txtEducationLocation" type="text" name="EducationLocation" title="EducationLocation">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/EducationLocation"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
		</div>

		<div id="WeAreLucky">
			<h2>List a couple reasons why we would be lucky to have you working with us.<br/><small>(Note: No special characters or symbols can be used in this box. Example _ , … , ©, ®,  ¶.)</small></h2> 
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">
					</td>
					<td>
						<textarea id="txtWeAreLucky" name="WeAreLucky" title="WeAreLucky" cols="40" rows="5">
							<xsl:value-of select="ExpressLane/formdata/WeAreLucky"/>
						</textarea>
					</td>
				</tr>
			</table>
		</div>

		<div id="PreviousEmploymentElsewhere">
			<h2>Previous work experience (in most recent order)</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Where?</td>
					<td>
						<input id="txtPreviousWork" type="text" name="PreviousWork" title="PreviousWork">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/PreviousWork"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Doing what?</td>
					<td>
						<input id="txtDoingWhat" type="text" name="DoingWhat" title="DoingWhat">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/DoingWhat"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">How Long?</td>
					<td>
						<input id="txtHowLong" type="text" name="HowLong" title="HowLong">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/HowLong"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Supervisor:</td>
					<td>
						<input id="txtSupervisor" type="text" name="Supervisor" title="Supervisor">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/Supervisor"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">Phone:</td>
					<td>
						<input id="txtPhone" type="text" name="Phone" title="Phone">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/Phone"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
			</table>
			<p></p>
			<div id="JobAppBottom">
				<table width="70%" border="0" class="Experience">
					<tr>
						<td width="40%" align="right">
							<span>Where?</span>
						</td>
						<td>
							<input id="txtPreviousWork1" type="text" name="PreviousWork1" title="PreviousWork1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/PreviousWork1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right">
							<span>Doing what?</span>
						</td>
						<td>
							<input id="txtDoingWhat1" type="text" name="DoingWhat1" title="DoingWhat1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/DoingWhat1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right">
							<span>How Long?</span>
						</td>
						<td>
							<input id="txtHowLong1" type="text" name="HowLong1" title="HowLong1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/HowLong1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right">
							<span>Supervisor:</span>
						</td>
						<td>
							<input id="txtSupervisor1" type="text" name="Supervisor1" title="Supervisor1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/Supervisor1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right">
							<span>Phone:</span>
						</td>
						<td>
							<input id="txtPhone1" type="text" name="Phone1" title="Phone1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/formdata/Phone1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="ReferenceAuthorization">
			<h2>Reference authorization</h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right">Please type your full name:</td>
					<td>
						<input id="txtReferenceAuthorization" type="text" name="ReferenceAuthorization" title="ReferenceAuthorization">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/formdata/ReferenceAuthorization"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>This application of employment is not intended to be a contract of employment. Equal Opportunity Employer.</td>
				</tr>
			</table>
			<h2>Any further suggestions or comments for Us? <br/><small>(Note: No special characters or symbols can be used in this box. Example _ , … , ©, ®,  ¶.)</small></h2>
			<table width="70%" border="0">
				<tr>
					<td width="40%" align="right"></td>
					<td>
						<textarea id="txtComments" name="Comments" title="Comments" cols="40" rows="5">
							<xsl:value-of select="ExpressLane/formdata/Comments"/>
						</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div id="employmentButtonsDiv">
			<a class="button red" href="javascript:void(0);" onclick="window.history.back();">
				<span>Cancel</span>
			</a>
			<a class="button red" href="javascript:void(0);" onclick="SubmitForm();">
				<span>Submit</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>