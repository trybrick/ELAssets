<?xml version='1.0'?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	<xsl:output method="xml" />	<xsl:template match="/">		<xsl:apply-templates select="//ExpressLane/GenericStore" />	</xsl:template>	<xsl:template name="Store" match="GenericStore">		<store>			<StoreID><xsl:value-of select="StoreID" /></StoreID>			<Name><xsl:value-of select="StoreName" /></Name>			<StoreNumber><xsl:value-of select="StoreNumber" /></StoreNumber>			<PrimaryAddress><xsl:value-of select="PrimaryAddress" /></PrimaryAddress>			<SecondaryAddress><xsl:value-of select="SecondaryAddress" /></SecondaryAddress>			<City><xsl:value-of select="City" /></City>			<State><xsl:value-of select="StateAbbreviation" /></State>			<PostalCode><xsl:value-of select="PostalCode" /></PostalCode>			<Phone><xsl:value-of select="Phone" /></Phone>			<Latitude><xsl:value-of select="Latitude" /></Latitude>			<Longitude><xsl:value-of select="Longitude" /></Longitude>		</store>	</xsl:template></xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.
<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\123-PageTypeId-23-RecipeFull.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>-->