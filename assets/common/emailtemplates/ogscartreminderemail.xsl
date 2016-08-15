<!-- DWXMLSource="EmailReminder.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:variable name="ManageQuery" select="DataManager/IndexPageRequest[LinkID=19]/UrlEncodedValue"/>
		<xsl:variable name="ShopQuery" select="DataManager/IndexPageRequest[LinkID=16]/UrlEncodedValue"/>
		<xsl:variable name="PreferedHost" select="concat(DataManager/GenericChain/PreferedHost, '/index.aspx?id=')"/>

			<html>
			<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0" bgcolor='#cccccc' >

			<STYLE>
				table	{ border:0; cellpadding:0; cellspacing:0 }
			 	td 		{ border:0; font-size:12px; color:#000000; line-height:150%; font-family:Tahoma, Verdana, Helvetica; }
			 	a 		{ color:#FF361d; }
				h2, p	{margin-left:10px;}
			</STYLE>

			<table width="100%" cellpadding="10" cellspacing="0" bgcolor='#cccccc' >
			<tr>
			<td valign="top" align="center">

			<table width="820" cellpadding="0" cellspacing="0" bgcolor='#ffffff' >

					<tr>
					<td colspan="2">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="DataManager/GenericChain/ChainSettings/Setting[SettingID='1']/Value"/>
							</xsl:attribute>
						</img>
					</td>
					</tr>
			</table>

			<table width="820" border="1" cellpadding="20" cellspacing="0" bgcolor='#ffffff' >
					<tr>
						<td colspan="2">
						<xsl:for-each select="DataManager/ArrayOfStaticContent/StaticContent">
								<xsl:sort select="SortBy" data-type="number"/>
								<xsl:value-of select="Description" disable-output-escaping="yes"/>
							</xsl:for-each>
						</td>
					</tr>

					<tr>
						<td colspan="2" style="text-align:center;">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="concat($PreferedHost, $ManageQuery)"/>
								</xsl:attribute>
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="//GenericChain/PreferedHost"/>/Assets/Common/Images/email_start_order.gif
									</xsl:attribute>
									<xsl:attribute name="width">300</xsl:attribute>
									<xsl:attribute name="height">30</xsl:attribute>
									<xsl:attribute name="border">0</xsl:attribute>
								</img>
							</a>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<xsl:variable name="sdate" select="DataManager/GenericShoppingListItem/PriceStartDate" />
							<xsl:variable name="edate" select="DataManager/GenericShoppingListItem/PriceEndDate" />
							<xsl:if test="string-length($sdate) &gt; 0 and string-length($edate) &gt; 0">
								<span>
									Prices Valid: 
									<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
									 - 
									<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
								</span>
							</xsl:if>
							<table border="1" width="100%">
								<xsl:for-each select="DataManager/GenericShoppingList/VisibleItems/GenericShoppingListItem">
									<xsl:sort select="Description" data-type="text"/>
									<xsl:call-template name="ShoppingListItem">
										<xsl:with-param name="ManageLink" select="concat($PreferedHost, $ManageQuery)"/>
									</xsl:call-template>
								</xsl:for-each>
							</table>
						</td>
					</tr>

				</table>
			</td>
			</tr>
			</table>
		</body>
	</html>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="ShoppingListItem">
		<xsl:param name="ManageLink"/>
		<tr>
			<td>
				<xsl:value-of select="Quantity"/>
				<xsl:if test="number(Weight)">
					<xsl:variable name="Weight" select="number(Weight)" />
					<xsl:value-of select="concat(' - ', /VariableWeight/GenericFraction[number(StoredValue) = $Weight]/DisplayValue)" />
					<xsl:choose>
						<xsl:when test="PriceUnit">
							<xsl:value-of select="concat(' ', PriceUnit)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="' lbs.'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="string-length(SmallImageUrl) &gt; 0">
					<img width="35" height="35" >
						<xsl:attribute name="src">
							<xsl:value-of select="SmallImageUrl"/>
						</xsl:attribute>
					</img>
				</xsl:if>
			</td>
			<td>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$ManageLink"/>
					</xsl:attribute>
					<xsl:value-of select="Description"/>
				</a>
			</td>
			<td>
				<xsl:if test="number(Price)">
					<xsl:if test="number(PriceMultiple) > 1">
						<xsl:value-of select="concat(PriceMultiple, '/ ')"/>
					</xsl:if>
					<xsl:value-of select="format-number(Price, '$#.00')" />
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\GSN\DAG\EmailReminder.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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