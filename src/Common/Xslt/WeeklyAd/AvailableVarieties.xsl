<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/GenericProduct/GenericProductDisplay.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">

    <xsl:variable name="OGSRequiresVarieties">
			<xsl:choose>
				<xsl:when test="translate(//GenericChain/ChainSettings/Setting[SettingID = 137]/Value, 'TRUE', 'true') = 'true'">true</xsl:when>
				<xsl:when test="translate(//GenericStore/StoreSettings/Setting[SettingID = 3]/Value, 'TRUE', 'true') = 'true'">true</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="translate(//GenericConsumer/ConsumerSettings/Setting[Name='OGSRequireAvaliableVarieties']/Value, 'TRUE', 'true')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="IsOGS">
			<xsl:choose>
			<xsl:when test="translate(//GenericChain/ChainSettings/Setting[Name = 'IsOnlineGrocery']/Value, 'TRUE', 'true') = 'true'">true</xsl:when>
			<xsl:when test="translate(//GenericStore/StoreSettings/Setting[SettingID = 2]/Value, 'TRUE', 'true') = 'true'">true</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="translate(//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value, 'TRUE', 'true')"/>
			</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<input>
			<xsl:attribute name="id">varietiesCircularItemID</xsl:attribute>
			<xsl:attribute name="type">hidden</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="//StoreCircularItem/CircularItemID"/>
			</xsl:attribute>
		</input>
		<xsl:choose>
			<xsl:when test="translate($OGSRequiresVarieties, 'TRUE', 'true') = 'true'">
				<div id="ogsavailablevarieties">
					<div id="availablevarietiestop">
						<h2>
							<xsl:choose>
								<xsl:when test="//GenericChain/ChainSettings/Setting[SettingID = 140]/Value != '' ">
									<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 140]/Value"/>
								</xsl:when>
								<xsl:otherwise>
                  Choose one or more varieties to add to your <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart.</xsl:when><xsl:otherwise> list.</xsl:otherwise></xsl:choose></xsl:otherwise>
							</xsl:choose>
						</h2>
					</div>
					<div id="availablevarietiesmiddle">
						<xsl:if test="//StoreCircularItem/ManufacturerCouponID&gt;0">
							<div id="availcouponimage">
								<img src="/Assets/Common/images/manufacturercouponicon.gif" alt="Manufacturer Coupon Available!"/>
								<p>
									<xsl:if test="number(//StoreCircularItem/ManufacturerCouponSavings)">Save  $<xsl:value-of select="format-number(//StoreCircularItem/ManufacturerCouponSavings, '0.00')"/><br/>
                                        with Coupon</xsl:if>
								</p>
							</div>
						</xsl:if>
						<xsl:if test="//StoreCircularItem/RecipeSearch">
							<div id="availrecipe">
								<img src="/Assets/Common/images/recipeideas_icon.gif" alt="Recipe Ideas"/>
								<a>
									<xsl:attribute name="href">/Recipes/RecipeSearchResults.aspx?KeyWord=<xsl:value-of select="//StoreCircularItem/RecipeSearch"/></xsl:attribute>Recipe<br/>Ideas</a>
							</div>
						</xsl:if>
						<table id="availproductdetails">
							<tr>
								<td id="availproductimage">
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="//StoreCircularItem/Name"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="//StoreCircularItem/SmallImageUrl"/>
										</xsl:attribute>
									</img>
								</td>
								<td>
									<div id="availproductinfo">
										<span class="availprice">
											<xsl:value-of select="//StoreCircularItem/PriceString"/>
										</span>
										<span class="availproductname">
											<xsl:value-of select="//StoreCircularItem/Name"/>
										</span>
										<span class="availableproductdescription">
											<xsl:value-of select="//StoreCircularItem/Description" disable-output-escaping="yes"/>
										</span>
									</div>
									<xsl:if test="count(//ArrayOfGenericProduct/GenericProduct)&gt;1">
										<div id="availnumberofvarieties">
											<b>
												<xsl:value-of select="count(//ArrayOfGenericProduct/GenericProduct)"/>
											</b>
											<xsl:choose>
												<xsl:when test="count(//ArrayOfGenericProduct/GenericProduct)=1"><xsl:text> variety.</xsl:text></xsl:when>
												<xsl:otherwise><xsl:text> varieties.</xsl:text></xsl:otherwise>
											</xsl:choose>  Select below.</div>
									</xsl:if>
								</td>
							</tr>
						</table>
						<xsl:if test="count(//ArrayOfGenericProduct/GenericProduct)&gt;0">
							<div id="availablevarietiesadditemlink" style="display:none;visibility:hidden;">
								<span>Select your favorite varieties, then click <strong>add to list</strong> to update your list.</span>
								<a href="javascript:AddAvaliableVarieties();">
									<div id="AddToList"></div>
								</a>
							</div>
							<div id="scrollabletable">
								<xsl:call-template name="GenericProductTableWithTableID">
									<xsl:with-param name="GenericProducts" select="//ArrayOfGenericProduct/GenericProduct"/>
									<xsl:with-param name="TableID" select="'tblAvaliableVarieites'"/>
								</xsl:call-template>
							</div>
						</xsl:if>
						<xsl:if test="not(number(//StoreCircularItem/Price))">
							<div id="availrandomweights">
								<select>
									<xsl:attribute name="class">availweights</xsl:attribute>
									<xsl:attribute name="style">display: none;</xsl:attribute>
									<xsl:attribute name="title">weights</xsl:attribute>

									<xsl:for-each select="ExpressLane/ArrayOfGenericFraction/GenericFraction">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="format-number(StoredValue, '0.##')"/>
											</xsl:attribute>
											<xsl:value-of select="DisplayValue"/>
										</option>
									</xsl:for-each>
								</select>
							</div>
						</xsl:if>
					</div>
					<div id="availablevarietiesbottom"/>
					<div class="OGSRequiredVarietiesDiv">
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div id="availablevarietiestop">
					<h2>
						<xsl:value-of select="//StoreCircularItem/Name"/>
					</h2>
				</div>
				<div id="availablevarietiesmiddle">
					<xsl:if test="//StoreCircularItem/Coupons/Coupon[CouponType = 1]">
						<div id="availcouponimage">
							<img src="/Assets/Common/images/manufacturercouponicon.gif" alt="Manufacturer Coupon Available!"/>
							<p>
								<xsl:if test="number(//StoreCircularItem/ManufacturerCouponSavings)">Save  $<xsl:value-of select="format-number(//StoreCircularItem/ManufacturerCouponSavings, '0.00')"/><br/>
                                        with Coupon</xsl:if>
							</p>
						</div>
					</xsl:if>
					<xsl:if test="//StoreCircularItem/RecipeSearch">
						<div id="availrecipe">
							<img src="/Assets/Common/images/recipeideas_icon.gif" alt="Recipe Ideas"/>
							<a>
								<xsl:attribute name="href">/Recipes/RecipeSearchResults.aspx?KeyWord=<xsl:value-of select="//StoreCircularItem/RecipeSearch"/></xsl:attribute>Recipe<br/>Ideas</a>
						</div>
					</xsl:if>
					<div id="availproductimage">
						<a>
							<xsl:attribute name="href">javascript:showImage('<xsl:value-of select="//StoreCircularItem/ImageUrl"/>');</xsl:attribute>
							<img>
								<xsl:attribute name="alt">
									<xsl:value-of select="//StoreCircularItem/Name"/>
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:value-of select="//StoreCircularItem/SmallImageUrl"/>
								</xsl:attribute>
							</img>
						</a>
					</div>
					<div id="availprice">
						<h3>
							<span>
								<xsl:value-of select="//StoreCircularItem/PriceString"/>
							</span>
						</h3>
					</div>
					<div id="availproductdescription">
						<xsl:value-of select="//StoreCircularItem/Description" disable-output-escaping="yes"/>
					</div>
					<xsl:if test="count(//ArrayOfGenericProduct/GenericProduct)&gt;1">
						<div id="availnumberofvarieties">
							<b>
								<xsl:value-of select="count(//ArrayOfGenericProduct/GenericProduct)"/>
							</b>
							<xsl:choose>
								<xsl:when test="count(//ArrayOfGenericProduct/GenericProduct)=1">&#160;variety.</xsl:when>
								<xsl:otherwise>&#160;varieties.</xsl:otherwise>
							</xsl:choose>&#160;&#160;Select below.</div>
						<div id="availablevarietiesadditemlink" style="display:none;visibility:hidden;">
							<span>Select your favorite varieties, then click <strong>add to list</strong> to update your list.</span>
							<a href="javascript:AddAvaliableVarieties();">
								<div id="AddToList"></div>
							</a>
						</div>
						<div id="byitem">
							<input type="hidden" id="hfAvailableVarietiesCircularItemID">
								<xsl:attribute name="value">
									<xsl:value-of select="//StoreCircularItem/CircularItemID"/>
								</xsl:attribute>
							</input>
							<table>
								<tbody>
									<xsl:for-each select="//ArrayOfGenericProduct/GenericProduct">
										<tr>
											<td>
												<xsl:if test="position() mod 2=0">
													<xsl:attribute name="class">itemavailablevarieties</xsl:attribute>
												</xsl:if>
												<input type="checkbox" name="AvailableVarietiesCheckBox" onclick="ShowHideAddToListControls();">
													<xsl:attribute name="value">
														<xsl:value-of select="ProductID"/>
													</xsl:attribute>
												</input>
												<p>
													<xsl:choose>
														<xsl:when test="string-length(BrandName) &gt; 0">
															<xsl:value-of select="concat(BrandName, ' ', Description)"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="Description"/>
														</xsl:otherwise>
													</xsl:choose>
												</p>
												<div style="display:none;">
													<xsl:attribute name="class">
														<xsl:value-of select="concat('ItemData_', ProductID, '_3')" />
													</xsl:attribute>
													<span class="ExportKeyID"><xsl:value-of select="ProductExportKeyID" /></span>
													<span class="ExportKeyID"><xsl:value-of select="BrandExportKeyID" /></span>
													<span class="ExportKeyID"><xsl:value-of select="DepartmentExportKeyID" /></span>
													<span class="ExportKeyID"><xsl:value-of select="AisleExportKeyID" /></span>
													<span class="ExportKeyID"><xsl:value-of select="CategoryExportKeyID" /></span>
													<xsl:if test="CategoryExportKeyID != ShelfExportCategoryID">
														<span class="ExportKeyID"><xsl:value-of select="ShelfExportKeyID" /></span>
													</xsl:if>
												</div>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:if>
				</div>
				<div id="availablevarietiesbottom"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>