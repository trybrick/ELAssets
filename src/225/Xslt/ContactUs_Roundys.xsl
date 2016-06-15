<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="Consumer" select="ExpressLane/GenericConsumer[IsLoggedIn = 'true']"/>
		<script type="text/javascript">
		var subSelectOptions = [
			<xsl:for-each select="//ContactUs/Topic/ChildTopics/Topic">
			{ "Value": "<xsl:value-of select="Value"/>", "Label": "<xsl:value-of select="Label"/>", "Text": "<xsl:value-of select="Text"/>", "ParentOption": "<xsl:value-of select="parent::node()/parent::node()/Value"/>" }<xsl:if test="position() != last()">,</xsl:if>
			</xsl:for-each>
		];

		<![CDATA[
			function TopicChanged() {
				var topicSelect = $('ddlTopicSelect');
				var subSelect = $('ddlTopicSubSelect');

				subSelect.innerHTML = '';
				
				subSelectOptions.each(function (o) {
					if (o.ParentOption == topicSelect.value) {
						var option = document.createElement('option');

						option.innerHTML = o.Text;
						option.value = o.Value;
						option.label = o.Label;

						subSelect.appendChild(option);
					}
				});
			}

			function SubmitContactUs() {
		
				var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
				var emailInput = $('txtEmail');
				var emailInputLabel = $('txtEmailLabel');
				var emailConfirm = $('txtEmailConfirm');
				var emailConfirmLabel = $('txtEmailConfirmLabel');
				var emailIsValid = emailValidator.test(emailInput.value);
				var isValid = true;

				if (!emailIsValid) {
 					emailInputLabel.addClassName('contactInvalid');
					isValid = false;
 				}
				else {
					emailInputLabel.removeClassName('contactInvalid');
				}

				if ((emailInput.value != emailConfirm.value) || (emailConfirm.value =='')) {
					emailConfirmLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					emailConfirmLabel.removeClassName('contactInvalid');
				}

				var txtFirstName = $('txtFirstName');
				var txtFirstNameLabel = $('txtFirstNameLabel');

				if (txtFirstName.value == '') {
					txtFirstNameLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					txtFirstNameLabel.removeClassName('contactInvalid');
				}

				var txtLastName = $('txtLastName');
				var txtLastNameLabel = $('txtLastNameLabel');

				if (txtLastName.value == '') {
					txtLastNameLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					txtLastNameLabel.removeClassName('contactInvalid');
				}

				var ddlTopicSelect = $('ddlTopicSelect');
				var ddlTopicSelectLabel = $('ddlTopicSelectLabel');

				if (ddlTopicSelect.value == '') {
					ddlTopicSelectLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					ddlTopicSelectLabel.removeClassName('contactInvalid');
				}

				var ddlTopicSubSelect = $('ddlTopicSubSelect');
				var ddlTopicSubSelectLabel = $('ddlTopicSubSelectLabel');

				if (ddlTopicSubSelect.value == '') {
					ddlTopicSubSelectLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					ddlTopicSubSelectLabel.removeClassName('contactInvalid');
				}

				/*var ddlStore = $('ddlStore');
				var ddlStoreLabel = $('ddlStoreLabel');

				if (ddlStore.value == '') {
					ddlStoreLabel.addClassName('contactInvalid');
					isValid = false;
				}
				else {
					ddlStoreLabel.removeClassName('contactInvalid');
				}*/

				if (typeof (SubmitForm) == 'function') {
					isValid = isValid && SubmitForm('hfContactXml');
				}

				if (isValid) {
					document.forms[0].submit();
				}
				
				var requiredInfoLabel = $('requiredInfoLabel');
				requiredInfoLabel.addClassName('contactInvalid');
			}

			function ResetPage() {
				var contactInvalid = $$('.contactInvalid');
				for (i = 0; i < contactInvalid.length; i++) {
					contactInvalid[i].removeClassName('contactInvalid');
					}
				for (i = 0; i < document.forms[0].elements.length; i++) {
					var element = document.forms[0].elements[i];
					if (element.tagName == 'SELECT') {
						element.selectedIndex = 0;
					}
					if (element.tagName == 'TEXTAREA') {
						element.value = '';
					}
					else if (element.tagName == 'INPUT') {
						if (element.type == 'text' || element.type == 'password') {
							element.value = '';
						}
						else if (element.type == 'checkbox') {
							element.checked = false;
						}
						else if (element.type == 'radio') {
							element.checked = false;
						}
					}
				}	

				TopicChanged();
			}
			
			function CancelPage() {
				document.location = document.referrer;
			}
		]]>	
		</script>
		<input type="hidden" name="staticpagetypeid">
			<xsl:attribute name="value">
				<xsl:value-of select="ExpressLane/StaticPageType/StaticPageTypeID"/>
			</xsl:attribute>
		</input>
		<div id="ContactUs" class="main-wrapper">
			<div id="contactUsInfo">
				<h3>Contact Roundy&#x2019;s</h3>
				<p>We encourage you to visit the appropriate store website&#x2019;s Contact Us page to fill out this form. There you will find information about our coupon policies, gluten free products, Fuel Rewards program, gift cards, employment and more common topics.</p>
				<h3>Two Ways to Contact Us</h3>
				<p>(Please include UPC number, product expiration date, lot code number, date of purchase, product description and store where purchased for any product-related inquiries.)</p>
				<h3>Send Us an Email</h3>
				<h3>Call Our Customer Experience Center</h3>
				<p>Hours are 7:45 a.m. &#x2013; 5:00 p.m. Monday through Friday.</p>
				<p>1-866-279-6269</p>
			</div>
			<div id="ContactForm">
				<p id="requiredInfoLabel">* = Required</p>
				<h3>Contact Information</h3>
				<div id="ContactName" class="contactRow">
					<div class="contactColumn">
						<label for="txtFirstName" id="txtFirstNameLabel" class="ContactFieldTitle">First Name:*</label>
						<input id="txtFirstName" name="NameFirst" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/FirstName"/>
							</xsl:attribute>
						</input>
					</div>
					<div class="contactColumn">
						<label for="txtLastName" id="txtLastNameLabel" class="ContactFieldTitle">Last Name:*</label>
						<input id="txtLastName" name="NameLast" type="text" size="27" maxlength="60">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/LastName"/>
							</xsl:attribute>
						</input>
					</div>
				</div>
				<div id="ContactAddress1" class="contactRow">
					<div class="contactColumn">
						<label for="txtAddress" class="ContactFieldTitle">Address:</label>
						<input id="txtAddresss" name="Address" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/PrimaryAddress"/>
							</xsl:attribute>
						</input>
					</div>
					<div class="contactColumn">
						<label for="txtCity" class="ContactFieldTitle">City:</label>
						<input id="txtCity" name="City" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/City"/>
							</xsl:attribute>
						</input>
					</div>
				</div>
				<div id="ContactAddress2" class="contactRow">
					<div class="contactColumn">
						<label for="txtState" class="ContactFieldTitle">State:</label>
						<input id="txtState" name="State" type="text" size="2" maxlength="2">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/State"/>
							</xsl:attribute>
						</input>
					</div>
					<div class="contactColumn">
						<label for="txtZip" class="ContactFieldTitle">Zip:</label>
						<input for="txtZip" name="Zip" type="text" size="5" maxlength="10">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/PostalCode"/>
							</xsl:attribute>
						</input>
					</div>
				</div>
				<div id="ContactDetails" class="contactRow">
					<div class="contactColumn">
						<label for="txtPhone" class="ContactFieldTitle">Phone:</label>
						<input id="txtPhone" name="Phone" type="text" size="27" maxlength="30">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Phone"/>
							</xsl:attribute>
						</input>
					</div>
					<div class="contactColumn">
						<label for="txtEmail" id="txtEmailLabel" class="ContactFieldTitle">Email:*</label>
						<input id="txtEmail" name="Email" type="text" size="27" maxlength="80">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Email"/>
							</xsl:attribute>
						</input>
					</div>
					<div class="contactColumn">
						<label for="txtEmailConfirm" id="txtEmailConfirmLabel" class="ContactFieldTitle">Confirm:*</label>
						<input id="txtEmailConfirm" name="EmailConfirm" type="text" size="27" maxlength="80">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Email"/>
							</xsl:attribute>
						</input>
					</div>
				</div>
				<div id="ContactCustomerCard" class="contactRow">
					<div class="contactColumn">
						<label for="txtExternalID" class="ContactFieldTitle">Customer Card:</label>
						<input id="txtExternalID" name="cardnbr" type="text" size="27" maxlength="30">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/ExternalID"/>
							</xsl:attribute>
						</input>
					</div>
				</div>
				<h3>Your Comments</h3>
				<div id="ContactUsComments">
					<div id="CommentSelect">
						<div>
							<label for="ddlTopicSelect" id="ddlTopicSelectLabel" class="ContactFieldTitle">1. Select Main Topic:*</label>
						</div>
						<div>
							<select name="Selection" id="ddlTopicSelect" onchange="TopicChanged();">
								<option value="" selected="true">Select</option>
								<xsl:for-each select="//ContactUs/Topic">
									<xsl:sort select="Sort" data-type="number"/>
									<xsl:sort select="Text" data-type="text"/>
									<option>
										<xsl:attribute name="id">
											<xsl:value-of select="ID"/>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="Value"/>
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:value-of select="Title"/>
										</xsl:attribute>
										<xsl:value-of select="Text"/>
									</option>
								</xsl:for-each>
							</select>
						</div>
					</div>
					<div id="CommentSubSelect">
						<label for="ddlTopicSubSelect" id="ddlTopicSubSelectLabel" class="ContactFieldTitle">2. Select Specific Topic:*</label>
						<br/>
						<select id="ddlTopicSubSelect" name="subselection">
							<option value="" selected="selected">
								<xsl:text>Select</xsl:text>
							</option>
						</select>
					</div>
				</div>
				<!--<div id="ContactUsStore">
					<label for="ddlStore" id="ddlStoreLabel" class="ContactFieldTitle">3. Select Your Store:*</label>
					<select id="ddlStore" name="SelStore">
						<option value="" selected="true">Select</option>
						<xsl:for-each select="ExpressLane/ArrayOfState/State[StateID = //GenericStore/StateID]">
							<xsl:variable name="StateID" select="StateID"/>
							<optgroup>
								<xsl:attribute name="label">
									<xsl:value-of select="concat('=========', FullName, '=========')"/>
								</xsl:attribute>
								<xsl:for-each select="//ArrayOfGenericStore/GenericStore[StateID = $StateID]">
									<option>
										<xsl:if test="StoreID = //GenericConsumer/PrimaryStoreID">
											<xsl:attribute name="selected">selected</xsl:attribute>
										</xsl:if>
										<xsl:attribute name="label">
											<xsl:value-of select="concat(StoreName, ' - ', PrimaryAddress, '(#', StoreNumber, ')')"/>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="StoreID"/>
										</xsl:attribute>
										<xsl:value-of select="concat(StoreName, ' - ', PrimaryAddress, '(#', StoreNumber, ')')"/>
									</option>
								</xsl:for-each>
							</optgroup>
						</xsl:for-each>
					</select>
				</div>-->
				<div id="ContactUsMessage">
					<textarea name="Message" cols="48" rows="6"/>
				</div>
				<div class="Buttons">
					<a class="button submit" href="javascript:SubmitContactUs();">
						<span>Submit</span>
					</a>
					<a class="button reset" href="javascript:ResetPage();">
						<span>Reset</span>
					</a>
					<a class="button cancel" href="javascript:CancelPage();">
						<span>Cancel</span>
						<span class="ie_dupChar_fix">
							<xsl:text> </xsl:text>
							<!--do not delete. this fixes the duplicate character bug in ie7-->
						</span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
