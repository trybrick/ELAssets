<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:param name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:param>
	<xsl:param name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:param>
	<xsl:template match="/">
		<xsl:apply-templates select="//GenericShoppingList"/>
	</xsl:template>
	<xsl:template name="OGSManageList" match="GenericShoppingList">
		<xsl:variable name="ShowTotal" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSShowCartTotalOnShoppingList']/Value"/>
		<xsl:choose>
			<xsl:when test="Categories/Category">
				<xsl:for-each select="Categories/Category">
					<xsl:sort select="CategoryName" data-type="text"/>
					<div class="category">
						<h3>
							<xsl:value-of select="CategoryName"/>
						</h3>
						<table>
							<tr>
								<th style="width:125px"/>
								<th class="ItemImage"/>
								<th class="Item" style="text-align:left;">Item</th>
								<th class="PriceSavings">Price</th>
								<th class="ItemTotal">Item Total</th>
								<th class="CouponImage"/>
								<th class="Delete"/>
							</tr>
						</table>
						<xsl:call-template name="ShoppingListItemManageList"/>
					</div>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="NoItems"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="count(//GenericShoppingList/VisibleItems/GenericShoppingListItem) &gt; 0">
			<xsl:if test="$ShowTotal = 'true'">
				<xsl:if test="number(SubTotal) &gt; 0">
					<table id="ManageListTotal">
						<tr>
							<td>Subtotal:</td>
							<td align="right">
								<xsl:value-of select="format-number(SubTotal, '$###,###.00')"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				<div id="ShoppingListCheckoutButtonBottom">
					<a class="button" style="float:left;margin:1em 0">
						<xsl:attribute name="href">##root##/Shop/Product.aspx</xsl:attribute>
						<span>Continue Shopping</span>
					</a>
					<a class="button" style="float:right;margin:1em 0">
						<xsl:attribute name="href">##root##/index.aspx?linkid=42</xsl:attribute>
						<span>Checkout</span>
					</a>
				</div>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ShoppingListItemManageList" match="Category">
		<xsl:param name="CategoryID" select="CategoryID"/>
		<table>
			<tbody>
				<xsl:for-each select="//GenericShoppingList/VisibleItems/GenericShoppingListItem[CategoryID = $CategoryID]">
					<xsl:sort select="Description" data-type="text"/>
					<xsl:call-template name="OGSShoppingListItemManageRow"/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="OGSShoppingListItemManageRow" match="GenericShoppingListItem">
		<xsl:param name="ItemID" select="ItemID"/>
		<xsl:param name="id" select="concat('ItemRow:', ShoppingListItemID)"/>
		<xsl:param name="QuantitySelectID" select="concat($id, ':txtQuantity')"/>
		<xsl:param name="Weight" select="Weight"/>
		<xsl:variable name="TextBoxID" select="concat('TextBox', $ItemID)"/>
		<xsl:variable name="CommentText">
			<xsl:choose>
				<xsl:when test="string-length(Comment) &gt; 0">
					<xsl:value-of select="Comment"/>
				</xsl:when>
				<xsl:when test="ItemTypeID = 3">
					<xsl:value-of select="//ConsumerComments/ProductComments/ConsumerProductComment[ProductID = $ItemID]/Comment"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ProductID">
			<xsl:if test="ItemTypeID = '3'">
				<xsl:value-of select="ItemID"/>
			</xsl:if>
		</xsl:variable>
		<tr>
			<xsl:attribute name="id">
				<xsl:value-of select="$id"/>
			</xsl:attribute>
			<td class="AddButton">
				<div class="ProductAddToListControl">
					<div>
						<input type="text" title="quantity">
							<xsl:attribute name="id">
								<xsl:value-of select="$QuantitySelectID"/>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="Quantity"/>
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
					<xsl:if test="VariableWeight/GenericFraction">
						<select title="weight">
							<xsl:for-each select="VariableWeight/GenericFraction">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="format-number(StoredValue, '0.##')"/>
									</xsl:attribute>
									<xsl:if test="number(StoredValue) = number($Weight) or number(StoredValue) &gt; number($Weight)">
										<xsl:if test="StoredValue - $Weight &lt; 0.25">
											<xsl:attribute name="selected"/>
										</xsl:if>
									</xsl:if>
									<xsl:value-of select="DisplayValue"/>
								</option>
							</xsl:for-each>
						</select>
						<span class="unitOfMeasure">
							<xsl:choose>
								<xsl:when test="string-length(PriceUnit) &gt; 0">
									<xsl:value-of select="PriceUnit"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>lb.</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</xsl:if>
				</div>
				<div>
					<a class="button add" title="Update Item">
						<xsl:attribute name="href">
							<xsl:value-of select="concat('javascript:ManageUpdateRow(', ShoppingListItemID, ', &quot;', $id, '&quot;);')"/>
						</xsl:attribute>
						<span>Update</span>
					</a>
				</div>
			</td>
			<td>
				<xsl:attribute name="class">ItemImage</xsl:attribute>
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
				<xsl:if test="string-length(SmallImageUrl) &gt; 0">
					<xsl:choose>
						<xsl:when test="ItemTypeID = 3">
							<a>
								<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="ItemID"/>);</xsl:attribute>
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="SmallImageUrl"/>
								</xsl:attribute>
							</img>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</td>
			<td class="Item">
				<xsl:value-of select="Description"/>
				<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
					<br/>
					<strong class="comment">Comments:</strong>
					<input>
						<xsl:attribute name="class">comment</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:value-of select="$ItemID"/>
						</xsl:attribute>
						<xsl:attribute name="title">comment</xsl:attribute>
						<xsl:attribute name="onkeypress">var key = event.keyCode ? event.keyCode : event.which; if (key == 13){ SetListComment('<xsl:value-of select="$id"/>');} return key!=13;</xsl:attribute>
						<xsl:attribute name="onblur">javascript:SetListComment('<xsl:value-of select="$id"/>')</xsl:attribute>
						<xsl:if test="string-length($CommentText) &gt; 0">
							<xsl:attribute name="value">
								<xsl:value-of select="$CommentText"/>
							</xsl:attribute>
						</xsl:if>
					</input>
					<input type="hidden" title="ItemID">
						<xsl:attribute name="value">
							<xsl:value-of select="ItemID"/>
						</xsl:attribute>
					</input>
					<input type="hidden" title="ItemTypeID">
						<xsl:attribute name="value">
							<xsl:value-of select="ItemTypeID"/>
						</xsl:attribute>
					</input>
					<xsl:if test="number($ProductID)">
						<input type="hidden" title="ProductID">
							<xsl:attribute name="value">
								<xsl:value-of select="$ProductID"/>
							</xsl:attribute>
						</input>
					</xsl:if>
				</xsl:if>
			</td>
			<td class="PriceSavings">
				<xsl:choose>
					<xsl:when test="number(Price) &gt; 0">
						<xsl:if test="number(PriceMultiple) &gt; 1">
							<xsl:value-of select="concat(PriceMultiple, '/ ')"/>
						</xsl:if>
						<xsl:value-of select="concat('$', format-number(Price, '0.00'))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="PriceString"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="ItemTotal">
				<xsl:if test="Price &gt; 0">
					<xsl:variable name="WeightMultiplier">
						<xsl:choose>
							<xsl:when test="number(Weight)">
								<xsl:value-of select="Weight"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ItemTotal">
						<xsl:choose>
							<xsl:when test="number(PriceMultiple) &gt; 1">
								<xsl:value-of select="$WeightMultiplier * Quantity * (Price div PriceMultiple)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$WeightMultiplier * Quantity * Price"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="format-number($ItemTotal,'$0.00')"/>
				</xsl:if>
			</td>
			<td class="CouponImage">
				<xsl:if test="number(ManufacturerCouponID) &gt; 0 or ItemTypeID = '2'">
					<img alt="Manufacturer Coupon" src="/Assets/Common/Images/manufacturercouponicon.gif"/>
				</xsl:if>
			</td>
			<td class="Delete">
				<a title="Remove Item" id="trashcanSmall">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('javascript:ManageRemoveFromShoppingList(', ShoppingListItemID, ', ', ItemTypeID, ');')"/>
					</xsl:attribute>
					Remove
					<!-- moved delete icon to CSS where it belongs -->
					<!-- <img src="/Assets/Common/Images/delete_icon.gif" alt="Remove"/> -->
				</a>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="NoItems" match="node()">	
		<div class="category">
			<h2>Create a Shopping Cart:</h2>
			<ul>
				<xsl:if test="translate(//GenericChain/ChainSettings/Setting[SettingID = 130]/Value, 'TRUE', 'true') = 'true'">
					<li>
						<a>
							<xsl:attribute name="href">##root##/Shop/PreviousOrders.aspx</xsl:attribute>
							<xsl:text>Previous Orders</xsl:text>
						</a>
					</li>
					<li>
						<a>
							<xsl:attribute name="href">##root##/Shop/SavedLists.aspx</xsl:attribute>
							<xsl:text>Saved Carts</xsl:text>
						</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/PersonalizedSpecials.aspx'">
					<li>
						<a href="/Shop/PersonalizedSpecials.aspx">Check out Your Personalized Specials</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/WeeklyAd.aspx'">
					<li>
						<a href="/Shop/WeeklyAd.aspx">Browse our Weekly Ad</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/Specials.aspx'">
					<li>
						<a href="/Shop/Specials.aspx">View All Items On Sale</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/MyFavorites.aspx'">
					<li>
						<a href="/Shop/MyFavorites.aspx">Add Your Favorite Items</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/MyPantry.aspx'">
					<li>
						<a href="/Shop/MyPantry.aspx">View Things I Buy</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/Coupons.aspx'">
					<li>
						<a href="/Shop/Coupons.aspx">Print Manufacturers' Coupons</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/Product.aspx'">
					<li>
						<a href="/Shop/Product.aspx">Browse The Aisles</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Shop/Browse.aspx'">
					<li>
						<a href="/Shop/Browse.aspx">Browse The Aisles</a>
					</li>
				</xsl:if>
				<xsl:if test="//tab/url = '/Recipes/RecipeCenter.aspx'">
					<li>
						<a href="/Recipes/RecipeCenter.aspx">Add Ingredients From Recipes</a>
					</li>
				</xsl:if>
			</ul>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->