<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	<xsl:template match="/">
		<div id="EmploymentLogo"></div>
		<div id="EmploymentPositionsHeader">
			<h1 class="pageHeading">Employment</h1>
		</div>
		<div id="EmploymentPositions">
			<h2>Positions Available</h2>
					<xsl:for-each select="ExpressLane/JobOpenings/Positions">
						<h3>
							<xsl:value-of select="JobPositionTitle" disable-output-escaping="yes"/>
						</h3>
						<p>
							<xsl:value-of select="JobPositionDescription" disable-output-escaping="yes"/>
						</p>
						<ul>
							<xsl:for-each select="Stores">
								<li>
									<a>
										<xsl:attribute name="href">
											Apply.aspx?Sid=<xsl:value-of select="StoreID"/>&amp;Pid=<xsl:value-of select="JobPositionID"/>
										</xsl:attribute>
										<xsl:value-of select="StoreName"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:for-each>
					
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" />
				<div>
					<xsl:attribute name="id">div<xsl:value-of select="SortBy" /></xsl:attribute>
					<xsl:if test="SortBy &gt; 1">
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:if> 
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</div>
			</xsl:for-each>		
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
