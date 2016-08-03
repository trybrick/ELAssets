<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="NoPositionsPage" class="EmploymentPage">
			<div id="EmploymentPositionsHeader">
				<h1>Careers at <xsl:value-of select="ExpressLane/GenericChain/ChainName"/></h1>
				<h2>Positions Available</h2>
			</div>
			<p>There are no positions available online at this time.</p>
			<h2>How To Apply</h2>
			<p>
				<xsl:text>We offer all of our employees flexible scheduling in a fun and clean environment. 
				Applications available at our Customer Service Center. We are always looking for 
				motivated, energetic people to join our team.</xsl:text>
				<br/>
				<br/>
				<xsl:if test="ExpressLane/GenericStore/PrimaryAddress != '' ">
					<xsl:text>Send to: </xsl:text>
					<xsl:value-of select="ExpressLane/GenericChain/ChainName"/>
					<xsl:text> -  </xsl:text>
					<xsl:value-of select="ExpressLane/GenericStore/PrimaryAddress"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="ExpressLane/GenericStore/SecondaryAddress"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="ExpressLane/GenericStore/City"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="ExpressLane/GenericStore/State"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="ExpressLane/GenericStore/PostalCode"/>
					<xsl:text> or </xsl:text>
				</xsl:if>
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
				<xsl:text> for our Online Employment Application.</xsl:text>
			</p>
			<a href="/" class="button">
				<span>Back to Home</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>