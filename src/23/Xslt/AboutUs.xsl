<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="about">
			<div id="storeinfo">
				<div id="address">
					<div id="addresscontent">
						<b><xsl:value-of select="//ArrayOfGenericStore/GenericStore/StoreName"/></b><br/>
						<xsl:value-of select="//ArrayOfGenericStore/GenericStore/PrimaryAddress"/><br/>
						<xsl:value-of select="//ArrayOfGenericStore/GenericStore/City"/><text>, </text><xsl:value-of select="Abbreviation"/>&#160;<xsl:value-of select="//ArrayOfGenericStore/GenericStore/PostalCode"/><br/>
						<b>Phone: </b><xsl:value-of select="//ArrayOfGenericStore/GenericStore/Phone"/><br/>
						<b>Fax: </b><xsl:value-of select="//ArrayOfGenericStore/GenericStore/Fax"/><br/>
						<b>Hours: </b>24 Hours a Day 7 Days a Week<br/>
						<b>Email: </b><a><xsl:attribute name="href">mailto:<xsl:value-of select="//ArrayOfGenericStore/GenericStore/Email"/></xsl:attribute><xsl:value-of select="//ArrayOfGenericStore/GenericStore/Email"/></a>
					</div>
				</div>
				<div id="map">
					<img>
						<xsl:attribute name="src">
							##root##/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/map1.gif
						</xsl:attribute>
					</img>
				</div>
			</div>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="aboutContent">
					<h3><xsl:value-of select="Title" /></h3>
					<p><xsl:value-of select="Description" disable-output-escaping="yes" /></p>
				</div>
			</xsl:for-each>
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