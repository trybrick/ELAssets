<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/GenericProduct/GenericProductDisplay.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/StaticPageType/Description = 'MyPantryItems'">
				<xsl:call-template name="MyPantryItems" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="MyPantry" />
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:template>
	<xsl:template name="MyPantry" match="ExpressLane">
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
	    <script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />
		<script type="text/javascript" src="/Assets/Common/Js/MyPantry/MyPantryService.js" />
		<script type="text/javascript" src="/Assets/Common/Js/MyPantry/MyPantryPage.js" />
		<script type="text/javascript">
			<![CDATA[
			function TogglePantryGrid() {

				var categoryID = $('ddlDepartment').value;
				var categoryDivID = 'ProductsGrid:' + categoryID;

				var productGrids = document.getElementsByClassName('LineItem');

				if (typeof(productGrids) == 'object') {
					
					for ( var i = 0; i < productGrids.length; i++) {
						
						var productsDiv = productGrids[i];

						if (categoryID != 0) {
							if (productsDiv.id == categoryDivID) {
								productsDiv.show();
							}
							else {
								productsDiv.hide();
							}
						}
						else {
							productsDiv.show();
						}
					}
				}

				refreshAdPods();
			}

			function SelectCategory() {
				
				var categoryID = $('ddlDepartment').value;	
				var requestArgs = GSNContext.RequestArguments;
				
				GetProductsByCategory(document.URL, requestArgs, categoryID, HandleSelectCategoryResponse, null);
									
				$$('#UpdateProgress1').each(function (e) { e.show(); });
			}

			function HandleSelectCategoryResponse(response) {

				$$('#UpdateProgress1').each(function (e) { e.hide(); });	

				var responseContent = UnwrapResponse(response);

				if (responseContent != '') {
					$('ProductsGrid').innerHTML = responseContent;
				}
			}
			]]>
		</script>
		<div id="productdescription"></div>
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='MyPantryTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='MyPantryTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>My Pantry</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
		<xsl:variable name="CartOrList">
			<xsl:choose>
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageSubHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='MyPantrySubTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='MyPantrySubTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>View history of items added to your <xsl:value-of select="$CartOrList" />.</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" /><span> <xsl:value-of select="$PageSubHeaderText" />.</span></h2>    		
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
				<xsl:when test="count(//ShopperHistory/Products/GenericProduct) &gt; 0">
					<div id="CtrlDepartmentDropDown">
						<select id="ddlDepartment">
							<xsl:attribute name="onchange">
								<xsl:choose>
									<xsl:when test="count(//ShopperHistory/Products/GenericProduct) &gt; 100">
										<xsl:text>SelectCategory();</xsl:text>
									</xsl:when>
									<xsl:otherwise>TogglePantryGrid();</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:if test="count(//ShopperHistory/Products/GenericProduct) &lt;= 100">
								<option value="0">
									Show All
								</option>
							</xsl:if>
							<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory[CategoryID = //ShopperHistory/Products/GenericProduct/DepartmentCategoryID]">
								<xsl:sort select="CategoryName" data-type="text" />
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="CategoryID" />
									</xsl:attribute>
									<xsl:attribute name="exportkeyid">
										<xsl:value-of select="ExportKeyID" />
									</xsl:attribute>
									<xsl:value-of select="CategoryName" />
								</option>
							</xsl:for-each>
						</select>
					</div>
					<div id="ProductsGrid">
						<xsl:choose>
							<xsl:when test="count(//ShopperHistory/Products/GenericProduct) &gt; 100">
								<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory[1]">
									<xsl:sort select="CategoryName" data-type="text" />
									<xsl:call-template name="ProductsByCategory">
										<xsl:with-param name="CategoryID" select="CategoryID" />
									</xsl:call-template>					
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="ExpressLane/ShopperHistory/Categories/GenericCategory">
									<xsl:sort select="CategoryName" data-type="text" />
									<xsl:call-template name="ProductsByCategory">
										<xsl:with-param name="CategoryID" select="CategoryID" />
									</xsl:call-template>					
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="no-items">
						<p>You do not have any purchase history yet. Please check back later.</p>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="MyPantryItems">
		<xsl:apply-templates select="ExpressLane/ShopperHistory/Categories/GenericCategory[CategoryID = //ExpressLane/Category/CategoryID]">
			<xsl:with-param name="CategoryID" select="//ExpressLane/Category/CategoryID" />
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="GenericCategory" name="ProductsByCategory">
		<xsl:param name="CategoryID" />
		<div>
			<xsl:attribute name="id"><xsl:value-of select="concat('ProductsGrid:',$CategoryID)" /></xsl:attribute>
			<xsl:attribute name="class">LineItem</xsl:attribute>
			<xsl:call-template name="GenericProductTableByCategory">
				<xsl:with-param name="GenericProducts" select="//ShopperHistory/Products/GenericProduct"></xsl:with-param>
				<xsl:with-param name="GenericCategory" select="."></xsl:with-param>
			</xsl:call-template>
		</div>
	</xsl:template>
</xsl:stylesheet>