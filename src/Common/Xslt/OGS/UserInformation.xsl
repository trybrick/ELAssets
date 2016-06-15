<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	<xsl:choose>
		<xsl:when test="ExpressLane/UserInformation">
			<xsl:call-template name="MainContent" />
		</xsl:when>
		<xsl:when test="ExpressLane/DeliveryTimes">
			<xsl:call-template name="DeliveryTimes" />
		</xsl:when>
		<xsl:when test="ExpressLane/DeliverySlots">
			<xsl:call-template name="DeliverySlots" />
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="MainContent">
	<script type="text/javascript" src="/Assets/Common/js/jsvalidate.js"></script>
	<script type="text/javascript" src="/Assets/Common/js/OGS/UserInformation.js"></script>

	<script type="text/javascript">
		function LoadForm(){
			LoadUserInformation();
			LoadDeliveryTypes();
		}

		function LoadUserInformation(){
			var firstname = $('txtFirstName');
			var lastname = $('txtLastName');
			var address1 = $('txtAddress1');
			var address2 = $('txtAddress2');
			var city = $('txtCity');
			var state = $('stateselect');
			var zipcode = $('txtZipCode');
			var phonenum = $('txtPhoneNumber');
			var phonenumalt = $('txtPhoneNumberAlt');
			var email = $('txtEmail');
			var emailalt = $('txtEmailAlt');

			var stateid;

			<xsl:choose>
				<xsl:when test="string-length(//OrderInformation/Consumer/Email) > 1">
					firstname.value = '<xsl:value-of select="//OrderInformation/Consumer/FirstName" />';
					lastname.value = '<xsl:value-of select="//OrderInformation/Consumer/LastName" />';
					address1.value = '<xsl:value-of select="//OrderInformation/Consumer/PrimaryAddress" />';
					address2.value = '<xsl:value-of select="//OrderInformation/Consumer/SecondaryAddress" />';
					city.value = '<xsl:value-of select="//OrderInformation/Consumer/City" />';
					zipcode.value = '<xsl:value-of select="//OrderInformation/Consumer/PostalCode" />';
					phonenum.value = '<xsl:value-of select="//OrderInformation/Consumer/Phone" />';
					phonenumalt.value = '<xsl:value-of select="//OrderInformation/Consumer/AlternatePhone" />';
					email.value = '<xsl:value-of select="//OrderInformation/Consumer/Email" />';
					emailalt.value = '<xsl:value-of select="//OrderInformation/Consumer/AlternateEmail" />';

					<xsl:variable name="consumerstateid1" select="//OrderInformation/Consumer/StateID" />
					
					<xsl:if test="number(consumerstateid1)">
						stateid = <xsl:value-of select="$consumerstateid1" />;
					</xsl:if>

				</xsl:when>
				<xsl:otherwise>
					firstname.value = '<xsl:value-of select="//Common/GenericConsumer/FirstName" />';
					lastname.value = '<xsl:value-of select="//Common/GenericConsumer/LastName" />';
					address1.value = '<xsl:value-of select="//Common/GenericConsumer/PrimaryAddress" />';
					address2.value = '<xsl:value-of select="//Common/GenericConsumer/SecondaryAddress" />';
					city.value = '<xsl:value-of select="//Common/GenericConsumer/City" />';
					zipcode.value = '<xsl:value-of select="//Common/GenericConsumer/PostalCode" />';
					phonenum.value = '<xsl:value-of select="//Common/GenericConsumer/Phone" />';
					email.value = '<xsl:value-of select="//Common/GenericConsumer/Email" />';

					<xsl:variable name="consumerstateabbreviation" select="ExpressLane/Common/GenericConsumer/State" />
					<xsl:variable name="consumerstateid" select="ExpressLane/UserInformation/ArrayOfState/State[Abbreviation = $consumerstateabbreviation]/StateID" />

					<xsl:if test="number(consumerstateid)">
						stateid = <xsl:value-of select="$consumerstateid" />;
					</xsl:if>
					
				</xsl:otherwise>
			</xsl:choose>

			if(typeof(stateid) != 'undefined'){
				for(i = 0; i &lt; state.options.length; i++){
					var option = state.options[i];

					if(option.value == stateid){
						option.selected = true;
					}

				}
			}
		}

		function LoadDeliveryTypes(){
			var count = <xsl:value-of select="count(ExpressLane/UserInformation/ArrayOfDeliveryTimeTemplateType/DeliveryTimeTemplateType)" />

			if(count = 1){
				var rdobtngrp = document['forms']['aspnetForm']['deliverytimetype'];

				if(rdobtngrp != undefined){
					rdobtngrp.checked = true;
					LoadDeliveryTimes();
				}
			}
		}

		function LoadDeliveryTimes(){
			var rdobtnValue = undefined;
			// IE 9 can't handle Prototype $$ function until we upgrade.
			try {
				rdobtnValue = $$('input[type="radio"][name="deliverytimetype"]').find(function(re) {return re.checked;} ).value; 
			} catch(e) {
				var radioButtons = document.forms[0].elements["deliverytimetype"];
				for(var i = 0; i &lt; radioButtons.length; i++) {
					if(radioButtons[i].checked) {
						rdobtnValue = radioButtons[i].value;
						break;
					}
				}
			}

			if(rdobtnValue != undefined){
				GetDeliveryDates(rdobtnValue);
			}

		}

		function LoadExistingDeliveryTime(){
				var deliverytimeid;
				
				<xsl:if test="number(//OrderInformation/DeliveryTimeID) = true">
					deliverytimeid = <xsl:value-of select="//OrderInformation/DeliveryTimeID" />;
				</xsl:if>

				if(typeof(deliverytimeid) == 'undefined'){
					return;
				}

				var deliverytimes = $('deliverytimesselect');

				if(typeof(deliverytimes) == 'undefined'){
					return;
				}

				var time = '<xsl:value-of select="//OrderInformation/DeliveryDateDisplay" />';
				var times = deliverytimes.options;

				for(i=0; i &lt; times.length; i++){
					var item = times[i];

					if(item.value == time){
						item.selected = true;
					}
				}

				if(deliverytimes.selectedIndex > 0){
					LoadDeliverySlots();
				}
		}

		function LoadDeliverySlots(){
			var deliverytimeid;

			<xsl:choose>
				<xsl:when test="number(//OrderInformation/DeliveryTimeID)">
					deliverytimeid = <xsl:value-of select="//OrderInformation/DeliveryTimeID" />;
				</xsl:when>
				<xsl:otherwise>
					deliverytimeid = -1;
				</xsl:otherwise>
			</xsl:choose>
			
			var dates = $('deliverytimesselect');
			var slotDate;

			for(i = 0; i &lt; dates.options.length; i++){
				var option = dates.options[i];

				if(option.selected){
					slotDate = option.value;
				}
			}

			if(slotDate != undefined){
				GetDeliverySlots(1, slotDate, deliverytimeid);
			}

		}

		function Save(){
			var valid = validateFields('aspnetForm');

			var errordiv = $('CheckOutUserInformationError');

			if(!valid){
				errordiv.innerHTML = '<p style="color: red;">There was a problem with your information.  Your information could not be saved.  Please fix and try again.</p>';
				return;
			}

			errordiv.innerHTML = '';

			var firstname = $('txtFirstName').value;
			var lastname = $('txtLastName').value;
			var address1 = $('txtAddress1').value;
			var address2 = $('txtAddress2').value;
			var city = $('txtCity').value;
			var zipcode = $('txtZipCode').value;
			var phonenum = $('txtPhoneNumber').value;
			var phonenumalt = $('txtPhoneNumberAlt').value;
			var email = $('txtEmail').value;
			var emailalt = $('txtEmailAlt').value;

			var state = $('stateselect');
			var statevalue = $F('stateselect');
			

			var consumerObject = Class.create();

			consumerObject.prototype = {
				ConsumerID: <xsl:value-of select="ExpressLane/Common/GenericConsumer/ConsumerID" />,
				FirstName: firstname,
				LastName: lastname,
				PrimaryAddress: address1,
				SecondaryAddress: address2,
				City: city,
				StateID: statevalue,
				State: '',
				PostalCode: zipcode,
				Phone: phonenum,
				AlternatePhone: phonenumalt,
				Email: email,
				AlternateEmail: emailalt,


				initialize: function(){
				}
			};

			var deliverytypeid = Form.getInputs('aspnetForm','radio','deliverytimetype').find(function(radio) { return radio.checked; }).value;
			var deliverydate = $F('deliverytimesselect');
			var deliveryslot = Form.getInputs('aspnetForm','radio','deliveryslotselection').find(function(radio) { return radio.checked; }).value;
			var substitution = Form.getInputs('aspnetForm','radio','substitutionchoice').find(function(radio) { return radio.checked; }).value;
			var comment = $F('userComments');

			var deliveryOptionsObject = Class.create();

			deliveryOptionsObject.prototype = {
				DeliveryTypeID: deliverytypeid,
				DeliveryDate: deliverydate,
				DeliverySlotID: deliveryslot,
				SubstitutionPreferenceID: substitution,
				Comments: comment,
				

				initialize: function(){
				}
			};

			var consumer = new consumerObject();
			var doptions = new deliveryOptionsObject();

			SaveUserInformation(Object.toJSON(consumer), Object.toJSON(doptions));

		}

		function SaveAndRedirect(destination){
			Save();
			UpdateNextStep(<xsl:value-of select="//Order/OrderID" />);

			var errordiv = $('CheckOutUserInformationError');

			if(errordiv.innerHTML.length == 0){
				window.location.replace(destination);
			}
		}
		
	</script>

	<div id="UserInformation">
		<div id="CheckOutSteps">
			<xsl:variable name="currentstepid" select="ExpressLane/UserInformation/Order/CurrentStep/CheckOutStepID" />
			<table style="border-collapse: collapse;">
				<tr>
					<xsl:for-each select="ExpressLane/UserInformation/Order/CheckOutSteps/CheckOutStep">
						<td>
							<span>
								<xsl:if test="CheckOutStepID = $currentstepid">
									<xsl:attribute name="class">CurrentStep</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="Description" />
							</span>
						</td>
					</xsl:for-each>
				</tr>
			</table>
		</div>
		<div id="checkoutHeader">
			<h1><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryInformationTitle" /></xsl:call-template></h1> <br />
			<span class="checkoutInstructions"><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryInformationSubTitle" /></xsl:call-template></span>
		</div>
		<div id="checkoutMain" style="margin-left: auto; margin-right: auto;">
			<div id="CheckOutUserInformation" class="checkoutInfoDiv">
				<h1><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryAddressTitle" /></xsl:call-template></h1>
				<xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryAddressSubTitle" /></xsl:call-template>
				<table>
					<tr>
						<td>First Name:</td>
						<td><input id="txtFirstName" style="width: 200px;" class="jsrequired" alt="First name is required." type="text" /></td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td><input id="txtLastName" style="width: 200px;" class="jsrequired" alt="Last name is required." type="text" /></td>
					</tr>
					<tr>
						<td>Address 1:</td>
						<td><input id="txtAddress1" style="width: 200px;" class="jsrequired" alt="Address1 is required."  type="text" /></td>
					</tr>
					<tr>
						<td>Address 2:</td>
						<td><input id="txtAddress2" style="width: 200px;" type="text" /></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input id="txtCity" style="width: 200px;" class="jsrequired" alt="City is required."  type="text" /></td>
					</tr>
					<tr>
						<td>State:</td>
						<td>
							<select id="stateselect">
								<xsl:for-each select="ExpressLane/UserInformation/ArrayOfState/State">
										<option>
											<xsl:attribute name="value"><xsl:value-of select="StateID" /></xsl:attribute>
											<xsl:value-of select="FullName" />
										</option>
								</xsl:for-each>
							</select>
						</td>
					</tr>
					<tr>
						<td>Zip Code:</td>
						<td><input id="txtZipCode" style="width: 200px;" class="jsrequired jsvalidate_uscanzip" alt="A valid zip code is required." type="text" /></td>
					</tr>
					<tr>
						<td>Phone Number:</td>
						<td><input id="txtPhoneNumber" style="width: 200px;" class="jsrequired jsvalidate_usphone" type="text" /></td>
					</tr>
					<tr>
						<td>Alternate Phone Number:</td>
						<td><input id="txtPhoneNumberAlt" style="width: 200px;" class="jsvalidate_usphone" type="text" /></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input id="txtEmail" style="width: 200px;" class="jsrequired jsvalidate_email"  alt="A valid email is required." type="text" /></td>
					</tr>
					<tr>
						<td>Alternate Email:</td>
						<td><input id="txtEmailAlt" style="width: 200px;" class="jsvalidate_email" type="text" /></td>
					</tr>
				</table>
			</div>
			<div id="CheckOutDeliveryTime" class="checkoutInfoDiv">
					<h1><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryOptionsTitle" /></xsl:call-template></h1>
					<xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSDeliveryOptionsSubTitle" /></xsl:call-template>
					<xsl:for-each select="ExpressLane/UserInformation/ArrayOfDeliveryTimeTemplateType/DeliveryTimeTemplateType">
						<xsl:variable name="idvalue" select="concat('deliverytimetype', position())" />
						<input class="jsrequired" alt="Please select a delivery type">
							<xsl:attribute name="id"><xsl:value-of select="$idvalue" /></xsl:attribute>
							<xsl:attribute name="type">radio</xsl:attribute>
							<xsl:attribute name="name">deliverytimetype</xsl:attribute>
							<xsl:attribute name="value"><xsl:value-of select="DeliveryTimeTemplateTypeID" /></xsl:attribute>
							<xsl:attribute name="onchange">javascript:LoadDeliveryTimes();</xsl:attribute>
						</input>
						<label>
							<xsl:attribute name="for"><xsl:value-of select="$idvalue" /></xsl:attribute>
							<xsl:value-of select="DeliveryTimeTemplateTypeName" />
						</label>
					</xsl:for-each>
					<div id="deliverytimeselection">
					</div>
					<div id="deliveryslotselection">
					</div>
			</div>
			<div id="CheckOutSubstitutionTypes" class="checkoutInfoDiv">
				<h1><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSSubstitutionOptionsTitle" /></xsl:call-template></h1>
				<xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSSubstitutionOptionsSubTitle" /></xsl:call-template>
				<xsl:for-each select="ExpressLane/UserInformation/ArrayOfCheckOutListSubstitutionTypeChain/CheckOutListSubstitutionTypeChain">
					<xsl:sort select="SortOrder" />
					<xsl:variable name="idvalue" select="concat('substitution', position())" />

					<input class="jsrequired" alt="Please select a substitution type">
						<xsl:attribute name="id"><xsl:value-of select="$idvalue" /></xsl:attribute>
						<xsl:attribute name="type">radio</xsl:attribute>
						<xsl:attribute name="name">substitutionchoice</xsl:attribute>
						<xsl:attribute name="value"><xsl:value-of select="CheckOutListSubstitutionTypeChainID" /></xsl:attribute>
					
						<xsl:if test="IsDefault = 'true'">
							<xsl:attribute name="checked" />
						</xsl:if>
					</input>
					<label>
						<xsl:attribute name="for"><xsl:value-of select="$idvalue" /></xsl:attribute>
						<xsl:value-of select="Description" />
					</label>
					<br />
				</xsl:for-each>
			</div>
			<div id="CheckOutOrderComments" class="checkoutInfoDiv">
				<h1><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSOrderCommentsTitle" /></xsl:call-template></h1>
				<p><xsl:call-template name="ChainSettingValue"><xsl:with-param name="SettingID" select="OGSOrderCommentsSubTitle" /></xsl:call-template></p>
				<textarea id="userComments">
					<xsl:attribute name="rows">5</xsl:attribute>
					<xsl:attribute name="cols">40</xsl:attribute>
				</textarea>
			</div>
			<div id="CheckOutButtons" class="group">
				<xsl:for-each select="ExpressLane/UserInformation/Order/CheckOutSteps">
					<xsl:call-template name="Navigation">
						<xsl:with-param name="currentstepstatusid" select="//CurrentStep/CheckOutListStatusID" />
					</xsl:call-template>
				</xsl:for-each>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" for="window" event="onload">
		if(document.addEventListener){
			window.document.addEventListener("DOMContentLoaded", LoadForm, true);
		}
		else{ LoadForm(); }
	</script>	
