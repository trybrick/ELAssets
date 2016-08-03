<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:han="http://handlers.soap.softcoin.com">
			<soapenv:Header/>
			<soapenv:Body>
				<han:addECouponsToCard soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
					<pCardNumber xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddCouponsToCardRequest/CardNumber" />
					</pCardNumber>
					<pCouponIdList xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddCouponsToCardRequest/CouponIDList" />
					</pCouponIdList>
					<pRetailerName xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddCouponsToCardRequest/RetailerName" />
					</pRetailerName>
					<pSiteId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddCouponsToCardRequest/SiteID" />
					</pSiteId>
					<pSignature xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
						<xsl:value-of select="ExpressLane/AddCouponsToCardRequest/MAC" />
					</pSignature>
				</han:addECouponsToCard>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>