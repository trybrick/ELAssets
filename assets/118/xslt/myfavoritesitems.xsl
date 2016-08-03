<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:param>
	<xsl:param name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:param>
	<xsl:template match="/">
		<xsl:param name="DisplayCategoryID" select="ExpressLane/MyFavoritesPage/Settings/CategoryID"/>
		<xsl:choose>
			<xsl:when test="$DisplayCategoryID!=0">
				<xsl:apply-templates select="//MyFavorites/Categories/Category[CategoryID=$DisplayCategoryID]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="//MyFavorites/Categories/Category[CategoryID = //MyFavorites/Items/GenericShoppingListItem/CategoryID]">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Category">
		<xsl:param name="CategoryID" select="CategoryID"/>
		<xsl:variable name="Items" select="//MyFavorites/Items/GenericShoppingListItem[CategoryID=$CategoryID]"/>
		<div class="LineItem">
			<xsl:attribute name="id">
				<xsl:value-of select="concat('Items:', $CategoryID)"/>
			</xsl:attribute>
			<div class="CategoryHeader">
				<h3>
					<xsl:value-of select="CategoryName"/>
				</h3>
			</div>
			<div>
				<table>
					<xsl:attribute name="class">GridItem</xsl:attribute>
					<tbody>
						<tr>
							<th scope="col" class="header1">Quantity</th>
							<th scope="col" class="header2"></th>
							<th scope="col" class="header3">Item</th>
							<th scope="col" class="header4">Price</th>
						</tr>
						<xsl:for-each select="$Items">
							<xsl:call-template name="CategoryProductDataRow"/>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="CategoryProductDataRow">
		<xsl:variable name="HoverID" select="concat('ProductHover:', ItemID, ':', ItemTypeID)"/>
		<!-- 
		Table Row Order:
			- Add Button
			- Image (place holder)
			- Brand/Name/Comments
			- Price
	-->

		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">GridItem</xsl:when>
					<xsl:otherwise>GridAlternatingItem</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<td>
				<xsl:attribute name="class">AddButton</xsl:attribute>
				<xsl:choose>
					<xsl:when test="number(SoldByWeight)">
						<xsl:call-template name="AddToListWeightedControl"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="AddToListControl"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="ItemImage">
				<xsl:if test="string-length(ImageUrl) &gt; 0">
					<xsl:attribute name="onmouseover">
						<xsl:choose>
							<xsl:when test="ItemTypeID = 3">
								<!-- test if NutritionInfo chain setting is set or not -->
								<xsl:variable name="ShowProdNutrition" select="//GenericChain/ChainSettings/Setting[SettingID=172]/Value"/>
								<xsl:choose>
									<xsl:when test="translate($ShowProdNutrition,$ucletters,$lcletters) = 'false'">
										<xsl:value-of select="concat('doTipFromImage(this, &quot;', ImageUrl, '&quot;, &quot;Enlarged View&quot;);')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('doTipFromImage(this, &quot;', ImageUrl, '&quot;, &quot;Click for more information&quot;);')"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- test if NutritionInfo chain setting is set or not -->
								<xsl:variable name="ShowProdNutrition" select="//GenericChain/ChainSettings/Setting[SettingID=172]/Value"/>
								<xsl:choose>
									<xsl:when test="translate($ShowProdNutrition,$ucletters,$lcletters) = 'false'">
										<xsl:value-of select="concat('doTipFromImage(this, &quot;', ImageUrl, '&quot;, &quot;Enlarged View&quot;);')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('doTipFromImage(this, &quot;', ImageUrl, '&quot;, &quot;', Description, '&quot;);')"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<xsl:variable name="SmallImageURL">
					<xsl:choose>
						<xsl:when test="string-length(SmallImageUrl) &gt; 0">
							<xsl:value-of select="SmallImageUrl" />
						</xsl:when>
						<xsl:when test="string-length(ImageUrl) &gt; 0">
							<xsl:value-of select="ImageUrl" />
						</xsl:when>
						<xsl:otherwise>/Assets/118/Images/shoppingbag-icon.png</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="(ItemTypeID = 3) and (string-length(ImageUrl) &gt; 0)">
						<a>
							<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="ItemID"/>);</xsl:attribute>
							<img src="{$SmallImageURL}" alt="" />
						</a>
					</xsl:when>
					<xsl:otherwise>
						<img src="{$SmallImageURL}" alt="" />
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:attribute name="ItemName"/>
				<xsl:value-of select="Description"/>
			</td>


			<td>
				<xsl:attribute name="class">ItemPrice</xsl:attribute>
				<xsl:choose>
					<xsl:when test="number(Price)">
						<xsl:if test="PriceMultiple&gt;1">
							<xsl:value-of select="PriceMultiple"/>/</xsl:if>
						<xsl:value-of select="format-number(Price,  '$#.00')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="PriceString"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="AddToListControl">
		<xsl:variable name="ShoppingListItemID" select="ShoppingListItemID"/>
		<xsl:variable name="ItemID" select="ItemID"/>
		<xsl:variable name="ItemTypeID" select="ItemTypeID"/>
		<xsl:variable name="AddToListDiv" select="concat('ShoppingListItemAddDiv:', ItemID, ':', ItemTypeID)"/>
		<xsl:variable name="UpdateItemDiv" select="concat('ShoppingListItemUpdateDiv:', ItemID, ':', ItemTypeID)"/>
		<xsl:variable name="QuantitySelectID" select="concat('quantity:', ShoppingListItemID)"/>
		<xsl:variable name="ShoppingListItem" select="//ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ItemID][ItemTypeID=$ItemTypeID]"/>
		<xsl:variable name="TextBoxID" select="concat('comment:', ShoppingListItemID)"/>
		<xsl:variable name="ParentDiv" select="concat('AddItemToList:', ItemID, ':', ItemTypeID)"/>

		<div class="ProductAddToListControl">
			<xsl:attribute name="id">
				<xsl:value-of select="$ParentDiv"/>
			</xsl:attribute>
			<div>
				<input type="text" maxlength="3">
					<xsl:attribute name="id">
						<xsl:value-of select="$QuantitySelectID"/>
					</xsl:attribute>
					<xsl:attribute name="title">quantity</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:choose>
							<!-- pull the current quantity if it's in the list -->
							<xsl:when test="number($ShoppingListItem/Quantity)">
								<xsl:value-of select="number($ShoppingListItem/Quantity)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="number(Price) = 'true'">
										<xsl:value-of select="Price"/>
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<div id="ProductPlusMinusButtons">
					<a class="ProductAddToListPlus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', 1, 99);</xsl:attribute>
					</a>
					<a class="ProductAddToListMinus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', -1, 99);</xsl:attribute>
					</a>
				</div>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$AddToListDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ShoppingListItemUpdateDivButtons</xsl:attribute>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
							<xsl:otherwise>display:block;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<a>
					<xsl:attribute name="class">button add</xsl:attribute>
					<xsl:attribute name="href">javascript:AddShoppingListLineItemToList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Add</span>
				</a>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">divRemoveUpdate</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a>
					<xsl:attribute name="class">button update</xsl:attribute>
					<xsl:attribute name="href">javascript:UpdateShoppingListLineItemInList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Update</span>
				</a>
				<a>
					<xsl:attribute name="class">button remove</xsl:attribute>
					<xsl:attribute name="href">javascript:RemoveShoppingListLineItemFromList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Remove</span>
				</a>
			</div>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ShoppingListItemID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ShoppingListItemID"/>
				</xsl:attribute>
			</input>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ItemID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ItemID"/>
				</xsl:attribute>
			</input>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ItemTypeID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ItemTypeID"/>
				</xsl:attribute>
			</input>
		</div>
	</xsl:template>

	<xsl:template match="GenericShoppingListItem" name="AddToListWeightedControl">
		<xsl:param name="ShoppingListItemID" select="ShoppingListItemID"/>
		<xsl:param name="AddToListDiv" select="concat('ShoppingListItemAddDiv:', ItemID, ':', ItemTypeID)"/>
		<xsl:param name="UpdateItemDiv" select="concat('ShoppingListItemUpdateDiv:', ItemID, ':', ItemTypeID)"/>
		<xsl:param name="QuantitySelectID" select="concat('quantity:', ItemID)"/>
		<xsl:param name="WeightSelectID" select="concat('weight:', ItemID)"/>
		<xsl:param name="ShowQtyForWeightedItems" select="translate(//GenericChain/ChainSettings/Setting[SettingID=263]/Value,$ucletters,$lcletters)" />
		<xsl:variable name="ParentDiv" select="concat('AddItemToList:', ItemID)"/>
		<xsl:variable name="ShoppingListItem" select="//ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[ShoppingListItemID=$ShoppingListItemID]"/>
		<div class="ProductAddToListControl">
			<xsl:attribute name="id">
				<xsl:value-of select="$ParentDiv"/>
			</xsl:attribute>
			<xsl:if test="$ShowQtyForWeightedItems = 'true'">
				<input type="text" maxlength="3">
					<xsl:attribute name="id">
						<xsl:value-of select="$QuantitySelectID"/>
					</xsl:attribute>
					<xsl:attribute name="title">quantity</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:choose>
							<!-- pull the current quantity if it's in the list -->
							<xsl:when test="number($ShoppingListItem/Quantity)">
								<xsl:value-of select="number($ShoppingListItem/Quantity)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="number(Quantity)">
										<xsl:value-of select="Quantity"/>
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<div id="ProductPlusMinusButtons">
					<a class="ProductAddToListPlus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', 1, 99);</xsl:attribute>
					</a>
					<a class="ProductAddToListMinus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', -1, 99);</xsl:attribute>
					</a>
				</div>
			</xsl:if>
			<select>
				<xsl:attribute name="id">
					<xsl:value-of select="$WeightSelectID"/>
				</xsl:attribute>
				<xsl:attribute name="title">weight</xsl:attribute>

				<xsl:for-each select="VariableWeight/GenericFraction">
					<xsl:call-template name="ListItemsVariableWeight">
						<xsl:with-param name="Display" select="DisplayValue"/>
						<xsl:with-param name="Value" select="StoredValue"/>
						<xsl:with-param name="Selected" select="$ShoppingListItem/Weight"/>
					</xsl:call-template>
				</xsl:for-each>
			</select>
			<script type="text/javascript">// work around to display selects in light window
				if ($('lightwindow_contents') != null) {
					lightwindow.prototype._toggleTroubleElements('visible', true);
				}</script>
			<span class="unitOfMeasure">
			<xsl:choose>
				<xsl:when test="string-length(UnitOfMeasureAbbreviation) &gt; 0">
					<xsl:value-of select="UnitOfMeasureAbbreviation"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>lb.</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			</span>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$AddToListDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ShoppingListItemUpdateDivButtons</xsl:attribute>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
							<xsl:otherwise>display:block;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<a>
					<xsl:attribute name="class">button add</xsl:attribute>
					<xsl:attribute name="href">javascript:AddShoppingListLineItemToList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Add</span>
				</a>
			</div>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="class">ShoppingListItemUpdateDivButtons divRemoveUpdate</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a>
					<xsl:attribute name="class">button update</xsl:attribute>
					<xsl:attribute name="href">javascript:AddShoppingListLineItemToList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Update</span>
				</a>
				<a>
					<xsl:attribute name="class">button remove</xsl:attribute>
					<xsl:attribute name="href">javascript:RemoveShoppingListLineItemFromList('<xsl:value-of select="$ParentDiv"/>', '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
					<span>Remove</span>
				</a>
			</div>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ShoppingListItemID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ShoppingListItemID"/>
				</xsl:attribute>
			</input>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ItemID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ItemID"/>
				</xsl:attribute>
			</input>
			<input>
				<xsl:attribute name="title">
					<xsl:value-of select="'ItemTypeID'"/>
				</xsl:attribute>
				<xsl:attribute name="type">hidden</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ItemTypeID"/>
				</xsl:attribute>
			</input>
		</div>
	</xsl:template>
	<xsl:template name="ListItemsVariableWeight">
		<xsl:param name="Value"/>
		<xsl:param name="Display"/>
		<xsl:param name="Selected"/>
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="$Value"/>
			</xsl:attribute>
			<xsl:if test="$Value = $Selected">
				<xsl:attribute name="selected">true</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="$Display"/>
		</option>
	</xsl:template>
</xsl:stylesheet>