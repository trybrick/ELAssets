<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
	<table cellpadding="1" border="1">
	<tr>
	<th>Order ID</th>
	<th>Name</th>
	<th>Phone</th>
	<th>Order Date</th>
	<th>CheckOut Status</th>
	<th>Number of Items</th>
	<th>Order Total</th>
	</tr>
	<xsl:for-each select="//Admin/Orders/Order">
		<xsl:variable name="OrderID" select="OrderID" />
		<tr>
		<td><a><xsl:attribute name="href">
			<xsl:value-of select="//Admin/OrderLinks/OrderLink[OrderID = $OrderID]/URL" />
			</xsl:attribute>
			<xsl:value-of select="$OrderID"/>
			</a>
		</td>
		<td><xsl:value-of select="OrderInformation/Consumer/FirstName"/> <xsl:text> </xsl:text> <xsl:value-of select="OrderInformation/Consumer/LastName"/></td>
		<td><xsl:value-of select="OrderInformation/Consumer/Phone"/></td>
		<td><xsl:value-of select="FormattedDeliveryDate"/></td>
		<td><xsl:value-of select="OrderInformation/CheckOutListStatus"/></td>
		<td><xsl:value-of select="count(Items/OrderItem)" /></td>
		<td>$<xsl:value-of select="format-number(OrderInformation/Total, '##.##')"/></td>
		</tr>
	</xsl:for-each>
</table>
</xsl:template>


</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\OrderAdmin.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="OrderAdmin.xml" srcSchemaRoot="Orders" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->