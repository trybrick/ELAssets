<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	<xsl:template match="/">
		<div id="EmploymentLogo"></div>
		<div id="EmploymentPositionsHeader">
			<h1>Careers at <xsl:value-of select="ExpressLane/GenericChain/ChainName"/></h1>
		</div>
		<div id="EmploymentPositions">
			<h2>Positions Available</h2>
			<xsl:for-each select="ExpressLane/JobOpenings/Positions">
				<h3><xsl:value-of select="JobPositionTitle" disable-output-escaping="yes"/></h3>
				<p><xsl:value-of select="JobPositionDescription" disable-output-escaping="yes"/></p>
				<ul>
					<xsl:for-each select="Stores">
						<li>
							<!-- row striping -->
							<xsl:if test="position() mod 2 = 0">
								<xsl:attribute name="class">alternate-row</xsl:attribute>
							</xsl:if>
							<a href="{concat('Apply.aspx?Sid=',StoreID,'&amp;Pid=',JobPositionID)}">
								<xsl:value-of select="StoreName"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
			<h2>How To Apply</h2>
			<p>We offer all our employees flexible scheduling in a fun and clean environment. Applications are available at our
					Customer Service counters at your local store. We are always looking for motivated, energetic people to join our team.<br/><br/>
			
			<a href="/Employment/Apply.aspx">Click Here</a> for our Online Inquiry Sheet.
			</p>				
		</div>
	</xsl:template>
</xsl:stylesheet>