<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="Consumer" select="ExpressLane/GenericConsumer[IsLoggedIn = 'true']" />
		
		<script type="text/javascript">
		GSNPageItems.ContactUs = {
			SubSelectOptions: [
				<xsl:for-each select="//ContactUs/Topic/ChildTopics/Topic">
					{ "Value": "<xsl:value-of select="Value" />", "Label": "<xsl:value-of select="Label" />", "Text": "<xsl:value-of select="Text" />", "ParentOption": "<xsl:value-of select="parent::node()/parent::node()/Value" />" }<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
			]
		}
		</script>
		<input type="hidden" name="staticpagetypeid">
			<xsl:attribute name="value">
				<xsl:value-of select="ExpressLane/StaticPageType/StaticPageTypeID"/>
			</xsl:attribute>
		</input>
	<div id="ContactUs" class="main-wrapper">
		<div id="contactUsInfo">
			<p>
				<xsl:text>If needed, please use our </xsl:text>
				<a href="/StoreLocator.aspx?hold=true" title="Store Locator">Store Locator</a>
				<xsl:text> to look up the phone number and address of your local store.</xsl:text>
			</p>
		</div>
		<h2>Send Us an Email</h2>
		<div id="ContactForm">
			<p id="requiredInfoLabel">* = Required</p>
			<h3>Contact Information</h3>
			<div id="ContactName" class="contactRow">
				<div class="contactColumn">
					<label for="txtFirstName" id="txtFirstNameLabel" class="ContactFieldTitle">First Name:</label>
					<input id="txtFirstName" name="NameFirst" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/FirstName" />
							</xsl:attribute>
					</input>
				</div>
				<div class="contactColumn">
					<label for="txtLastName" id="txtLastNameLabel" class="ContactFieldTitle">Last Name:</label>
					<input id="txtLastName" name="NameLast" type="text" size="27" maxlength="60">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/LastName" />
							</xsl:attribute>
					</input>
				</div>
			</div>
			<div id="ContactAddress1" class="contactRow">
				<div class="contactColumn">
					<label for="txtAddress" class="ContactFieldTitle">Address:</label>
					<input id="txtAddresss" name="Address" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/PrimaryAddress" />
							</xsl:attribute>
					</input>
				</div>
				<div class="contactColumn">
					<label for="txtCity" class="ContactFieldTitle">City:</label>
					<input id="txtCity" name="City" type="text" size="27" maxlength="40">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/City" />
							</xsl:attribute>
					</input>
				</div>
			</div>
			<div id="ContactAddress2" class="contactRow">
				<div class="contactColumn">
					<label for="txtState" class="ContactFieldTitle">State:</label>
					<input id="txtState" name="State" type="text" size="2" maxlength="2">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/State" />
							</xsl:attribute>
					</input>
				</div>
				<div class="contactColumn">
					<label for="txtZip" class="ContactFieldTitle">Zip:</label>
					<input id="txtZip" name="Zip" type="text" size="5" maxlength="10">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/PostalCode" />
							</xsl:attribute>
					</input>
				</div>
			</div>
			<div id="ContactDetails" class="contactRow">
				<div class="contactColumn">
					<label for="txtPhone" class="ContactFieldTitle">Phone:</label>
					<input id="txtPhone" name="Phone" type="text" size="27" maxlength="30">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Phone" />
							</xsl:attribute>
					</input>
				</div>
				<div class="contactColumn">
					<label for="txtEmail" id="txtEmailLabel" class="ContactFieldTitle">Email:</label>
					<input id="txtEmail" name="Email" type="text" size="27" maxlength="80">
							<xsl:attribute name="value">
								<xsl:value-of select="$Consumer/Email" />
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
							<select name="Selection" id="ddlTopicSelect" onchange="GSNPages.ContactUs.ChangeTopic();">
								<option value="" selected="true">Select</option>
								<xsl:for-each select="//ContactUs/Topic">
									<xsl:sort select="Text" data-type="text"/>
									
									<option>
										<xsl:attribute name="id">
											<xsl:value-of select="ID" />
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="Value" />
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:value-of select="Title" />
										</xsl:attribute>
										<xsl:value-of select="Text" />
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
				<div id="ContactUsStore">
					<label for="ddlStore" id="ddlStoreLabel" class="ContactFieldTitle">3. Select Your Store:*</label>
					<select id="ddlStore" name="SelStore">
						<option value="" selected="true">Select</option>
						<xsl:for-each select="//ArrayOfGenericState/GenericState[StateID = //GenericStore/StateID]">
							<xsl:variable name="StateID" select="StateID" />
							<optgroup>
								<xsl:attribute name="label">
									<xsl:value-of select="concat('========= ', FullName, ' =========')" />
								</xsl:attribute>
								<xsl:for-each select="//ArrayOfGenericStore/GenericStore[StateID = $StateID]">
									<option>
										<xsl:if test="StoreID = //GenericConsumer/PrimaryStoreID">
											<xsl:attribute name="selected">selected</xsl:attribute>
										</xsl:if>
										<xsl:attribute name="label">
											<xsl:value-of select="concat(StoreName, ' - ', PrimaryAddress)" />
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="StoreID" />
										</xsl:attribute>
										<xsl:value-of select="concat(StoreName, ' - ', PrimaryAddress)" />
									</option>
								</xsl:for-each>
							</optgroup>
						</xsl:for-each>
					</select>
				</div>
				<div id="ContactUsMessage">
					<textarea id="txtMessage" name="Message" cols="48" rows="6"></textarea>
				</div>
				<div class="Buttons">
					<a class="button submit" href="javascript:GSNPages.ContactUs.Submit();">
						<span>Submit</span>
					</a>
					<a class="button reset" href="javascript:GSNPages.ContactUs.Reset();">
						<span>Reset</span>
					</a>
					<a class="button cancel" href="javascript:GSNPages.ContactUs.Cancel();">
						<span>Cancel</span>
						<span class="ie_dupChar_fix"><xsl:text> </xsl:text><!--do not delete. this fixes the duplicate character bug in ie7--></span>
					</a>
				</div>	
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>