</xsl:template>

<xsl:template name="DeliveryTimes">
	<select id="deliverytimesselect" onchange="javascript:LoadDeliverySlots();" class="jsrequired select-notfirst" alt="Please select a delivery time">
		<xsl:for-each select="ExpressLane/DeliveryTimes/ArrayOfXmlStringDataWrapper/XmlStringDataWrapper">
			<option>
				<xsl:attribute name="value"><xsl:value-of select="Value1" /></xsl:attribute>
				<xsl:value-of select="Value2" />
			</option>
		</xsl:for-each>
	</select>
</xsl:template>

<xsl:template name="DeliverySlots">
	<xsl:variable name="deliveryslotid" select="//OrderInformation/DeliveryTimeID" />

	<xsl:for-each select="ExpressLane/DeliverySlots/ArrayOfXmlStringDataWrapper/XmlStringDataWrapper">
		<xsl:variable name="idvalue" select="concat('deliveryslot', position())" />

		<input class="jsrequired">
			<xsl:attribute name="id"><xsl:value-of select="$idvalue" /></xsl:attribute>
			<xsl:attribute name="type">radio</xsl:attribute>
			<xsl:attribute name="name">deliveryslotselection</xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="Value1" /></xsl:attribute>

			<xsl:if test="Value1 = $deliveryslotid">
				<xsl:attribute name="checked"></xsl:attribute>
			</xsl:if>
		</input>
		<label>
			<xsl:attribute name="for"><xsl:value-of select="$idvalue" /></xsl:attribute>
			<!--<xsl:attribute name="name">deliveryslotselection</xsl:attribute> -->
			<xsl:value-of select="Value2" />
		</label>
		<br />
	</xsl:for-each>
</xsl:template>

<xsl:template name="Navigation" match="CheckOutSteps">
	<xsl:param name="currentstepstatusid" />
</xsl:template>

<xsl:template name="ChainSettingValue" match="ChainSettings">
	<xsl:param name="SettingName" />

	<xsl:value-of select="Setting[Name = $SettingName]/Value" />
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\Users\amorger\Documents\TestXml\Fest\UserInformation.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->
