<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="ExpressLane/SavedShoppingLists/Lists/GenericShoppingList">
				<xsl:for-each select="ExpressLane/SavedShoppingLists">
					<xsl:call-template name="SavedShoppingList"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="ExpressLane/SavedShoppingLists/Lists/SavedShoppingList">
				<xsl:for-each select="ExpressLane/SavedShoppingLists">
					<xsl:call-template name="SavedShoppingList"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="IsOGS">
					<xsl:choose>
						<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
						<xsl:otherwise>false</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$IsOGS = 'true'">
						<h3>You do not have any saved shopping carts.</h3>
					</xsl:when>
					<xsl:otherwise>
						<h3>You do not have any saved shopping lists.</h3>
					</xsl:otherwise>
				</xsl:choose>
				<div>
					<p>
						<xsl:text>To save a shopping list use the "Save Current </xsl:text>
						<xsl:choose>
							<xsl:when test="$IsOGS = 'true'"> Cart</xsl:when>
							<xsl:otherwise> List</xsl:otherwise>
						</xsl:choose>
						<xsl:text> As" button on the Manage List Menu on the </xsl:text>
						<a href="/Shop/ManageList.gsn">
							<xsl:text>Manage </xsl:text>
							<xsl:choose>
								<xsl:when test="$IsOGS = 'true'"> Cart</xsl:when>
								<xsl:otherwise> List</xsl:otherwise>
							</xsl:choose>
						</a>
						<xsl:text> page.</xsl:text>
					</p>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SavedShoppingList" match="SavedShoppingLists">
		<xsl:param name="SelectedListID" select="SelectedListID"/>
		<div class="SavedShoppingListsAllItems">
			<xsl:for-each select="SelectedList">
				<xsl:call-template name="SavedShoppingListDisplay"/>
			</xsl:for-each>
		</div>
		<div>
			<div class="SavedShoppingListsAll">
				<xsl:variable name="IsOGS">
					<xsl:choose>
						<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
						<xsl:otherwise>false</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:if test="count(Lists/GenericShoppingList/ShoppingList) &gt; 0">
					<xsl:choose>
						<xsl:when test="$IsOGS = 'true'">
							<h2>Saved Carts:</h2>
						</xsl:when>
						<xsl:otherwise>
							<h2>Saved Lists:</h2>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:for-each select="Lists/SavedShoppingList">
					<xsl:sort select="ShoppingListID" data-type="number" order="descending"/>
					<h3>
						<xsl:choose>
							<xsl:when test="ShoppingListID = $SelectedListID">
								<xsl:attribute name="class">active</xsl:attribute>
								<span>
									<xsl:value-of select="Title"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:DisplaySavedList(', ShoppingListID, ');')"/>
									</xsl:attribute>
									<xsl:value-of select="Title"/>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:for-each>
				<xsl:for-each select="Lists/GenericShoppingList/ShoppingList">
					<xsl:sort select="ShoppingListID" data-type="number" order="descending"/>
					<h3>
						<xsl:choose>
							<xsl:when test="ShoppingListID = $SelectedListID">
								<xsl:attribute name="class">active</xsl:attribute>
								<span>
									<xsl:value-of select="Title"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:DisplaySavedList(', ShoppingListID, ');')"/>
									</xsl:attribute>
									<xsl:value-of select="Title"/>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="SavedShoppingListDisplay" match="SelectedList">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div>
			<h3>
				<xsl:choose>
					<xsl:when test="$IsOGS = 'true'">
						<span>Saved Cart:</span>
					</xsl:when>
					<xsl:otherwise>
						<span>Saved List:</span>
					</xsl:otherwise>
				</xsl:choose>
				&quot;<xsl:value-of select="ShoppingList/Title"/>&quot;
			</h3>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="concat('javascript:DeleteSavedList(', ShoppingList/ShoppingListID, ');')"/>
				</xsl:attribute>
				<xsl:attribute name="class">button</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$IsOGS = 'true'">
						<span>Delete Cart</span>
					</xsl:when>
					<xsl:otherwise>
						<span>Delete List</span>
					</xsl:otherwise>
				</xsl:choose>
			</a>
			<a class="button">
				<xsl:attribute name="href">
					<xsl:value-of select="concat('javascript:AddAllItemsFromOtherList(', ShoppingList/ShoppingListID, ');')"/>
				</xsl:attribute>
				<span>Add All</span>
			</a>
			<a class="missingItems" href="javascript:DisplayMissingItems();">
				<span>Missing Items?</span>
			</a>
		</div>
		<xsl:for-each select="Categories/Category">
			<xsl:call-template name="SavedShoppingListCategoryList"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="SavedShoppingListCategoryList" match="Category">
		<xsl:param name="ShoppingListID"/>
		<xsl:param name="CategoryID" select="CategoryID"/>
		<div>
			<h4>
				<xsl:value-of select="CategoryName"/>
			</h4>
		</div>
		<table>
			<tbody>
				<xsl:for-each select="//SelectedList/VisibleItems/GenericShoppingListItem[CategoryID = $CategoryID]">
					<xsl:call-template name="SavedShoppingListItemDisplay"/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="SavedShoppingListItemDisplay" match="GenericShoppingListItem">
		<tr>
			<td class="ButtonUpdate">
				<xsl:variable name="Weight">
					<xsl:choose>
						<xsl:when test="number(Weight)"><xsl:value-of select="Weight" /></xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<a class="button">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('javascript:AddShoppingListItemQty(', ShoppingListItemID, ', ', 1, ', ', $Weight, ');')"/>
					</xsl:attribute>
					<span>Add</span>
				</a>
			</td>
			
			
			<td class="Favorite">
				<xsl:variable name="ProductID" select="ItemID"/>
				<xsl:variable name="ItemType" select="ItemTypeID" />
				<xsl:variable name="Price" select="Price"/>
				<xsl:variable name="FavoriteProductID" select="//ConsumerFavorite/GenericProduct[ProductID = $ProductID]/ProductID"/>
				<xsl:variable name="FavoriteID" select="concat('favorite_', ItemID, '_1')" />				
				<xsl:variable name="FavoriteClass">
					<xsl:choose>
						<xsl:when test="($FavoriteProductID &gt; 0) and (string-length($Price) &gt; 0) and //GenericConsumer/IsLoggedIn = 'true'">favorite-added</xsl:when>
						<xsl:when test="(ItemTypeID != 3) or (string-length($Price) &lt; 1)">not-favoritable</xsl:when>
						<xsl:otherwise>not-favorite</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="FavoriteTitle">
					<xsl:choose>
						<xsl:when test="//GenericConsumer/IsLoggedIn != 'true'">
							<xsl:text>Please log in to add items to your favorites.</xsl:text>
						</xsl:when>
						<xsl:when test="($FavoriteProductID &gt; 0) and (string-length($Price) &gt; 0)">
							<xsl:text>This item is a favorite. Click to remove from your favorites.</xsl:text>
						</xsl:when>
						<xsl:when test="(ItemTypeID != 3) or (string-length($Price) &lt; 1)">
							<xsl:text>This item cannot be saved to your favorites because it isn&#39;t tied to our inventory. Find a similar product through our Browse the Aisles or Search to favorite an item like this.</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>This item is not a favorite. Click to add this item to your favorites.</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="FavoriteClick">
					<xsl:choose>
						<xsl:when test="(ItemTypeID = 3) and (string-length($Price) &gt; 0) and //GenericConsumer/IsLoggedIn = 'true'">
							javascript:GSNServices.ConsumerFavorites.Toggle('<xsl:value-of select="$FavoriteID" />', <xsl:value-of select="$ProductID" />, 1);
						</xsl:when>
						<xsl:otherwise>
							javascript:alert("<xsl:value-of select="$FavoriteTitle" />");
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					
				<xsl:choose>
					<xsl:when test="(ItemTypeID = 3) and (string-length($Price) &gt; 0) and //GenericConsumer/IsLoggedIn = 'true'">
						<a class="favorite-image {$FavoriteClass} categoryid:{DepartmentCategoryID}" id="{$FavoriteID}" title="{$FavoriteTitle}" href="{$FavoriteClick}">&#9829;</a>
					</xsl:when>
					<xsl:otherwise>
						<a class="favorite-image {$FavoriteClass}" title="{$FavoriteTitle}" href="{$FavoriteClick}">No &#9829;</a>
					</xsl:otherwise>
				</xsl:choose>
				
				
			</td>
			<td class="Item">
				<xsl:value-of select="Description"/>
			</td>
			<td class="Delete">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('javascript:DeleteSavedListItem(', ShoppingListItemID, ');')"/>
					</xsl:attribute>
					<img alt="Delete Item" src="/Assets/Common/Images/delete_icon.gif"/>
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>