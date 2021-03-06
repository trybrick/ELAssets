<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="personalizeditemV3.xsl" />
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:variable name="SpacerURL" select="'##root##/Assets/Common/EmailTemplates/DailyEmail/images/spacer.gif'"/>
	<xsl:template match="/">
		<xsl:call-template name="Specials"></xsl:call-template>
	</xsl:template>

	<xsl:template name="Specials">
		<xsl:variable name="sdate" select="//StoreCircularSummary/StartDate"/>
		<xsl:variable name="edate" select="//StoreCircularSummary/EndDate"/>

		<xsl:variable name="StartDate" select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
		<xsl:variable name="EndDate" select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
		<xsl:variable name="EffectiveDates" select="concat($StartDate, ' - ', $EndDate)"/>

		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
							<td width="19">
								<img src="{$SpacerURL}" width="19" style="display:block;"/>
							</td>
				<td>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="170">
								<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/personalizedTab.jpg" border="0" height="32" width="160" style="display:block;"/>
								<!--Need Logic for Personalized vs Top Picks
								<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/topTab.jpg" border="0" height="32" width="160" style="display:block;"/>			
			-->
							</td>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="1">Ad Prices Valid From <xsl:value-of select="$EffectiveDates"/></font>
							</td>
						</tr>
					</table>
				</td>
							<td width="19">
								<img src="{$SpacerURL}" width="19" style="display:block;"/>
							</td>
			</tr>
			<tr>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
				<td align="left">
					<table id="Body_Right_Specials" width="690" border="0" cellpadding="5" cellspacing="0" margin="0" style="border:1px solid #ccc;">
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
				</td>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\197\EmailTemplates\build_personalized_test.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->