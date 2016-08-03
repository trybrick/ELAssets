<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:if test="starts-with(ExpressLane/Common/Uri/AbsolutePath, '/CheckOut/ConfirmStore') = false">
			<xsl:apply-templates select="//ArrayOfGenericStore/GenericStore[StoreID = //GenericConsumer/PrimaryStoreID]"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="StoreInfo" match="GenericStore">
		<xsl:variable name="Stores" select="//ArrayOfGenericStore/GenericStore"/>
		<div id="CurrentStoreInfo">
			<p>You are currently placing an order with this store:</p>
			<h3>
				<xsl:value-of select="StoreName"/>
			</h3>
			<p>
				Located at:
				<br/>
				<xsl:value-of select="PrimaryAddress"/>
				<br/>
				<xsl:value-of select="City"/>
				<xsl:if test="string-length(State) &gt; 0">
					<xsl:value-of select="concat(', ', State)"/>
				</xsl:if>
				<xsl:if test="string-length(PostalCode) &gt; 0">
					<xsl:value-of select="concat(' ', PostalCode)"/>
				</xsl:if>
			</p>
			<xsl:if test="count($Stores) &gt; 1">
			<p class="otherstore">If you would like to place an order with another store, click <a><xsl:attribute name="href">/CheckOut</xsl:attribute>Here</a> to change your current store.</p>
			</xsl:if>
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent SideBar">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
	</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\43\XmlData\43-PageTypeId-158-OGSCheckoutSubHeader.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->