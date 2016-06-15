<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="SpecialsPageCategories.xsl"/>
	<xsl:import href="OGS_SpecialsPageProducts.xsl"/>
	<xsl:import href="../AdPod.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="Specials" class="ProductDisplayPage">
			<script type="text/javascript" src="/Assets/Common/Js/Specials/Specials.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
		    <script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Inventory/InventoryPage.js" />
			<xsl:call-template name="PageHeading" />
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:value-of select="Description" disable-output-escaping="yes" />
					</xsl:for-each>
				</div>
			</xsl:if>
			<div id="ListBoxes">
				<div id="Department" class="DepartmentAisleCategory">
					<h3>Department</h3>
					<select id="lstDepartments" size="4" class="CategoryList" onchange="UpdateAisles()">
						<xsl:for-each select="//ArrayOfCategory/Category[string-length(ParentCategoryID) &lt; 1]">
							<xsl:sort select="CategoryName" data-type="text" />
							<xsl:call-template name="CategorySelect" />
						</xsl:for-each>
					</select>
				</div>
				<div id="InBetween1">&gt;</div>
				<div id="Aisles" class="DepartmentAisleCategory">
					<h3>Aisle</h3>
					<select id="lstAisles" size="4" class="CategoryList" onchange="UpdateCategories()">
					</select>
				</div>
				<div id="InBetween2">&gt;</div>
				<div id="Category" class="DepartmentAisleCategory">
					<h3>Category</h3>
					<select id="lstCategory" size="4" class="CategoryList" onchange="UpdateGrid()">
					</select>
				</div>
			</div>
			<div id="UpdateProgress1" style="display: none;">
				<div id="ProcessingPanel">
					<img src="../Assets/Common/Images/Wait.gif" alt="Wait"/>Processing...</div>
			</div>
			<div id="LineItem" class="LineItem">
				<xsl:call-template name="OGS_SpecialsPageProducts" />
			</div>
		</div>
	</xsl:template>
	
	<!-- ========================================================================================== -->

	<xsl:template name="PageHeading">
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='SpecialsPageTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='SpecialsPageTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>In-Store Specials</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>		
		<xsl:variable name="PageHeaderDescription" select="'Browse items on sale by department.'" />
		
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" />
			<span><xsl:value-of select="$PageHeaderDescription" /></span>
		</h2>
	</xsl:template>
	
</xsl:stylesheet>