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
				<b>There are no available positions at this time.</b>
			<h2>Join the Trig's Team</h2>
			<p>Everyone at Trig's is an important part of what we do. Everyone who works at Trig's has a big influence on the happiness of our customers and the success of our company. The secret to achieving both is employees who bring enthusiasm, ideas, and spirit to our organization.<br />In return, Trig's employees receive competitive wages, training, and the opportunity to build a career within our company. Benefits include:</p>
			<ul>
			    <li>Group health insurance</li>
			    <li>Life insurance</li>
			    <li>Disability insurance</li>
			    <li>Group dental and vision care</li>
			    <li>Prescription drug coverage</li>
			    <li>401(k)</li>
			    <li>Vacation/personal days</li>
			    <li>Paid holidays</li>
			    <li>Pre-tax cafeteria and flex plan.</li>
			</ul>
			<p>Contact our human resources department for complete details and eligibility requirements. T.A. Solberg reserves the right to eliminate or change any of the benefits at any time, without notice.</p>
			<p>Trig's is a friendly, progressive place to work that is rich with career advancement opportunities. If you would like to be a part of the Trig's team, <a><xsl:attribute name="href">##root##/Assets/<xsl:value-of select="ExpressLane/Common/Chain/ChainID" />/Images/trigs_app.pdf</xsl:attribute>click here</a> to get a Trig's Job Application. Download, print, complete, and deliver the application to the Trig's store you would like to work at. If you’d like current information on specific job openings available, please contact the store.</p>
			<!-- <p><a href="/Employment/Apply.aspx">Click Here </a>for our Online Employment Application.</p> -->
			<h2>EOE STATEMENT</h2>
			<p><em>T.A. Solberg Co., Inc. is an equal opportunity employer and fully subscribes to the principles of equal employment opportunity. It is our policy to provide employment, compensation and other benefits related to employment based on qualifications, without regard to race, color, religion, national origin, age, sex, veteran status, or disability, or any other basis prohibited by Federal or State law. As an equal opportunity employer, this company intends to comply with all Federal and State laws and the information requested on this application will not be used for any purpose prohibited by law.</em></p>		
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
