<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<xsl:variable name="FeaturedArticle" select="//FeaturedArticles/Article[ArticleTypeID = 2]"/>

		<xsl:variable name="FeaturedArticleURL">
			<xsl:value-of select="concat('##root##/Recipes/Article.aspx?ArticleID=', $FeaturedArticle/ArticleID)"/>
		</xsl:variable>
		
		<div>
			<h3>Featured Article</h3>
			<h4><xsl:value-of select="$FeaturedArticle/Title"/></h4>
			<div align="center">
				<img id="src" border="0" src="{$FeaturedArticle/ImageURL}" style="margin:4px auto"/>
			</div>
			<p>Click to read &gt;&gt;</p>
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