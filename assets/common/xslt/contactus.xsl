<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:param name="Consumer" select="ExpressLane/Common/Consumer[IsLoggedIn='true']"/>
		<script type="text/javascript"><![CDATA[
		
		function SubmitContactUs() {
	
			var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
			var emailInput = $('txtEmail');
			
			var emailIsValid = emailValidator.test(emailInput.value);
			var spamInvalid = SpamValidation("txtcommentconcern") || SpamValidation("txtsuggestioncomments");

			if (!emailIsValid) {
					emailInput.className = 'Invalid';
					return;
			}

			if (typeof(SubmitForm) == 'function') {
				emailIsValid = SubmitForm('hfContactXml');
			}

			if (emailIsValid && !spamInvalid) {
				document.forms[0].submit();
			}
		}

        //Validate Text Area for Hyper Links, HTML Tags and Special Symbols
        function SpamValidation(txtfield) {
            var element = document.getElementById(txtfield);
            if(element != null)
            {
                var valueOf = element.value;
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
            }
            return false;
        }
            
		function ResetPage() {

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
		<div id="ContactUs">
			<h2>Contact Us</h2>
			<h3>Customer Details</h3>
			<div id="Contactname">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Name</td>
							<td>
								<input id="txtName" title="FullName" size="40" name="fullname">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/fullname"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="Contactaddress">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Address</td>
							<td>
								<input id="txtAddress" title="Address" size="40" name="address">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/address"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="Contactcity">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">City</td>
							<td>
								<input id="txtCity" title="City" size="40" name="city">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/city"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="Contactstate">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">State</td>
							<td>
								<xsl:variable name="State">
									<xsl:choose>
										<xsl:when test="ExpressLane/ContactUs/formdata/state">
											<xsl:value-of select="ExpressLane/ContactUs/formdata/state" />
										</xsl:when>
										<xsl:when test="$Consumer/State">
											<xsl:value-of select="$Consumer/State" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="//ArrayOfGenericStore/GenericStore[position()=1]//StateAbbreviation" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<select title="State" name="state">
									<option>Select a State</option>
									<xsl:for-each select="ExpressLane/ArrayOfState/State">
										<xsl:sort select="FullName" data-type="text"/>
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Abbreviation"/>
											</xsl:attribute>
											<xsl:if test="Abbreviation = $State">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="FullName"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="Contactzip">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Zip</td>
							<td>
								<input id="txtZip" title="ZipCode" maxLength="5" size="5" name="zipcode">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/zipcode"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="Contactphone">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Phone</td>
							<td>
								<input id="txtAreaCode" title="AreaCode" maxLength="3" size="3" name="areacode">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/areacode"/>
									</xsl:attribute>
								</input>-
								<input id="txtPhoneCity" title="CityCode" maxLength="3" size="3" name="citycode">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/citycode"/>
									</xsl:attribute>
								</input>-
								<input id="txtPhoneHouse" title="HouseCode" maxLength="4" size="4" name="housecode">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/housecode"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="emailaddress">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Email Address</td>
							<td>
								<input id="txtEmail" title="EmailAddress" size="40" name="emailaddress">
									<xsl:attribute name="value">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/emailaddress"/>
									</xsl:attribute>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="ContactStore">
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Store</td>
							<td>
								<xsl:variable name="StoreID">
									<xsl:choose>
										<xsl:when test="number(ExpressLane/ContactUs/formdata/selStore)">
											<xsl:value-of select="ExpressLane/ContactUs/formdata/selStore" />
										</xsl:when>
										<xsl:when test="$Consumer/PrimaryStoreID">
											<xsl:value-of select="$Consumer/PrimaryStoreID" />
										</xsl:when>
									</xsl:choose>
								</xsl:variable>
								<select title="SelectedStore" name="selStore">
									<option>Select a Store</option>
									<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="StoreID"/>
											</xsl:attribute>
											<xsl:if test="$StoreID = StoreID">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="StoreName"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="ComplimentConcern">
				<h3>Compliment or Concern</h3>
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">Do you have a current concern or compliment? If so, please explain:</td>
							<td>
								<textarea id="txtcommentconcern" title="commentconcern" name="commentconcern" rows="4" cols="40">
									<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="GeneralComments">
				<h3>General Comments</h3>
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%">What grocery shopping factors, services, or departments are most important to you?</td>
							<td>
								<table align="left">
									<tbody>
										<tr>
											<td>
												<input id="chkDeli" title="Deli" type="checkbox" value="true" name="deli">
													<xsl:if test="ExpressLane/ContactUs/formdata/deli = 'true' or ExpressLane/ContactUs/formdata/deli = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Deli</xsl:text>
											</td>
											<td>
												<input id="chkOnlineShopping" title="OnlineShopping" type="checkbox" value="true" name="onlineshopping">
													<xsl:if test="ExpressLane/ContactUs/formdata/onlineshopping = 'true' or ExpressLane/ContactUs/formdata/onlineshopping = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Online Shopping</xsl:text>
											</td>
											<td>
												<input id="chkSpecials" title="Specials" type="checkbox" value="true" name="specials">
													<xsl:if test="ExpressLane/ContactUs/formdata/specials = 'true' or ExpressLane/ContactUs/formdata/specials = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Weekly Specials</xsl:text>
											</td>
										</tr>
										<tr>
											<td>
												<input id="chkMeat" title="Meat" type="checkbox" value="true" name="meat">
													<xsl:if test="ExpressLane/ContactUs/formdata/meat = 'true' or ExpressLane/ContactUs/formdata/meat = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Meat</xsl:text>
											</td>
											<td>
												<input id="chkPrice" title="Price" type="checkbox" value="true" name="price">
													<xsl:if test="ExpressLane/ContactUs/formdata/price = 'true' or ExpressLane/ContactUs/formdata/price = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Good Prices</xsl:text>
											</td>
											<td>
												<input id="chkPromotions" title="Promotions" type="checkbox" value="true" name="promotions">
													<xsl:if test="ExpressLane/ContactUs/formdata/promotions = 'true' or ExpressLane/ContactUs/formdata/promotions = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Promotions </xsl:text>
											</td>
										</tr>
										<tr>
											<td>
												<input id="chkProduce" title="Produce" type="checkbox" value="true" name="produce">
													<xsl:if test="ExpressLane/ContactUs/formdata/produce = 'true' or ExpressLane/ContactUs/formdata/produce = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Produce </xsl:text>
											</td>
											<td>
												<input id="chkStoreLocation" title="StoreLocation" type="checkbox" value="true" name="storelocation">
													<xsl:if test="ExpressLane/ContactUs/formdata/storelocation = 'true' or ExpressLane/ContactUs/formdata/storelocation = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Store Location </xsl:text>
											</td>
											<td>
												<input id="chkSelection" title="ItemSelection" type="checkbox" value="true" name="itemselection">
													<xsl:if test="ExpressLane/ContactUs/formdata/itemselection = 'true' or ExpressLane/ContactUs/formdata/itemselection = 'on'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
												</input>
												<xsl:text> Good Item Selection</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="DoWeMeetNeeds">
				<h3>Do we meet your grocery shopping needs?</h3>
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%"/>
							<td>
								<input id="rbMeetNeedsYes" title="MeetNeedsYes" type="radio" value="Yes" name="meetneeds">
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsyes = 'true' or ExpressLane/ContactUs/formdata/meetneedsyes = 'Yes'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Yes </xsl:text>
								</input>
								<input id="rbMeetNeedsMost" title="MeetNeedsMostOftheTime" type="radio" value="Most Of The Time" name="meetneeds">
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'true' or ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'Yes'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Most Of The Time </xsl:text>
								</input>
								
								<input id="rbMeetNeedsSeldom" title="MeetNeedsSeldom" type="radio" value="Seldom" name="meetneeds">
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsseldom = 'true' or ExpressLane/ContactUs/formdata/meetneedsseldom = 'Yes'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Seldom </xsl:text>
								</input>
								
								<input id="rbMeetNeedsNo" title="MeetNeedsNo" type="radio" value="No" name="meetneeds">
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsno = 'true' or ExpressLane/ContactUs/formdata/meetneedsno = 'Yes'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> No </xsl:text>
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="FurtherSuggestions">
				<h3>Any further suggestions or comments for us?</h3>
				<table width="70%" border="0">
					<tbody>
						<tr>
							<td align="right" width="30%"/>
							<td>
								<textarea id="txtsuggestioncomments" title="suggestioncomments" name="suggestioncomments" rows="4" cols="40">
									<xsl:value-of select="ExpressLane/ContactUs/formdata/suggestioncomments"/>
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<a class="button" href="javascript:SubmitContactUs();">
					<span>Submit your comments</span>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>