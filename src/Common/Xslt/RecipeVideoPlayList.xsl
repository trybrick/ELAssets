<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" />
	<xsl:template match="/">
		<rss version="2.0" xmlns:media="http://search.yahoo.com/mrss/">
			<channel>
				<title>
					<xsl:choose>
						<xsl:when test="ExpressLane/VideoParameters/ChannelTitle">
							<xsl:value-of select="ExpressLane/VideoParameters/ChannelTitle" />
						</xsl:when>
						<xsl:otherwise>GSN Videos</xsl:otherwise>
					</xsl:choose>
				</title>
				<item>
					<media:title>
						<xsl:choose>
							<xsl:when test="ExpressLane/VideoParameters/IntroTitle">
								<xsl:value-of select="ExpressLane/VideoParameters/IntroTitle" />
							</xsl:when>
							<xsl:otherwise>GSN Intro</xsl:otherwise>
						</xsl:choose>
					</media:title>
					<media:content type="video/flv">
						<xsl:attribute name="url">
							<xsl:choose>
								<xsl:when test="ExpressLane/VideoParameters/IntroPath">
									<xsl:value-of select="ExpressLane/VideoParameters/IntroPath" />
								</xsl:when>
								<xsl:otherwise>flvs/intro_999.flv</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</media:content>	
				</item>
				<xsl:if test="string-length(ExpressLane/VideoParameters/VideoTitle) &gt; 0">
					<item>
						<media:title>
							<xsl:choose>
								<xsl:when test="ExpressLane/VideoParameters/VideoTitle">
									<xsl:value-of select="ExpressLane/VideoParameters/VideoTitle" />
								</xsl:when>
								<xsl:otherwise>GSN Recipe Video</xsl:otherwise>
							</xsl:choose>
						</media:title>
						<media:content type="video/flv">
							<xsl:attribute name="url">
								flvs/<xsl:value-of select="ExpressLane/VideoParameters/VideoTitle" />.flv
							</xsl:attribute>
						</media:content>
					</item>
				</xsl:if>
			</channel>
		</rss>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-149-RecipeVideoPlayList.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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