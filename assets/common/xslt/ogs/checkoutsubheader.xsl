<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:variable name="CurrentStep" select="ExpressLane/Order/CheckOut/CheckOutStep" />
		<div>
			<xsl:attribute name="id">CheckOutSteps</xsl:attribute>
			<xsl:variable name="currentstepid" select="ExpressLane/Order/CurrentStep/CheckOutStepID" />
			
			<table>
				<xsl:variable name="style">border-collapse: collapse;</xsl:variable>
				<tr>
					<xsl:for-each select="ExpressLane/Order/CheckOutSteps/CheckOutStep">
						<xsl:if test="IsVisible = 'true'">
							<td>
								<span>
									<xsl:if test="CheckOutStepID = $currentstepid">
										<xsl:attribute name="class">CurrentStep</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="Description" />
								</span>
							</td>
						</xsl:if>
					</xsl:for-each>
				</tr>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>