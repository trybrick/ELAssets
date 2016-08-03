<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
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
 				}


				if (emailIsValid && typeof(SubmitForm) == 'function') {
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

			function togglePanelOptionalInfo(){
				Element.toggleClassName('toggler', 'accordionActive');
			    Effect.toggle('PanelOptionalInfo','blind', {duration: 1.0});
			}	
		]]>
		</script>
		<input type="hidden" name="staticpagetypeid">
			<xsl:attribute name="value">
				<xsl:value-of select="ExpressLane/StaticPageType/StaticPageTypeID"/>
			</xsl:attribute>
		</input>
		<div id="ContactUs" class="main-wrapper">

			<div id="Contact">
				<h2>Contact Us</h2>
				<div class="ContactInput">
					<p>Please use this form to send us your comments.</p>
					<p>
						<b>Enter your email address here:</b>
					</p>
					<span>
						<input id="txtEmail" title="EmailAddress" size="40" name="emailaddress">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="ExpressLane/ContactUs/formdata/emailaddress">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/emailaddress"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Consumer/Email"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
						<xsl:text>&#xA0;</xsl:text>
						<span style="color:red;float:right;">*</span>
					</span>
				</div>
				<p style="font-style:italic; clear:both; float:left; color:red;">*Required</p>
				<div class="ContactInput">
					<p>Do you have a concern or compliment? If so, please explain.</p>
					<span>
						<textarea id="txtcommentconcern" title="commentconcern" name="commentconcern" rows="4" cols="40">
							<xsl:attribute name="value">
								<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
							</xsl:attribute>
						</textarea>
					</span>
				</div>
			</div>
			<div id="ExpandButton">
				<div class="ContactInput">
					<span class="txtLabel">Store:</span>
					<span>
						<select title="SelectedStore" name="selectedstorevalue">
							<option>Select a Store</option>
							<xsl:for-each select="//ArrayOfGenericStore/GenericStore">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="StoreID"/>
									</xsl:attribute>
									<xsl:if test="../../Consumer/PrimaryStoreID = StoreID">
										<xsl:attribute name="selected">true</xsl:attribute>
									</xsl:if>
									<xsl:if test="../formdata/selectedstorevalue = StoreID">
										<xsl:attribute name="selected">true</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="StoreName"/>
								</option>
							</xsl:for-each>
						</select>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">Name:</span>
					<span>
						<input id="txtName" title="FullName" size="40" name="fullname">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="ExpressLane/ContactUs/formdata/fullname">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/fullname"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($Consumer/FirstName, ' ', $Consumer/LastName)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">Address:</span>
					<span>
						<input id="txtAddress" title="Address" size="40" name="address">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="ExpressLane/ContactUs/formdata/address">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/address"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Consumer/PrimaryAddress"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">City:</span>
					<span>
						<input id="txtCity" title="City" size="40" name="city">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="ExpressLane/ContactUs/formdata/city">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/city"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Consumer/City"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">State:</span>
					<span>
						<select title="State" name="statevalue">
							<option>Select a State</option>
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
											<xsl:if test="Abbreviation=//ArrayOfGenericStore/GenericStore[position()=1]//StateAbbreviation">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:value-of select="FullName"/>
								</option>
							</xsl:for-each>
						</select>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">Zip:</span>
					<span>
						<input id="txtZip" title="ZipCode" maxLength="5" size="5" name="zipcode">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="ExpressLane/ContactUs/formdata/zipcode">
										<xsl:value-of select="ExpressLane/ContactUs/formdata/zipcode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Consumer/PostalCode"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
					</span>
				</div>
				<div class="ContactInput">
					<span class="txtLabel">Phone:</span>
					<span>
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
					</span>
				</div>
				<div class="ContactInput">
					<h3>What grocery shopping factors, services, or departments are most important to you?</h3>
					<span class="factors">
						<table>
							<tbody>
								<tr>
									<td>
										<input id="chkDeli" title="Deli" type="checkbox" value="true" name="deli">
											<xsl:if test="ExpressLane/ContactUs/formdata/deli = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Deli</xsl:text>
										</input>
									</td>
									<td>
										<input id="chkOnlineShopping" title="OnlineShopping" type="checkbox" value="true" name="onlineshopping">
											<xsl:if test="ExpressLane/ContactUs/formdata/onlineshopping = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Online Shopping</xsl:text>
										</input>
									</td>
									<td>
										<input id="chkSpecials" title="Specials" type="checkbox" value="true" name="specials">
											<xsl:if test="ExpressLane/ContactUs/formdata/specials = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Weekly Specials</xsl:text>
										</input>
									</td>
								</tr>
								<tr>
									<td>
										<input id="chkMeat" title="Meat" type="checkbox" value="true" name="meat">
											<xsl:if test="ExpressLane/ContactUs/formdata/meat = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Meat</xsl:text>
										</input>
									</td>
									<td>
										<input id="chkPrice" title="Price" type="checkbox" value="true" name="price">
											<xsl:if test="ExpressLane/ContactUs/formdata/price = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Good Prices</xsl:text>
										</input>
									</td>
									<td>
										<input id="chkPromotions" title="Promotions" type="checkbox" value="true" name="promotions">
											<xsl:if test="ExpressLane/ContactUs/formdata/promotions = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Promotions </xsl:text>
										</input>
									</td>
								</tr>
								<tr>
									<td>
										<input id="chkProduce" title="Produce" type="checkbox" value="true" name="produce">
											<xsl:if test="ExpressLane/ContactUs/formdata/produce = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Produce </xsl:text>
										</input>
									</td>
									<td>
										<input id="chkStoreLocation" title="StoreLocation" type="checkbox" value="true" name="storelocation">
											<xsl:if test="ExpressLane/ContactUs/formdata/storelocation = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Store Location </xsl:text>
										</input>
									</td>
									<td>
										<input id="chkSelection" title="ItemSelection" type="checkbox" value="true" name="itemselection">
											<xsl:if test="ExpressLane/ContactUs/formdata/itemselection = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Good Item Selection</xsl:text>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</span>
				</div>
				<div class="ContactInput">
					<h3>Do we meet your grocery shopping needs?</h3>
					<div>
						<table>
							<tbody>
								<tr>
									<td>
										<input id="rbMeetNeedsYes" title="MeetNeedsYes" type="radio" value="Yes" name="meetneeds">
											<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsyes = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Yes </xsl:text>
										</input>
										<input id="rbMeetNeedsMost" title="MeetNeedsMostOftheTime" type="radio" value="Most Of The Time" name="meetneeds">
											<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Most Of The Time </xsl:text>
										</input>
										<input id="rbMeetNeedsSeldom" title="MeetNeedsSeldom" type="radio" value="Seldom" name="meetneeds">
											<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsseldom = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> Seldom </xsl:text>
										</input>
										<input id="rbMeetNeedsNo" title="MeetNeedsNo" type="radio" value="No" name="meetneeds">
											<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsno = 'true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
											<xsl:text> No </xsl:text>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="ContactInput">
					<h3>Any further suggestions or comments for us?</h3>
					<div>
						<textarea id="txtsuggestioncomments" title="suggestioncomments" name="suggesioncomments" rows="4" cols="40">
							<xsl:value-of select="ContactUs/formdata/suggestioncomments"/>
						</textarea>
					</div>

					<!-- static content -->
					<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
						<div class="StaticContent">
							<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
								<xsl:sort select="SortBy" data-type="number"/>
								<xsl:value-of select="Description" disable-output-escaping="yes"/>
							</xsl:for-each>
						</div>
					</xsl:if>

					<div class="Buttons">
						<a class="button submit" href="javascript:SubmitContactUs();">
							<span>Submit</span>
						</a>
						<a class="button reset" href="javascript:ResetPage();">
							<span>Reset</span>
						</a>
						<a class="button cancel" href="javascript:CancelPage();">
							<span>Cancel</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>