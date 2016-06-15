<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<xsl:apply-templates select="ExpressLane/Common/GenericConsumer" />
	</xsl:template>
	<xsl:template name="Consumer" match="GenericConsumer">
		<Consumer>
			<ConsumerID><xsl:value-of select="ConsumerID" /></ConsumerID>
			<FirstName><xsl:value-of select="FirstName" /></FirstName>
			<LastName><xsl:value-of select="LastName" /></LastName>
			<PrimaryAddress><xsl:value-of select="PrimaryAddress" /></PrimaryAddress>
			<SecondaryAddress><xsl:value-of select="SecondaryAddress" /></SecondaryAddress>
			<City><xsl:value-of select="City" /></City>
			<State><xsl:value-of select="State" /></State>
			<PostalCode><xsl:value-of select="PostalCode" /></PostalCode>
			<Phone><xsl:value-of select="Phone" /></Phone>
			<Email><xsl:value-of select="Email" /></Email>
			<UserName><xsl:value-of select="UserName" /></UserName>
			<CreateDate><xsl:value-of select="CreateDate" /></CreateDate>
			<ModifyDate><xsl:value-of select="ModifyDate" /></ModifyDate>
			<ChainID><xsl:value-of select="ChainID" /></ChainID>
			<ExternalID><xsl:value-of select="ExternalID" /></ExternalID>
			<HouseholdID><xsl:value-of select="HouseholdID" /></HouseholdID>
			<ConsumerGuid><xsl:value-of select="ConsumerGuid" /></ConsumerGuid>
			<PrimaryStoreID><xsl:value-of select="PrimaryStoreID" /></PrimaryStoreID>
			<ProfieID><xsl:value-of	select="ProfieID" /></ProfieID>
			<FoodExclusion><xsl:value-of select="FoodExclusion" /></FoodExclusion>
			<IsLoggedIn><xsl:value-of select="IsLoggedIn" /></IsLoggedIn>
		</Consumer>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-159-GetConsumer.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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