<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	<div id="ContactUs" class="main-wrapper">
		<h2>Thank you for contacting us!</h2>
		<div id="ContactForm" class="StandardConfirm">
			<p>The information below has been sent:</p>
			<h3>Contact Information</h3>
			<table border="0" cellpadding="0" cellspacing="0" width="560" title="Email Confirmation">
				<tr>
					<td class="FieldTitle">Name:</td>
					<td>
						<xsl:value-of select="concat(ExpressLane/ContactUs/formdata/namefirst, ' ', ExpressLane/ContactUs/formdata/namelast)" />
					</td>
				</tr>
				<tr valign="top">
					<td class="FieldTitle">Address:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/address" />
						<xsl:if test="string-length(//ContactUs/formdata/unit) &gt; 0">
							<xsl:value-of select="concat(' Unit ', //ContactUs/formdata/unit)" />
						</xsl:if>
						<br/>
						<xsl:if test="string-length(//ContactUs/formdata/city) &gt; 0">
							<xsl:value-of select="concat(//ContactUs/formdata/city, ', ')" />
						</xsl:if>
						<xsl:value-of select="concat(//ContactUs/formdata/state, ' ', //ContactUs/formdata/zip)" />
					</td>
				</tr>
				<tr>
					<td class="FieldTitle">Phone:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/phone" />
					</td>
				</tr>
				<tr>
					<td class="FieldTitle">Email:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/email" />
					</td>
				</tr>
				<tr>
					<td class="FieldTitle">Customer Card:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/cardnbr" />
					</td>
				</tr>
			</table>
			<h3>Your Comments</h3>
			<table border="0" cellpadding="0" cellspacing="0" width="560" title="Email Confirmation">
				<tr>
					<td class="FieldTitle">Comment On:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/selectiontext" />
						<xsl:if test="string-length(//ContactUs/formdata/subselectiontext) &gt; 0">
							<xsl:value-of select="concat(' (', //ContactUs/formdata/subselectiontext, ')')" />
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="FieldTitle" valign="top">Message:</td>
					<td>
						<xsl:value-of select="//ContactUs/formdata/message" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet>