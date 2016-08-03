<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="personalizeditem_clipboard.xsl" />
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:variable name="SpacerURL" select="'##root##/Assets/Common/EmailTemplates/DailyEmail/images/spacer.gif'"/>
	<xsl:template match="/">
		<xsl:call-template name="Specials"></xsl:call-template>
	</xsl:template>
	
	<xsl:template name="Specials">
		<table id="Body_Right_Specials" width="675" border="0" cellpadding="5" cellspacing="0" margin="0">
			<tr>
				<xsl:choose>
					<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
						<xsl:text>##CircularItem_0## </xsl:text>
						<xsl:text>##CircularItem_1## </xsl:text>
						<xsl:text>##CircularItem_2## </xsl:text>
						<xsl:text>##CircularItem_3## </xsl:text>
						<xsl:text>##CircularItem_4##</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//PersonalizedSpecials/CircularItems/StoreCircularItem">
							<xsl:if test="position() &lt; 6">
								<xsl:call-template name="PersonalizedItem" />
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>