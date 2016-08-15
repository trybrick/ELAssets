<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<script type="text/javascript"><![CDATA[
		
		function SubmitContactUs() {
	
			var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
			var emailInput = $('txtEmail');
			
			var emailIsValid = emailValidator.test(emailInput.value);
			var spamInvalid = SpamValidation("txtcommentconcern") || SpamValidation("txtsuggestioncomments");
            
			if (!emailIsValid) {
					emailInput.className = 'Invalid';
			}
			
			if (emailIsValid && typeof (SubmitForm) == 'function') {
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
				<xsl:value-of select="ExpressLane/StaticPageType/StaticPageTypeID" />
			</xsl:attribute>
		</input>
		<div id="ContactUs">
			<h2>Contact Us</h2>
			<h3>Customer details</h3>
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
								<select title="State" name="statevalue">
									<option>Select a State</option>
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
								</input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
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
			<h3>Any further suggestions or comments for us?</h3>
			<table width="70%" border="0">
				<tbody>
					<tr>
						<td align="right" width="30%"/>
						<td>
							<textarea id="txtsuggestioncomments" title="suggestioncomments" name="suggestioncomments" rows="4" cols="40">
								<xsl:value-of select="ContactUs/formdata/suggestioncomments"/>
							</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<a class="button" href="javascript:SubmitContactUs();">
				<span>Submit</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>