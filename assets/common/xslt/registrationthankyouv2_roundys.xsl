<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/JS/Signup/SignUp.js"/>
		<div id="SignUpV2">
			<h2>Free Membership</h2>
			<div id="validationSummary">
			</div>
			<xsl:for-each select="//SignUpV2/Pages/Page">
				<xsl:call-template name="PageDisplay"/>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="PageDisplay" match="Page">
		<xsl:variable name="IsOGS" select="//GenericChain/ChainSettings/Setting[SettingID = 130]/Value"/>
		<div id="{Name}">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="(position() = 1) and (string-length(//GenericConsumer/ExternalID) &gt; 0)">
						<xsl:text>activeStep signUpStep</xsl:text>
					</xsl:when>
					<xsl:when test="(position() = 3) and (string-length(//GenericConsumer/ExternalID) = 0)">
						<xsl:text>activeStep signUpStep</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>deactiveStep signUpStep</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<div style="display:none;">
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="position() = 3">
							<xsl:text>signUpSteps5</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>signUpSteps</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$IsOGS = 'True'">
						<img src="{concat('/Assets/Common/Images/Registration/pReg_OGS_', Name, '.jpg')}"/>
					</xsl:when>
					<xsl:otherwise>
						<img src="{concat('/Assets/Common/Images/Registration/pReg_', Name, '.jpg')}"/>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div>
				<xsl:attribute name="class">
					<xsl:text>signUpDesc</xsl:text>
					<xsl:if test="position() = 1 or position() = 2 or position() = 3">
						<xsl:text> deactiveStep</xsl:text>
					</xsl:if>
				</xsl:attribute>
				<p class="signUpSml">
					<xsl:value-of select="concat('Please enter the following ', Direction, ' information:')"/>
				</p>
				<p class="signUpWhy">
					<a href="#" target="_self">
						<xsl:attribute name="onclick">
							<xsl:value-of select="concat('setVisible(&quot;signUpPop', position(), '&quot;);')"/>
						</xsl:attribute>
						<xsl:text>Why do we need this?</xsl:text>
					</a>
				</p>
			</div>
			<xsl:choose>
				<xsl:when test="(@value = 'loyaltycard') and (string-length(//GenericConsumer/ExternalID) &gt; 0)">
					<xsl:call-template name="loyaltycarddisplay">
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="(@value = 'externalprofile') and (string-length(//GenericConsumer/ExternalID) &gt; 0)">
					<xsl:call-template name="externalprofiledisplay">
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="@value = 'thankyou'">
					<xsl:call-template name="thankyoudisplay">
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="loyaltycarddisplay">
		<div>
			<div id="signUpPhoto">
				<xsl:if test="string-length(//GenericChain/ChainSettings/Setting[Name='RegistrationExternalIDLabel']/Value) &gt; 0">
					<img alt="{//GenericChain/ChainSettings/Setting[Name='RegistrationExternalIDLabel']/Value}" id="signUpLoyalty" src="{//GenericChain/ChainSettings/Setting[Name='RegistrationExternalIDImage']/Value}"/>
				</xsl:if>
			</div>
			<div class="signUpText">
				<label>Would you like to update your contact information? Providing your current mailing address allows us to send you personalized rewards and offers.</label>
			</div>
			<div id="navigation">
				<div class="yesButton" onclick="displayNextStep();"/>
				<div class="nothanksButton" onclick="navigateToPage('step6');"/>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="externalprofiledisplay">
		<div>
			<iframe id="spinGroupPortal" src="{concat('https://rewardscard.roundys.com/cardmaintenance.aspx?ln=', //GenericConsumer/LastName,'&amp;rcn=', //GenericConsumer/ExternalID, '&amp;pip=', //GenericConsumer/ConsumerID, '&amp;next=', '##root##/Sign-Up.aspx')}" frameborder="0" width="590" height="850" marginheight="0" marginwidth="0" scrolling="no"/>
		</div>
	</xsl:template>
	<xsl:template name="thankyoudisplay">
		<div>
			<div id="signUpPhoto">
				<img src="/Assets/Common/Images/Registration/pReg_shopper2.jpg" alt="Grocery Shopper"/>
			</div>
			<div class="signUpText">
				<label>Thank you for registering.</label>
				<label>You may go to your home page or return to editing your profile.</label>
			</div>
			<div id="navigation">
				<div class="homeButton" onclick="parent.location='/'"/>
				<div class="profileButton" onclick="parent.location='/Profile/SignUp.aspx'"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
