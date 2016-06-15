<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:han="http://handlers.soap.softcoin.com">
			<soapenv:Header/>
			<soapenv:Body>
				<han:getECouponTotal soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
					<pRetailerFamilyID xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ECouponTotalRequest/RetailerFamilyID" />
					</pRetailerFamilyID>
					<pSiteId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ECouponTotalRequest/SiteID" />
					</pSiteId>
					<pSignature xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/ECouponTotalRequest/MAC" />
					</pSignature>
				</han:getECouponTotal>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>

