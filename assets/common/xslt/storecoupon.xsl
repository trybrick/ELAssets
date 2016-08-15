<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html"/>
  <xsl:template match="/">
   <xsl:choose>
			<xsl:when test="not(ExpressLane/Common)">
  			<xsl:for-each select="//FeaturedProduct[FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
					<div>
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">
								<xsl:attribute name="style">border:dashed black 2px;width:45%;min-height:235px; margin:5px;float:left;max-height:300px;</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="style">border:dashed black 2px;width:45%;min-height:235px; margin:5px;float:left;clear:both; max-height:300px;</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<tbody style="font-family: arial">
								<tr height="40">
									<td align="center" width="40%">
										<xsl:if test="string-length(//StoreFeaturedProducts/LogoImage) &gt; 0">
											<img>
												<xsl:attribute name="src">
													<xsl:value-of select="//StoreFeaturedProducts/LogoImage"/>
												</xsl:attribute>
												<xsl:attribute name="align">left</xsl:attribute>
												<xsl:attribute name="border">0</xsl:attribute>
											</img>
										</xsl:if>
									</td>
									<td width="60%" align="center">
										<strong>Internet Coupon</strong>
										<xsl:if test="PLU != ''">- <strong class="PLU">PLU:</strong><xsl:value-of select="PLU"/></xsl:if>
									</td>
								</tr>
								<tr>
									<td colSpan="2" align="center">
										<xsl:if test="ImageURL">
											<img id="src" src="{ImageURL}" height="100" align="left" border="0"/>
										</xsl:if>
										<xsl:if test="TopTagLine">
											<font size="2">
												<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
											</font>
										</xsl:if>
										<xsl:if test="BrandName">
											<p style="font-size: 18px; color: red; font-weight: bold; margin: 2px;">
												<xsl:value-of select="BrandName"/>
											</p>
										</xsl:if>
										<xsl:if test="ProductVariety">
											<p style="font-size: 14px; color: green; font-weight: bold; margin: 2px;">
												<xsl:value-of select="ProductVariety"/>
											</p>
										</xsl:if>
										<xsl:if test="PrimarySavingDescription">
											<p style="font-size: 12px; color: #000; font-weight: bold; margin: 2px;">
												<xsl:value-of select="PrimarySavingDescription"/>
												<xsl:if test="SecondarySavingDescription">
													<br/>
													<xsl:value-of select="SecondarySavingDescription"/>
												</xsl:if>
											</p>
										</xsl:if>
										<xsl:if test="Price">
											<p style="font-size: 12px; font-weight: bold; margin: 2px;">
												<xsl:variable name="price" select="Price"/>
												<xsl:value-of select="concat('$',substring($price,1,5))"/>
											</p>
										</xsl:if>
										<xsl:if test="SavingsDescription">
											<p style="font-size: 12px; font-weight: bold; margin: 2px;">
												<xsl:value-of select="SavingsDescription"/>
											</p>
										</xsl:if>
										<!-- <xsl:value-of select="department_name"/><br/> -->
										<xsl:if test="BarCodeImageURL != ImageURL">
											<img id="src" class="barcodeImage" src="{BarCodeImageURL}" align="center" border="0" style="max-height:60px; *height:60px"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td colSpan="2">
										<p style="font-size: 10px; margin: 5px 0; padding: 0px 10px; text-align: center;">
											<xsl:value-of select="BottomTagLine"/>
                                            <div class="storeCouponValidDates">
											<br/>Valid From <xsl:variable name="sdate" select="StartDate"/>
											<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
											<xsl:if test="EndDate != ''">
												<xsl:variable name="edate" select="EndDate"/>&#xA0;to
												<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
											</xsl:if>
                                            </div>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:if test="position() mod 2 = 0">
						<div id="newrow" style="width:100%; clear:both; height:1px; "></div>
					</xsl:if>
                    
					<xsl:if test="position() mod 4 = 0">
                    	<xsl:if test="position()!=last()">
							<div id="pagebreak" style="page-break-after:always"></div>
                        </xsl:if>
					</xsl:if>
                    
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="ExpressLane/PrintList/StoreCoupon/ArrayOfFeaturedProduct/FeaturedProduct">
					<div style="page-break-before:always"/>
				</xsl:if>
				<xsl:for-each select="ExpressLane/PrintList/StoreCoupon/ArrayOfFeaturedProduct/FeaturedProduct">
					<div>
						<xsl:if test="position() mod 2 = 0">
							<xsl:attribute name="style">border:dashed black 2px;width:45%;min-height:235px; margin:5px;float:left;max-height:300px;</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 2 != 0">
							<xsl:attribute name="style">border:dashed black 2px;width:45%;min-height:235px; margin:5px;float:left;clear:both; max-height:300px;</xsl:attribute>
						</xsl:if>
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<tbody style="font-family: arial">
								<tr height="40">
									<td align="center" width="40%">
										<xsl:if test="string-length(../../LogoImage) &gt; 1">
											<img>
												<xsl:attribute name="src">
													<xsl:value-of select="../../LogoImage"/>
												</xsl:attribute>
												<xsl:attribute name="align">left</xsl:attribute>
												<xsl:attribute name="border">0</xsl:attribute>
											</img>
										</xsl:if>
									</td>
									<td width="60%" align="center">
										<strong>Internet Coupon</strong>
										<xsl:if test="PLU != ''">- <strong>PLU:</strong><xsl:value-of select="PLU"/></xsl:if>
									</td>
								</tr>
								<tr>
									<td colSpan="2" align="center">
										<xsl:if test="ImageURL">
											<img id="src" src="{ImageURL}" height="100" align="left" border="0"/>
										</xsl:if>
										<xsl:if test="TopTagLine">
											<font size="2">
												<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
											</font>
										</xsl:if>
										<xsl:if test="BrandName">
											<p style="font-size: 18px; color: red; font-weight: bold; margin: 2px;">
												<xsl:value-of select="BrandName"/>
											</p>
										</xsl:if>
										<xsl:if test="ProductVariety">
											<p style="font-size: 14px; color: green; font-weight: bold; margin: 2px;">
												<xsl:value-of select="ProductVariety"/>
											</p>
										</xsl:if>  
										<xsl:if test="PrimarySavingDescription">
											<p style="font-size: 12px; color: #000; font-weight: bold; margin: 2px;">
												<xsl:value-of select="PrimarySavingDescription"/>
												<xsl:if test="SecondarySavingDescription">
													<br/>
													<xsl:value-of select="SecondarySavingDescription"/>
												</xsl:if>
											</p>
										</xsl:if>
										<xsl:if test="Price">
											<p style="font-size: 12px; font-weight: bold; margin: 2px;">
												<xsl:variable name="price" select="Price"/>
												<xsl:value-of select="concat('$',substring($price,1,5))"/>
											</p>
										</xsl:if> 
										<xsl:if test="SavingsDescription">
											<p style="font-size: 12px; font-weight: bold; margin: 2px;">
												<xsl:value-of select="SavingsDescription"/>
											</p>
										</xsl:if>
										<!-- <xsl:value-of select="department_name"/><br/> -->
										<xsl:if test="BarCodeImageURL != ImageURL">
											<img id="src" class="barcodeImage" src="{BarCodeImageURL}" align="center" border="0" style="max-height:60px; *height:60px"/>
										</xsl:if>
									</td>
								</tr>
								<tr> 
									<td colSpan="2">
										<p style="font-size: 10px; margin: 5px 0; padding: 0px 10px; text-align: center;">
											<xsl:value-of select="BottomTagLine"/>
                                            <div class="storeCouponValidDates">
											<br/>Valid From <xsl:variable name="sdate" select="StartDate"/>
											<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
											<xsl:if test="EndDate != ''">
												<xsl:variable name="edate" select="EndDate"/>&#xA0;to
												<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
											</xsl:if>
                                            </div>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:if test="position() mod 2 = 0">
						<div id="newrow" style="width:100%; clear:both; height:1px; "></div>
					</xsl:if>
					<xsl:if test="position() mod 4 = 0">
                    	<xsl:if test="position()!=last()">
							<div id="pagebreak" style="page-break-after:always"></div>
                        </xsl:if>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>