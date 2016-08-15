<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
			<xsl:choose>
				<xsl:when test="contains($AbsolutePath, '/recipes/recipevideos.aspx')">
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.aspx'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="secondary-navigation" class="clearfix">
			<ul>
				<xsl:for-each select="ExpressLane/tabs[2]/tab">
					<xsl:variable name="tabPath">
						<xsl:value-of select="translate(url, $ucletters, $lcletters)"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$aTabPath = $tabPath">
							<li>
								<xsl:attribute name="id">
									<xsl:text>current</xsl:text>
								</xsl:attribute>
								<a style="text-align:center">
									<xsl:attribute name="href">
										<xsl:value-of select="url"/>
									</xsl:attribute>
									<xsl:value-of select="text" disable-output-escaping="yes"/>
								</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="url = 0">
									<li>
										<xsl:attribute name="id">
											<xsl:text>blank</xsl:text>
										</xsl:attribute>
										<xsl:value-of select="text" disable-output-escaping="yes"/>
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li>
										<span>
											<a style="text-align:center">
												<xsl:attribute name="href">
													<xsl:value-of select="url"/>
												</xsl:attribute>
												<xsl:value-of select="text" disable-output-escaping="yes"/>
											</a>
										</span>
									</li>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="AbsolutePath">
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\188-PageTypeId-31-Tabs.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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