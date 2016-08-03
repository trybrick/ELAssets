<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
<order_file>
	<order>
		<store_num><xsl:value-of select="//Order/Store/StoreNumber"/></store_num>
		<order_date><xsl:value-of select="//Order/ChainFormattedCreateDate"/></order_date>
		<cust_account><xsl:value-of select="//Order/Consumer/ConsumerID"/></cust_account>
    	<cust_name><xsl:value-of select="//Order/Consumer/FirstName"/><xsl:text> </xsl:text><xsl:value-of select="//Order/Consumer/LastName"/></cust_name>
    	<cust_phone><xsl:value-of select="//Order/Consumer/Phone"/></cust_phone>
    	<cust_address><xsl:value-of select="//Order/Consumer/PrimaryAddress"/> <xsl:value-of select="//Order/Consumer/SecondaryAddress"/></cust_address>
    	<cust_city><xsl:value-of select="//Order/Consumer/City"/></cust_city>
    	<cust_state><xsl:value-of select="//Order/Consumer/State"/></cust_state>
    	<cust_zip><xsl:value-of select="//Order/Consumer/PostalCode"/></cust_zip>
    	<cust_email><xsl:value-of select="//Order/Consumer/Email"/></cust_email>
    	<cust_allowsub><xsl:value-of select="//Order/OrderInformation/SubstitutionType"/></cust_allowsub>
		<cust_comment><xsl:value-of select="//Order/OrderInformation/Comment"/></cust_comment>
		<delivery>
			<xsl:choose>
				<xsl:when test="//Order/OrderInformation/DeliveryType = 'Pickup'">N</xsl:when>
				<xsl:otherwise>Y</xsl:otherwise>
			</xsl:choose>
    	</delivery>
    	<delivery_date><xsl:value-of select="//Order/ChainFormattedDeliveryDate" /></delivery_date>
    	<delivery_time><xsl:value-of select="//Order/ChainFormattedDeliveryTime" /></delivery_time>
    	<delivery_fee><xsl:value-of select="//Order/OrderInformation/AppliedDeliveryFee"/></delivery_fee>
		<xsl:if test="//Order/OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName='PNREF']/FieldValue != ''">
			<pn_ref><xsl:value-of select="//Order/OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName='PNREF']/FieldValue" /></pn_ref>
		</xsl:if>

		<xsl:if test="string-length(//Order/OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName='PNREF']/FieldValue) &gt; 0">
			<pn_ref><xsl:value-of select="//Order/OrderInformation/TransactionDetails/CheckOutListPaymentTransaction[FieldName='PNREF']/FieldValue" /></pn_ref>
		</xsl:if>
		<xsl:if test="string-length(//Order/PaymentOptionData/formdata/houseaccount) &gt; 0">
			<house_account><xsl:value-of select="//Order/PaymentOptionData/formdata/houseaccount"/></house_account>
			<house_account_name><xsl:value-of select="//Order/PaymentOptionData/formdata/usersname"/></house_account_name>
		</xsl:if>

		
		<xsl:for-each select="//Order/Items/OrderItem">
		<item>
			<upc><xsl:value-of select="UPC11"/></upc>
	        <qty><xsl:value-of select="Quantity"/></qty>
      		<price><xsl:value-of select="Price"/></price>
      		<tax><xsl:value-of select="TaxSum"/></tax>
      		<descrip><xsl:value-of select="Description"/></descrip>
      		<weight><xsl:value-of select="Weight"/></weight>
			<comment><xsl:value-of select="Comment"/></comment>
		</item>
		</xsl:for-each>
	</order>
</order_file>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\..\Order.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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
		<scenario default="no" name="Scenario2" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\..\OrderTest.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\..\..\158-300991-3.xml" srcSchemaRoot="Order" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="order_file/order/cust_allowsub/xsl:value-of" x="368" y="234"/>
				<block path="order_file/order/delivery/xsl:choose" x="298" y="222"/>
				<block path="order_file/order/delivery/xsl:choose/=[0]" x="252" y="216"/>
				<block path="" x="248" y="252"/>
				<block path="order_file/order/delivery_date/xsl:value-of" x="368" y="137"/>
				<block path="order_file/order/delivery_time/xsl:value-of" x="408" y="137"/>
				<block path="order_file/order/xsl:for-each" x="328" y="137"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->