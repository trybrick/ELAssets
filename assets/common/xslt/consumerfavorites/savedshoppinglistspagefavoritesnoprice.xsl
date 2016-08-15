<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="SavedShoppingListsFavoritesNoPrice.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
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

		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/SavedShoppingLists.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/SavedShoppingListsPage.js"/>
		<div id="savedshoppinglists">
			<div id="ShoppingListHeaderLarge" class="Saved">
				<xsl:if test="$IsOGS = 'true'">
					<xsl:attribute name="class">SavedOGS</xsl:attribute>
				</xsl:if>
			</div>
			<div id="CurrentList">
				<p>To view items in a saved <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart</xsl:when><xsl:otherwise> list</xsl:otherwise></xsl:choose>, click a <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose> name below.<br/>
						<a href="/Shop/ManageList.gsn">
							Go back to your current <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart:</xsl:when><xsl:otherwise> list:</xsl:otherwise></xsl:choose> '<xsl:value-of select="ExpressLane/GenericShoppingList/ShoppingList/Title"/>'
						</a>
					</p>
			</div>
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number"/>
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<div id="SavedShoppingListsDisplay">
				<xsl:for-each select="ExpressLane/SavedShoppingLists">
					<xsl:call-template name="SavedShoppingList"/>
				</xsl:for-each>
			</div>

			<div id="MissingItemsContent" style="display:none;">
				<p>Occasionally, items from your Saved <xsl:choose><xsl:when test="$IsOGS = 'true'"> Carts</xsl:when><xsl:otherwise> Lists</xsl:otherwise></xsl:choose> will not appear if the exact item (size, flavor, brand, etc) is currently not available in your store.</p>
				<p>Examples include seasonal products and discontinued or out of stock items.</p>
				<p>Please browse the category or use general search to find similar items.</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
