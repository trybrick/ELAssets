<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	<xsl:template match="/">
		<div id="EmploymentLogo"></div>
		<div id="EmploymentPositionsHeader">
			<h2>Careers</h2>
				<p>At Plumb’s, we offer all of our employees flexible scheduling in a fun and clean environment.  We are always looking for motivated, energetic people to join our team!  Browse this page to learn about career opportunities currently available at Plumb’s.</p>
			<h2>Positions Available</h2>
				<p>We're looking for talented, passionate people in the following areas:</p>
		</div>
		<div id="EmploymentPositions">
			<xsl:for-each select="ExpressLane/JobOpenings/Positions">
				<h1>
					<xsl:value-of select="JobPositionTitle" disable-output-escaping="yes"/>
				</h1>
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
			
			<h2>How To Apply</h2>
			<p>Applications are available at our Customer Service Center in each of our stores.  Mail your completed Application to Plumb's Valu-Rite Foods, 1663 W. Sherman Blvd., Muskegon, MI  49441.  Or <a href="/Employment/Apply.aspx">click here</a> for our Online Employment Application.</p><br/><br/>
		
						
						
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

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