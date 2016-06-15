<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style>li	{list-style-type:none;}</style>
		<div id="JobApplicationReply" class="main-wrapper">
			<h2>Thanks for your application!</h2>
			<h3>Your information is included below and an email copy is also being sent to the email address you supplied.</h3>
			<div id="JobApplicationReplyPersonal">
				<ul>
					<li>
						<strong><xsl:text>Name: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/firstname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ExpressLane/formdata/lastname"/>
					</li>
					<li>
						<strong><xsl:text>Address: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/address"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ExpressLane/formdata/address2"/>
					</li>
					<li>
						<strong><xsl:text>City: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/city"/>
					</li>
					<li>
						<strong><xsl:text>State: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/state"/>
					</li>
					<li>
						<strong><xsl:text>Zip: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/zipcode"/>
					</li>
					<li>
						<strong><xsl:text>Phone: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/areacode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/formdata/citycode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/formdata/housecode"/>
					</li>
					<li>
						<strong><xsl:text>Email: </xsl:text></strong>
						<xsl:value-of select="ExpressLane/formdata/emailaddress"/>
					</li>
				</ul>
			</div>
			<div id="JobApplicationReplyPosition">
				<xsl:variable name="StoreID" select="ExpressLane/formdata/selStore" />
				<strong><xsl:text>Store Location: </xsl:text></strong>
				<xsl:value-of select="ExpressLane/ArrayOfGenericStore/GenericStore[StoreID = $StoreID]/StoreName" />
				<br/>
				<br/>
				<strong><xsl:text>Top Position Choices: </xsl:text></strong>
				<ul>
					<xsl:if test="ExpressLane/formdata/QuestionOne = ''">
						<li>
							<strong><xsl:text>No preference </xsl:text></strong>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/QuestionOne != ''">
						<li>
							<strong><xsl:text>Postion 1: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/QuestionOne"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/QuestionTwo != ''">
						<li>
							<strong><xsl:text>Postion 2: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/QuestionTwo"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/QuestionThree != ''">
						<li>
							<strong><xsl:text>Postion 3: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/QuestionThree"/>
						</li>
					</xsl:if>
				</ul>
			</div>
			<div id="JobApplicationReplyAvailability">
				<strong><xsl:text>Availability: </xsl:text></strong>
				<ul>
					<xsl:if test="ExpressLane/formdata/AvailableMonday != ''">
						<li>
							<strong><xsl:text>Monday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableMonday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableTuesday != ''">
						<li>
							<strong><xsl:text>Tuesday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableTuesday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableWednesday != ''">
						<li>
							<strong><xsl:text>Wednesday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableWednesday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableThursday != ''">
						<li>
							<strong><xsl:text>Thursday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableThursday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableFriday != ''">
						<li>
							<strong><xsl:text>Friday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableFriday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableSaturday != ''">
						<li>
							<strong><xsl:text>Saturday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableSaturday"/>
						</li>
					</xsl:if>
					<xsl:if test="ExpressLane/formdata/AvailableSunday != ''">
						<li>
							<strong><xsl:text>Sunday: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/AvailableSunday"/>
						</li>
					</xsl:if>
				</ul>
			</div>
			<div id="JobApplicationReplyPreviousWorkWithUs">
				<strong><xsl:text>Previous Work Experience with Us </xsl:text></strong>
				<br/>
				<xsl:if test="ExpressLane/formdata/WorkedWithUsFrom = ''">
					<ul>
						<li>
							<strong><xsl:text>None </xsl:text></strong>
						</li>
					</ul>
				</xsl:if>
				<xsl:if test="ExpressLane/formdata/WorkedWithUsFrom != ''">
					<ul>
						<li>
							<strong><xsl:text>From: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/WorkedWithUsFrom"/>
						</li>
						<li>
							<strong><xsl:text>To: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/WorkedWwithUsUntil"/>
						</li>
					</ul>
				</xsl:if>
			</div>
			<div id="JobApplicationReplyEducation">
				<strong><xsl:text>Education </xsl:text></strong>
				<ul>
					<li>
						<xsl:if test="ExpressLane/formdata/EducationLocation != ''">
							<strong><xsl:text>Highest level of education completed at </xsl:text></strong>
							<br/>
							<xsl:value-of select="ExpressLane/formdata/EducationLocation"/>
						</xsl:if>
						<xsl:if test="ExpressLane/formdata/EducationLocation = ''">
							<xsl:text>No Education Information Defined </xsl:text>
						</xsl:if>
					</li>
				</ul>
			</div>
			<br/>

			<div id="JobApplicationReplyLucky">
				<strong><xsl:text>Why we are lucky to have you working with us </xsl:text></strong>
				<br/>
				<xsl:if test="ExpressLane/formdata/WeAreLucky != ''">
					<ul>
						<li>
							<xsl:value-of select="ExpressLane/formdata/WeAreLucky"/>
						</li>
					</ul>
				</xsl:if>
				<xsl:if test="ExpressLane/formdata/WeAreLucky = ''">
					<ul>
						<li>
							<xsl:text>No Reasons Defined </xsl:text>
						</li>
					</ul>
				</xsl:if>
			</div>
			<br/>
			<div id="JobApplicationReplyWorkExperience">
				<strong><xsl:text>Previous Work Experience </xsl:text></strong>
				<xsl:if test="ExpressLane/formdata/PreviousWork != ''">
					<ul>
						<li>
							<strong><xsl:text>Previous Work Location: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/PreviousWork"/>
						</li>
						<li>
							<strong><xsl:text>Job Description: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/DoingWhat"/>
						</li>
						<li>
							<strong><xsl:text>Length of time there: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/HowLong"/>
						</li>
						<li>
							<strong><xsl:text>Supervisor Name: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/Supervisor"/>
						</li>
						<li>
							<strong><xsl:text>Supervisor Phone: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/Phone"/>
						</li>
					</ul>
				</xsl:if>
				<xsl:if test="ExpressLane/formdata/PreviousWork1 != ''">
					<ul>
						<li>
							<strong><xsl:text>Previous Work Location: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/PreviousWork1"/>
						</li>
						<li>
							<strong><xsl:text>Job Description: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/DoingWhat1"/>
						</li>
						<li>
							<strong><xsl:text>Length of time there: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/HowLong1"/>
						</li>
						<li>
							<strong><xsl:text>Supervisor Name: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/Supervisor1"/>
						</li>
						<li>
							<strong><xsl:text>Supervisor Phone: </xsl:text></strong>
							<xsl:value-of select="ExpressLane/formdata/Phone1"/>
						</li>
					</ul>
				</xsl:if>
			</div>
			<br/>
			<div id="JobApplicationReplyReferenceAuth">
				<strong>Reference Authorization</strong>
				<br/>
				<xsl:if test="ExpressLane/formdata/ReferenceAuthorization = ''">
					<ul>
						<li>
							<xsl:text>No Authorization Given </xsl:text>
						</li>
					</ul>
				</xsl:if>
				<xsl:if test="ExpressLane/formdata/ReferenceAuthorization != ''">
					<ul>
						<li>
							<xsl:value-of select="ExpressLane/formdata/ReferenceAuthorization"/>
						</li>
					</ul>
				</xsl:if>
			</div>
			<br/>
			<div id="JobApplicationReplyComments">
				<strong>Additional Comments</strong>
				<br/>
				<ul>
					<li>
						<xsl:value-of select="ExpressLane/formdata/Comments"/>
					</li>
				</ul>
			</div>
			<br/>
			<a href="{//GenericChain/PreferedHost}" class="button">
				<span>Home Page</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>