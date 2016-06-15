<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<xsl:variable name="DisplayName">
			<xsl:choose>
				<xsl:when test="string-length(//GenericConsumer/FirstName) &gt; 0 and string-length(//GenericConsumer/LastName) &gt; 0">
					<xsl:value-of select="concat(//GenericConsumer/FirstName, ' ', //GenericConsumer/LastName)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//GenericConsumer/Email" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="string-length($DisplayName) &gt; 0)">
			<p>You are receiving this email because <b><xsl:value-of select="$DisplayName" /></b> created a shopping list for you.</p>
		</xsl:if>
		<xsl:apply-templates select="//GenericShoppingList" />
	</xsl:template>
	
	<xsl:template name="ShoppingList" match="GenericShoppingList">
		<xsl:if test="count(Categories) &gt; 0">
			<xsl:for-each select ="Categories/Category">
				<xsl:variable name="CatID" select="CategoryID" />
				<h3><xsl:value-of select="CategoryName" /></h3>
				<ul>
					<xsl:for-each select="../../Items/GenericShoppingListItem[CategoryID = $CatID]">
						<li><xsl:value-of select="concat(Quantity, ' - ', Description)" /></li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\43-PageTypeId-99-ShoppingList.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth=""
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