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
						<xsl:value-of select="concat(//ContactUsRequest/FirstName, ' ', //ContactUsRequestRequest/LastName)" />
					</td>
				</tr>
				<tr valign="top">
					<td class="FieldTitle">Address:</td>
					<td>
						<xsl:value-of select="//ContactUsRequest/Address" />
						<br/>
						<xsl:if test="string-length(//ContactUsRequest/City) &gt; 0">
							<xsl:value-of select="concat(//ContactUsRequest/City, ', ')" />
						</xsl:if>
						<xsl:value-of select="concat(//ContactUsRequest/State, ' ', //ContactUsRequest/PostalCode)" />
					</td>
				</tr>
				<tr>
					<td class="FieldTitle">Phone:</td>
					<td>
						<xsl:value-of select="//ContactUsRequest/PhoneNumber" />
					</td>
				</tr>
				<tr>
					<td class="FieldTitle">Email:</td>
					<td>
						<xsl:value-of select="//ContactUsRequest/EmailAddress" />
					</td>
				</tr>
			</table>
			<h3>Your Comments</h3>
			<table border="0" cellpadding="0" cellspacing="0" width="560" title="Email Confirmation">
				<tr>
					<td class="FieldTitle">Comment On:</td>
					<td>
						<xsl:value-of select="//ContactUsRequest/MainTopic" />
						<xsl:if test="string-length(//ContactUsRequest/SpecificTopic) &gt; 0">
							<xsl:value-of select="concat(' (', //ContactUsRequest/SpecificTopic, ')')" />
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="FieldTitle" valign="top">Message:</td>
					<td>
						<xsl:value-of select="//ContactUsRequest/Comment" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\227\XmlData\227-PageTypeId-7-ContactUsEmail.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0"
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