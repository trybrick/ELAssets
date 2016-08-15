<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<Stores>
			<xsl:for-each select="ExpressLane/Common/ArrayOfGenericStore/GenericStore">
				<xsl:call-template name="Store" />
			</xsl:for-each>
		</Stores>
	</xsl:template>
	<xsl:template name="Store" match="GenericStore">
		<Store>
			<StoreID>
				<xsl:value-of select="StoreID" />
			</StoreID>
			<StoreName>
				<xsl:value-of select="StoreName" />
			</StoreName>
			<StoreNumber>
				<xsl:value-of select="StoreNumber" />
			</StoreNumber>
			<City>
				<xsl:value-of select="City" />
			</City>
			<Fax>
				<xsl:value-of select="Fax" />
			</Fax>
			<Latitude>
				<xsl:value-of select="Latitude" />
			</Latitude>
			<Longitude>
				<xsl:value-of select="Longitude" />
			</Longitude>
			<OpenHours>
				<xsl:value-of select="OpenHours" />
			</OpenHours>
			<Phone>
				<xsl:value-of select="Phone" />
			</Phone>
			<PrimaryAddress>
				<xsl:value-of select="PrimaryAddress" />
			</PrimaryAddress>
			<SecondaryAddress>
				<xsl:value-of select="SecondaryAddress" />
			</SecondaryAddress>
			<State>
				<xsl:value-of select="State" />			
			</State>
			<PostalCode>
				<xsl:value-of select="PostalCode" />
			</PostalCode>
			<ChainID>
				<xsl:value-of select="ChainID" />
			</ChainID>
			<WeekDayID>
				<xsl:value-of select="WeekDayID" />
			</WeekDayID>
			<TimeZone>
				<xsl:value-of select="TimeZone" />
			</TimeZone>
			<TimeZoneOffset>
				<xsl:value-of select="TimeZoneOffset" />
			</TimeZoneOffset>
			<StoreTime>
				<xsl:value-of select="StoreTime" />
			</StoreTime>
		</Store>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\73\XmlData\73-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->