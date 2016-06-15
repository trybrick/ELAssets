<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/" name="ShoppingListItems">
        <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
        <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="ShowListTotal" select="translate(ExpressLane/GenericChain/ChainSettings/Setting[Name='OGSShowCartTotalOnList']/Value, $upper, $lower)"></xsl:variable>
        <xsl:variable name="IsOGS" select="translate(//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value, $upper, $lower)"></xsl:variable>
		<div>
			<table>
				<tbody>
					<xsl:for-each select="ExpressLane/GenericShoppingList/TopNItems/GenericShoppingListItem">
						<tr>
							<td width="20">
								<div alt="Remove Item" id="trashcanSmall"><xsl:attribute name="onclick">RemoveFromShoppingListByID(<xsl:value-of select="ItemID" />, <xsl:value-of select="ItemTypeID" />);</xsl:attribute>
								</div>
							</td>
							<td>
								<div class="shopListItemSmall">
									<xsl:value-of select="Description"/>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
		<span id="ItemCount">
 			<xsl:choose>
				<xsl:when test="ExpressLane/GenericShoppingList/Total &gt; 0">
					You have <xsl:value-of select="ExpressLane/GenericShoppingList/Total" />
					<xsl:choose>
						<xsl:when test="ExpressLane/GenericShoppingList/Total=1"> item </xsl:when>
						<xsl:otherwise> items </xsl:otherwise>
					</xsl:choose>
					<xsl:choose><xsl:when test="$IsOGS = 'true'"> in your cart. </xsl:when><xsl:otherwise> on your list. </xsl:otherwise></xsl:choose>
				</xsl:when> 
				<xsl:otherwise>
					<strong>Your <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose> is empty </strong>- Add some items!
				</xsl:otherwise>
			</xsl:choose>
            
			<xsl:if test="$ShowListTotal = 'true'">
				<br />
				<xsl:choose>
					<xsl:when test="number(ExpressLane/GenericShoppingList/SubTotal)">
						<xsl:text>Total: $</xsl:text><xsl:value-of select="format-number(ExpressLane/GenericShoppingList/SubTotal, '###,###.00')" />
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
</xsl:stylesheet>