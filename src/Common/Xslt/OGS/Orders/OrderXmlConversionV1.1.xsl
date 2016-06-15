<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<Order>
	<xsl:attribute name="SubTotal"><xsl:value-of select="//Order/OrderInformation/SubTotal"/></xsl:attribute>
	<xsl:attribute name="PromotionTotal"><xsl:value-of select="//Order/OrderInformation/AppliedPromotionSum"/></xsl:attribute>
	<xsl:attribute name="OrderFee"><xsl:value-of select="//Order/OrderInformation/AppliedDeliveryFee"/></xsl:attribute>
	<xsl:attribute name="OrderNumber"><xsl:value-of select="//Order/OrderInformation/CheckOutListID"/></xsl:attribute>
	<xsl:attribute name="TaxTotal"><xsl:value-of select="//Order/OrderInformation/TaxTotal"/></xsl:attribute>
	<xsl:attribute name="DepositTotal"><xsl:value-of select="sum(//Order/Items/OrderItem[number(DepositAmount)]/DepositAmount)"/></xsl:attribute>
	<xsl:attribute name="StoreNumber"><xsl:value-of select="//Order/Store/StoreNumber"/></xsl:attribute>
		
	<OrderDetail>
		<xsl:attribute name="SubstitutionType"><xsl:value-of select="//Order/OrderInformation/SubstitutionTypeDescription"/></xsl:attribute>
		<xsl:attribute name="OrderRequestDate"><xsl:value-of select="//Order/OrderInformation/DeliveryTimeStart"/></xsl:attribute>
		<xsl:attribute name="OrderType"><xsl:value-of select="//Order/OrderInformation/DeliveryType"/></xsl:attribute>
	</OrderDetail>
	<Consumer>
		<xsl:attribute name="FirstName"><xsl:value-of select="//Order/Consumer/FirstName"/></xsl:attribute>
		<xsl:attribute name="LastName"><xsl:value-of select="//Order/Consumer/LastName"/></xsl:attribute>
		<xsl:attribute name="PrimaryAddress"><xsl:value-of select="//Order/Consumer/PrimaryAddress"/></xsl:attribute>
		<xsl:attribute name="SecondaryAddress"><xsl:value-of select="//Order/Consumer/SecondaryAddress"/></xsl:attribute>
		<xsl:attribute name="City"><xsl:value-of select="//Order/Consumer/City"/></xsl:attribute>
		<xsl:attribute name="State"><xsl:value-of select="//Order/Consumer/State"/></xsl:attribute>
		<xsl:attribute name="PostalCode"><xsl:value-of select="//Order/Consumer/PostalCode"/></xsl:attribute>
		<xsl:attribute name="Phone"><xsl:value-of select="//Order/Consumer/Phone"/></xsl:attribute>
		<xsl:attribute name="Email"><xsl:value-of select="//Order/Consumer/Email"/></xsl:attribute>
<!--		<xsl:attribute name="ExternalID"><xsl:value-of select="//Order/Consumer/FirstName"/></xsl:attribute> -->
		<xsl:attribute name="AlternatePhone"><xsl:value-of select="//Order/Consumer/AlternatePhone"/></xsl:attribute>
	</Consumer>
	<Items>
		<xsl:for-each select="//Order/Items/OrderItem">
			<Item>
				<xsl:attribute name="UPC"><xsl:value-of select="UPC11" /></xsl:attribute>
				<xsl:attribute name="Qty"><xsl:value-of select="Quantity" /></xsl:attribute>
				<xsl:attribute name="Price"><xsl:value-of select="CalculatedPrice" /></xsl:attribute>
				<xsl:attribute name="Tax"><xsl:value-of select="TaxSum" /></xsl:attribute>
				<xsl:attribute name="Descrip"><xsl:value-of select="Description" /></xsl:attribute>
				<xsl:attribute name="Weight"><xsl:value-of select="Weight" /></xsl:attribute>
			</Item>
		</xsl:for-each>
	</Items>
	<Comment><xsl:value-of select="ExpressLane/Order/OrderInformation/Comment"/></Comment>
	<TransactionDetail>
		<PayPay>
			<xsl:attribute name="TransactionNumber">
				<xsl:value-of select="//Order/OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName='PONUM']/FieldValue" />
			</xsl:attribute>
		</PayPay>
		<Authorize>
			<xsl:attribute name="TransactionNumber"></xsl:attribute>
			<xsl:attribute name="TransactionAuthorizationCode"></xsl:attribute>
		</Authorize>
	</TransactionDetail>
</Order>
</xsl:template>
</xsl:stylesheet>

<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\158-2009821-1.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
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