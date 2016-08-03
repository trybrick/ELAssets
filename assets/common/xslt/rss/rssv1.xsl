<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<xsl:apply-templates select="ExpressLane/RssFeed" />
	</xsl:template>
	<xsl:template name="RssChannel" match="RssFeed">
		<xsl:variable name="TypeFilter">
			<xsl:choose>
				<xsl:when test="//ApiParameters/KeyWord = 'circulars'">
					<xsl:text>RssCircular</xsl:text>
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'recipes'">
					<xsl:text>RssMealPlanner</xsl:text>
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'articles'">
					<xsl:text>RssArticle</xsl:text>
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'staticcontent'">
					<xsl:text>RssStaticPage</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Title">
			<xsl:choose>
				<xsl:when test="//ApiParameters/KeyWord = 'circulars'">
					<xsl:value-of select="concat(Title, ' : Ads')" />
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'recipes'">
					<xsl:value-of select="concat(Title, ' : Recipes')" />
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'articles'">
					<xsl:value-of select="concat(Title, ' : Articles')" />
				</xsl:when>
				<xsl:when test="//ApiParameters/KeyWord = 'staticcontent'">
					<xsl:value-of select="concat(Title, ' : Site')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="Title" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rss version="2.0">
			<channel>
				<title><xsl:value-of select="$Title" /></title>
				<link><xsl:value-of select="Link" /></link>
				<description><xsl:value-of select="Description" /></description>
				<xsl:if test="string-length(LastBuildDate) &gt; 0">
					<lastBuildDate><xsl:value-of select="LastBuildDate" /></lastBuildDate>
				</xsl:if>
				<xsl:if test="string-length(Language) &gt; 0">
					<language><xsl:value-of select="Language" /></language>
				</xsl:if>
				<xsl:if test="string-length(CopyRight) &gt; 0">
					<copyright><xsl:value-of select="CopyRight" /></copyright>
				</xsl:if>
				<xsl:if test="string-length(ManagingEditor) &gt; 0">
					<managingEditor><xsl:value-of select="ManagingEditor" /></managingEditor>
				</xsl:if>
				<xsl:if test="string-length(WebMaster) &gt; 0">
					<webMaster><xsl:value-of select="WebMaster" /></webMaster>
				</xsl:if>
				<xsl:if test="string-length(PubDate) &gt; 0">
					<pubDate><xsl:value-of select="PubDate" /></pubDate>
				</xsl:if>
				<xsl:if test="string-length(LastBuildDate) &gt; 0">
					<lastBuildDate><xsl:value-of select="LastBuildDate" /></lastBuildDate>
				</xsl:if>
				<xsl:if test="string-length(Category) &gt; 0">
					<category><xsl:value-of select="Category" /></category>
				</xsl:if>
				<xsl:if test="string-length(Generator) &gt; 0">
					<generator><xsl:value-of select="Generator" /></generator>
				</xsl:if>
				<xsl:if test="string-length(Docs) &gt; 0">
					<docs><xsl:value-of select="Docs" /></docs>
				</xsl:if>
				<xsl:if test="number(TTL)">
					<ttl><xsl:value-of select="TTL" /></ttl>
				</xsl:if>
				<xsl:if test="string-length(Rating) &gt; 0">
					<rating><xsl:value-of select="Rating" /></rating>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="string-length($TypeFilter) &gt; 0">
						<xsl:for-each select="Items/RssItem[@xsi:type = $TypeFilter]">
							<xsl:sort select="PublicationDate" order="descending" />
							<xsl:call-template name="Item" />
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="Items/RssItem">
							<xsl:sort select="PublicationDate" order="descending" />
							<xsl:call-template name="Item" />
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</channel>
		</rss>
	</xsl:template>
	<xsl:template name="Item" match="RssItem">
		<item>
			<xsl:if test="string-length(Title) &gt; 0">
				<title><xsl:value-of select="Title" /></title>
			</xsl:if>
			<xsl:if test="string-length(Link) &gt; 0">
				<link><xsl:value-of select="Link" /></link>
			</xsl:if>
			<xsl:if test="string-length(Description) &gt; 0">
				<description><xsl:value-of select="Description" disable-output-escaping="yes" /></description>
			</xsl:if>
			<pubDate><xsl:value-of select="PubDate" /></pubDate>
			<xsl:if test="Author">
				<author><xsl:value-of select="Author" /></author>
			</xsl:if>
			<xsl:if test="Category">
				<category><xsl:value-of select="Category" /></category>
			</xsl:if>
			<xsl:if test="Comments">
				<comments><xsl:value-of select="Comments" /></comments>
			</xsl:if>
			<xsl:if test="string-length(Enclosure/Url) &gt; 0 and number(Enuclosure/Length) and string-length(Enclosure/Type) &gt; 0">
				<enclosure>
					<xsl:attribute name="url">
						<xsl:value-of select="Enclosure/Url" />
					</xsl:attribute>
					<xsl:attribute name="length">
						<xsl:value-of select="Length" />
					</xsl:attribute>
					<xsl:attribute name="type">
						<xsl:value-of select="Type" />
					</xsl:attribute>
				</enclosure>
			</xsl:if>
			<xsl:if test="string-length(Guid) &gt; 0">
				<guid><xsl:value-of select="Guid" /></guid>
			</xsl:if>
			<xsl:if test="string-length(Source) &gt; 0 and string-length(SourceUrl) &gt; 0">
				<source>
					<xsl:attribute name="url"><xsl:value-of select="SourceUrl" /></xsl:attribute>
					<xsl:value-of select="Source" />
				</source>
			</xsl:if>
		</item>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-198-RSS.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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