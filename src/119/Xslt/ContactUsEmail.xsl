<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<div id="ContactUsThanks">
			<!--
			<img>
				<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="ExpressLane/Common/Chain/ChainID" />/Images/printlogo.gif</xsl:attribute>
				<xsl:attribute name="border">0</xsl:attribute>
			</img>
			<br/>
			-->
			<h2>Thank you for contacting us, your comments are appreciated!</h2>

			<ul>
				<li>
					<strong><xsl:text>Name: </xsl:text></strong><xsl:value-of select="ExpressLane/ContactUs/formdata/fullname"/>
				</li>
				<li>
					<strong><xsl:text>Address: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/address"/>
				</li>
				<li>
					<strong><xsl:text>City: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/city"/>
				</li>
				<li>
					<strong><xsl:text>State: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/statetext"/>
				</li>				
				<li>
					<strong><xsl:text>Zip Code: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/zipcode"/>
				</li>
				<li>
					<strong><xsl:text>Phone: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/areacode"/>
					<xsl:text>.</xsl:text>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/citycode"/>
					<xsl:text>.</xsl:text>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/housecode"/>
				</li>
				<li>
					<strong><xsl:text>E-mail Address: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/emailaddress"/>
				</li>
				<li>
					<strong><xsl:text>Store: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/selectedstoretext"/>
				</li>
				<li>
					<strong><xsl:text>Compliment or Concern: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
				</li>

			</ul>
			<br/>
			<h3>
				<i>We greatly value your feedback and will response as soon as possible.  For your convenience, you will receive an email copy of your comments.</i>
			</h3>
			<a href="##root##"  class="button"><span>Back to home</span></a>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->