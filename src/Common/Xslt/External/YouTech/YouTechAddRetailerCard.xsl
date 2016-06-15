<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:xsd="http://www.w3.org/2001/XMLSchema"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<soapenv:Header/>
			<soapenv:Body>
				<ns1:addRetailerCardToAccount 
					soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
					xmlns:ns1="urn:PromotionInterface">
					<ns1:arg0 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/CardNumber" />
					</ns1:arg0>
					<ns1:arg1 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/Login" />	
					</ns1:arg1>
					<ns1:arg2 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/Password" />
					</ns1:arg2>
					<ns1:arg3 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/RetailerFamilyID" />
					</ns1:arg3>
					<ns1:arg4 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/SiteID" />
					</ns1:arg4>
					<ns1:arg5 xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddRetailerCardRequest/MAC" />	
					</ns1:arg5>
				</ns1:addRetailerCardToAccount>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
