<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<xsl:if test="ExpressLane/ArrayOfCircularItem/CircularItem">
		<script src="/assets/common/js/wz_tooltip.js" type="text/javascript" />
		<div style="display:none;visiblity:hidden;">
		<xsl:for-each select="ExpressLane/ArrayOfCircularItem/CircularItem">
			<span>
				<xsl:attribute name="id"><xsl:value-of select="CircularItemID" />span</xsl:attribute>
				<div class="pSpecialsHoversNew">
					<h2><xsl:value-of select="CircularItemName" /></h2>
					<h3><xsl:value-of select="CircularItemDescription" disable-output-escaping="yes" /></h3>
					<h4><xsl:value-of select="PriceString" /></h4>
					<h5>Click to see available varieties and add to list.</h5>
				</div>
			</span>
		</xsl:for-each>
	</div>
	</xsl:if>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\73\XmlData\73-PageTypeId-95-PersonalizedSpecialsHovers.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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