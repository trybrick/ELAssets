<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="Deli">
			<div class="Header">
				Our Delicatessen
			</div>
			<div class="Images">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent" >
					<xsl:if test="string-length(Image)&gt;1">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="Image" />
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title" />
							</xsl:attribute>
						</img>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->