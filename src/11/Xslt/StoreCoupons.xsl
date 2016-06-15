<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='FeaturedProductsTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='FeaturedProductsTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>Featured Products</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageSubHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='FeaturedProductsSubTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='FeaturedProductsSubTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="//GenericChain/ChainName" /><xsl:text> Store Coupons</xsl:text></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" /><span>&#160;<xsl:value-of select="$PageSubHeaderText" /></span></h2>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
	<div id="CouponList">
		<div id="Coupons">
			<xsl:choose>
				<xsl:when test="ExpressLane/StoreFeaturedProducts/FeaturedProducts/FeaturedProduct">
					<script type="text/javascript">
						<xsl:comment>

							function AddAllFeaturedProducts() {
								
								var itemsList = new Array();
								
								<xsl:for-each select="ExpressLane/StoreFeaturedProducts/FeaturedProducts/FeaturedProduct">
									itemsList.push('<xsl:value-of select="FeaturedProductID" />:<xsl:choose><xsl:when test="FeaturedProductTypeID=1">9</xsl:when><xsl:otherwise>10</xsl:otherwise></xsl:choose>');
								</xsl:for-each>
								
								AddMultipleCouponsToList(itemsList);
                }
              </xsl:comment>
            </script>
              <div id="SelectAllProducts">
                <a class="button">
                  <xsl:attribute name="href">javascript:AddAllFeaturedProducts();</xsl:attribute>
                  <span>Add All Coupons</span>
                </a>
            </div>
            <div style="clear:both">
              <table>
                <tbody>
                  <xsl:for-each select="ExpressLane/StoreFeaturedProducts/FeaturedProducts/FeaturedProduct">
			        <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 0">GridAlternatingItem</xsl:when>
                          <xsl:otherwise>GridItem</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td class="AddButton">
                        <a class="button">
                          <xsl:attribute name="href">javascript:AddToShoppingList(<xsl:value-of select="FeaturedProductID" />, <xsl:choose><xsl:when test="FeaturedProductTypeID=1">9</xsl:when><xsl:otherwise>10</xsl:otherwise></xsl:choose>);</xsl:attribute>
                          <span>Add</span>
                        </a>
                      </td>
                      <td class="CouponLogo">
                        <xsl:choose>
                          <xsl:when test="ImageURL">
                            <img>
                              <xsl:attribute name="src">
                                <xsl:value-of select="ImageURL" />
                              </xsl:attribute>
                              <xsl:attribute name="alt">
                                <xsl:value-of select="BrandName" />
                              </xsl:attribute>
                            </img>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:if test="../../LogoImage">
                              <img>
                              <xsl:attribute name="src">
                                <xsl:value-of select="../../LogoImage" />
                              </xsl:attribute>
                              <xsl:attribute name="alt">
                                <xsl:value-of select="BrandName" />
                              </xsl:attribute>
                            </img>
                            </xsl:if>
                          </xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="ItemName">
											<xsl:value-of select="BrandName" />
											<xsl:if test="string-length(ProductVariety)&gt;0">
												<xsl:value-of select="concat(' ', ProductVariety)" />
											</xsl:if>
											<xsl:if test="string-length(TopTagLine)&gt;0">
												<xsl:value-of select="concat(' ', TopTagLine)" />
											</xsl:if>
											<xsl:if test="string-length(PrimarySavingDescription)&gt;0">
												<xsl:value-of select="concat(' ', PrimarySavingDescription)" />
											</xsl:if>
										</td>
										<xsl:if test="../../IconImage">
											<td class="CouponIcon">
												<img alt="">
													<xsl:attribute name="src">
														<xsl:value-of select="../../IconImage" />
													</xsl:attribute>
												</img>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<p>There are currently no items available, please try again later.</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div>
	<div id="WebOut">
		<div id="WOContent">
			<img id="WOImage" />
		</div>
		<script type='text/javascript' src='http://www.festfoods.com/WebOuts/CouponsWO/GoogleAnalytics.js'></script>
		<script type='text/javascript'><xsl:attribute name="src">##root##/Assets/11/js/CouponsWO.js</xsl:attribute></script>
	</div>
</xsl:template>

</xsl:stylesheet>
<!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->