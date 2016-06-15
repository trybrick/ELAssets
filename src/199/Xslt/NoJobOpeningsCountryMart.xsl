<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	<xsl:template match="/">
		<div id="EmploymentPositionsHeader">
			<h1>
				Careers at <xsl:value-of select="ExpressLane/JobOpenings/Chain/ChainName"/>
			</h1>
			<h2>Positions Available</h2>
			<p>There are no positions available online at this time.</p>

			<h2>How To Inquire</h2>
			<p>
				We offer all of our employees flexible scheduling in a fun and clean environment. 
				Applications available at our Customer Service Center. We are always looking for 
				motivated, energetic people to join our team.

				<br/><br/>

				
				<a href="/Employment/Apply.aspx"><!--
					<xsl:attribute name="href">
						<xsl:value-of select="Employment/ApplyLink"/>
					</xsl:attribute>-->
					Click Here
				</a>
				for our Online Inquiry Sheet.
			</p>
			
			<a href="##root##" class="button"><span>Back to Home</span></a>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->