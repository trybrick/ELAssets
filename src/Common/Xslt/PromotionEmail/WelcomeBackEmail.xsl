<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">

		<table border="1">

			<xsl:for-each select="//ExpressLane/GenericConsumer">
				<tr>
					<td>
					Consumer:<xsl:text> </xsl:text><xsl:value-of select="ConsumerID"/><xsl:text> </xsl:text>(<xsl:value-of select="FirstName"/><xsl:text> </xsl:text><xsl:value-of select="LastName"/>)
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="//ExpressLane/GenericChain">
				<tr>
					<td>
					Chain:<xsl:text> </xsl:text><xsl:value-of select="ChainID"/>:<xsl:text> </xsl:text><xsl:value-of select="ChainName"/>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="//ExpressLane/GenericStore">
				<tr>
					<td>
					Store:<xsl:text> </xsl:text><xsl:value-of select="StoreName"/><xsl:text> </xsl:text>(<xsl:value-of select="StoreNumber"/>)
					<br></br>
					<xsl:value-of select="PrimaryAddress"/>
					<br></br>
					<xsl:value-of select="City"/>,<xsl:text> </xsl:text>
					<xsl:value-of select="StateName"/><xsl:text>  </xsl:text>
					  <xsl:value-of select="PostalCode"/>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="//ExpressLane/GenericPromotionEmailConsumer">
				<tr>
					<td>
					Promotion:<br></br>
					Discount Amount:<xsl:text> </xsl:text><xsl:value-of select="PromotionDiscountAmount"/>
					<br></br>
					Discount Percent:<xsl:text> </xsl:text><xsl:value-of select="PromotionDiscountPercentage"/>
					</td>
				</tr>
				<tr>
					<td>
					Checkout:<xsl:text> </xsl:text><xsl:value-of select="CheckOutDate"/>
					<br></br>
					<xsl:value-of select="FirstName"/><xsl:text> </xsl:text><xsl:value-of select="LastName"/>
					<br></br>
					<xsl:value-of select="OrderEmail"/>
					</td>
				</tr>
			</xsl:for-each>

		</table>
		<br/>

	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="43-PageTypeId-277-OGSWelcomeBackEmail.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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
			<SourceSchema srcSchemaPath="43-PageTypeId-277-OGSWelcomeBackEmail.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="table/xsl:for-each" x="289" y="60"/>
				<block path="table/xsl:for-each[1]" x="289" y="100"/>
				<block path="table/xsl:for-each[2]" x="289" y="140"/>
				<block path="table/xsl:for-each[3]" x="329" y="102"/>
				<block path="table/xsl:for-each[3]/tr/td/xsl:value-of" x="329" y="240"/>
				<block path="table/xsl:for-each[3]/tr/td/xsl:value-of[1]" x="249" y="240"/>
				<block path="table/xsl:for-each[4]" x="249" y="102"/>
				<block path="table/xsl:for-each[4]/tr/td/xsl:value-of" x="249" y="145"/>
				<block path="table/xsl:for-each[4]/tr/td/xsl:value-of[1]" x="209" y="145"/>
				<block path="table/xsl:for-each[4]/tr/td/xsl:value-of[2]" x="169" y="145"/>
				<block path="table/xsl:for-each[4]/tr/td/xsl:value-of[3]" x="129" y="145"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->