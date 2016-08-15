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
				<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
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
						<a href="/Shop/ManageList.aspx">
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
				<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
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
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
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
			<td class="Item">
				<xsl:value-of select="Description"/>
			</td>
			<td class="Delete">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('javascript:DeleteSavedListItem(', ShoppingListItemID, ');')"/>
					</xsl:attribute>
					<img alt="Delete Item" src="/assets/118/images/trash.jpg"/>
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>