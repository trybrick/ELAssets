<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="no"/>
  <xsl:template match="/">
	<xsl:variable name="SpacerURL" select="'##root##/Assets/Common/EmailTemplates/DailyEmail/images/spacer.gif'" />
	
	<xsl:variable name="ChainEmailAddress">
		<xsl:choose>
			<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value) &gt; 0">
				<xsl:value-of select="concat(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value, '@grocerywebsites.com')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>gsn@grocerywebsites.com</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<table width="100%">
		<tr>
			<td align="center">
				<table width="70%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center">
							<font size="1" color="#414141">
								<b>NOTE:</b> To ensure delivery to your inbox (not bulk or junk folders), please add 
									<b>
										<i>
											<xsl:value-of select="$ChainEmailAddress"/>
										</i>
									</b>
								to your address book or safelist.
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table width="90%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center">
							<font size="1" color="#414141">
								Email News is an opt-in, recurring email from <b><xsl:value-of select="//GenericChain/ChainName"/></b>. 
								This email address was obtained through e-mail sign up on our website located at
								<a href="{//GenericChain/PreferedHost}"><xsl:value-of select="//GenericChain/PreferedHost"/></a>.
							</font>
						</td>
					</tr>
					<tr>
						<td align="center">
							<font size="1" color="#9b9b9b">
								Copyright 2014 Grocery Shopping Network
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>


  </xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

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