<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="ContactUsThanks" class="main-wrapper group">
			<h2>Thank you for contacting us!</h2>
			<ul>
				<li>
					<strong><xsl:text>Name: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/fullname"/>
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
					<xsl:choose>
						<xsl:when test="string-length(ExpressLane/ContactUs/formdata/statetext) &gt; 0">
							<xsl:value-of select="ExpressLane/ContactUs/formdata/statetext"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/state"/>
						</xsl:otherwise>
					</xsl:choose>
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
					<xsl:choose>
						<xsl:when test="ExpressLane/StoreLocations/Locations/StoreLocation/Store[StoreID = //ContactUs/formdata/selStore]">
							<xsl:value-of select="ExpressLane/StoreLocations/Locations/StoreLocation/Store[StoreID = //ContactUs/formdata/selStore]/StoreName" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/selectedstoretext"/>
						</xsl:otherwise>
					</xsl:choose>
				</li>
				<li>
					<strong><xsl:text>Compliment or Concern: </xsl:text></strong>
					<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
				</li>
			</ul>
			<p>
				<strong>What grocery shopping factors, services, or departments are most important to you?</strong>
			</p>
			<ul>
				<xsl:if test="ExpressLane/ContactUs/formdata/deli = 'true' or ExpressLane/ContactUs/formdata/deli = 'on'">
					<li>Deli</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/onlineshopping = 'true' or ExpressLane/ContactUs/formdata/onlineshopping = 'on'">
					<li>Online Shopping</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/specials = 'true' or ExpressLane/ContactUs/formdata/specials = 'on'">
					<li>Store Specials</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/meat= 'true' or ExpressLane/ContactUs/formdata/meat= 'on'">
					<li>Meat Department</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/produce = 'true' or ExpressLane/ContactUs/formdata/produce = 'on'">
					<li>Produce Department</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/price= 'true' or ExpressLane/ContactUs/formdata/price= 'on'">
					<li>Product Prices</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/promotions= 'true' or ExpressLane/ContactUs/formdata/promotions= 'on'">
					<li>Store Promotions</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/storelocation= 'true' or ExpressLane/ContactUs/formdata/storelocation= 'on'">
					<li>Store Locations</li>
				</xsl:if>
				<xsl:if test="ExpressLane/ContactUs/formdata/itemselection= 'true' or ExpressLane/ContactUs/formdata/itemselection= 'on'">
					<li>Product Selection</li>
				</xsl:if>
			</ul>
			<p>
				<strong>Do we meet your grocery shopping needs?<xsl:text> </xsl:text></strong>
				<xsl:choose>
					<xsl:when test="ExpressLane/ContactUs/formdata/meetneeds">
						<xsl:value-of select="ExpressLane/ContactUs/formdata/meetneeds" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsyes = 'true' or ExpressLane/ContactUs/formdata/meetneedsyes = 'Yes'">Yes</xsl:if>
						<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'true' or ExpressLane/ContactUs/formdata/meetneedsmostofthetime = 'Yes'">Most of the Time</xsl:if>
						<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsseldom = 'true' or ExpressLane/ContactUs/formdata/meetneedsseldom = 'Yes'">Seldom</xsl:if>
						<xsl:if test="ExpressLane/ContactUs/formdata/meetneedsno = 'true' or ExpressLane/ContactUs/formdata/meetneedsno = 'Yes'">No</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</p>
			<p>
				<strong><xsl:text>Suggestions or comments: </xsl:text></strong>
			</p>
			<xsl:value-of select="ExpressLane/ContactUs/formdata/suggestioncomments"/>
			<br/>
			<h3>
				<i>We greatly value your feedback and will respond as soon as possible. <br/>
				For your convenience, you will receive an email copy of your comments.</i>
			</h3>
			<a href="/" class="button">
				<span>Back to home</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

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