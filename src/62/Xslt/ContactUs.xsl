<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<script id="jsDivContent" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
				function HideContent(d) {
					document.getElementById(d).style.display = "none";
					document.getElementById(d).style.visibility="hidden";
				}

				function ShowContent(d) {
					document.getElementById(d).style.display = "block";
					document.getElementById(d).style.visibility="visible";
				}

				function showContactUs()
				{
					HideContent("LoyaltyCard");
					HideContent("CakeOrder");
					ShowContent("ContactUs");
					setTxtBxText("Contact");
				}

				function showLoyaltyCard()
				{
					HideContent("ContactUs");
					HideContent("CakeOrder");
					ShowContent("LoyaltyCard");
					setTxtBxText("Loyalty");
				}

				function showCakeOrder()
				{
					HideContent("LoyaltyCard");
					HideContent("ContactUs");
					ShowContent("CakeOrder");
					setTxtBxText("Cake");
				}

				function setTxtBxText(txt)
				{
					var txtbx = document.getElementById("formtype");
					txtbx.value = txt;
				}
        
        function getParameter (parameterName) 
        {
            var parameterName = parameterName + "=";
            var queryString = window.top.location.search.substring(1);
            
            if ( queryString.length > 0 ) 
            {
              begin = queryString.indexOf ( parameterName );
              if ( begin != -1 ) 
              {
                begin += parameterName.length;
                end = queryString.indexOf ( "&" , begin );
                
                if ( end == -1 ) 
                {
                  end = queryString.length
                }
                
                return unescape ( queryString.substring ( begin, end ) );
              }
              
              return "null";
            }
        }
        
        function pageRedirect()
        {
          var parameter = getParameter('page');
          
          if(parameter == 'Contact')
          {
            showContactUs();
          } else if(parameter == 'Cake')
          {
            showCakeOrder();
          } else if(parameter == 'Loyalty')
          {
            showLoyaltyCard();
          } else
          {
            showContactUs();
          }
        }
          

	]]>
			</xsl:comment>
		</script>
		<script type="text/javascript"><![CDATA[
			
			function SubmitContactUs() {
		
				var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
				var emailInput = $('txtEmail');
				
				var emailIsValid = emailValidator.test(emailInput.value);
				
				//Validate Text Area
				var txtTextAreaInvalid, spamInvalid = false;
				txtTextAreaInvalid = TextAreaValidation("txtcommentconcern");
				spamInvalid = SpamValidation("txtcommentconcern") || SpamValidation("txtcakeorder1text") || SpamValidation("txtcakeorder3text");
				if(!txtTextAreaInvalid || !spamInvalid) {
					txtTextAreaInvalid = TextAreaValidation("txtsuggestioncomments");
					spamInvalid = SpamValidation("txtsuggestioncomments");
				}
				
				
				if (!emailIsValid) {
 					emailInput.className = 'Invalid';
					return;
 				}

				if (typeof(SubmitForm) == 'function') {
					emailIsValid = SubmitForm('hfContactXml');
				}

				if (emailIsValid) {
					emailInput.className = '';
					if(!txtTextAreaInvalid && !spamInvalid) {
						document.forms[0].submit();
					}
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
		<div style="clear:both;">
			<xsl:variable name="formtype"/>
			<div id="linkButtons">
				<table align="center" width="50%">
					<tr>
						<td width="33%">
							<a class="button" onclick="javascript:showContactUs()"><span style="font-size:12px;">Contact Us</span></a>
						</td>
						<td width="33%">
							<a class="button" onclick="javascript:showLoyaltyCard()"><span style="font-size:12px;">Club Card</span></a>
						</td>
						<td width="33%">
							<a class="button" onclick="javascript:showCakeOrder()"><span style="font-size:12px;">Order a Cake</span></a>
						</td>
					</tr>
				</table>
			</div>
			<div id="ContactUs">
				<h1>Contact Us</h1>
				<h2>Customer details</h2>
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
									<select title="State" name="selState">
										<xsl:for-each select="ExpressLane/ArrayOfState/State">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="Abbreviation"/>
												</xsl:attribute>
												<xsl:if test="ExpressLane/ContactUs/formdata/statevalue = .">
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
									</input>&#xA0;
									<font color="#ff0000">*</font>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="storeselector">
					<table width="70%" border="0">
						<tbody>
							<tr>
								<td align="right" width="30%">Store</td>
								<td>
									<select title="SelectedStore" name="selStore">
										<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="StoreID"/>
												</xsl:attribute>
												<xsl:if test="//GenericConsumer/PrimaryStoreID = StoreID">
													<xsl:attribute name="selected">true</xsl:attribute>
												</xsl:if>
												<xsl:if test="//formdata/selectedstorevalue = StoreID">
													<xsl:attribute name="selected">true</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="StoreName"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of select="StoreNumber"/>
											</option>
										</xsl:for-each>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="complimentconcern">
					<h2>Compliment or Concern</h2>
					<table width="70%" border="0">
						<tbody>
							<tr>
								<td align="right" width="30%">Do you have a current concern or compliment? If so, please explain:</td>
								<td>
									<textarea id="txtcommentconcern" title="commentconcern" name="commentconcern">
										<xsl:attribute name="value">
											<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
										</xsl:attribute>
									</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="generalcomments">
					<h2>General Comments</h2>
					<table width="70%" border="0">
						<tbody>
							<tr>
								<td align="right" width="30%">What grocery shopping factors, services, or departments are most important to you?</td>
								<td>
									<table align="center">
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
													<input id="chkOnlineShopping" title="OnlineShopping" type="checkbox" value="true" name="onlineshopping"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/onlineshopping = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Online Shopping</xsl:text>
												</td>
												<td>
													<input id="chkSpecials" title="Specials" type="checkbox" value="true" name="specials"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/specials = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Weekly Specials</xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<input id="chkMeat" title="Meat" type="checkbox" value="true" name="meat"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/meat = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Meat</xsl:text>
												</td>
												<td>
													<input id="chkPrice" title="Price" type="checkbox" value="true" name="price"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/price = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Good Prices</xsl:text>
												</td>
												<td>
													<input id="chkPromotions" title="Promotions" type="checkbox" value="true" name="promotions"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/promotions = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Promotions </xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<input id="chkProduce" title="Produce" type="checkbox" value="true" name="produce"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/produce = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Produce </xsl:text>
												</td>
												<td>
													<input id="chkStoreLocation" title="StoreLocation" type="checkbox" value="true" name="storelocation"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/storelocation = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
													<xsl:text> Store Location </xsl:text>
												</td>
												<td>
													<input id="chkSelection" title="ItemSelection" type="checkbox" value="true" name="itemselection"/>
													<xsl:if test="ExpressLane/ContactUs/formdata/itemselection = 'true'">
														<xsl:attribute name="checked">checked</xsl:attribute>
													</xsl:if>
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
				<div id="meetneeds">
					<h2>Do we meet your grocery shopping needs?</h2>
					<table width="70%" border="0">
						<tbody>
							<tr>
								<td align="right" width="30%"/>
								<td>
									<input id="rbMeetNeedsYes" type="radio" value="Yes" name="meetneedsyes"/>
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsyes = 'true'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Yes </xsl:text>
									<input id="rbMeetNeedsMost" type="radio" value="Most Of The Time" name="meetneedsmostofthetime"/>
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'true'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Most Of The Time </xsl:text>
									<input id="rbMeetNeedsSeldom" type="radio" value="Seldom" name="meetneedsseldom"/>
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsseldom = 'true'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> Seldom </xsl:text>
									<input id="rbMeetNeedsNo" type="radio" value="No" name="meetneedsno"/>
									<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsno = 'true'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:text> No </xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="furthercomments">
					<h2>Any further suggestions or comments for us?</h2>
					<table width="70%" border="0">
						<tbody>
							<tr>
								<td align="right" width="30%"/>
								<td>
									<textarea id="txtsuggestioncomments" title="suggestioncomments" name="suggestioncomments">
										<xsl:value-of select="ContactUs/formdata/suggestioncomments"/>
									</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="LoyaltyCard">
				<h1>Ted's IGA ClubCard Application</h1>
				<div id="contactinformation">
					<h2>Customer details</h2>
					<div id="Contactname">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Name</td>
									<td>
										<input id="txtName" title="LoyaltyCardFullName" size="40" name="loyaltycardfullname">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardfullname"/>
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
										<input id="txtAddress" title="LoyaltyCardAddress" size="40" name="loyaltycardaddress">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardaddress"/>
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
										<input id="txtCity" title="LoyaltyCardCity" size="40" name="loyaltycardcity">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardcity"/>
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
										<select title="LoyaltyCardState" name="loyaltycardselState">
											<xsl:for-each select="ExpressLane/ArrayOfState/State">
												<option>
													<xsl:attribute name="value">
														<xsl:value-of select="Abbreviation"/>
													</xsl:attribute>
													<xsl:if test="ExpressLane/ContactUs/formdata/loyaltycardselState = .">
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
										<input id="txtZip" title="LoyaltyCardZipCode" maxLength="5" size="5" name="loyaltycardzipcode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardzipcode"/>
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
										<input id="txtAreaCode" title="LoyaltyCardAreaCode" maxLength="3" size="3" name="loyaltycardareacode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardareacode"/>
											</xsl:attribute>
										</input>-
										<input id="txtPhoneCity" title="LoyaltyCardCityCode" maxLength="3" size="3" name="loyaltycardcitycode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardcitycode"/>
											</xsl:attribute>
										</input>-
										<input id="txtPhoneHouse" title="LoyaltyCardHouseCode" maxLength="4" size="4" name="loyaltycardhousecode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardhousecode"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="Contactbirthdate">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Birth Date</td>
									<td>
										<input id="txtBirthDate" title="LoyaltyCardBirthDate" size="40" name="loyaltycardbirthdate">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/birthdate"/>
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
										</input>&#xA0;
										<font color="#ff0000">*</font>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="alternateid">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Alternate ID #</td>
									<td>
										<input id="txtAltID" title="LoyaltyCardAlternateID" size="40" name="loyaltycardalternameid">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardalternameid"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
								<tr>
									<td width="30%"></td>
									<td>
										<i>* only if you would like the ability to cash checks</i>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="employerinformation">
					<h2>Employer Information</h2>
					<i>* Only if you would like the ability to cash checks</i>
					<div id="Employername">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Name</td>
									<td>
										<input id="txtEmpName" title="LoyaltyCardEmployerFullName" size="40" name="loyaltycardemployerfullname">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerfullname"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="Employeraddress">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Address</td>
									<td>
										<input id="txtEmpAddress" title="LoyaltyCardEmployerAddress" size="40" name="loyaltycardemployeraddress">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployeraddress"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="Employercity">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">City</td>
									<td>
										<input id="txtEmpCity" title="LoyaltyCardEmployerCity" size="40" name="loyaltycardemployercity">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployercity"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="Employerstate">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">State</td>
									<td>
										<select title="LoyaltyCardEmployerState" name="selloyaltycardemployerstate">
											<xsl:for-each select="ExpressLane/ArrayOfState/State">
												<option>
													<xsl:attribute name="value">
														<xsl:value-of select="Abbreviation"/>
													</xsl:attribute>
													<xsl:if test="ExpressLane/ContactUs/formdata/selloyaltycardemployerstate = .">
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
					<div id="Employerzip">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Zip</td>
									<td>
										<input id="txtEmpZip" title="LoyaltyCardEmployerZipCode" maxLength="5" size="5" name="loyaltycardemployerzipcode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerzipcode"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="Employerphone">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Phone</td>
									<td>
										<input id="txtEmpAreaCode" title="LoyaltyCardEmployerAreaCode" maxLength="3" size="3" name="loyaltycardemployerareacode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerareacode"/>
											</xsl:attribute>
										</input>-
										<input id="txtEmpPhoneCity" title="LoyaltyCardEmployerCityCode" maxLength="3" size="3" name="loyaltycardemployercitycode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployercitycode"/>
											</xsl:attribute>
										</input>-
										<input id="txtEmpPhoneHouse" title="LoyaltyCardEmployerHouseCode" maxLength="4" size="4" name="loyaltycardemployerhousecode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerhousecode"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="CakeOrder">
				<h1>Cake Order Form</h1>
				<div id="cakeText">
					<p align="center">
						<b>
							<font size="4">Need a cake for a special occasion?</font>
						</b>
					</p>
					<p>Look no further.  Simply complete the questionnaire below and your cake will be made to order and available for pick-up in just 3 days! Let Ted's do all of your cake decorating for your birthday, baby showers &amp; more.</p>
					<p>
						<b>
							<font size="2" color="#FF0000">We have over</font>
						</b>
						<font size="3" color="#FF0000">
							<em>100</em>
						</font>
						<b>
							<font size="2" color="#FF0000">different designs for you to choose from!</font>
						</b>
					</p>
					<p>Mickey &amp; Minnie Mouse, Winnie the Pooh &amp; much more. Stop by our bakery, browse thru our
						<b>
							<u>MAGIC of CAKES BOOKLET</u>
						</b>and choose your special cake today!</p>
				</div>
				<div id="cakeInformation">
					<h2>Order our cakes for all occasions</h2>
					<table width="70%" border="1">
						<tbody>
							<tr>
								<td>
									<b>Cake Size</b>
								</td>
								<td>
									<b>Serves</b>
								</td>
								<td>
									<b>Price</b>
								</td>
							</tr>
							<xsl:for-each select="ExpressLane/CakeOrder/Cakes/Cake">
								<tr>
									<td>
										<xsl:value-of select="Size"></xsl:value-of>
									</td>
									<td>
										<xsl:value-of select="Serving"></xsl:value-of>
									</td>
									<td>
										<xsl:value-of select="Price"></xsl:value-of>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
				<div id="cakeOrder1">
					<h2>Please provide the following ordering information</h2>
					<table width="70%" border="0">
						<tr>
							<td colspan="3" align="center">
								<h3>Cake Style 1</h3>
							</td>
						</tr>
						<tr>
							<td>
								<b>Qty.</b>
								<br/>
								<input type="text" size="20" name="cakeorder1qty" title="CakeOrder1Qty"/>
							</td>
							<td>
								<b>Description</b>
								<br/>
								<select title="CakeOrder1Description" name="cakeorder1descriptionvalue">
									<xsl:for-each select="ExpressLane/CakeOrder/Cakes/Cake">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Size"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder1descriptionvalue = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Size"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
							<td>
								<b>Flavor</b>
								<br/>
								<select title="CakeOrder2Flavor" name="cakeorder2flavorvalue">
									<xsl:for-each select="ExpressLane/CakeOrder/Flavors/Flavor">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Name"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder2flavorvalue = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Name"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>Base Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder1baseicing" title="CakeOrder1BaseIcing"/>
							</td>
							<td>
								<b>Decorative Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder1color" title="CakeOrder1Color"/>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>I would like the follow text written on the cake:</b>
								<br/>
								<textarea id="txtcakeorder1text" rows="6" name="cakeorder1text" cols="35" title="CakeOrder1Text"/>
							</td>
						</tr>
					</table>
				</div>
				<div id="cakeOrder2">
					<table width="70%" border="0">
						<tr>
							<td colspan="3" align="center">
								<h3>Cake Style 2</h3>
							</td>
						</tr>
						<tr>
							<td>
								<b>Qty.</b>
								<br/>
								<input type="text" size="20" name="cakeorder2qty" title="CakeOrder2Qty"/>
							</td>
							<td>
								<b>Description</b>
								<br/>
								<select title="CakeOrder2Description" name="cakeorder2description">
									<xsl:for-each select="ExpressLane/CakeOrder/Cakes/Cake">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Size"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder2description = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Size"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
							<td>
								<b>Flavor</b>
								<br/>
								<select title="CakeOrder2Flavor" name="cakeorder2flavor">
									<xsl:for-each select="ExpressLane/CakeOrder/Flavors/Flavor">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Name"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder2flavor = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Name"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>Base Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder2baseicing" title="CakeOrder2BaseIcing"/>
							</td>
							<td>
								<b>Decorative Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder2color" title="CakeOrder2Color"/>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>I would like the follow text written on the cake:</b>
								<br/>
								<textarea rows="6" name="cakeorder2text" cols="35" title="CakeOrder2Text"/>
							</td>
						</tr>
					</table>
				</div>
				<div id="cakeOrder3">
					<table width="70%" border="0">
						<tr>
							<td colspan="3" align="center">
								<h3>Cake Style 3</h3>
							</td>
						</tr>
						<tr>
							<td>
								<b>Qty.</b>
								<br/>
								<input type="text" size="20" name="cakeorder3qty" title="CakeOrder3Qty"/>
							</td>
							<td>
								<b>Description</b>
								<br/>
								<select title="CakeOrder3Description" name="cakeorder3description">
									<xsl:for-each select="ExpressLane/CakeOrder/Cakes/Cake">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Size"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder3description = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Size"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
							<td>
								<b>Flavor</b>
								<br/>
								<select title="CakeOrder3Flavor" name="cakeorder3flavor">
									<xsl:for-each select="ExpressLane/CakeOrder/Flavors/Flavor">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="Name"/>
											</xsl:attribute>
											<xsl:if test="ExpressLane/ContactUs/formdata/cakeorder3flavor = .">
												<xsl:attribute name="selected">true</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="Name"/>
										</option>
									</xsl:for-each>
								</select>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>Base Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder3baseicing" title="CakeOrder3BaseIcing"/>
							</td>
							<td>
								<b>Decorative Icing Color</b>
								<br/>
								<input type="text" size="20" name="cakeorder3color" title="CakeOrder3Color"/>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td>
								<b>I would like the follow text written on the cake:</b>
								<br/>
								<textarea id="txtcakeorder3text" rows="6" name="cakeorder3text" cols="35" title="CakeOrder3Text"/>
							</td>
						</tr>
					</table>
				</div>
				<div id="cakeContactInfo">
					<h3>Contact information</h3>
					<div id="cakename">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Name</td>
									<td>
										<input id="txtName" title="CakeOrderFullName" size="40" name="cakeorderfullname">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeorderfullname"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="cakeaddress">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Address</td>
									<td>
										<input id="txtAddress" title="CakeOrderAddress" size="40" name="cakeorderaddress">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeorderaddress"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="cakecity">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">City</td>
									<td>
										<input id="txtCity" title="CakeOrderCity" size="40" name="cakeordercity">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeordercity"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="cakestate">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">State</td>
									<td>
										<select title="State" name="cakeorderstate">
											<xsl:for-each select="ExpressLane/ArrayOfState/State">
												<option>
													<xsl:attribute name="value">
														<xsl:value-of select="Abbreviation"/>
													</xsl:attribute>
													<xsl:if test="ExpressLane/ContactUs/formdata/cakeorderstate = .">
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
					<div id="cakezip">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Zip</td>
									<td>
										<input id="txtZip" title="CakeOrderZipCode" maxLength="5" size="5" name="cakeorderzipcode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeorderzipcode"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="cakephone">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Phone</td>
									<td>
										<input id="txtAreaCode" title="CakeOrderAreaCode" maxLength="3" size="3" name="cakeorderareacode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeorderareacode"/>
											</xsl:attribute>
										</input>-
										<input id="txtPhoneCity" title="CakeOrderCityCode" maxLength="3" size="3" name="cakeordercitycode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeordercitycode"/>
											</xsl:attribute>
										</input>-
										<input id="txtPhoneHouse" title="CakeOrderHouseCode" maxLength="4" size="4" name="cakeorderhousecode">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/cakeUs/formdata/cakeorderhousecode"/>
											</xsl:attribute>
										</input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="cakeemailaddress">
						<table width="70%" border="0">
							<tbody>
								<tr>
									<td align="right" width="30%">Email Address</td>
									<td>
										<input id="txtEmail" title="CakeEmailAddress" size="40" name="emailaddress">
											<xsl:attribute name="value">
												<xsl:value-of select="ExpressLane/ContactUs/formdata/emailaddress"/>
											</xsl:attribute>
										</input>&#xA0;
										<font color="#ff0000">*</font>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<xsl:element name="INPUT">
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="title">formtype</xsl:attribute>
				<xsl:attribute name="id">formtype</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ExpressLane/ContactUs/formdata/formtype"/>
				</xsl:attribute>
			</xsl:element>
		</div>
		<script id="js" type="text/javascript" language="javascript">pageRedirect();</script>
		<div>
			<a class="button" href="javascript:SubmitContactUs();">
				<span>Submit</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>