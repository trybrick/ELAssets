<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="no"/>
<xsl:template match="/">
	<td width="200" valign="top" style="background-color: #FFFFFF; border-right: 1px dashed #CCCCCC; text-align: left;">
		<span style="font-size: 12px; font-weight: normal; color: #999999; font-family: Verdana,Arial,Helvetica,sans-serif; line-height: 150%;">
			<img src="http://www.ukrops.com/email_2008/new_email/specials6.gif" border="0" />
			<div style="font-family : Verdana, Arial, Helvetica, sans-serif; font-size : 10px; color : black; text-align: center;">
				Offers valid  
				<xsl:variable name="sdate" select="//StoreCircularSummary/StartDate"/>
				<xsl:variable name="edate" select="//StoreCircularSummary/EndDate"/>
				<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
				<![CDATA[ ]]>through<![CDATA[ ]]>
				<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
			</div>
			<br />
			<xsl:for-each select="//PersonalizedSpecials/CircularItems/StoreCircularItem">
				<xsl:if test="position() &lt; 7">
					<div style="font-family : Verdana, Arial, Helvetica, sans-serif; text-align: center; font-size : 12px; color : black;">
					<a>
						<img>
							<xsl:attribute name="src"><xsl:value-of select="SmallImageUrl" /></xsl:attribute><xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
					</div>
					<div style="font-family : Verdana, Arial, Helvetica, sans-serif; text-align: center; font-size : 12px; color : black;">
						<xsl:value-of select="Name" />
					</div>
					<div style="font-family : Verdana, Arial, Helvetica, sans-serif; text-align: center; font-size : 12px; color : red;">
						<xsl:value-of select="ProductDescription" />
					</div>
					<div style="font-family: Verdana, Arial, Helvetica, sans-serif; text-align: center; font-size : 15px; color : black; font-weight : bold;">
						<xsl:value-of select="PriceString" />
					</div>
				</xsl:if>
				<xsl:if test="position() &lt; 6">
					<hr size="1" width="90%" noshade="noshade" />
				</xsl:if>
			</xsl:for-each>
			<br />
			<a href="http://ukrops.gsnrecipes.com/shop/circular.aspx">
				<img src="http://www.ukrops.com/email_2008/new_email/more_specials3.gif" border="0" />
			</a>
		</span>
	</td>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\Desktop\xml\emailpersonalized.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->