<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:if test="//CouponsRequest/RetailerFamilyID and //CouponsRequest/SiteID and //CouponsRequest/MAC">
			<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:han="http://handlers.soap.softcoin.com">
				<soapenv:Header/>
				<soapenv:Body>
					<han:getECoupons soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
						<pRetailerFamilyId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
							<xsl:value-of select="//CouponsRequest/RetailerFamilyID"/>
						</pRetailerFamilyId>
						<pSiteId xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
							<xsl:value-of select="//CouponsRequest/SiteID"/>
						</pSiteId>
						<pSignature xsi:type="soapenc:string" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
							<xsl:value-of select="//CouponsRequest/MAC"/>
						</pSignature>
					</han:getECoupons>
				</soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>