<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="InventoryPageCategories.xsl"/>
	<xsl:import href="InventoryPageProductsV2.xsl"/>
	<xsl:import href="../AdPod.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="Inventory" class="ProductDisplayPage">
			<script type="text/javascript" src="/Assets/Common/Js/Inventory/Inventory.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Inventory/InventoryPage.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
			<xsl:call-template name="PageHeading" />
			<div id="Departments" class="clearfix">
				<xsl:for-each select="//ArrayOfGenericCategory/GenericCategory[string-length(ParentCategoryID) &lt; 1]">
					<xsl:sort select="Name"/>
					<xsl:variable name="CategoryID" select="CategoryID"/>
					<a class="grid_3">
						<xsl:attribute name="href">
							<xsl:value-of select="concat('/Shop/Product.aspx?Department=', $CategoryID)"/>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="//OverrideDepartments/Department[CategoryID = $CategoryID]">
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="//OverrideDepartments/Department[CategoryID = $CategoryID]/Name"/>
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="//OverrideDepartments/Department[CategoryID = $CategoryID]/ImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="CatgoryName"/>
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:otherwise>
						</xsl:choose>
						<span>
							<xsl:value-of select="CategoryName"/>
						</span>
					</a>
				</xsl:for-each>
			</div>
			<div id="ListBoxes" style="display:none;">
				<div id="Department" class="DepartmentAisleCategory">
					<h3>Department</h3>
					<select id="lstDepartments" size="4" class="CategoryList" onchange="UpdateAisles()">
						<xsl:choose>
							<xsl:when test="ExpressLane/Inventory/ArrayOfCategory/Category">
								<xsl:for-each select="ExpressLane/Inventory/ArrayOfCategory/Category[string-length(ParentCategoryID) = 0]">
									<xsl:sort select="CategoryName" data-type="text"/>
									<xsl:call-template name="CategoryDisplay"/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="//ArrayOfGenericCategory/GenericCategory[string-length(ParentCategoryID) = 0]">
									<xsl:sort select="CategoryName" data-type="text"/>
									<xsl:call-template name="GenericCategoryDisplay"/>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
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
				<xsl:call-template name="InventoryPageProductsV2"/>
			</div>
		</div>
		<script type="text/javascript">CheckQueryString();</script>
	</xsl:template>
	
	<!-- ========================================================================================== -->

	<xsl:template name="PageHeading">
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='BrowsePageTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='BrowsePageTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>Browse the Aisles</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
		<xsl:variable name="CartOrList">
			<xsl:choose>
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageHeaderDescription" select="concat('Select a department to view and add items to your ', $CartOrList,'.')" />
		
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" />
			<span><xsl:value-of select="$PageHeaderDescription" /></span>
		</h2>
	</xsl:template>
	
</xsl:stylesheet>