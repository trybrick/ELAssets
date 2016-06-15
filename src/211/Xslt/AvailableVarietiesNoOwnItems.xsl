<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="GenericProductDisplay.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/"><style>
		#lightwindow_contents	{height:auto !important}
		
	</style>
    
    
		<input>
			<xsl:attribute name="id">varietiesCircularItemID</xsl:attribute>
			<xsl:attribute name="type">hidden</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="//StoreCircularItem/CircularItemID"/>
			</xsl:attribute>
		</input>
		<div id="ogsavailablevarieties">
			<xsl:if test="count(//ArrayOfGenericProduct/GenericProduct)&gt;0">
				<div id="availablevarietiestop">
					<h2>
						<xsl:choose>
							<xsl:when test="//GenericChain/ChainSettings/Setting[SettingID = 140]/Value != '' ">
								<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 140]/Value"/>
							</xsl:when>
							<xsl:otherwise>Choose one or more varieties to add to your list.</xsl:otherwise>
						</xsl:choose>
					</h2>
				</div>
			</xsl:if>
			<div id="availablevarietiesmiddle">
				<xsl:if test="//StoreCircularItem/ManufacturerCouponID&gt;0">
					<div id="availcouponimage">
						<img src="/assets/common/images/manufacturercouponicon.gif" alt="Manufacturer Coupon Available!"/>
						<p>
							<xsl:if test="number(//StoreCircularItem/ManufacturerCouponSavings)">
                                            Save  $<xsl:value-of select="format-number(//StoreCircularItem/ManufacturerCouponSavings, '0.00')" /><br/>
                                            with Coupon
                             </xsl:if>
						</p>
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
										<xsl:when test="count(//ArrayOfGenericProduct/GenericProduct)=1"> variety. </xsl:when>
										<xsl:otherwise> varieties. </xsl:otherwise>
									</xsl:choose>
									<xsl:text>Select below.</xsl:text>
								</div>
							</xsl:if>
						</td>
					</tr>
				</table>
				<br />
				<xsl:choose>
					<xsl:when test="count(//ArrayOfGenericProduct/GenericProduct)&gt;0">
                    <div id="scrollabletable">
						<xsl:call-template name="GenericProductTableWithTableID">
							<xsl:with-param name="GenericProducts" select="//ArrayOfGenericProduct/GenericProduct"/>
							<xsl:with-param name="TableID" select="'tblAvaliableVarieites'"/>
						</xsl:call-template>
                    </div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent">
								<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
									<xsl:sort select="OrderBy" data-type="number"/>
									<xsl:value-of select="Description" disable-output-escaping="yes"/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<p>This item is not available for purchase online.</p>
							</xsl:otherwise>
						</xsl:choose>
						<!-- This is needed to prevent an own item pop-up, do not remove! -->
						<table id="tblAvaliableVarieites" style="display:none;">
							<tr/>
							<tr/>
							<tr/>
						</table>
					</xsl:otherwise>
				</xsl:choose>
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
			<div id="availablevarietiesbottom" style="display:none;"/>
			<div class="OGSRequiredVarietiesDiv">
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

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