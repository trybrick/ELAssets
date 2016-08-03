<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<p>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="ExpressLane/MenuLinks/WeeklyAd/Hyperlink"/>
				</xsl:attribute>
				<img border="0">
					<xsl:attribute name="src">
						<xsl:value-of select="ExpressLane/MenuLinks/WeeklyAd/ImagePath"/>
					</xsl:attribute>
				</img>
			</a>
		</p>
		<p>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="ExpressLane/MenuLinks/Recipe/Hyperlink"/>
				</xsl:attribute>
				<img border="0">
					<xsl:attribute name="src">
						<xsl:value-of select="ExpressLane/MenuLinks/Recipe/ImagePath"/>
					</xsl:attribute>
				</img>
			</a>
		</p>
		<br />
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="NoItems.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="NoItems.xml" srcSchemaRoot="MenuLinks" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->