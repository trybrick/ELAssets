<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:han="http://handlers.soap.softcoin.com">
			<soapenv:Header/>
			<soapenv:Body>
				<han:getECouponsForCard soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
					<xsl:choose>
						<xsl:when test="string-length(ExpressLane/CardCouponsRequest/CardNumber) &gt; 0">
							<pCardNumber xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
								<xsl:value-of select="ExpressLane/CardCouponsRequest/CardNumber" />
							</pCardNumber>
						</xsl:when>
						<xsl:otherwise>
							<pCardNumber xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" />
						</xsl:otherwise>
					</xsl:choose>
					<pRetailerName xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/CardCouponsRequest/RetailerName" />
					</pRetailerName>
					<pSiteId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/CardCouponsRequest/SiteID" />
					</pSiteId>
					<pSignature xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/CardCouponsRequest/MAC" />
					</pSignature>
				</han:getECouponsForCard>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
