<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="SavedShoppingLists.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
                <xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>

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
						<a href="/Shop/ManageList.aspx">
							Go back to your current <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart:</xsl:when><xsl:otherwise> list:</xsl:otherwise></xsl:choose> '<xsl:value-of select="ExpressLane/GenericShoppingList/ShoppingList/Title"/>'
						</a>
					</p>
			</div>
			<div id="ListsBar">
				<div id="SavedListsBar">Saved Lists</div>
				<div>Selected List</div>
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
		</div>
	</xsl:template>
</xsl:stylesheet>