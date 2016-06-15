<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingListItems">
        <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
        <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="string-length(//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value) &gt; 0">
					<xsl:value-of select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
				</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ShowListTotal">
			<xsl:choose>
				<xsl:when test="($IsOGS = 'true') and (translate(//GenericConsumer/ConsumerSettings/Setting[Name='OGSShowCartTotalOnShoppingList']/Value, $upper, $lower) = 'true')">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div>
			<table>
				<tbody>
				<xsl:for-each select="ExpressLane/GenericShoppingList/TopNItems/GenericShoppingListItem[position()=1]">
					<xsl:call-template name="QuantityItem"/>
				</xsl:for-each>
				<xsl:for-each select="ExpressLane/GenericShoppingList/TopNItems/GenericShoppingListItem[position()&gt;1]">
					<xsl:call-template name="ClassicItem" />
				</xsl:for-each>
				</tbody>
			</table>
		</div>
		<span id="ItemCount"><xsl:text>You have </xsl:text>
			<xsl:choose>
				<xsl:when test="ExpressLane/GenericShoppingList/Total">
					<xsl:value-of select="ExpressLane/GenericShoppingList/Total"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="ExpressLane/GenericShoppingList/Total=1"> item </xsl:when>
				<xsl:otherwise> items </xsl:otherwise>
			</xsl:choose><xsl:choose><xsl:when test="$IsOGS = 'true'"> in your cart.</xsl:when><xsl:otherwise>on your list.</xsl:otherwise></xsl:choose>
			<xsl:if test="$ShowListTotal = 'true'">
				<br/>
				<xsl:choose>
					<xsl:when test="number(ExpressLane/GenericShoppingList/SubTotal)">
						<xsl:text>Total: </xsl:text>
						<xsl:value-of select="format-number(ExpressLane/GenericShoppingList/SubTotal, '$###,###.00')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Total: $0.00</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="ExpressLane/GenericShoppingList/ShoppingList/ShoppingListStatusID = 2 and count(//ExpressLane/GenericShoppingList/VisibleItems/GenericShoppingListItem) &gt; 0">
				<br />
				<xsl:choose>
					<xsl:when test="$IsOGS = 'true'">
						<xsl:text>This cart has been saved.</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>This shopping list has been saved.</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</span>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="ClassicItem">
    <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
	<tr>
			<td width="20">
				<div alt="Remove Item" id="trashcanSmall">
					<xsl:attribute name="onclick">RemoveFromShoppingListByID(<xsl:value-of select="ItemID"/>, <xsl:value-of select="ItemTypeID"/>);</xsl:attribute>
				</div>
			</td>
			<td>
				<div class="shopListItemSmall">
                    <xsl:value-of select="translate(Description,$upper,$lower)"/>								
                </div>
  			</td>
		</tr>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="QuantityItem">
		<xsl:param name="ElementID" select="concat('ShoppingListItem:', ShoppingListItemID)"/>
		<xsl:param name="ItemID" select="ItemID" />
		<xsl:param name="ItemTypeID" select="ItemTypeID" />
		<xsl:param name="Weight" select="Weight" />
		<xsl:variable name="ProductID">
			<xsl:if test="ItemTypeID = '3'">
				<xsl:value-of select="ItemID" />
			</xsl:if>
		</xsl:variable>		
        <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
        <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<tr>
			<xsl:attribute name="id">
				<xsl:value-of select="$ElementID"/>
			</xsl:attribute>
			<td width="20">
				<div alt="Remove Item" id="trashcanSmall">
					<xsl:attribute name="onclick">RemoveFromShoppingListByID(<xsl:value-of select="ItemID" />, <xsl:value-of select="ItemTypeID" />);</xsl:attribute>
				</div>
			</td>
			<td>
			<span class="firstItem">
					<xsl:value-of select="Description"/>
				</span>
				<table class="editqtyline">
				<xsl:choose>
					<xsl:when test="VariableWeight/GenericFraction">
						<tr>
							<td class="weightCell">
								<select title="weight">
									<xsl:attribute name="onchange">
										<xsl:value-of select="concat('SetListQuantity(&quot;', $ElementID, '&quot;);')" />
									</xsl:attribute>
									<xsl:for-each select="VariableWeight/GenericFraction">
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="format-number(StoredValue, '0.##')" />
											</xsl:attribute>
											<xsl:if test="number(StoredValue) = number($Weight) or number(StoredValue) &gt; number($Weight)" >
												<xsl:if test="StoredValue - $Weight &lt; 0.25">
													<xsl:attribute name="selected" />
												</xsl:if>
											</xsl:if>
											<xsl:value-of select="DisplayValue" />
										</option>
									</xsl:for-each>
								</select>
							</td>
							<td>
								<span class="unitOfMeasure">
									<xsl:choose>
										<xsl:when test="string-length(PriceUnit) > 0">
											<xsl:value-of select="PriceUnit" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>lb.</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
                    	<xsl:variable name="ShowQuantityForWeighted">
							<xsl:value-of select="translate(//GenericChain/ChainSettings/Setting[SettingID = 263]/Value,$upper,$lower)" />
						</xsl:variable>
                    	<xsl:if test="$ShowQuantityForWeighted ='true'">
                    		<tr>
								<td class="qtyCell">
									<input type="text" title="quantity" maxlength="3" class="quantity">
										<xsl:attribute name="onkeyup">
											<xsl:value-of select="concat('SetListQuantity(&quot;', $ElementID, '&quot;);')"/>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="Quantity"/>
										</xsl:attribute>
									</input>
									<div class="plusminus">
									<a class="ProductAddToListPlus">
										<xsl:attribute name="href">javascript:ChangeListQuantity('<xsl:value-of select="$ElementID"/>', 1);</xsl:attribute>
									</a>
									<a class="ProductAddToListMinus">
										<xsl:attribute name="href">javascript:ChangeListQuantity('<xsl:value-of select="$ElementID"/>', -1);</xsl:attribute>
									</a>
									</div>
								</td>
								<td>
									<span class="labelText">qty.</span>
								</td>
							</tr>
                    	</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="qtyCell">
								<input type="text" title="quantity" maxlength="3" class="quantity">
								<xsl:attribute name="onkeyup">
									<xsl:value-of select="concat('SetListQuantity(&quot;', $ElementID, '&quot;);')"/>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:value-of select="Quantity"/>
								</xsl:attribute>
								</input>
								<div class="plusminus">
									<a class="ProductAddToListPlus">
										<xsl:attribute name="href">javascript:ChangeListQuantity('<xsl:value-of select="$ElementID"/>', 1);</xsl:attribute>
									</a>
									<a class="ProductAddToListMinus">
										<xsl:attribute name="href">javascript:ChangeListQuantity('<xsl:value-of select="$ElementID"/>', -1);</xsl:attribute>
									</a>
								</div>
							</td>
							<td>
								<span class="labelText">qty.</span>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				</table>
				<div class="commentline">
					<input type="text" title="comment" class="comment">
						<xsl:attribute name="onkeypress">
							<xsl:value-of select="concat('if (event.keyCode==13) SetListComment(&quot;', $ElementID, '&quot;); return event.keyCode!=13;')"/>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="string-length(Comment)">
								<xsl:attribute name="value">
									<xsl:value-of select="Comment" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<!-- There shouldnt be a need for this. We should always copy user comment to shopping list item when it is added/updated to shoppinglist-->
								<xsl:if test="$ItemTypeID = 3"> 
									<xsl:attribute name="value">
										<xsl:value-of select="//ConsumerProductComment[ProductID = $ItemID]/Comment" />
									</xsl:attribute>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</input>
					<a class="button">
						<xsl:attribute name="href">
							<xsl:value-of select="concat('javascript:SetListComment(&quot;', $ElementID, '&quot;);')" />
						</xsl:attribute>
						<span>Save Comment</span>
					</a>
				</div>
				<input type="hidden" title="ItemID">
					<xsl:attribute name="value"><xsl:value-of select="ItemID" /></xsl:attribute>
				</input>
				<input type="hidden" title="ItemTypeID">
					<xsl:attribute name="value"><xsl:value-of select="ItemTypeID" /></xsl:attribute>
				</input>
				<xsl:if test="number($ProductID)">
					<input type="hidden" title="ProductID">
						<xsl:attribute name="value"><xsl:value-of select="$ProductID" /></xsl:attribute>
					</input>
				</xsl:if>				
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>