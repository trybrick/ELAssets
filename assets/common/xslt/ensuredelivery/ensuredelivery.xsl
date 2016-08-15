<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:variable name="chainName" select="//ChainSettings/Setting[SettingID=99]/Value" />
	<xsl:variable name="chainNameEmail" select="//ChainSettings/Setting[SettingID=98]/Value" />
	<xsl:template match="/">
		<div id="ensureCopy">
			<h2>Ensure Email Delivery</h2>
			<p>To ensure proper delivery of your email, please add <xsl:value-of select="$chainNameEmail" />@grocerywebsites.com to your address book or safe list. Follow the instructions below for your email account:</p>
			<h3>Outlook:</h3>
			<ol>
				<li>Go to your Contacts page.</li>
				<li>Click on New in the upper left hand corner.</li>
				<li>Enter <xsl:value-of select="$chainNameEmail" />@grocerywebsites.com into the email address field.</li>
				<li>Click Save in the upper left of your window.</li>
			</ol>
			<h3>Hotmail:</h3>
			<ol>
				<li>Click on the Contacts tab at the top of your account.</li>
				<li>In the left hand menu, click on Safe List.</li>
				<li>Enter <xsl:value-of select="$chainNameEmail" />@grocerywebsites.com into the blank field.</li>
				<li>Click the Add button to the right of the field.</li>
			</ol>
			<h3>Yahoo:</h3>
			<ol>
				<li>Click on the Addresses tab in the upper left part of your account screen.</li>
				<li>Click on Add Contact just under the Addresses tab.</li>
				<li>Enter <xsl:value-of select="$chainNameEmail" />@grocerywebsites.com in the Email field &#x2013; you can leave the rest blank, if desired.</li>
				<li>Click on Save at the bottom of the page.</li>
				<li>You should see a confirmation screen. Click Done in the upper left.</li>
			</ol>
			<h3>Gmail:</h3>
			<ol>
				<li>Click on Contacts in the left column.</li>
				<li>Click on Add Contact on the upper right of the Contacts screen.</li>
				<li>Enter <xsl:value-of select="$chainNameEmail" />@grocerywebsites.com in the Primary Email field.</li>
				<li>Click on Save.</li>
			</ol>
			<h3>AOL (version 9.0):</h3>
			<ol>
				<li>Open an edition of the <xsl:value-of select="$chainName" /> email.</li>
				<li>Click on Add address on the right side of the email window.</li>
			</ol>
		</div>
		<div id="privacy">
			<p class="signUpSml">*Our <a href="/Profile/PrivacyPolicy.aspx">privacy policy</a> states, we will not share your email address with third-party marketers.</p>
		</div>
	</xsl:template>
</xsl:stylesheet>
