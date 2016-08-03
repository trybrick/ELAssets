<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="//FeaturedProduct[FeaturedProductTypeID = 2][FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
				<style>#storeCouponsPage	{font-family:Tahoma, Verdana, Arial, Helvetica; page-break-before:always}
				#storeCouponFrame	{width:360px; margin-left:50px; border:3px dashed red; position:relative; margin-bottom:32px;text-align:center;}
				#storeCouponFrame #couponTitle {width:250px;padding:0 50px;}
				#storeCouponFrame h1 {font-size:14pt; width:250px; text-align:center;padding:0;}
				#storeCouponFrame #couponBrand {width:250px;padding:0 50px;}
				#storeCouponFrame h2 {font-size:12pt; width:250px; text-align:center;padding:0;}
				#storeCouponFrame #couponDescription {width:250px;padding:0 50px;}
				#storeCouponFrame p {font-size:10pt; width:250px; text-align:center;padding:0;}
				#storeCouponFrame #couponImage {margin: 1em 2em;}</style>
				<div id="storeCouponsPage" style="page-break-before:always">
					<xsl:for-each select="//FeaturedProduct[FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
						<div id="storeCouponFrame">
							<img src="http://www.trigs.com/Assets/148/Images/trigscouponlogo.gif" style="position:absolute; left:-33px; top:50px; width:65px;"/>
							<div id="couponImage">
								<xsl:if test="ImageURL">
									<img src="{ImageURL}"/>
								</xsl:if>
							</div>
							<div id="couponTitle">
								<h1>
									<xsl:if test="PrimarySavingDescription">
										<xsl:value-of select="PrimarySavingDescription"/>
										<xsl:if test="SecondarySavingDescription">
											<br/>
											<xsl:value-of select="SecondarySavingDescription"/>
										</xsl:if>
									</xsl:if>
									<xsl:if test="SavingsDescription">
										<xsl:value-of select="SavingsDescription"/>
									</xsl:if>
								</h1>
							</div>
							<div id="barcode">
								<xsl:if test="BarCodeImageURL">
									<img id="barcodeImage" src="{BarCodeImageURL}"/>
								</xsl:if>
							</div>
							<div id="couponBrand">
								<h2>
									<xsl:if test="BrandName">
										<xsl:value-of select="BrandName"/>&#xA0;</xsl:if>
									<xsl:if test="ProductVariety">
										<xsl:value-of select="ProductVariety"/>
									</xsl:if>
									<xsl:if test="Price">
										<xsl:variable name="price" select="Price"/>
										<xsl:value-of select="concat('$',substring($price,1,5))"/>
									</xsl:if>
								</h2>
							</div>
							<div id="couponDescription">
								<p>
									<xsl:if test="TopTagLine">
										<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
									</xsl:if>
									<xsl:if test="BottomTagLine">
										<xsl:value-of select="BottomTagLine"/>
									</xsl:if>Valid From <xsl:variable name="sdate" select="StartDate"/>
									<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
									<xsl:if test="EndDate != ''">
										<xsl:variable name="edate" select="EndDate"/>&#xA0;to
										<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
									</xsl:if>
									<xsl:if test="PLU">
										<br/>
										<strong>PLU: <xsl:value-of select="PLU"/></strong>
									</xsl:if>
								</p>
							</div>
							<div id="clearing" style="clear:both; width:100%;"></div>
							<xsl:if test="position() mod 5 = 0">
								<div id="pagebreak" style="page-break-after:always">&#xA0;</div>
							</xsl:if>
						</div>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<br/>
				<br/>
				<style>#storeCouponsPage	{font-family:Tahoma, Verdana, Arial, Helvetica; page-break-before:always}
	#storeCouponFrame	{width:360px; margin-left:50px; border:3px dashed red; position:relative; margin-bottom:32px;text-align:center;}
	#storeCouponFrame #couponTitle {width:250px;padding:0 50px;}
	#storeCouponFrame h1 {font-size:14pt; width:250px; text-align:center;padding:0;}
	#storeCouponFrame #couponBrand {width:250px;padding:0 50px;}
	#storeCouponFrame h2 {font-size:12pt; width:250px; text-align:center;padding:0;}
	#storeCouponFrame #couponDescription {width:250px;padding:0 50px;}
	#storeCouponFrame p {font-size:10pt; width:250px; text-align:center;padding:0;}
	#storeCouponFrame #couponImage {margin: 1em 2em;}</style>

				<div id="storeCouponsPage" style="page-break-before:always">
					<xsl:for-each select="ExpressLane/PrintList/StoreCoupon/ArrayOfFeaturedProduct/FeaturedProduct">
						<div id="storeCouponFrame">
							<img src="http://www.trigs.com/Assets/148/Images/trigscouponlogo.gif" style="position:absolute; left:-33px; top:50px; width:65px;"/>
							<div id="couponImage">
								<xsl:if test="ImageURL">
									<img src="{ImageURL}"/>
								</xsl:if>
							</div>
							<div id="couponTitle">
								<h1>

									<xsl:if test="PrimarySavingDescription">
										<xsl:value-of select="PrimarySavingDescription"/>
										<xsl:if test="SecondarySavingDescription">
											<br/>
											<xsl:value-of select="SecondarySavingDescription"/>
										</xsl:if>
									</xsl:if>

									<xsl:if test="SavingsDescription">
										<xsl:value-of select="SavingsDescription"/>
									</xsl:if>
								</h1>
							</div>
							<div id="barcode">
								<xsl:if test="BarCodeImageURL">
									<img id="barcodeImage" src="{BarCodeImageURL}"/>
								</xsl:if>
							</div>
							<div id="couponBrand">
								<h2>
									<xsl:if test="BrandName">
										<xsl:value-of select="BrandName"/>&#xA0;</xsl:if>
									<xsl:if test="ProductVariety">
										<xsl:value-of select="ProductVariety"/>
									</xsl:if>
									<xsl:if test="Price">
										<xsl:variable name="price" select="Price"/>
										<xsl:value-of select="concat('$',substring($price,1,5))"/>
									</xsl:if>
								</h2>
							</div>
							<div id="couponDescription">
								<p>
									<xsl:if test="TopTagLine">
										<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
									</xsl:if>
									<xsl:if test="BottomTagLine">
										<xsl:value-of select="BottomTagLine"/>
									</xsl:if>Valid From <xsl:variable name="sdate" select="StartDate"/>
									<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
									<xsl:if test="EndDate != ''">
										<xsl:variable name="edate" select="EndDate"/>&#xA0;to
										<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
									</xsl:if>
									<xsl:if test="PLU">
										<br/>
										<strong>PLU: <xsl:value-of select="PLU"/></strong>
									</xsl:if>
								</p>
							</div>
							<div id="clearing" style="clear:both; width:100%;"></div>
							<xsl:if test="position() mod 5 = 0">
								<div id="pagebreak" style="page-break-after:always">&#xA0;</div>
							</xsl:if>
						</div>
					</xsl:for-each>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Documents and Settings\jhumphries\Desktop\Sample.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
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