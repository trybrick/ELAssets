<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/assets/common/Xslt/ShoppingList/ShoppingListItems.xsl"/>
	<xsl:import href="http://localhost/assets/common/xslt/GlobalQuickSearch.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingList">
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
	<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
    	<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>      
        <xsl:variable name="ShowGlobalSearch" select="translate(//ChainSettings/Setting[SettingID=14]/Value,$ucletters,$lcletters)" />
		<xsl:if test="$ShowGlobalSearch = 'true'">
			<xsl:call-template name="GlobalQuickSearchDisplay"/>
		</xsl:if>
		<div id="ShoppingList">
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js"/>
			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>
			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
				<script type="text/javascript"><![CDATA[
					Event.observe(window, 'scroll', CheckSideColumnPosition);
					]]>
				</script>
			</xsl:if>
			<div id="ShoppingListHeaderSmall"/>
			<div id="ShoppingListMain">
				<div id="ShoppingListItemsDisplay">
					<xsl:call-template name="ShoppingListItems"/>
				</div>
				<xsl:if test="translate(//ChainSettings/Setting[Name='EnableOwnItems']/Value,$ucletters,$lcletters) = 'true'">
					<div id="AddYourOwnItems">
							<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('AddYourOwnItems'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
								<a href="javascript:AddOwnItem('AddYourOwnItems');" class="button">
									<span> + </span>
								</a>
					</div>
				</xsl:if>
			</div>
			<div id="FiveListButtons">
					<a href="javascript:printList();" class="shoplistPrint">
						<span id="imgbtn_print">Print</span>
					</a>
					<a href="/Shop/EmailList.aspx" class="shoplistEmail" onclick="javascript:EmailShoppingList();">
						<span>Email</span>
					</a>
					<a class="shoplistLast">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:LastShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('Please log-in to retrieve your saved shopping list.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>Previous</span>
					</a>
					<a class="shoplistSave">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">javascript:SaveCurrentShoppingList();</xsl:when>
								<xsl:otherwise>javascript:alert('Please log-in to to save your shopping list.');</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<span>Save</span>
					</a>
					<a href="/Shop/ManageList.aspx" class="shoplistManage">
						<span>Manage</span>
					</a>
				</div>

		</div>
		<div id="availablevarieties">
		</div>
	</xsl:template>
</xsl:stylesheet>