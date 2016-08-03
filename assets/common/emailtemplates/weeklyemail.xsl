<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:key name="meals-by-date" match="EmailContents/MealPlanner" use="DisplayDate"/>


<xsl:template match="/">
	<html style="margin:0; height:100%; padding:0; ">
		<head>
			<STYLE type="text/css">
				a:link,
				a:visited,
				a:active			{color:#C02407;text-decoration:none;}
				a:hover				{color:#FF0000;text-decoration:underline;}
				p					{color:#000000; font-size:12px;}
			</STYLE>
	    	<title></title>
		</head>

		<body style="font-weight:normal; font-style:normal; font-family: Verdana, Arial, Helvetica, sans-serif; color:black; padding:0; vertical-align:top;">
		
		<!-- Start Header Section -->
		<div id="container" style="display:block; height:auto; width: 820px; margin-left:auto; margin-top:0px; margin-right:auto; border:0; padding:0; overflow:hidden;">

			<table>
				<tbody>
					<tr>
						<td>
							<table width="820">
						  		<tbody>
									<tr>
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="EmailContents/ChainInfo/Domain"/>
												</xsl:attribute>
												<img id="src" border="0" src="{EmailContents/ChainInfo/StoreEmailLogo}"/>
											</a>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<br />



		<table>
				<tbody>
					<tr>

						<!--==   Scored Specials Column   ==-->
						<td width="194" vAlign="top" align="center">
                        
							<table width="100%" cellpadding="0" cellspacing="0" border="3" bordercolor="#005447">
                            <tr>
								<td valign="top" width="100%">	
                                			
									<table width="100%" border="0" cellpadding="5" cellspacing="0">
                                        <tr><td width="100%" align="left" valign="top">
                                        <img src="/Assets/51/Images//ukrops/uk_email_place_holder_left_top.jpg" border="0"/>
                                        </td></tr>
                                	</table>
                                    
                                    
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                        <td align="center">
                                        <div style="font-family:Verdana,Arial,Helvetica,sans-serif;font-size:10px;color:black;">
                                         Offers valid from 
                                            <xsl:variable name="sdate" select="EmailContents/CircularItemScoring/StartDate"/>
                                            <xsl:variable name="edate" select="EmailContents/CircularItemScoring/EndDate"/>
                                            <xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
                                            <![CDATA[ ]]>to<![CDATA[ ]]>
                                            <xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
                                        </div>
                                        </td>
                                        </tr>
                                    </table>
                                    
                                    
                                    <table width="100%" vAlign="top" align="center">
        
                                        <xsl:for-each select="EmailContents/CircularItemScoring">
                                            <xsl:if test="position() &lt; 7">
                                            <tr valign="top" style="text-align:center;">
                                                <td>
                                                    <a>
                                                        <img>
                                                            <xsl:attribute name="src"><xsl:value-of select="SmallImageURL" /></xsl:attribute>
                                                            <xsl:attribute name="border">0</xsl:attribute>
                                                        </img><br/>
                                                    </a>
                                                    <div style="font-family : Verdana, Arial, Helvetica, sans-serif; text-align:center; font-size : 12px; color : black;"><xsl:value-of select="CircularItemName" /></div>
                                                    <div style="font-family : Verdana, Arial, Helvetica, sans-serif; text-align:center; font-size : 12px; color : red;"><xsl:value-of select="ProductDescription" /></div>
                                                    <div style="font-family : Verdana; text-align:center; font-size : 15px; color : black; font-weight : bold;"><xsl:value-of select="PriceString" /></div> 
                                                 </td>
                                             </tr> 
                                             </xsl:if>
                                             <xsl:if test="position() &lt; 6">
                                                <tr>
                                                    <td colspan="1"><hr size="1" width="90%" noshade="noshade"/>
                                                    </td>
                                                </tr>
                                             </xsl:if>
                                        </xsl:for-each>	
                                    </table>					
								
                                </td>
                             </tr>
                             </table>
                        </td>
                                    


						<td width="21">
							<img src="/Assets/Common/Images/pixel.gif" width="18"/>
						</td>



						<td vAlign="top" width="572">


							<!-- Start User Customize Section -->
							<table>
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:for-each select="EmailContents/DynamicContent">
														<tr>
															<td align="center" style="text-align:center">
																<xsl:value-of select="EmailContent" disable-output-escaping="yes"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>            


						</td>
                        


				</tr>


			</tbody>
	  	</table>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\emailbeta.xml" htmlbaseurl="" outputurl="" processortype="msxml" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->