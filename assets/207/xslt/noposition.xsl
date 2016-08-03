<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="NoPositionsPage" class="EmploymentPage">
			<div id="EmploymentPositionsHeader">
				<h1>Careers at Sullivan's Foods</h1>				
			</div>			
			<p>
				<xsl:text>We offer all our employees flexible scheduling in a fun and clean environment. Applications are available at our
					Customer Service counters at your local store. We are always looking for motivated, energetic people to join our team.
				</xsl:text>
				<br/>
				<br/>				
				<a>
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="string-length(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 236]/Value) &gt; 0">
								<xsl:value-of select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 236]/Value"/>
							</xsl:when>
							<xsl:otherwise>/Employment/Apply.aspx</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:text>Click Here</xsl:text>
				</a>
				<xsl:text> for our Online Inquiry Sheet.</xsl:text>
			</p>
			<a href="/" class="button">
				<span>Back Home</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>