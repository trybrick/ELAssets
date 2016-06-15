<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
<xsl:output method="html"/>
<xsl:template match="/">

<div class="orderErrorMsg">

	<h2>Oops! A problem with your order was detected</h2>
	<h3>It appears as if there was there was a problem with your order.  Someone from the store will contact you shortly.</h3>

	<a>
		<xsl:attribute name="class">button</xsl:attribute>
		<xsl:attribute name="href"><xsl:value-of select="ExpressLane/Common/Chain/DomainName" /></xsl:attribute>
		<span><xsl:text>Back to Home</xsl:text></span>
	</a>
    
</div>

</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

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