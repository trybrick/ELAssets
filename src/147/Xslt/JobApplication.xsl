<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">

			<h2>Employment Application</h2>
			<div id="EmploymentApplicationInstructions">
				<h3>Please fill out as completely as possible and click Submit.</h3>
				<em>*Fields are Required</em><br/><br/>
			</div>
			<div id="FirstName">
				<h2>Personal Information</h2>
				<table width="70%" border="0">
				<tr><td width="40%" align="right">
				First Name
				</td><td>
				<input id="txtFirstName" title="FirstName" name="txtFirstName">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/firstname"/>
					</xsl:attribute>
				</input>
				</td></tr></table>
			</div>
			<div id="LastName">
				<table width="70%" border="0">
				<tr><td width="40%" align="right">
				Last Name
				</td><td>
				<input id="txtLastName" title="LastName" name="txtLastName">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/lastname"/>
					</xsl:attribute>
				</input>
				</td></tr></table>
			</div>
		<div id="addressblock">
				<table width="70%" border="0">
				<tr><td width="40%" align="right" >
				Address
				</td><td>
				<input id="txtAddress" title="Address" name="txtAddress">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/address"/>
					</xsl:attribute>
				</input>
				<br/>
				<input id="txtAddress2" title="Address2" name="txtAddress2">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/address2"/>
					</xsl:attribute>
				</input>
				</td></tr>
				<tr><td width="40%" align="right">
				City
				</td><td>
				<input id="txtCity" title="City" name="txtCity">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/city"/>
					</xsl:attribute>
				</input>
				</td></tr>
				<tr><td width="40%" align="right">
					State
				</td><td>
				<select title="State" name="selState">
					<xsl:for-each select="ExpressLane/JobApplication/ArrayOfState/State/StateRecord">
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="Abbreviation"/>
							</xsl:attribute>
							<xsl:if test="Abbreviation = ../../../Common/ArrayOfGenericStore/GenericStore/State//State">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="FullName"/>
						</option>
					</xsl:for-each>
				</select>
				</td></tr>
				<tr><td width="40%" align="right">
				Zip
				</td><td>
				<input id="txtZip" title="ZipCode" maxLength="5" name="txtZip">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/zipcode"/>
					</xsl:attribute>
				</input>
				</td></tr>
				<tr><td width="40%" align="right">			
				Phone
				</td><td>
				<input id="txtAreaCode" title="AreaCode" size="3" maxLength="3" name="txtAreaCode">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/areacode"/>
					</xsl:attribute>
				</input> - 
				<input id="txtPhoneCity" title="CityCode" size="3" maxLength="3" name="txtPhoneCity">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/citycode"/>
					</xsl:attribute>
				</input> - 
				<input id="txtPhoneHouse" title="HouseCode" size="4" maxLength="4" name="txtPhoneHouse" >
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/housecode"/>
					</xsl:attribute>
				</input>
				</td></tr>
				<tr><td width="40%" align="right">			
				Email Address
				</td><td>
				<input id="txtEmail" title="EmailAddress" name="txtEmail">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/emailaddress"/>
					</xsl:attribute>
				</input>
				</td></tr>
		

				<tr><td width="40%" align="right">			
					Store
				</td><td>
				<select name="selStore" title="SelectedStore">
	        <option>
	          <xsl:attribute name="value">SELECT-A-STORE</xsl:attribute>
	          <xsl:attribute name="selected">selected</xsl:attribute>
	          <xsl:text>-SELECT A STORE-</xsl:text>
	        </option>
				<xsl:for-each select="ExpressLane/JobApplication/ArrayOfGenericStore/GenericStore">
					<option>
						<xsl:attribute name="value">
							<xsl:value-of select="StoreID"/>
						</xsl:attribute>

						<xsl:value-of select="StoreName"/>
						<xsl:text>-</xsl:text>
						<xsl:value-of select="StoreNumber"/>
					</option>
				</xsl:for-each>
				</select>
				</td></tr>
				</table>
		</div>

		<div id="DesiredWork">
				<h2>Position: What would you most like to do for us? List top three choices.</h2>
			
				<table width="70%" border="0">
				<tr><td width="40%" align="right" > 
				</td><td>
				<div id="Questions">
					1.
					<input id="txtQuestionOne" title="QuestionOne" name="QuestionOne">
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/JobApplication/formdata/questionone"/>
						</xsl:attribute>
					</input>
					<br/>
					2.
					<input id="txtQuestionTwo" title="QuestionTwo" name="QuestionTwo">
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/JobApplication/formdata/questiontwo"/>
						</xsl:attribute>
					</input>
					<br/>
					3.
					<input id="txtQuestionThree" title="QuestionThree" name="QuestionThree">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/questionthree"/>
					</xsl:attribute>
				</input>
				</div>
				</td></tr>
				</table>
		</div>
		
		<div id="Availability">
				<h2>Availability: List approximate times next to each day.</h2>

				<table width="70%" border="0">
					<tr>
						<td width="40%" align="right" >Monday</td>
						<td>
							<input id="txtAvailableMonday" type="text" name="AvailableMonday" title="AvailableMonday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablemonday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Tuesday</td>
						<td>
							<input id="txtAvailableTuesday" type="text" name="AvailableTuesday" title="AvailableTuesday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availabletuesday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Wednesday</td>
						<td>
							<input id="txtAvailableWedday" type="text" name="AvailableWednesday" title="AvailableWednesday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablewednesday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Thursday</td>
						<td>
							<input id="txtAvailableThursday" type="text" name="AvailableThursday" title="AvailableThursday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablethursday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Friday</td>
						<td>
							<input id="txtAvailableFriday" type="text" name="AvailableFriday" title="AvailableFriday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablefriday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Saturday</td>
						<td>
							<input id="txtAvailableSaturday" type="text" name="AvailableSaturday" title="AvailableSaturday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablesaturday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" >Sunday</td>
						<td>
							<input id="txtAvailableSunday" type="text" name="AvailableSunday" title="AvailableSunday">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/availablesunday"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
		</div>
		
		<div id="PreviousEmploymentHere">
				<h2>Have you ever worked with us before? If so, when?</h2>
				<table width="70%" border="0">
				<tr><td width="40%" align="right" >
					From
				</td><td>
					<input id="txtWorkedWithUsFrom" type="text" name="WorkedWithUsFrom" title="WorkedWithUsFrom">
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/JobApplication/formdata/workedwithusfrom"/>
						</xsl:attribute>
					</input>
				</td></tr>
				<tr><td width="40%" align="right" >
					To
				</td><td>
					<input id="txtWorkedWithUsUntil" type="text" name="WorkedWwithUsUntil" title="WorkedWithUsUntil">
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/JobApplication/formdata/workedwithusuntil"/>
						</xsl:attribute>
					</input>
				</td></tr></table>
		</div>
		
		<div id="Education">
				<h2>Education</h2>
				<table width="70%" border="0">
				<tr><td width="40%" align="right" >
				Highest level of education completed
				</td><td>
				<select name="educationLevel" id="_ctl0__educationLevel">
					<option value="in high school">in high school</option>
					<option value="high school">high school</option>
					<option value="2-year college degree">2-year college degree</option>
					<option value="4-year degree">4-year degree</option>
				</select>
				</td></tr>
				<tr><td width="40%" align="right" >
					Where?
					</td><td>
					<input id="txtEducationLocation" type="text" name="EducationLocation" title="EducationLocation">
						<xsl:attribute name="value">
							<xsl:value-of select="ExpressLane/JobApplication/formdata/educationlocation"/>
						</xsl:attribute>
					</input>
					</td></tr>
					</table>
		</div>
		
		<div id="WeAreLucky">
				<h2>List a couple reasons why we would be lucky to have you working with us</h2>
				<table width="70%" border="0">
				<tr><td width="40%" align="right" > </td>
				<td>
				<textarea id="txtWeAreLucky" name="WeAreLucky" title="WeAreLucky" cols="40" rows="5">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/wearelucky"/>
					</xsl:attribute>
				</textarea>
			</td></tr></table>
		</div>
		
		<div id="PreviousEmploymentElsewhere">
				<h2>Previous work experience (in most recent order)</h2>
				<table width="70%" border="0">
					<tr><td width="40%" align="right" >
							Where?
						</td>
						<td>
							<input id="txtPreviousWork" type="text" name="PreviousWork" title="PreviousWork">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/previouswork"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Doing what?
						</td>
						<td>
							<input id="txtDoingWhat" type="text" name="DoingWhat" title="DoingWhat">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/doingwhat"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							How Long?
						</td>
						<td>
							<input id="txtHowLong" type="text" name="HowLong" title="HowLong">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/howlong"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Supervisor
						</td>
						<td>
							<input id="txtSupervisor" type="text" name="Supervisor" title="Supervisor">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/supervisor"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Phone
						</td>
						<td>
							<input id="txtPhone" type="text" name="Phone" title="Phone">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/phone"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
			
				<table width="70%" border="0">
					<tr><td width="40%" align="right" >
							Where?
						</td>
						<td>
							<input id="txtPreviousWork1" type="text" name="PreviousWork1" title="PreviousWork1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/previouswork1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Doing what?
						</td>
						<td>
							<input id="txtDoingWhat1" type="text" name="DoingWhat1" title="DoingWhat1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/doingwhat1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							How Long?
						</td>
						<td>
							<input id="txtHowLong1" type="text" name="HowLong1" title="HowLong1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/howlong1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Supervisor
						</td>
						<td>
							<input id="txtSupervisor1" type="text" name="Supervisor1" title="Supervisor1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/supervisor1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
					<tr><td width="40%" align="right" >
							Phone
						</td>
						<td>
							<input id="txtPhone1" type="text" name="Phone1" title="Phone1">
								<xsl:attribute name="value">
									<xsl:value-of select="ExpressLane/JobApplication/formdata/phone1"/>
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
		</div>
	
		<div id="ReferenceAuthorization">
				<h2>Reference authorization</h2>
				<table width="70%" border="0">
					<tr><td width="40%" align="right" >
						Please type your full name
				</td><td>
				<input id="txtReferenceAuthorization" type="text" name="ReferenceAuthorization" title="ReferenceAuthorization">
					<xsl:attribute name="value">
						<xsl:value-of select="ExpressLane/JobApplication/formdata/referenceauthorization"/>
					</xsl:attribute>
				</input>
				</td></tr>
			
				<tr><td> </td>
				<td>
				This application of employment is not intended to be a contract
				of employment. Equal Opportunity Employer.
				</td></tr></table>		
		
				<h2>Any further suggestions or comments for Us?</h2>
				<table width="70%" border="0">
					<tr><td width="40%" align="right" ></td>
						<td><textarea id="txtComments" name="Comments" title="Comments" cols="40" rows="5">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/JobApplication/formdata/comments"/>
							</xsl:attribute>
						</textarea>
					</td>
				</tr></table>
		</div>
	</xsl:template>

	<xsl:template match="JobApplication"></xsl:template>
</xsl:stylesheet>