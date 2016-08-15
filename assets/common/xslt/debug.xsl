<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<div id="DebugPage">
			<ul>
			<li><strong>Machine Name:</strong> <xsl:value-of select="ExpressLane/Debug/Server/MachineName" /></li>
			<li><strong>Host: </strong> <xsl:value-of select="ExpressLane/Debug/ServerVariables/HTTP_HOST" /></li>
			<li><strong>Host IP: </strong><xsl:value-of select="ExpressLane/Debug/ServerVariables/REMOTE_HOST" /></li>
			<li><strong>Domain name: </strong><xsl:value-of select="ExpressLane/GenericChain/PreferedHost" /></li>
			<li><strong>Chain: </strong><xsl:value-of select="ExpressLane/GenericChain/ChainName" /></li>
			<li><strong>ChainID: </strong><xsl:value-of select="ExpressLane/GenericChain/ChainID"/></li>
			<li><strong>StoreID: </strong><xsl:value-of select="ExpressLane/GenericConsumer/PrimaryStoreID" /></li>
			<li><strong>SaleItemHeaderID: </strong><xsl:value-of select="ExpressLane/GenericShoppingList/SaleItemHeaderID" /></li>
			<li><strong>ConsumerID: </strong><xsl:value-of select="ExpressLane/GenericConsumer/ConsumerID" /></li>
			<xsl:if test="ExpressLane/GenericConsumer/HouseholdID != ''">
				<li><strong>HouseholdID: </strong><xsl:value-of select="ExpressLane/GenericConsumer/HouseholdID" /></li>
			</xsl:if>
			<xsl:if test="ExpressLane/GenericConsumer/ExternalID != ''">
				<li><strong>ExternalID: </strong><xsl:value-of select="ExpressLane/GenericConsumer/ExternalID" /></li>
			</xsl:if>
			<xsl:if test="ExpressLane/GenericConsumer/ExternalHouseholdID != ''">
				<li><strong>ExternalHouseholdID: </strong><xsl:value-of select="ExpressLane/GenericConsumer/ExternalHouseholdID" /></li>
			</xsl:if>
			<li><strong>ShoppingListID: </strong><xsl:value-of select="ExpressLane/GenericShoppingList/ShoppingList/ShoppingListID" /></li>
			<li><strong>GSN SessionID: </strong><xsl:value-of select="ExpressLane/Debug/Session/SessionID" /></li>
			<li><strong>ASP.NET SessionID: </strong><xsl:value-of select="ExpressLane/Debug/webSession/SessionID" /></li>
			<li>
				<strong>Browser: </strong>
				<xsl:value-of select="ExpressLane/Debug/Session/Browser" />
			</li>
			<li>
				<strong>Browser Details: </strong>
				<xsl:value-of select="ExpressLane/Debug/ServerVariables/HTTP_USER_AGENT" />
			</li>
			<li>
				<strong>Cookies Enabled: </strong>
				<xsl:choose>
					<xsl:when test="ExpressLane/Debug/ServerVariables/HTTP_COOKIE">true
					</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</li>
			<li><strong>Server Variables:</strong><br/>
			<p> id="ServerVariables">
				<xsl:value-of select="ExpressLane/Debug/ServerVariables/ALL_RAW"/>
			</p></li>
			</ul>
		</div>
		<xsl:if test="ExpressLane/GenericChain">
			<h1>success</h1>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="LocalTest" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-38-Debug.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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