<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<order>
			<order_info>
				<xsl:attribute name="order_id">
					<xsl:value-of select="//Order/OrderInformation/CheckOutListID"/>
				</xsl:attribute>
				<xsl:attribute name="order_date">
					<xsl:value-of select="//Order/OrderInformation/CreateDate"/>
				</xsl:attribute>
				<xsl:attribute name="fulfillment">
					<xsl:value-of select="//Order/OrderInformation/DeliveryType"/>
				</xsl:attribute>
				<xsl:attribute name="fulfillment_time">
					<xsl:value-of select="//Order/ChainFormattedDeliveryDate"/><xsl:value-of select="//Order/ChainFormattedDeliveryTime"/>
				</xsl:attribute>
				<xsl:attribute name="service_fee">
					<xsl:value-of select="//Order/OrderInformation/AppliedDeliveryFee"/>
				</xsl:attribute>
				<xsl:attribute name="order_comments">
					<xsl:value-of select="//Order/OrderInformation/Comment"/>
				</xsl:attribute>
				<xsl:attribute name="additional_items">
					<xsl:text></xsl:text>
				</xsl:attribute>
				<xsl:attribute name="sub_total">
					<xsl:value-of select="//Order/OrderInformation/SubTotal"/>
				</xsl:attribute>
				<xsl:attribute name="tax_total">
					<xsl:value-of select="//Order/OrderInformation/TaxTotal"/>
				</xsl:attribute>
				<xsl:attribute name="store_number">
					<xsl:value-of select="//Order/Store/StoreNumber"/>
				</xsl:attribute>
				<xsl:attribute name="substitution_preference">
					<xsl:value-of select="//Order/OrderInformation/SubstitutionTypeLegacyChainCode"/>
				</xsl:attribute>
			</order_info>

			<shipping>
				<xsl:attribute name="first_name">
					<xsl:value-of select="//Order/Consumer/FirstName"/>
				</xsl:attribute>
				<xsl:attribute name="last_name">
					<xsl:value-of select="//Order/Consumer/LastName"/>
				</xsl:attribute>
				<xsl:attribute name="address1">
					<xsl:value-of select="//Order/Consumer/PrimaryAddress"/>
				</xsl:attribute>
				<xsl:attribute name="address2">
					<xsl:value-of select="//Order/Consumer/SecondaryAddress"/>
				</xsl:attribute>
				<xsl:attribute name="city">
					<xsl:value-of select="//Order/Consumer/City"/>
				</xsl:attribute>
				<xsl:attribute name="state">
					<xsl:value-of select="//Order/Consumer/State"/>
				</xsl:attribute>
				<xsl:attribute name="zip">
					<xsl:value-of select="//Order/Consumer/PostalCode"/>
				</xsl:attribute>
				<xsl:attribute name="phone1">
					<xsl:value-of select="//Order/Consumer/Phone"/>
				</xsl:attribute>
				<xsl:attribute name="phone2">
					<xsl:value-of select="//Order/Consumer/AlternatePhone"/>
				</xsl:attribute>
			</shipping>

			<billing>
				<xsl:attribute name="profile_id">
					<xsl:value-of select="//Order/ConsumerID"/>
				</xsl:attribute>
				<xsl:attribute name="email1">
					<xsl:value-of select="//Order/Consumer/Email"/>
				</xsl:attribute>
				<xsl:attribute name="first_name">
					<xsl:value-of select="//Order/Consumer/FirstName"/>
				</xsl:attribute>
				<xsl:attribute name="last_name">
					<xsl:value-of select="//Order/Consumer/LastName"/>
				</xsl:attribute>
				<xsl:attribute name="address1">
					<xsl:value-of select="//Order/Consumer/PrimaryAddress"/>
				</xsl:attribute>
				<xsl:attribute name="address2">
					<xsl:value-of select="//Order/Consumer/SecondaryAddress"/>
				</xsl:attribute>
				<xsl:attribute name="city">
					<xsl:value-of select="//Order/Consumer/City"/>
				</xsl:attribute>
				<xsl:attribute name="state">
					<xsl:value-of select="//Order/Consumer/State"/>
				</xsl:attribute>
				<xsl:attribute name="zip">
					<xsl:value-of select="//Order/Consumer/PostalCode"/>
				</xsl:attribute>
				<xsl:attribute name="phone1">
					<xsl:value-of select="//Order/Consumer/Phone"/>
				</xsl:attribute>
				<xsl:attribute name="payment_type">
					<xsl:text>House Account</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="payment_cc">
					<xsl:text></xsl:text>
				</xsl:attribute>
				<xsl:attribute name="payment_cvv">
					<xsl:text></xsl:text>
				</xsl:attribute>
				<xsl:attribute name="payment_cc_exp">
					<xsl:text></xsl:text>
				</xsl:attribute>
				<xsl:attribute name="loyalty_card">
					<xsl:value-of select="//Order/Consumer/ExternalID"/>
				</xsl:attribute>
			</billing>
			<xsl:for-each select="//OrderItem">
				<item>
					<xsl:attribute name="upc">
						<xsl:value-of select="UPC11"/>
					</xsl:attribute>
					<xsl:attribute name="brand_name">
						<xsl:value-of select="BrandName"/>
					</xsl:attribute>
					<xsl:attribute name="prod_desc">
						<xsl:value-of select="Description"/>
					</xsl:attribute>
					<xsl:attribute name="prod_size">
						<xsl:value-of select="ProductSize"/>
					</xsl:attribute>
					<xsl:attribute name="unit_of_measure">
						<xsl:value-of select="UnitOfMeasure"/>
					</xsl:attribute>
					<xsl:attribute name="sell_by_weight">
						<xsl:choose>
							<xsl:when test="number(SoldByWeight)">y</xsl:when>
							<xsl:otherwise>n</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<!-- no idea on this one, default to 0.0000-->
					<xsl:attribute name="bottle_dep_amt">
						<xsl:choose>
							<xsl:when test="number(DepositAmount)">
								<xsl:value-of select="format-number(DepositAmount, '0.0000')" />
							</xsl:when>
							<xsl:otherwise>0.0000</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					
					<xsl:attribute name="store_item_code">
						<xsl:value-of select="InventoryProperty/InventoryProductProperty/ChainItemNumber"/>
					</xsl:attribute>
					<xsl:attribute name="tax_amt">
						<xsl:value-of select="TaxSum"/>
					</xsl:attribute>
					<xsl:attribute name="comments">
						<xsl:value-of select="Comment"/>
					</xsl:attribute>
					<xsl:attribute name="ord_price">
						<xsl:choose>
							<xsl:when test="number(SalePrice)">
								<xsl:value-of select="SalePrice"/>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="RegularPrice"/></xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="reg_price">
						<xsl:value-of select="RegularPrice"/>
					</xsl:attribute>
					<xsl:attribute name="quantity">
						<xsl:value-of select="Quantity"/>
					</xsl:attribute>
					<xsl:attribute name="weight">
						<xsl:choose>
							<xsl:when test="number(Weight)">
								<xsl:value-of select="format-number(Weight, '0.00')"/>
							</xsl:when>
							<xsl:otherwise>0.00</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<!-- not in the xml -->
					<xsl:attribute name="redeem_points">
						<xsl:text>0</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="item_total">
						<xsl:if test="number(CalculatedSum)">
							<xsl:value-of select="format-number(CalculatedSum, '0.0000')"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:attribute name="item_tax_total">
						<xsl:value-of select="TaxSum"/>
					</xsl:attribute>
				</item>
			</xsl:for-each>
			<xsl:if test="number(//Order/OrderInformation/AppliedDeliveryFee)">
				<promotion prod_desc="Personal Shopper Fee" comments="">
					<xsl:attribute name="ord_price">
						<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '0.0000')" />
					</xsl:attribute>
					<xsl:attribute name="reg_price">
						<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '0.0000')" />
					</xsl:attribute>
					<xsl:attribute name="quantity">1</xsl:attribute>
					<xsl:attribute name="item_total">
						<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '0.0000')" />
					</xsl:attribute>
					<xsl:attribute name="plu">000000009856</xsl:attribute>
				</promotion>
			</xsl:if>
			<xsl:for-each select="//Order/Promotion/OrderPromotion">
				<promotion>
					
					<xsl:attribute name="prod_desc">
						<xsl:value-of select="Description" />
					</xsl:attribute>
					<xsl:attribute name="comments">
					</xsl:attribute>
					<xsl:attribute name="ord_price">
						<xsl:value-of select="concat('-', format-number(DiscountAmount, '0.0000'))" />
					</xsl:attribute>
					<xsl:attribute name="reg_price">
						<xsl:value-of select="concat('-', format-number(DiscountAmount, '0.0000'))" />
					</xsl:attribute>
					<xsl:attribute name="quantity">1</xsl:attribute>
					<xsl:attribute name="item_total">
						<xsl:value-of select="concat('-', format-number(DiscountAmount, '0.0000'))" />
					</xsl:attribute>
					<xsl:attribute name="plu">
						<xsl:value-of select="PLU" />
					</xsl:attribute>
				</promotion>
			</xsl:for-each>
		</order>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\..\OrderTest.xml" htmlbaseurl="" outputurl="..\..\..\..\..\..\nobackup\download\124\Order300553x.xml" processortype="msxmldotnet2"
		          useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath=""
		          postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
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
			<SourceSchema srcSchemaPath="..\..\..\..\..\..\nobackup\download\124\Order300553.xml" srcSchemaRoot="order" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="order/order_info/xsl:attribute/xsl:value-of" x="368" y="54"/>
				<block path="order/order_info/xsl:attribute[1]/xsl:value-of" x="408" y="72"/>
				<block path="order/order_info/xsl:attribute[2]/xsl:value-of" x="368" y="90"/>
				<block path="order/order_info/xsl:attribute[3]/xsl:value-of" x="288" y="108"/>
				<block path="order/order_info/xsl:attribute[4]/xsl:value-of" x="248" y="126"/>
				<block path="order/order_info/xsl:attribute[5]/xsl:value-of" x="288" y="144"/>
				<block path="order/order_info/xsl:attribute[7]/xsl:value-of" x="368" y="180"/>
				<block path="order/order_info/xsl:attribute[8]/xsl:value-of" x="408" y="198"/>
				<block path="order/order_info/xsl:attribute[9]/xsl:value-of" x="368" y="216"/>
				<block path="order/order_info/xsl:attribute[10]/xsl:value-of" x="208" y="126"/>
				<block path="order/shipping/xsl:attribute/xsl:value-of" x="168" y="126"/>
				<block path="order/shipping/xsl:attribute[1]/xsl:value-of" x="128" y="126"/>
				<block path="order/shipping/xsl:attribute[2]/xsl:value-of" x="88" y="126"/>
				<block path="order/shipping/xsl:attribute[3]/xsl:value-of" x="48" y="126"/>
				<block path="order/shipping/xsl:attribute[4]/xsl:value-of" x="328" y="86"/>
				<block path="order/shipping/xsl:attribute[5]/xsl:value-of" x="248" y="86"/>
				<block path="order/shipping/xsl:attribute[6]/xsl:value-of" x="208" y="86"/>
				<block path="order/shipping/xsl:attribute[7]/xsl:value-of" x="168" y="86"/>
				<block path="order/shipping/xsl:attribute[8]/xsl:value-of" x="128" y="86"/>
				<block path="order/billing/xsl:attribute/xsl:value-of" x="88" y="86"/>
				<block path="order/billing/xsl:attribute[1]/xsl:value-of" x="48" y="86"/>
				<block path="order/billing/xsl:attribute[2]/xsl:value-of" x="328" y="46"/>
				<block path="order/billing/xsl:attribute[3]/xsl:value-of" x="288" y="46"/>
				<block path="order/billing/xsl:attribute[4]/xsl:value-of" x="248" y="46"/>
				<block path="order/billing/xsl:attribute[5]/xsl:value-of" x="208" y="46"/>
				<block path="order/billing/xsl:attribute[6]/xsl:value-of" x="168" y="46"/>
				<block path="order/billing/xsl:attribute[7]/xsl:value-of" x="128" y="46"/>
				<block path="order/billing/xsl:attribute[8]/xsl:value-of" x="88" y="46"/>
				<block path="order/billing/xsl:attribute[13]/xsl:value-of" x="48" y="46"/>
				<block path="order/xsl:for-each" x="368" y="126"/>
				<block path="order/xsl:for-each/item/xsl:attribute/xsl:value-of" x="408" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[1]/xsl:value-of" x="328" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[2]/xsl:value-of" x="248" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[3]/xsl:value-of" x="208" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[4]/xsl:value-of" x="168" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[5]/xsl:choose" x="378" y="16"/>
				<block path="order/xsl:for-each/item/xsl:attribute[5]/xsl:choose/number[0]" x="332" y="10"/>
				<block path="" x="328" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[6]/xsl:choose" x="418" y="16"/>
				<block path="order/xsl:for-each/item/xsl:attribute[6]/xsl:choose/number[0]" x="372" y="10"/>
				<block path="order/xsl:for-each/item/xsl:attribute[6]/xsl:choose/xsl:when/xsl:value-of" x="48" y="166"/>
				<block path="order/xsl:for-each/item/xsl:attribute[7]/xsl:value-of" x="288" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[8]/xsl:value-of" x="248" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[9]/xsl:value-of" x="208" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[10]/xsl:value-of" x="168" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[11]/xsl:value-of" x="128" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[12]/xsl:value-of" x="88" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[13]/xsl:if/number[0]" x="292" y="94"/>
				<block path="order/xsl:for-each/item/xsl:attribute[13]/xsl:if" x="338" y="96"/>
				<block path="order/xsl:for-each/item/xsl:attribute[13]/xsl:if/xsl:value-of" x="48" y="206"/>
				<block path="order/xsl:for-each/item/xsl:attribute[15]/xsl:if/number[0]" x="292" y="94"/>
				<block path="order/xsl:for-each/item/xsl:attribute[15]/xsl:if" x="338" y="96"/>
				<block path="order/xsl:for-each/item/xsl:attribute[15]/xsl:if/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each/item/xsl:attribute[16]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:if/number[0]" x="362" y="124"/>
				<block path="order/xsl:if" x="408" y="126"/>
				<block path="order/xsl:if/promotion/xsl:attribute/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:if/promotion/xsl:attribute[1]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:if/promotion/xsl:attribute[3]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each[1]" x="328" y="126"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[2]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[2]/xsl:value-of/format-number[1]" x="322" y="148"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[3]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[3]/xsl:value-of/format-number[1]" x="322" y="148"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[5]/xsl:value-of" x="368" y="126"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[5]/xsl:value-of/format-number[1]" x="322" y="148"/>
				<block path="order/xsl:for-each[1]/promotion/xsl:attribute[6]/xsl:value-of" x="368" y="126"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->