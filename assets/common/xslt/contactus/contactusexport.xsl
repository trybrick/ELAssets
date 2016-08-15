<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<ContactUs>
			<ChainID>
				<xsl:value-of select="ExpressLane/ContactUs/ChainID" />
			</ChainID>
			<StoreID>
				<xsl:value-of select="ExpressLane/ContactUs/StoreID" />
			</StoreID>
			<ConsumerID>
				<xsl:value-of select="ExpressLane/ContactUs/ConsumerID" />
			</ConsumerID>
			<ParsedXML>
				<xsl:value-of select="ExpressLane/ContactUs/ParsedXML" />
			</ParsedXML>
			<RawXML>
				<xsl:copy-of select="ExpressLane/ContactUs/formdata" />
			</RawXML>
			<CreatedOn>
				<xsl:value-of select="ExpressLane/ContactUs/CreatedOn" />
			</CreatedOn>
		</ContactUs>
	</xsl:template>
</xsl:stylesheet>