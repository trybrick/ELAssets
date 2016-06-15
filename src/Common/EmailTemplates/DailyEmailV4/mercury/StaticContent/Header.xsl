<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="count(//ArrayOfStaticContent/StaticContent) &gt; 0">
				<xsl:call-template name="CustomContent" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DefaultContent" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="DefaultContent">
		<xsl:variable name="setting" select="//GenericChain/ChainSettings/Setting[SettingID = 1]/Value" />
		<xsl:if test="string-length($setting) &gt; 0">
			<div>
				<a href="##root##">
					<img id="src" border="0" src="{ $setting }"></img>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="CustomContent">
		<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
		<xsl:sort select="SortBy" data-type="number" />
			<div>
				<xsl:value-of select="Description" disable-output-escaping="yes" />
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\197\EmailTemplates\build_test.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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