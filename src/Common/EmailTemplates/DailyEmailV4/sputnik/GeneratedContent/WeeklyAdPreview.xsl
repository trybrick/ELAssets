<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:variable name="StoreID" select="//GenericStore/StoreID" />
		<xsl:variable name="DataSource" select = "//CircularSummary/CircularSummaryItem[StoreID = $StoreID]" />
		
		<xsl:variable name="ImageUrl">
			<xsl:choose>
				<xsl:when test="string-length($DataSource/ImageUrl) &gt; 0">
					<xsl:value-of select="$DataSource/ImageUrl" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'##root##/Assets/Common/Images/CircularThumb.png'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<div id="WeeklyAdPreview">
			<h3>Check out our<br/>Weekly Ads!</h3>
			<p>
				Click on an item, find a recipe to match, and create your own shopping list.
			</p>
			<img border="0" style="margin:12px auto" src="{ $ImageUrl }"></img>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\test\buildxml.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->