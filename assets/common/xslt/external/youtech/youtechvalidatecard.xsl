<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:han="http://handlers.soap.softcoin.com">
			<soapenv:Header/>
			<soapenv:Body>
				<han:validateRetailerCard soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
					<pCardNumber xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ValidateCardRequest/CardNumber" />
					</pCardNumber>
					<pRetailerFamilyId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ValidateCardRequest/RetailerFamilyID" />
					</pRetailerFamilyId>
					<pSiteId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ValidateCardRequest/SiteID" />
					</pSiteId>
					<pSignature xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ValidateCardRequest/MAC" />
					</pSignature>
				</han:validateRetailerCard>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
