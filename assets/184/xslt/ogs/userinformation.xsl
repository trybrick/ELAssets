<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/UserInformation">
				<xsl:call-template name="MainContent"/>
			</xsl:when>
			<xsl:when test="ExpressLane/DeliveryTimes">
				<xsl:call-template name="DeliveryTimes"/>
			</xsl:when>
			<xsl:when test="ExpressLane/DeliverySlots">
				<xsl:call-template name="DeliverySlots"/>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="MainContent">
		<script type="text/javascript" src="/Assets/Common/js/jsvalidate.js"></script>
		<script type="text/javascript" src="/Assets/Common/js/OGS/UserInformation.js"></script>
		<script type="text/javascript" src="/Assets/Common/js/OGS/DeliveryZones/DeliveryZone.js"></script>
		<script type="text/javascript">
			function LoadForm(){
				LoadUserInformation();
				LoadExistingDeliveryFee();
			}

			if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
			var GSNPageItems = new Object();
			}

			GSNPageItems.UserInformation = {
				IDs: {
					Form: 'aspnetForm'
				}
			};

			var userInformation_NextPage;

			function DisplayDeliveryFee(zone, fee){
			var zoneDisplay = 'Delivery zone: %s';
			var feeDisplay = 'Delivery fee: $%s';

			if (zone == 'Pickup') {
			feeDisplay = 'Pickup fee: $%s';
			}

			var feeString = fee.toString();

			zoneDisplay = zoneDisplay.replace('%s', zone);
			feeDisplay = feeDisplay.replace('%s', fee);

			$('deliveryfeedisplay').innerHTML = '<p>' + zoneDisplay + '<br/>' + feeDisplay + '</p>';
			$('deliveryfeedisplay').show();
			
			$('hdnFeeSelected').value = "true";
			$('feeErrorMsg').hide();

			if(myLightWindow != null){
				myLightWindow.deactivate();
			}
		}
		
		function LoadExistingDeliveryFee(){
			var zone;
			var fee = '<xsl:value-of select="//OrderInformation/AppliedDeliveryFee"/>';

			<xsl:if test="number(//OrderInformation/AppliedDeliveryFee)">
				<xsl:variable name="Fee" select="floor(//OrderInformation/AppliedDeliveryFee)"/>

				<xsl:for-each select="//DeliveryZones/DeliveryZone">
					<xsl:if test="floor(DeliveryFee) = $Fee">zone = '<xsl:value-of select="ShortTitle"/>';</xsl:if>
				</xsl:for-each>
			</xsl:if>if(zone){
				DisplayDeliveryFee(zone, fee);
				$('hdnFeeSelected').value = "true";

			}
		}

		function LoadUserInformation(){
			<xsl:if test="count(//DeliverySchedule/Types/DeliverySlotType) &gt; 0">LoadDeliveryTimes();</xsl:if>}

		function GetDeliverySlotType() {
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

			return rdobtnValue;
		}

		function LoadDeliveryTimes(){
		
			$('deliveryslotselection').hide();
			$('hdnFeeSelected').value = 'false';

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

			ShowHideDeliveryZoneLink();
			ShowHideUpdateProgress();
			
			if(rdobtnValue == 2){
				globalZone = 'Pickup';
				globalFee = '0';
				
				DisplayDeliveryFee('Pickup', 7.91);
				var orderid = <xsl:value-of select="//Order/OrderID"/>;

			var requestArgs = GSNContext.RequestArguments;
			var url = document.URL;
			GetDeliveryZoneAddDeliveryFee(url, requestArgs, orderid, 7.91, null, null);

			}
			else{
			$('deliveryfeedisplay').hide();
			}

			if(rdobtnValue != undefined){
			GetDeliveryDates(rdobtnValue);
			}

			LoadExistingDeliveryTime();
			}

			function LoadDeliveryDates(){
			var dates = [];

			<xsl:for-each select="//DeliverySchedule/Dates/string">dates.push('<xsl:value-of select="."/>');</xsl:for-each>}

		function LoadExistingDeliveryTime(){
			var current = '<xsl:value-of select="//OrderInformation/DeliveryDateDisplay"/>';
			
			if(current.length &gt; 0){
				var dates = $('deliverytimesselect');
				
				if(dates != null){
					for(var a = 0; a &lt; dates.options.length; a++){
						var date = dates.options[a];
						
						if(current.include(date.text) > 0){
							date.selected = true; 
						}
					}
					
					if(dates.selectedIndex > 0){
						LoadDeliverySlots();
					}
				}
			}
		}
		
		function LoadDeliverySlots(){
			var deliverytimeid;

			ShowHideUpdateProgress();

			<xsl:choose>
				<xsl:when test="number(//OrderInformation/DeliverySlotItemID)">deliverytimeid = <xsl:value-of select="//OrderInformation/DeliverySlotItemID"/>;</xsl:when>
				<xsl:otherwise>deliverytimeid = -1;</xsl:otherwise>
			</xsl:choose>var dates = $('deliverytimesselect');
			var slotDate;

			for(i = 0; i &lt; dates.options.length; i++){
				var option = dates.options[i];

				if(option.selected){
					slotDate = option.value;
				}
			}
			
			$('deliveryslotselection').show();

			var deliverySlotType = GetDeliverySlotType();

			if(slotDate != undefined){

				GetDeliverySlots(deliverySlotType, slotDate, deliverytimeid);
			}
			
			LoadExistingDeliverySlots();
		}		

		function LoadExistingDeliverySlots(){
			var deliveryslotitemid;

			<xsl:choose>
				<xsl:when test="number(//OrderInformation/DeliverySlotItemID)">deliveryslotitemid = new Number(<xsl:value-of select="//OrderInformation/DeliverySlotItemID"/>);</xsl:when>
				<xsl:otherwise>deliveryslotitemid = new Number(-1);</xsl:otherwise>
			</xsl:choose>
			
			var slots = Form.getInputs(GSNPageItems.UserInformation.IDs.Form,'radio','deliveryslotselection');

			for(i = 0; i &lt; slots.length; i++){
				var option = slots[i];

				if(deliveryslotitemid == option.value){
					option.checked = true;
				}
			}
		}

		function Save(){

			var valid = validateFields('aspnetForm');

			var errordiv = $('CheckOutUserInformationError');
			
			var feeSelected = $('hdnFeeSelected').value;
			
			if(feeSelected != 'true'){
				valid = false;
				$('feeErrorMsg').show();
			}
			else{
				$('feeErrorMsg').hide();
			}

			if(!valid){
				errordiv.innerHTML = '<p style="color: red;">Your information could not be saved.  Please review this form and try again.</p>';
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
				ConsumerID: <xsl:value-of select="ExpressLane/GenericConsumer/ConsumerID"/>,
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

			var deliverytypeid = Form.getInputs(GSNPageItems.UserInformation.IDs.Form,'radio','deliverytimetype').find(function(radio) { return radio.checked; }).value;
			var deliverydate = $F('deliverytimesselect');
			var deliveryslot = Form.getInputs(GSNPageItems.UserInformation.IDs.Form,'radio','deliveryslotselection').find(function(radio) { return radio.checked; }).value;
			var substitution = Form.getInputs(GSNPageItems.UserInformation.IDs.Form,'radio','substitutionchoice').find(function(radio) { return radio.checked; }).value;
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
			var valid = validateFields(GSNPageItems.UserInformation.IDs.Form);
			
			var feeSelected = $('hdnFeeSelected').value;
			
			if(feeSelected != 'true'){
				valid = false;
				$('feeErrorMsg').show();
			}
			else{
				$('feeErrorMsg').hide();
			}

			if(valid){
				userInformation_NextPage = function() { Redirect(destination); };

				Save();				
			}else{
				var errordiv = $('CheckOutUserInformationError');
				errordiv.innerHTML = '<p style="color: red;">Your information could not be saved.  Please review this form and try again.</p>';
			}
		}
		
		function Redirect(destination){
			UpdateNextStep(<xsl:value-of select="//Order/OrderID"/>);
		}

		var deliveryZoneLightWindow = null;

		function ShowDeliveryZones(){
			if(deliveryZoneLightWindow == null){
				deliveryZoneLightWindow = new lightwindow();
			}
			deliveryZoneLightWindow.activateWindow({
				href: '/CheckOut/DeliveryZone/Default.aspx',
				title: 'Delivery Zones',
				iframeEmbed: true,
				width: 850
			});
		}
		
		function ShowHideDeliveryZoneLink() {
			
			var deliveryTypeID = GetDeliverySlotType();
			var deliveryZoneLink = $('deliveryzoneslink');

			if (deliveryTypeID == 2) {
				deliveryZoneLink.hide();
			}
			else {
				deliveryZoneLink.show();
			}
		}
		
		function ShowHideUpdateProgress() {

			if ($('UpdateProgress1').visible()) {
				$('UpdateProgress1').hide();
			}
			else {
				$('UpdateProgress1').show();
			}
		}
		</script>

		<script type="text/javascript" for="window" event="onload">
			if (document.all) { LoadForm(); }
			else { window.document.addEventListener("DOMContentLoaded", LoadForm, true); } //firefox
			setTimeout(LoadDeliveryTimes,500);
		</script>
		<div id="UserInformation">
			<div class="checkoutHeader">
				<h1>Delivery Information</h1>
				<span class="checkoutInstructions">Please provide a delivery address and select a delivery/pick-up time.</span>
				<span class="checkoutInstructions">* indicates a required field.</span>
			</div>
			<div id="checkoutMain" style="margin-left: auto; margin-right: auto;">
				<div id="CheckOutUserInformation" class="checkoutInfoDiv">

					<xsl:variable name="Consumer" select="//GenericConsumer"/>

					<h1>Delivery Address</h1>
                    <table>
                    <tr>
                        <td><label for="txtFirstName">*First Name:</label></td>
                        <td><input id="txtFirstName" class="jsrequired" type="text" value="{$Consumer/FirstName}"/></td>
                    </tr>
                    <tr>
                        <td><label for="txtLastName">*Last Name:</label></td>
                        <td><input id="txtLastName" class="jsrequired" type="text" value="{$Consumer/LastName}"/></td>
					</tr>
					<tr>
                        <td><label for="txtAddress1">*Address 1:</label></td>
                        <td><input id="txtAddress1" class="jsrequired" type="text" value="{$Consumer/PrimaryAddress}"/></td>
					</tr>
					<tr>
                        <td><label for="txtAddress2">Address 2:</label></td>
                        <td><input id="txtAddress2" type="text" value="{$Consumer/SecondaryAddress}"/></td>
                    </tr>
                    <tr>
                        <td><label for="txtCity">*City:</label></td>
                        <td><input id="txtCity" class="jsrequired" type="text" value="{$Consumer/City}"/></td>
					</tr>
					<tr>
                        <td><label for="stateselect">State:</label></td>
                        <td><select id="stateselect">
								<xsl:for-each select="ExpressLane/UserInformation/ArrayOfState/State">
									<option>
										<xsl:attribute name="value">
						    				<xsl:value-of select="StateID"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="$Consumer/State">
												<xsl:if test="Abbreviation = $Consumer/State">
													<xsl:attribute name="selected">true</xsl:attribute>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="StateID = //ExpressLane/GenericStore/StateID">
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
                        <td><label for="txtZipCode">*Zip Code:</label></td>
                        <td><input id="txtZipCode" class="jsrequired jsvalidate_uscanzip" type="text" value="{$Consumer/PostalCode}"/></td>
					</tr>
					<tr>
                        <td><label for="txtPhoneNumber">*Phone Number:</label></td>
                        <td><input id="txtPhoneNumber" class="jsrequired jsvalidate_usphone" type="text" value="{$Consumer/Phone}"/></td>
					</tr>
					<tr>
                        <td><label for="txtPhoneNumberAlt">Alternate Phone Number:</label></td>
                        <td><input id="txtPhoneNumberAlt" type="text"/></td>
					</tr>
					<tr>
                        <td><label for="txtEmail">Email:</label></td>
                        <td><input id="txtEmail" class="jsrequired jsvalidate_email" type="text" value="{$Consumer/Email}"/></td>
					</tr>
					<tr>
                        <td><label for="txtEmailAlt">Alternate Email:</label></td>
                        <td><input id="txtEmailAlt" type="text" /></td>
                    </tr>
                    </table>
				</div>
				<div id="CheckOutDeliveryTime" class="checkoutInfoDiv group">
						<h1>Delivery/Pickup Options:</h1>
						<div id="deliveryZones" class="group">
							<xsl:variable name="currentstoreid" select="ExpressLane/GenericConsumer/PrimaryStoreID"/>

							<div class="deliverytypes deliverydetails">1. Choose one <br/>
								<xsl:for-each select="//DeliverySchedule/Types/DeliverySlotType">
									<xsl:sort select="Description"/>
									<xsl:variable name="idvalue" select="concat('deliveryslottype', position())"/>
									<input id="{$idvalue}" class="jsrequired" alt="*Required" type="radio" name="deliverytimetype" onchange="javascript:LoadDeliveryTimes();" value="{DeliverySlotTypeID}">
										<xsl:if test="position() = 1">
											<xsl:attribute name="checked"></xsl:attribute>
										</xsl:if>
									</input>
									<label for="{$idvalue}">
										<xsl:value-of select="Description"/>
									</label>
									<br/>
								</xsl:for-each>
							</div>
							<div class="deliverytimes deliverydetails">2. Choose Date <br/>
								<div id="deliverytimeselection"></div>
							</div>

							<div class="deliveryslots deliverydetails">3. Choose Avaliable Time <br/>
								<ul id="deliveryslotselection"></ul>
							</div>
						</div>
						<br/>
						<div id="deliveryzones">
							<xsl:variable name="dzonelink" select="/Checkout/DeliveryZone/Default.aspx"/>
							<a id="deliveryzoneslink">
								<xsl:attribute name="class">lightwindow</xsl:attribute>
								<xsl:attribute name="href">/Checkout/DeliveryZone/Default.aspx</xsl:attribute>
								<xsl:attribute name="style">margin:0</xsl:attribute>
								<xsl:attribute name="params">lightwindow_type=external,lightwindow_width=950</xsl:attribute>Click Here to choose your delivery zone</a>

							<div id="feeErrorMsg" style="display:none;">
								<p style="color: red;">*Required Please select a delivery zone.</p>
							</div>
						</div>
						<div id="deliveryfeedisplay"></div>
						<input id="hdnFeeSelected" type="hidden" value=""/>
						<div style="display:none;" id="UpdateProgress1">
						    <div id="ProcessingPanel" style="width:auto;">
								<img src="/Assets/Common/Images/Wait.gif" style="marging:auto auto;" alt="Wait" />
                                <xsl:text>Processing&#8230;</xsl:text>
							</div>
						</div>
						<p>Note: Orders to be picked up on Saturday need to be placed by noon on Friday. Please drive to the Parcel Pickup area and pull in front of the Brat Barn and your groceries will be brought out to you at your scheduled time.</p>
						<p>We will not leave deliveries unattended, so please arrange for someone over the age of 18 to be present. If no one is home at the time of delivery, the driver will leave an attempted delivery form and return your items to the store. You will then need to contact the Festival Foods Online Shopper (336-6520) to arrange a new delivery time or pickup time. **Please note that if a new delivery time is chosen an additional delivery fee will need to be paid.</p>

						<p>Requests to change delivery time must be made 2 hours prior by contacting the Online Shopper. Thank You.</p>
				</div>
				<div id="CheckOutSubstitutionTypes" class="checkoutInfoDiv">
					<h1>Substitution Preferences</h1>
					<xsl:for-each select="ExpressLane/UserInformation/ArrayOfCheckOutListSubstitutionTypeChain/CheckOutListSubstitutionTypeChain">
						<xsl:sort select="SortOrder"/>
						<xsl:variable name="idvalue" select="concat('substitution', position())"/>

						<input class="jsrequired" alt="Please select a substitution type">
							<xsl:attribute name="id">
								<xsl:value-of select="$idvalue"/>
							</xsl:attribute>
							<xsl:attribute name="type">radio</xsl:attribute>
							<xsl:attribute name="name">substitutionchoice</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="CheckOutListSubstitutionTypeChainID"/>
							</xsl:attribute>

							<xsl:if test="IsDefault = 'true'">
								<xsl:attribute name="checked"/>
							</xsl:if>
						</input>
						<label>
							<xsl:attribute name="for">
								<xsl:value-of select="$idvalue"/>
							</xsl:attribute>
							<xsl:value-of select="Description"/>
						</label>
						<br/>
					</xsl:for-each>
				</div>
				<div id="CheckOutOrderComments" class="checkoutInfoDiv">
					<h1>Order Comments:</h1>
					<p>Place any comments you would like associated with your order below.</p>
					<textarea id="userComments">
						<xsl:attribute name="rows">5</xsl:attribute>
						<xsl:attribute name="cols">40</xsl:attribute>
						<xsl:value-of select="//Order/OrderInformation/Comment" />
					</textarea>
				</div>
				<div id="CheckOutButtons">
					<xsl:for-each select="ExpressLane/UserInformation/Order/CheckOutSteps">
						<xsl:call-template name="Navigation">
							<xsl:with-param name="currentstepstatusid" select="//CurrentStep/CheckOutListStatusID"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="DeliveryTimes">
		<select id="deliverytimesselect" onchange="javascript:LoadDeliverySlots();" class="jsrequired select-notfirst">
			<xsl:for-each select="//DeliveryTimes/ArrayOfString/string">
				<xsl:if test="position() = 1">
					<option>
						<xsl:attribute name="value"></xsl:attribute>
						<xsl:text></xsl:text>
					</option>
				</xsl:if>
				<option>
					<xsl:attribute name="value">
						<xsl:value-of select="."/>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</option>
			</xsl:for-each>
		</select>
	</xsl:template>

	<xsl:template name="DeliverySlots">
		<xsl:variable name="deliveryslotid" select="//OrderInformation/DeliveryTimeID"/>
		    <xsl:for-each select="//DeliverySlots/ArrayOfDeliverySlot/DeliverySlot">
			    <xsl:variable name="idvalue" select="concat('deliveryslot', position())"/>
                <li>
                    <input id="{$idvalue}" class="jsrequired" type="radio" name="deliveryslotselection" value="{DeliverySlotItemID}">
				        <xsl:if test="Value1 = $deliveryslotid">
					        <xsl:attribute name="checked">checked</xsl:attribute>
				        </xsl:if>
		    	    </input>
                    <label for="{$idvalue}">
				        <xsl:value-of select="Message"/>
                    </label>
                </li>
            </xsl:for-each>
	</xsl:template>

	<xsl:template name="Navigation" match="CheckOutSteps">
		<xsl:param name="currentstepstatusid"/>

		<xsl:variable name="currentstep" select="CheckOutStep[CheckOutListStatusID = $currentstepstatusid]"/>
		<xsl:variable name="previousstep" select="$currentstep/preceding-sibling::*[1]"/>
		<xsl:variable name="nextstep" select="$currentstep/following-sibling::*[1]"/>

		<div id="CheckOutUserInformationError"></div>
            <a class="button" href="{concat(//GenericChain/PreferedHost, '/Shop/ManageList.aspx')}">
				<span>Cancel</span>
			</a>
            <a class="button" onclick="Save();" href="javascript:void();">
                <span>Save</span>
			</a>
            <a class="button" href="javascript:void();">
                <xsl:attribute name="onclick">
                    <xsl:text>SaveAndRedirect('</xsl:text><xsl:value-of select="nextstep/PageName" /><xsl:text>')</xsl:text>
                </xsl:attribute>
				<span>Continue Checkout</span>
			</a>
    </xsl:template>
</xsl:stylesheet>
<!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
