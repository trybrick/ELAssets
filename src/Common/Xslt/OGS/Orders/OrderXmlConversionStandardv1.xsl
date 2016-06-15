<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
	<xsl:for-each select="ExpressLane/Order">
		<xsl:call-template name="order"></xsl:call-template>
	</xsl:for-each>
</xsl:template>
<xsl:template match="Order" name="order">
	<Order>                             
		<xsl:attribute name="StoreNumber"><xsl:value-of select="Store/StoreNumber"/></xsl:attribute>
		<xsl:attribute name="OrderNumber"><xsl:value-of select="OrderID"/></xsl:attribute>
		<xsl:attribute name="PromotionTotal"><xsl:value-of select="OrderInformation/AppliedPromotionSum"/></xsl:attribute>
		<xsl:attribute name="OrderFee"><xsl:value-of select="OrderInformation/AppliedDeliveryFee"/></xsl:attribute>
		<xsl:attribute name="DepositTotal"><xsl:value-of select="OrderInformation/DepositTotal"/></xsl:attribute>
		<xsl:attribute name="SubTotal"><xsl:value-of select="OrderInformation/SubTotal"/></xsl:attribute>
		<xsl:attribute name="TaxTotal"><xsl:value-of select="OrderInformation/TaxTotal"/></xsl:attribute>
		<xsl:attribute name="Total"><xsl:value-of select="OrderInformation/Total"/></xsl:attribute>
		<OrderDetail>
		<xsl:attribute name="SubstitutionType"><xsl:value-of select="OrderInformation/SubstitutionTypeDescription"/></xsl:attribute>
		<xsl:attribute name="OrderRequestDate"><xsl:value-of select="OrderInformation/DeliveryDateDisplay"/></xsl:attribute>
		<xsl:attribute name="OrderType"><xsl:value-of select="OrderInformation/DeliveryType"/></xsl:attribute>
		</OrderDetail>
		<Consumer>
			<xsl:attribute name="FirstName"><xsl:value-of select="OrderInformation/Consumer/FirstName"/></xsl:attribute>
			<xsl:attribute name="LastName"><xsl:value-of select="OrderInformation/Consumer/LastName"/></xsl:attribute>
			<xsl:attribute name="PrimaryAddress"><xsl:value-of select="OrderInformation/Consumer/PrimaryAddress"/></xsl:attribute>
			<xsl:attribute name="SecondaryAddress"><xsl:value-of select="OrderInformation/Consumer/SecondaryAddress"/></xsl:attribute>
			<xsl:attribute name="City"><xsl:value-of select="OrderInformation/Consumer/City"/></xsl:attribute>
			<xsl:attribute name="State"><xsl:value-of select="OrderInformation/Consumer/State"/></xsl:attribute>
			<xsl:attribute name="PostalCode"><xsl:value-of select="OrderInformation/Consumer/PostalCode"/></xsl:attribute>
			<xsl:attribute name="Phone"><xsl:value-of select="OrderInformation/Consumer/Phone"/></xsl:attribute>
			<xsl:attribute name="Email"><xsl:value-of select="OrderInformation/Consumer/Email"/></xsl:attribute>
			<xsl:attribute name="ExternalID"><xsl:value-of select="OrderInformation/Consumer/ExternalID"/></xsl:attribute>
			<xsl:attribute name="AlternatePhone"><xsl:value-of select="OrderInformation/Consumer/AlternatePhone"/></xsl:attribute>
		</Consumer>
		<Items>
			<xsl:for-each select="Items/OrderItem">
				<Item>
				<xsl:attribute name="UPC11"><xsl:value-of select="UPC11"/></xsl:attribute>
				<xsl:attribute name="Quantity"><xsl:value-of select="Quantity"/></xsl:attribute>
				<xsl:attribute name="Weight"><xsl:value-of select="Weight"/></xsl:attribute>
				<xsl:attribute name="Price"><xsl:value-of select="Price"/></xsl:attribute>
				<xsl:attribute name="Tax"><xsl:value-of select="TaxSum"/></xsl:attribute>
				<xsl:attribute name="Description"><xsl:value-of select="BrandName"/> <xsl:value-of select="Description"/> <xsl:value-of select="ProductSize"/></xsl:attribute>
				<xsl:attribute name="CalculatedPrice"><xsl:value-of select="CalculatedPrice"/></xsl:attribute>
				<xsl:attribute name="Point"><xsl:value-of select="Points"/></xsl:attribute>
				</Item>
			</xsl:for-each>
		</Items>
		<Comment>
			<xsl:value-of select="OrderInformation/Comment"/>
		</Comment>
		<TransactionDetail>
			<!--This is for Pay Pal Only -->
			<PayPal>
				<xsl:attribute name="TransactionNumber"><xsl:value-of select="OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName = 'PNREF']/FieldValue" /></xsl:attribute>
			</PayPal>
			<!--This is for Authorize Only -->
			<Authorize>
				<xsl:attribute name="TransactionNumber"><xsl:value-of select="OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName = 'x_trans_id']/FieldValue" /></xsl:attribute>
				<xsl:attribute name="TransactionAuthorizationCode"><xsl:value-of select="OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName = 'x_auth_code']/FieldValue" /></xsl:attribute>
			</Authorize>
			<!--Add any new output methods above this line -->
		</TransactionDetail>
	</Order>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\..\OrderTest.xml" htmlbaseurl="" outputurl="..\..\..\..\43\Xslt\OGS\Orders\TestXML.xml" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\..\..\Order2128.xml" srcSchemaRoot="Order" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/Order">
				<block path="Order/xsl:attribute/xsl:value-of" x="368" y="36"/>
				<block path="Order/xsl:attribute[1]/xsl:value-of" x="408" y="54"/>
				<block path="Order/xsl:attribute[2]/xsl:value-of" x="368" y="72"/>
				<block path="Order/xsl:attribute[3]/xsl:value-of" x="408" y="90"/>
				<block path="Order/xsl:attribute[4]/xsl:value-of" x="368" y="108"/>
				<block path="Order/xsl:attribute[5]/xsl:value-of" x="408" y="126"/>
				<block path="Order/xsl:attribute[6]/xsl:value-of" x="368" y="144"/>
				<block path="Order/xsl:attribute[7]/xsl:value-of" x="408" y="162"/>
				<block path="Order/OrderDetail/xsl:attribute/xsl:value-of" x="288" y="106"/>
				<block path="Order/OrderDetail/xsl:attribute[1]/xsl:value-of" x="248" y="106"/>
				<block path="Order/OrderDetail/xsl:attribute[2]/xsl:value-of" x="208" y="106"/>
				<block path="Order/Consumer/xsl:attribute/xsl:value-of" x="168" y="106"/>
				<block path="Order/Consumer/xsl:attribute[1]/xsl:value-of" x="128" y="106"/>
				<block path="Order/Consumer/xsl:attribute[2]/xsl:value-of" x="88" y="106"/>
				<block path="Order/Consumer/xsl:attribute[3]/xsl:value-of" x="48" y="106"/>
				<block path="Order/Consumer/xsl:attribute[4]/xsl:value-of" x="328" y="66"/>
				<block path="Order/Consumer/xsl:attribute[5]/xsl:value-of" x="288" y="66"/>
				<block path="Order/Consumer/xsl:attribute[6]/xsl:value-of" x="248" y="66"/>
				<block path="Order/Consumer/xsl:attribute[7]/xsl:value-of" x="208" y="66"/>
				<block path="Order/Consumer/xsl:attribute[8]/xsl:value-of" x="168" y="66"/>
				<block path="Order/Consumer/xsl:attribute[9]/xsl:value-of" x="128" y="66"/>
				<block path="Order/Consumer/xsl:attribute[10]/xsl:value-of" x="88" y="66"/>
				<block path="Order/Items/xsl:for-each" x="48" y="66"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute/xsl:value-of" x="328" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[1]/xsl:value-of" x="288" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[2]/xsl:value-of" x="248" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[3]/xsl:value-of" x="208" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[4]/xsl:value-of" x="168" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[5]/xsl:value-of" x="128" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[5]/xsl:value-of[1]" x="88" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[5]/xsl:value-of[2]" x="48" y="26"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[6]/xsl:value-of" x="328" y="146"/>
				<block path="Order/Items/xsl:for-each/Item/xsl:attribute[7]/xsl:value-of" x="288" y="146"/>
				<block path="Order/Comment/xsl:value-of" x="328" y="106"/>
				<block path="Order/TransactionDetail/PayPal/xsl:attribute/xsl:value-of" x="248" y="146"/>
				<block path="Order/TransactionDetail/Authorize/xsl:attribute/xsl:value-of" x="208" y="146"/>
				<block path="Order/TransactionDetail/Authorize/xsl:attribute[1]/xsl:value-of" x="168" y="146"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->