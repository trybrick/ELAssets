<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="no"/>
<xsl:template match="/">
	<xsl:if test="count(//DynamicContents/DynamicContent) &gt; 0">
		<table>
			<tbody>
				<xsl:for-each select="//DynamicContents/DynamicContent">
					<tr>
						<td align="center">
							<div align="center" style="width:572px">
							<xsl:value-of select="Content" disable-output-escaping="yes"/>
							</div>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:if>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->