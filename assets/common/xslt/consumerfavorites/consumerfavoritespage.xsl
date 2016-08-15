<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- This import can change per chain-->
	<xsl:import href="GenericProductDisplayFavorites.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="CategoryIDs" match="//ConsumerFavorite/GenericProduct" use="DepartmentCategoryID"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="//GSNServices/IsWebservice = 'true'">
				<xsl:variable name="CatID" select="ExpressLane/ConsumerFavoriteVisibleCategory"/>
				<xsl:choose>
					<xsl:when test="$CatID &gt; 0">
						<xsl:call-template name="CategoryTopLevelDisplay">
							<xsl:with-param name="Category" select="ExpressLane/ArrayOfCategory/Category[CategoryID = $CatID]"/>
							<xsl:with-param name="Products" select="key('CategoryIDs', $CatID)"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="MainDisplay"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DefaultContent"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DefaultContent">
		<script>
			if (typeof (myLightWindow) != 'object') {
				var myLightWindow = new lightwindow();
			}

			function DisplayMissingItems(){
				myLightWindow.deactivate();
				myLightWindow.activateWindow({
					href: '#MissingItemsContent',
					title: 'Missing Items?',
					type: 'inline'
				});
			}
		</script>

		<h2 class="pageHeader">
			My Favorites <span>Your favorite items.</span>
			<a class="missingItems" href="javascript:DisplayMissingItems();">
				<span>Missing Items?</span>
			</a>
		</h2>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<div id="ConsumerFavoritesPage">
			<xsl:if test="count(//ConsumerFavorites/ConsumerFavorite) &gt; 0">
				<div id="favorites-controls">
					<p class="featureNote">If an item is no longer a favorite, simply click the red heart icon anywhere on our site to remove the item from this page.</p>
					<xsl:variable name="IsOGS">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<select id="ddlDepartment" onchange="GSNPageItems.ConsumerFavorites.OnDepartmentSelect()">
						<option value="0">All Departments</option>
						<xsl:for-each select="ExpressLane/ArrayOfCategory/Category">
							<xsl:variable name="ItemCount" select="count(key('CategoryIDs', CategoryID))"/>
							<xsl:if test="$ItemCount &gt; 0">
								<option id="categoryOption{CategoryID}" value="{CategoryID}" exportkeyid="{ExportKeyID}">
									<xsl:value-of select="CategoryName"/>
								</option>
							</xsl:if>
						</xsl:for-each>
					</select>
					<a href="javascript:void(0);" onclick="window.open('/favorites/printmyfavorites.gsn', 'ConsumerFavorites', 'width=800,height=600,scrollbars=yes,menubar=yes,top=10,left=10');" class="print-favorites favorites-action">Print My Favorites</a>
					<a href="javascript:GSNPageItems.ConsumerFavorites.OnAddAllToList();" class="add-all-favorites favorites-action" id="add-all-favorites-control">
				Add All to 
					<xsl:choose><xsl:when test="$IsOGS = 'true'"><xsl:text> Cart</xsl:text></xsl:when><xsl:otherwise><xsl:text> List</xsl:text></xsl:otherwise></xsl:choose>
			</a>
				</div>
			</xsl:if>
			<div id="favorites-wrapper">
				<xsl:call-template name="MainDisplay"/>
			</div>
		</div>
		<div id="MissingItemsContent" style="display:none;">
			<p>Occasionally, items from your Favorites will not appear if the exact item (size, flavor, brand, etc) is currently not available in your store.</p>
			<p>Examples include seasonal products and discontinued or out of stock items.  For products like strawberries, we may currently not carry the Driscoll brand but do carry Giant or other brands.</p>
			<p>Please browse the category or use general search to find similar items.</p>
		</div>
		<div id="productdescription"></div>
	</xsl:template>
	<xsl:template name="MainDisplay">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:for-each select="ExpressLane/ArrayOfCategory/Category">
			<xsl:variable name="ItemCount" select="count(key('CategoryIDs', CategoryID))"/>
			<xsl:if test="$ItemCount &gt; 0">
				<div id="{concat('category',CategoryID,'-wrapper')}">
					<xsl:call-template name="CategoryTopLevelDisplay">
						<xsl:with-param name="Category" select="."/>
						<xsl:with-param name="Products" select="key('CategoryIDs', CategoryID)"/>
					</xsl:call-template>
				</div>
			</xsl:if>
		</xsl:for-each>
		<div id="noConsumerFavorites">
			<xsl:if test="count(//ConsumerFavorites/ConsumerFavorite) &gt; 0">
				<xsl:attribute name="class">hidden</xsl:attribute>
			</xsl:if>
			<p class="featureNote">You do not have any favorites yet. Add some and check back!</p>
			<xsl:choose>
				<xsl:when test="$IsOGS = 'true'">
					<h3>How to Start Using Favorites</h3>
					<ol>
						<li class="favorites-step1">Add Items to My Favorites by clicking the heart icons anywhere on this site.</li>
						<li class="favorites-step2">Then, view them here to quickly add favorite items to your cart!</li>
						<li class="favorites-step3">If an item is no longer a favorite, simply click the red heart icon again to remove the favorite from this page.</li>
					</ol>
					<!--<img src="/Assets/Common/Images/myfavorites_info_cart.jpg" alt="How to use My Favorites with ecart"/>-->
				</xsl:when>
				<xsl:otherwise>
					<h3>How to Start Using Favorites</h3>
					<ol>
						<li class="favorites-step1">Add Items to My Favorites by clicking the heart icons anywhere on this site.</li>
						<li class="favorites-step2">Then, view them here to quickly add favorite items to your list!</li>
						<li class="favorites-step3">If an item is no longer a favorite, simply click the red heart icon again to remove the favorite from this page.</li>
					</ol>
					<!--<img src="/Assets/Common/Images/myfavorites_info_list.jpg" alt="How to use My Favorites with ecart"/>-->
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="CategoryTopLevelDisplay">
		<xsl:param name="Category"/>
		<xsl:param name="Products"/>
		<div id="{concat('category', $Category/CategoryID)}" class="favoriteCategory">
			<h3>
				<xsl:value-of select="$Category/CategoryName"/>
			</h3>
			<xsl:call-template name="GenericProductTableRelevance">
				<xsl:with-param name="GenericProducts" select="$Products"/>
			</xsl:call-template>
		</div>
	</xsl:template>
	<xsl:template name="CategoryProductsDisplay">
		<xsl:param name="Category"/>
		<xsl:param name="Products"/>
		<xsl:call-template name="GenericProductTableRelevance">
			<xsl:with-param name="GenericProducts" select="$Products"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
