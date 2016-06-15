<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html"/>
	<xsl:template name="StoreCoupon" match="/">
		<style>#productImage	{width:auto; height:auto; max-width:150px; max-height:100px; margin:6px 0 0 0}
		* html #productImage	{ margin:0 auto; 
							  	height: expression( this.scrollHeight > 99 ? "100px" : "auto" );
							  	}		
		#barcodeImage	{width:auto; height:auto; max-height:80px; margin:6px 0 0 0}
		* html #barcodeImage	{ margin:0 auto; 
							  	height: expression( this.scrollHeight > 79 ? "80px" : "auto" );
							  	}
		#chainLogoImage	{width:auto; height:auto; max-height:30px;}
		* html #chainLogoImage	{ margin:0 auto; 
							  	height: expression( this.scrollHeight > 29 ? "30px" : "auto" );
							  	}
								
		#couponContainerDiv {clear:both; border:dashed #999999 1px; height:auto; width:640px; max-height:250px; margin:0 0 5px 5px; padding:3px}
		* html #couponContainerDiv {
							  	height: expression( this.scrollHeight > 249 ? "250px" : "auto" );
								}</style>

   <xsl:choose>
			<xsl:when test="ExpressLane/GenericShoppingList">
				<xsl:for-each select="//FeaturedProduct[FeaturedProductID = //GenericShoppingListItem[ItemTypeID = 10]/ItemID]">
					<div id="couponContainerDiv">
						<xsl:if test="(position() - 1) mod 4 = 0">
							<xsl:attribute name="style">page-break-before:always</xsl:attribute>
						</xsl:if>
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<tbody style="font-family: arial">
								<tr height="30">
									<td rowspan="3" align="center" width="150">
										<xsl:if test="ImageURL">
											<img id="productImage" src="{ImageURL}" border="0"/>
											<br/>
										</xsl:if>
										<xsl:if test="BarCodeImageURL != '' and BarCodeImageURL != ImageURL">
											<img id="barcodeImage" class="barcodeImage" src="{BarCodeImageURL}" border="0"/>
										</xsl:if>
									</td>
									<td align="center">
										<div style="background-color:black; width:auto; border:1px solid black; float:left; color:white; padding:4px 10px; text-align:center; text-transform:uppercase">
										
											<xsl:variable name="DisplayName">
												<xsl:choose>
													<xsl:when test="string-length(//ChainSettings/Setting[Name='StoreCouponChainName']/Value) &gt; 0">
														<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponChainName']/Value" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>STORE COUPON</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
										
											<xsl:value-of select="$DisplayName" />
										</div>
										<div style="background-color:white; width:180px; border:1px solid black; float:left; color:black; padding:4px 10px; text-align:center;">
											<xsl:if test="EndDate != ''">
												<xsl:variable name="edate" select="EndDate"/>EXPIRES
												<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
											</xsl:if>&#xA0;</div>
									</td>
								</tr>

								<tr>
									<td>

										<xsl:if test="PLU != ''">
											<div class="PLU" style="clear:both; font-size:10px">
												<strong class="PLU">PLU:</strong>
												<xsl:value-of select="PLU"/>
											</div>
										</xsl:if>
										<xsl:if test="Plu != ''">
											<!-- XML node names are different in admin -->
											<div class="PLU" style="clear:both; font-size:10px">
												<strong class="PLU">PLU:</strong>
												<xsl:value-of select="Plu"/>
											</div>
										</xsl:if>
										<xsl:if test="BrandName">
											<div class="BN" style="clear:both; font-size:18px; font-weight:bold;">
												<xsl:value-of select="BrandName"/>
											</div>
										</xsl:if>
										<xsl:if test="ProductVariety">
											<div class="PV" style="clear:both; font-size:16px; font-weight:bold;">
												<xsl:value-of select="ProductVariety"/>
											</div>
										</xsl:if>
										<xsl:if test="TopTagLine">
											<div class="TTL" style="clear:both; font-size:16px">
												<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
											</div>
										</xsl:if>
										<xsl:if test="PrimarySavingDescription">
											<div class="PSDSSD" style="clear:both; font-size:9px; margin-top:10px; ">
												<xsl:value-of select="PrimarySavingDescription"/>
												<xsl:if test="SecondarySavingDescription">
													<br/>
													<xsl:value-of select="SecondarySavingDescription"/>
												</xsl:if>
											</div>
										</xsl:if>
										<xsl:if test="Price">
											<div class="PRICE" style="clear:both; font-size:10px">
												<xsl:variable name="price" select="Price"/>
												<xsl:value-of select="concat('$',substring($price,1,5))"/>
											</div>
										</xsl:if>

										<xsl:if test="SavingsDescription">
											<div class="SD" style="clear:both; font-size:10px">
												<xsl:value-of select="SavingsDescription"/>
											</div>
										</xsl:if>
										<xsl:if test="BottomTagLine">
											<div class="BTL" style="clear:both; font-size:8px">
												<xsl:value-of select="BottomTagLine" disable-output-escaping="yes"/>
											</div>
										</xsl:if>
										<!-- <xsl:value-of select="department_name"/><br/> -->
									</td>
								</tr>
								<tr>
									<td colSpan="2">
										<img>
											<xsl:attribute name="src">
												<xsl:choose>
													<xsl:when test="string-length(//ChainSettings/Setting[Name='FeaturedProductsHeaderLogo']/Value) &gt; 0">
														<xsl:value-of select="//ChainSettings/Setting[Name='FeaturedProductsHeaderLogo']/Value"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>/Assets/</xsl:text>
														<xsl:value-of select="//GenericChain/ChainID"/>
														<xsl:text>/Images/printlogo.gif</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<xsl:attribute name="align">right</xsl:attribute>
											<xsl:attribute name="id">chainLogoImage</xsl:attribute>
											<xsl:attribute name="border">0</xsl:attribute>
										</img>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:for-each>
			</xsl:when>

			<xsl:otherwise>
				<xsl:for-each select="//FeaturedProduct">
					<div id="couponContainerDiv">

						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<tbody style="font-family: arial">
								<tr height="30">
									<td rowspan="3" align="center" width="150">
										<xsl:if test="ImageURL">
											<img id="productImage" src="{ImageURL}" border="0"/>
											<br/>
										</xsl:if>
										<xsl:if test="BarCodeImageURL != '' and BarCodeImageURL != ImageURL">
											<img id="barcodeImage" class="barcodeImage" src="{BarCodeImageURL}" border="0"/>
										</xsl:if>
									</td>
									<td align="center">
										<div style="background-color:black; width:auto; border:1px solid black; float:left; color:white; padding:4px 10px; text-align:center; text-transform:uppercase">
											<xsl:variable name="DisplayName">
												<xsl:choose>
													<xsl:when test="string-length(//ChainSettings/Setting[Name='StoreCouponChainName']/Value) &gt; 0">
														<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponChainName']/Value" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>STORE COUPON</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
										
											<xsl:value-of select="$DisplayName" />
										</div>
										<div style="background-color:white; width:180px; border:1px solid black; float:left; color:black; padding:4px 10px; text-align:center;">
											<xsl:if test="EndDate != ''">
												<xsl:variable name="edate" select="EndDate"/>EXPIRES
												<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
											</xsl:if>&#xA0;</div>
									</td>
								</tr>

								<tr>
									<td>

										<xsl:if test="PLU != ''">
											<div class="PLU" style="clear:both; font-size:10px">
												<strong class="PLU">PLU:</strong>
												<xsl:value-of select="PLU"/>
											</div>
										</xsl:if>
										<xsl:if test="Plu != ''">
											<!-- XML node names are different in admin -->
											<div class="PLU" style="clear:both; font-size:10px">
												<strong class="PLU">PLU:</strong>
												<xsl:value-of select="Plu"/>
											</div>
										</xsl:if>
										<xsl:if test="BrandName">
											<div class="BN" style="clear:both; font-size:18px; font-weight:bold;">
												<xsl:value-of select="BrandName"/>
											</div>
										</xsl:if>
										<xsl:if test="ProductVariety">
											<div class="PV" style="clear:both; font-size:16px; font-weight:bold;">
												<xsl:value-of select="ProductVariety"/>
											</div>
										</xsl:if>
										<xsl:if test="TopTagLine">
											<div class="TTL" style="clear:both; font-size:16px">
												<xsl:value-of select="TopTagLine" disable-output-escaping="yes"/>
											</div>
										</xsl:if>
										<xsl:if test="PrimarySavingDescription">
											<div class="PSDSSD" style="clear:both; font-size:9px; margin-top:10px; ">
												<xsl:value-of select="PrimarySavingDescription"/>
												<xsl:if test="SecondarySavingDescription">
													<br/>
													<xsl:value-of select="SecondarySavingDescription"/>
												</xsl:if>
											</div>
										</xsl:if>
										<xsl:if test="Price">
											<div class="PRICE" style="clear:both; font-size:10px">
												<xsl:variable name="price" select="Price"/>
												<xsl:value-of select="concat('$',substring($price,1,5))"/>
											</div>
										</xsl:if>
										<xsl:if test="SavingsDescription">
											<div class="SD" style="clear:both; font-size:10px">
												<xsl:value-of select="SavingsDescription"/>
											</div>
										</xsl:if>
										<xsl:if test="BottomTagLine">
											<div class="BTL" style="clear:both; font-size:8px">
												<xsl:value-of select="BottomTagLine" disable-output-escaping="yes"/>
											</div>
										</xsl:if>
										<!-- <xsl:value-of select="department_name"/><br/> -->
									</td>
								</tr>
								<tr>
									<td colSpan="2">
										<img>
											<xsl:attribute name="src">/Assets/##chainid##/Images/printlogo.gif</xsl:attribute>
											<xsl:attribute name="align">right</xsl:attribute>
											<xsl:attribute name="border">0</xsl:attribute>
											<xsl:attribute name="style">max-height:40px; *height:40px;</xsl:attribute>
										</img>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>