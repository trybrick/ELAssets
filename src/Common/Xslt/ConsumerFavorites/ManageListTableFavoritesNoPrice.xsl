<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:param name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:param>
	<xsl:param name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:param>
	<xsl:template match="/">
		<xsl:apply-templates select="//GenericShoppingList"/>
	</xsl:template>
	<xsl:template name="ManageList" match="GenericShoppingList">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="StoreIsOGS">
			<xsl:choose>
				<xsl:when test="//GenericStore/StoreSettings/Setting[Name='IsOGS']/Value = translate('true',$ucletters,$lcletters)">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ShowTotal">
			<xsl:choose>
				<xsl:when test="($IsOGS = 1) and (//GenericConsumer/ConsumerSettings/Setting[Name='OGSShowCartTotalOnShoppingList']/Value = 'true')">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="Categories/Category">
				<div class="manage-list-checkout-buttons">
					<xsl:if test="($StoreIsOGS = 1) and ($IsOGS = 1)">
						<a href="/Shop/Product.gsn" class="button red" style="float:left;margin:1em 0">
							<span>Continue Shopping</span>
						</a>
					</xsl:if>
					<xsl:if test="($StoreIsOGS = 1) and ($IsOGS = 1)">
						<a href="/Index.aspx?linkid=42&amp;ogs=true" class="button" style="float:right;margin:1em 0">
							<span>Checkout</span>
						</a>
					</xsl:if>
				</div>
				<xsl:for-each select="Categories/Category">
					<xsl:sort select="CategoryName" data-type="text"/>
					<div class="category">
						<xsl:call-template name="ShoppingListItemManageList"/>
					</div>
				</xsl:for-each>
				<xsl:if test="$ShowTotal = 'true'">
					<table id="ManageListTotal">
						<tr>
							<td>Subtotal:</td>
							<td align="right">
								<xsl:choose>
									<xsl:when test="number(SubTotal) &gt; 0">
										<xsl:value-of select="format-number(SubTotal, '$###,###.00')"/>
									</xsl:when>
									<xsl:otherwise>
										<p style="color: #f00; font-size: 12px; text-align: left;">
											<xsl:text>We are unable to calculate the subtotal at this time.</xsl:text>
											<br/>
											<xsl:text>Please proceed to checkout to view subtotal.</xsl:text>
										</p>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="($StoreIsOGS = 1) and ($IsOGS = 1)">
					<xsl:call-template name="CheckoutButtons"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="NoItems"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="count(//ConsumerCoupons/TakenCoupons/YouTechCoupon) &gt; 0">
			<h3>
				<xsl:choose>
					<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=332]/Value) &gt; 0">
						<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=332]/Value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Card Coupons</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</h3>
			<table class="coupon-card-summary">
				<thead>
					<tr>
						<th> </th>
						<th>Card Coupon</th>
						<th>Savings</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//ConsumerCoupons/TakenCoupons/YouTechCoupon">
						<tr>
							<td> </td>
							<td>
								<xsl:value-of select="ShortDescription" disable-output-escaping="yes"/>
							</td>
							<td>
								<strong>
									<xsl:value-of select="format-number(number(SavingsAmount), '$#.00')"/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckoutButtons">
		<div class="manage-list-checkout-buttons">
			<a href="/Shop/Product.gsn" class="button red" style="float:left;margin:1em 0">
				<span>Continue Shopping</span>
			</a>
			<a href="/Index.aspx?linkid=42&amp;ogs=true" class="button" style="float:right;margin:1em 0">
				<span>Checkout</span>
			</a>
		</div>
	</xsl:template>
	<xsl:template name="ShoppingListItemManageList" match="Category">
		<xsl:param name="CategoryID" select="CategoryID"/>
		<table>
			<xsl:if test="position() = 1">
				<xsl:attribute name="class">first-category-table</xsl:attribute>
			</xsl:if>
			<thead>
				<tr class="category-table-head">
					<th scope="col" class="AddButton">Quantity</th>
					<th scope="col" class="Favorite"/>
					<th scope="col" class="ItemImage"/>
					<th scope="col" class="Item">Item</th>
					<th scope="col" class="PriceSavings">Price</th>
					<th scope="col" class="CouponImage"/>
					<th scope="col" class="Delete"/>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">
						<h3>
							<xsl:value-of select="CategoryName"/>
						</h3>
					</td>
				</tr>
				<xsl:for-each select="//GenericShoppingList/VisibleItems/GenericShoppingListItem[CategoryID = $CategoryID]">
					<xsl:sort select="Description" data-type="text"/>
					<xsl:choose>
						<xsl:when test="ItemTypeID = 13">
							<xsl:call-template name="CardCouponRow"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="ShoppingListItemManageRow"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="ShoppingListItemManageRow" match="GenericShoppingListItem">
		<xsl:param name="ItemID" select="ItemID"/>
		<xsl:param name="ItemTypeID" select="ItemTypeID"/>
		<xsl:param name="id" select="concat('ItemRow:', ShoppingListItemID)"/>
		<xsl:param name="QuantitySelectID" select="concat($id, ':txtQuantity')"/>
		<xsl:param name="Weight" select="Weight"/>
		<xsl:variable name="Price" select="Price"/>
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
		<xsl:variable name="ProductID" select="$ItemID"/>
		<tr id="{$id}">
			<td class="AddButton">
				<xsl:call-template name="AddToListControl">
					<xsl:with-param name="id" select="$id"/>
					<xsl:with-param name="QuantitySelectID" select="$QuantitySelectID"/>
					<xsl:with-param name="Weight" select="$Weight"/>
				</xsl:call-template>
			</td>
			<td class="Favorite">
				<xsl:variable name="FavoriteProductID" select="//ConsumerFavorite/GenericProduct[ProductID = $ProductID]/ProductID"/>
				<xsl:variable name="FavoriteID" select="concat('favorite_', $ItemID, '_1')"/>
				<xsl:variable name="FavoriteClass">
					<xsl:choose>
						<xsl:when test="$FavoriteProductID &gt; 0">favorite-added</xsl:when>
						<xsl:when test="ItemTypeID != 3">not-favoritable</xsl:when>
						<xsl:otherwise>not-favorite</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="FavoriteTitle">
					<xsl:choose>
						<xsl:when test="//GenericConsumer/IsLoggedIn != 'true'">
							<xsl:text>Please log in to add items to your favorites.</xsl:text>
						</xsl:when>
						<xsl:when test="$FavoriteProductID &gt; 0">
							<xsl:text>This item is a favorite. Click to remove from your favorites.</xsl:text>
						</xsl:when>
						<xsl:when test="ItemTypeID != 3">
							<xsl:text>This item cannot be saved to your favorites because it isn't tied to our inventory. Find a similar product through our Browse the Aisles or Search to favorite an item like this.</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>This item is not a favorite. Click to add this item to your favorites.</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="FavoriteClick">
					<xsl:choose>
						<xsl:when test="(ItemTypeID = 3) and //GenericConsumer/IsLoggedIn = 'true'">
							javascript:GSNServices.ConsumerFavorites.Toggle('<xsl:value-of select="$FavoriteID"/>', <xsl:value-of select="$ProductID"/>, 1);
						</xsl:when>
						<xsl:otherwise>
							javascript:alert("<xsl:value-of select="$FavoriteTitle"/>");
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="(ItemTypeID = 3) and //GenericConsumer/IsLoggedIn = 'true'">
						<a class="favorite-image {$FavoriteClass} categoryid:{DepartmentCategoryID}" id="{$FavoriteID}" title="{$FavoriteTitle}" href="{$FavoriteClick}">♥</a>
					</xsl:when>
					<xsl:otherwise>
						<a class="favorite-image {$FavoriteClass}" title="{$FavoriteTitle}" href="{$FavoriteClick}">No ♥</a>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="ItemImage">
				<xsl:if test="string-length(ImageUrl) &gt; 0">
					<xsl:attribute name="onmouseover">
						<xsl:choose>
							<xsl:when test="$ItemTypeID = 3">
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
							<xsl:value-of select="SmallImageUrl"/>
						</xsl:when>
						<xsl:when test="string-length(ImageUrl) &gt; 0">
							<xsl:value-of select="ImageUrl"/>
						</xsl:when>
						<xsl:otherwise>/Assets/Common/Images/no_image_sm.jpg</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="($ItemTypeID = 3) and (string-length(ImageUrl) &gt; 0)">
						<a>
							<xsl:attribute name="href">javascript:RunProductDescription(<xsl:value-of select="$ItemID"/>);</xsl:attribute>
							<img src="{$SmallImageURL}" alt=""/>
						</a>
					</xsl:when>
					<xsl:otherwise>
						<img src="{$SmallImageURL}" alt=""/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="Item">
				<xsl:value-of select="Description"/>
				<!-- include product description from Store Circular - must have 'storecircular' content object added to "Manage List" pagetype in Admin to appear  -->
				<xsl:if test="$ItemTypeID = 8">
					<xsl:variable name="ItemDescrip" select="//StoreCircularItem[CircularItemID = $ItemID]/Description"/>
					<xsl:if test="string-length($ItemDescrip) &gt; 0">
						<br/>
						<xsl:value-of select="substring($ItemDescrip, 0, 250)"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="//GenericConsumer/IsLoggedIn = 'true'">
					<br/>
					<strong class="comment">Comments:</strong>
					<input class="comment" id="{$ItemID}" maxlength="60" title="comment">
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
							<xsl:value-of select="$ItemID"/>
						</xsl:attribute>
					</input>
					<input type="hidden" title="ItemTypeID">
						<xsl:attribute name="value">
							<xsl:value-of select="$ItemTypeID"/>
						</xsl:attribute>
					</input>
					<xsl:if test="$ItemTypeID = '3'">
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
					<xsl:when test="number($Price) &gt; 0">
						<xsl:if test="number(PriceMultiple) &gt; 1">
							<xsl:value-of select="concat(PriceMultiple, '/ ')"/>
						</xsl:if>
						<xsl:value-of select="concat('$', format-number($Price, '0.00'))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="PriceString"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="CouponImage">
				<xsl:if test="number(ManufacturerCouponID) &gt; 0 or $ItemTypeID = '2'">
					<div class="CouponIcon"/>
				</xsl:if>
			</td>
			<td class="Delete">
				<a title="Remove Item" id="trashcanSmall"><xsl:attribute name="href"><xsl:value-of select="concat('javascript:ManageRemoveFromShoppingList(', ShoppingListItemID, ', ', $ItemTypeID, ');')"/></xsl:attribute>
					Remove
					<!-- moved delete icon to CSS where it belongs -->
					<!-- <img src="/Assets/Common/Images/delete_icon.gif" alt="Remove"/> -->
				</a>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="CardCouponRow" match="GenericShoppingListItem">
		<tr>
			<td class="Quantity">
				<xsl:value-of select="Quantity"/>
			</td>
			<td class="Item" colspan="3">
				<xsl:value-of select="SavingsString"/>
			</td>
			<td class="CouponImage" colspan="2">
				<div class="CardCouponIcon">
					<xsl:choose>
						<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=326]/Value) &gt; 0">
							<img src="{//GenericChain/ChainSettings/Setting[SettingID=326]/Value}" alt="Card Coupon"/>
						</xsl:when>
						<xsl:otherwise>
							<strong>Card Coupon</strong>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="NoItems" match="node()">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="category">
			<h2>Your
				<xsl:choose><xsl:when test="$IsOGS = 1"> cart</xsl:when><xsl:otherwise> list</xsl:otherwise></xsl:choose>
    		is empty</h2>
		</div>
	</xsl:template>
	<xsl:template name="AddToListControl" match="GenericShoppingListItem">
		<xsl:param name="QuantitySelectID"/>
		<xsl:param name="Weight"/>
		<xsl:param name="id"/>
		<xsl:param name="ShowQtyForWeightedItems" select="translate(//GenericChain/ChainSettings/Setting[SettingID=263]/Value,$ucletters,$lcletters)"/>
		<div class="ProductAddToListControl">
			<xsl:choose>
				<xsl:when test="VariableWeight/GenericFraction">
					<xsl:if test="$ShowQtyForWeightedItems = 'true'">
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
					</xsl:if>
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
				</xsl:when>
				<xsl:otherwise>
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
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div>
			<a class="button add" title="Update Item">
				<xsl:attribute name="href">
					<xsl:value-of select="concat('javascript:ManageUpdateRow(', ShoppingListItemID, ', &quot;', $id, '&quot;);')"/>
				</xsl:attribute>
				<span>Update</span>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
