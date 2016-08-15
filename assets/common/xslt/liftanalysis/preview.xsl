<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<table border="1">
			<tr>
				<td>
					<table border="1" style="width:50%;float:left;">
						<tr>
							<td valign="top">
								<b>Name</b>
							</td>
							<td valign="top">
								<b>
									<xsl:value-of select="//GenericCampaign/CampaignName"/>
								</b>
							</td>
						</tr>
						<tr>
							<td valign="top">Campaign Actual Run Period</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/StartDateDisplay"/>
								<xsl:text> - </xsl:text>
								<xsl:value-of select="//GenericCampaign/EndDateDisplay"/>
							</td>
						</tr>

						<tr>
							<td valign="top">Campaign Before Period</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/CampaignBeforeStartDateDisplay"/>
								<xsl:text> - </xsl:text>
								<xsl:value-of select="//GenericCampaign/CampaignBeforeEndDateDisplay"/>
							</td>
						</tr>
						<tr>
							<td valign="top">Campaign During Period</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/CampaignDuringStartDateDisplay"/>
								<xsl:text> - </xsl:text>
								<xsl:value-of select="//GenericCampaign/CampaignDuringEndDateDisplay"/>
							</td>
						</tr>
						<tr>
							<td valign="top">Add days to campaign</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/AddDaysToDuringPeriod"/>
							</td>
						</tr>
						<tr>
							<td valign="top">Analysis Runs From</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/AnalysisRequestedDateDisplay"/>
								<xsl:text> to </xsl:text>
								<xsl:value-of select="//GenericCampaign/AnalysisEndDateDisplay"/>
							</td>
						</tr>
						<tr>
							<td valign="top">Processing Priority</td>
							<td valign="top">
								<xsl:value-of select="//GenericCampaign/ProcessingPriorityTypeDescription"/>
							</td>
						</tr>
						<tr>
							<td>Processing Frequency
							</td>
							<td>
								<xsl:value-of select="//GenericCampaign/FrequencyTypeDescription"/>
							</td>
						</tr>	
						<tr>
							<td valign="top">Compare to prior year?</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="//GenericCampaign/IsBeforePeriodPriorYear = 'true'">Yes</xsl:when>
									<xsl:otherwise>No</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Include transactions where chain isn't known?</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="//GenericCampaign/IncludeUnknownChain = 'true'">Yes</xsl:when>
									<xsl:otherwise>No</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Exclude Discontinued Products?</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="//GenericCampaign/ExcludeDiscontinuedProducts = 'true'">Yes</xsl:when>
									<xsl:otherwise>No</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Exclude Products From Chains
								<br></br>Below % Of Network Average</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/ExcludeProductAveragePercentLowThreshold) &gt; 0">
										<xsl:value-of select="//GenericCampaign/ExcludeProductAveragePercentLowThreshold"/>%</xsl:when>
									<xsl:otherwise>N/A</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Exclude Products From Chains
								<br></br>Above % Of Network Average</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/ExcludeProductAveragePercentHighThreshold) &gt; 0">
										<xsl:value-of select="//GenericCampaign/ExcludeProductAveragePercentHighThreshold"/>%</xsl:when>
									<xsl:otherwise>N/A</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Order Impressions</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/AdImpressionsOrdered) &gt; 0">
										<xsl:value-of select="//GenericCampaign/AdImpressionsOrdered"/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Impressions Delivered</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/AdImpressionsDelivered) &gt; 0">
										<xsl:value-of select="//GenericCampaign/AdImpressionsDelivered"/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Clicks Delivered</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/ClicksDelivered) &gt; 0">
										<xsl:value-of select="//GenericCampaign/ClicksDelivered"/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">GSN Unique Visitors</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/GSNUniqueVisitorCount) &gt; 0">
										<xsl:value-of select="//GenericCampaign/GSNUniqueVisitorCount"/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">DFP Unique Visitors</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/DFPUniqueVisitorCount) &gt; 0">
										<xsl:value-of select="//GenericCampaign/DFPUniqueVisitorCount"/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td valign="top">Total Costs</td>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="string-length(//GenericCampaign/CampaignCost) &gt; 0">
										<xsl:text>$</xsl:text>
										<xsl:value-of select='format-number(//GenericCampaign/CampaignCost, "#.00")'/>
									</xsl:when>
									<xsl:otherwise>&lt;Not entered&gt;</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<ul style="width:40%;float:left;">
						<table border="1" style="float:left;">
							<tr>
								<td>
									<b>Chain Name</b>
								</td>
								<td>
									<b>POS Dates Available</b>
								</td>
							</tr>
							<xsl:for-each select="//GenericCampaign/Chains/GenericCampaignChain">
								<xsl:sort select="ChainName" data-type="text"/>
								<tr>
									<td>
										<xsl:value-of select="ChainName"/>(<xsl:value-of select="ChainID"/>)</td>
									<td>
										<xsl:value-of select="MinPurchaseDateDisplay"/>-
										<xsl:value-of select="MaxPurchaseDateDisplay"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</ul>
				</td>
			</tr>

			<tr>
				<td>|
				</td>
			</tr>

			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="//GenericCampaign/ProductUnShelvedCount &gt; 0">
							<font color="red"><b><xsl:value-of select="//GenericCampaign/ProductUnShelvedCount"/> products are unshelved, cannot continue!</b></font>
						</xsl:when>
						<xsl:otherwise>All Products Are Shelved</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" style="float:left;">
						<tr>
							<td>
								<b>UPC11</b>
							</td>
							<td>
								<b>Product Description</b>
							</td>
							<td>
								<b>Chain</b>
							</td>
							<td>
								<b>ProductID</b>
							</td>
							<td>
								<b>Create Date</b>
							</td>
							<td>
								<b>Shelved?</b>
							</td>
						</tr>
						<xsl:for-each select="//GenericCampaign/Products/GenericCampaignProduct">
							<xsl:sort select="ProductCode" data-type="number"/>
							<tr>
								<td>
									<xsl:value-of select="ProductCode"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="string-length(BrandName) &gt; 0"><xsl:value-of select="BrandName"/>-</xsl:when>
									</xsl:choose>
									<xsl:value-of select="ProductDescription"/>
								</td>
								<td>
									<xsl:value-of select="ChainText"/>
								</td>
								<td>
									<xsl:value-of select="ProductID"/>
								</td>
								<td>
									<xsl:value-of select="CreateDateDisplay"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="string-length(ShelfCategoryID) &gt; 0">Yes</xsl:when>
										<xsl:otherwise><font color="red"><b>NO</b></font></xsl:otherwise>
									</xsl:choose>
								</td>

							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>

			<tr>
				<td>|
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" style="float:left;">
						<tr>
							<td>
								<b>Department</b>
							</td>
							<td>
								<b>Aisle</b>
							</td>
							<td>
								<b>Category</b>
							</td>
							<td>
								<b>Shelf</b>
							</td>
						</tr>
						<xsl:for-each select="//GenericCampaign/Categories/GenericCampaignCategory">
							<xsl:sort select="DisplaySortName" data-type="text"/>
							<tr>
								<td>
									<xsl:value-of select="CategoryDepartmentName"/>
								</td>
								<td>
									<xsl:value-of select="CategoryAisleName"/>
								</td>
								<td>
									<xsl:value-of select="CategoryCategoryName"/>
								</td>
								<td>
									<xsl:value-of select="ShelfCategoryName"/>(<xsl:value-of select="CategoryID"/>)</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<br/>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\ExpressLane\ExpressLaneAdmin\GSN.Website\Assets\7\XmlData\7-PageTypeId-216-LiftAnalysis.xml" htmlbaseurl="" outputurl=""
		          processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline=""
		          postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\ExpressLane\ExpressLaneAdmin\GSN.Website\Assets\7\XmlData\7-PageTypeId-216-LiftAnalysis.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="table/tr/td/table/tr[8]/td[1]/xsl:choose" x="99" y="180"/>
				<block path="table/tr/td/table/tr[8]/td[1]/xsl:choose/=[0]" x="53" y="174"/>
				<block path="" x="260" y="71"/>
				<block path="table/tr/td/table/tr[9]/td[1]/xsl:choose" x="339" y="140"/>
				<block path="table/tr/td/table/tr[9]/td[1]/xsl:choose/=[0]" x="293" y="134"/>
				<block path="table/tr/td/table/tr[10]/td[1]/xsl:choose" x="139" y="140"/>
				<block path="table/tr/td/table/tr[10]/td[1]/xsl:choose/=[0]" x="93" y="134"/>
				<block path="table/tr/td/table/tr[11]/td[1]/xsl:choose" x="289" y="130"/>
				<block path="table/tr/td/table/tr[11]/td[1]/xsl:choose/&gt;[0]" x="243" y="124"/>
				<block path="table/tr/td/table/tr[11]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="197" y="118"/>
				<block path="table/tr/td/table/tr[12]/td[1]/xsl:choose" x="89" y="130"/>
				<block path="table/tr/td/table/tr[12]/td[1]/xsl:choose/&gt;[0]" x="43" y="124"/>
				<block path="table/tr/td/table/tr[12]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="0" y="118"/>
				<block path="table/tr/td/table/tr[13]/td[1]/xsl:choose" x="329" y="90"/>
				<block path="table/tr/td/table/tr[13]/td[1]/xsl:choose/&gt;[0]" x="283" y="84"/>
				<block path="table/tr/td/table/tr[13]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="237" y="78"/>
				<block path="table/tr/td/table/tr[14]/td[1]/xsl:choose" x="209" y="90"/>
				<block path="table/tr/td/table/tr[14]/td[1]/xsl:choose/&gt;[0]" x="163" y="84"/>
				<block path="table/tr/td/table/tr[14]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="117" y="78"/>
				<block path="table/tr/td/table/tr[15]/td[1]/xsl:choose" x="129" y="90"/>
				<block path="table/tr/td/table/tr[15]/td[1]/xsl:choose/&gt;[0]" x="83" y="84"/>
				<block path="table/tr/td/table/tr[15]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="37" y="78"/>
				<block path="table/tr/td/table/tr[16]/td[1]/xsl:choose" x="49" y="90"/>
				<block path="table/tr/td/table/tr[16]/td[1]/xsl:choose/&gt;[0]" x="3" y="84"/>
				<block path="table/tr/td/table/tr[16]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="0" y="78"/>
				<block path="table/tr/td/table/tr[17]/td[1]/xsl:choose" x="219" y="20"/>
				<block path="table/tr/td/table/tr[17]/td[1]/xsl:choose/&gt;[0]" x="173" y="14"/>
				<block path="table/tr/td/table/tr[17]/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="127" y="8"/>
				<block path="table/tr/td/table/tr[17]/td[1]/xsl:choose/xsl:when/xsl:value-of" x="169" y="50"/>
				<block path="table/tr/td/ul/table/xsl:for-each" x="89" y="50"/>
				<block path="table/tr[2]/td/xsl:choose" x="339" y="180"/>
				<block path="table/tr[2]/td/xsl:choose/&gt;[0]" x="293" y="174"/>
				<block path="table/tr[3]/td/table/xsl:for-each" x="249" y="210"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td/xsl:value-of" x="49" y="50"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[1]/xsl:choose" x="339" y="220"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[1]/xsl:choose/&gt;[0]" x="293" y="218"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[1]/xsl:choose/&gt;[0]/string-length[0]" x="247" y="212"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[1]/xsl:choose/xsl:when/xsl:value-of" x="289" y="250"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[1]/xsl:value-of" x="209" y="250"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[3]/xsl:value-of" x="169" y="250"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[4]/xsl:value-of" x="129" y="250"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[5]/xsl:choose" x="339" y="260"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[5]/xsl:choose/&gt;[0]" x="293" y="254"/>
				<block path="table/tr[3]/td/table/xsl:for-each/tr/td[5]/xsl:choose/&gt;[0]/string-length[0]" x="247" y="248"/>
				<block path="table/tr[5]/td/table/xsl:for-each" x="209" y="210"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->