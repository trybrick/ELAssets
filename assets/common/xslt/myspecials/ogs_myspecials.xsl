<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
	    <script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
		<script type="text/javascript" src="/Assets/Common/Js/MyPantry/MyPantryService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/MyPantry/MyPantryPage.js" />
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<div id="mypantry">
			<xsl:choose>
				<xsl:when test="">
					<div id="CtrlDepartmentDropDown">
						<select id="ddlDepartment" onchange="TogglePantryGrid();">
							<option value="0">
								Show All
							</option>
							<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory">
								<xsl:sort select="CategoryName" data-type="text" />
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="CategoryID" />
									</xsl:attribute>
									<xsl:value-of select="CategoryName" />
								</option>
							</xsl:for-each>
						</select>
					</div>
					<div id="ProductsGrid">
						<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory">
							<xsl:sort select="CategoryName" data-type="text" />
							<xsl:variable name="CatID" select="CategoryID" />
							<xsl:if test="count(ancestor::ShopperHistory/Products/GenericProduct[CategoryID = $CatID]/SalePriceString[.!='']) &gt; 0">
								<div>
									<xsl:attribute name="id"><xsl:value-of select="concat('ProductsGrid:',$CategoryID)" /></xsl:attribute>
									<xsl:attribute name="class">LineItem</xsl:attribute>
									<xsl:call-template name="GenericProductTableByCategory">
										<xsl:with-param name="GenericProducts" select="ancestor::ShopperHistory/Products/GenericProduct[CategoryID = $CatID]/SalePriceString[.!='']"></xsl:with-param>
										<xsl:with-param name="GenericCategory" select="."></xsl:with-param>
									</xsl:call-template>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="no-items">
						<p>We have not selected your Specials yet.  Please check back later.</p>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>