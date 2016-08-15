<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<Article>
			<xsl:choose>
				<xsl:when test="ExpressLane/Article/ArticleID">
					<ArticleID>
						<xsl:value-of select="ExpressLane/Article/ArticleID"/>
					</ArticleID>
				</xsl:when>
				<xsl:otherwise>
					<ArticleID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="ExpressLane/Article/ArticleTypeID">
					<ArticleTypeID>
						<xsl:value-of select="ExpressLane/Article/ArticleTypeID"/>
					</ArticleTypeID>
				</xsl:when>
				<xsl:otherwise>
					<ArticleTypeID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/Body) &gt; 0">
					<Body>
						<xsl:value-of select="ExpressLane/Article/Body" disable-output-escaping="no"/>
					</Body>
				</xsl:when>
				<xsl:otherwise>
					<body/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/CreateDate) &gt; 0">
					<CreateDate>
						<xsl:value-of select="ExpressLane/Article/CreateDate"/>
					</CreateDate>
				</xsl:when>
				<xsl:otherwise>
					<CreateDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/ImageURL) &gt; 0">
					<ImageURL>
						<xsl:value-of select="ExpressLane/Article/ImageURL"/>
					</ImageURL>
				</xsl:when>
				<xsl:otherwise>
					<ImageURL/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/ModifyDate) &gt; 0">
					<ModifyDate>
						<xsl:value-of select="ExpressLane/Article/ModifyDate"/>
					</ModifyDate>
				</xsl:when>
				<xsl:otherwise>
					<ModifyDate/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/SubTitle) &gt; 0">
					<SubTitle>
						<xsl:value-of select="ExpressLane/Article/SubTitle"/>
					</SubTitle>
				</xsl:when>
				<xsl:otherwise>
					<SubTitle/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/Teaser) &gt; 0">
					<Teaser>
						<xsl:value-of select="ExpressLane/Article/Teaser"/>
					</Teaser>
				</xsl:when>
				<xsl:otherwise>
					<Teaser/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/Article/Title) &gt; 0">
					<Title>
						<xsl:value-of select="ExpressLane/Article/Title"/>
					</Title>
				</xsl:when>
				<xsl:otherwise>
					<title/>
				</xsl:otherwise>
			</xsl:choose>
		</Article>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-132-ExternalArticle.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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