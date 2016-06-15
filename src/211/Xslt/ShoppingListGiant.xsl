<?xml version="1.0"?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	<xsl:import href="ShoppingListItemsQtyGiant.xsl"/>	<xsl:import href="../../Common/Xslt/AdPod.xsl"/>	<xsl:import href="../../Common/Xslt/GlobalQuickSearch.xsl"/>	<xsl:output method="html"/>	<xsl:template match="/" name="ShoppingList">		<xsl:variable name="OGSRequiresVarieties" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSRequireAvaliableVarieties']/Value"/>		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>		<xsl:choose>			<xsl:when test="//ChainSettings/Setting[SettingID=14][Value='true']">				<style>#CircularLists select		{width:36%;}                        #CircularLists input,                        #CircularLists a.button		{display:none; }</style>				<xsl:call-template name="GlobalQuickSearchDisplay"/>			</xsl:when>			<xsl:otherwise>				<!-- no search -->			</xsl:otherwise>		</xsl:choose>		<div id="ShoppingList">			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>			<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js"/>			<script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>			<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">				<script type="text/javascript"><![CDATA[					Event.observe(window, 'scroll', CheckSideColumnPosition);					]]>				</script>			</xsl:if>			<div>				<xsl:attribute name="id">ShoppingListHeaderSmall</xsl:attribute>				<xsl:attribute name="class">OGS</xsl:attribute>			</div>			<div id="ShoppingListItemsDisplay">				<xsl:call-template name="ShoppingListItems"/>			</div>			<div id="FiveListButtons">				<!-- position 1 - Convert List to Cart, or View Card -->				<a href="/Shop/ManageList.aspx" class="shoplistConvertCart">					<span>View Cart/<br/>Check Out</span>				</a>				<!-- position 2 - Last List or Order -->				<a class="shoplistLastOrder">					<xsl:attribute name="href">						<xsl:choose>							<xsl:when test="ExpressLane/GenericConsumer/IsLoggedIn='true'">javascript:LastShoppingList();</xsl:when>							<xsl:otherwise>javascript:alert('Please log-in to retrieve your saved shopping cart.');</xsl:otherwise>						</xsl:choose>					</xsl:attribute>					<span>My Last<br/>Order</span>				</a>				<!-- position 3 - Save List or Cart -->				<a class="shoplistSave">					<xsl:attribute name="href">						<xsl:choose>							<xsl:when test="ExpressLane/GenericConsumer/IsLoggedIn='true'">javascript:SaveCurrentShoppingList();</xsl:when>							<xsl:otherwise>javascript:alert('Please log-in to save your shopping cart.');</xsl:otherwise>						</xsl:choose>					</xsl:attribute>					<span>Save<br/>Cart</span>				</a>				<!-- position 4 - Print List or Cart 					<a href="javascript:printList();" id="PrintListIcon" class="shoplistPrint" >								<span>Print<br/>Cart</span>					</a>					-->				<!-- position 5 - Check out or Manage List 							<a href="/index.aspx?linkid=42" id="CheckOutIcon" class="shoplistCheckout">								<span>Check<br/>Out</span>							</a>					-->			</div>			<div id="AddYourOwnItems">				<a class="lightwindow" href="#OwnItems">					<xsl:attribute name="title">Add Your Own Items</xsl:attribute>					<xsl:attribute name="style">margin:0</xsl:attribute>					<xsl:attribute name="params">"lightwindow_width=800;lightwindow_height=500"</xsl:attribute>Add Your Own Items!</a>			</div>			<div id="OwnItems" style="display:none;">				<div class="OwnItems" style="width:580px;">					<h2>More Information Needed</h2>					<div class="separator">						<span class="fieldName">Name:</span>						<input type="text" title="name" class="productname"/>						<p>Enter the name of the item.</p>					</div>					<div class="separator">						<span class="fieldName">Size:</span>						<input type="text" class="Size" title="size"/>						<p>Please specify what size item you are looking for: such as "72 oz. box", or "2 liter bottle".</p>					</div>					<xsl:if test="//ArrayOfCategory">						<div class="separator">							<span class="fieldName">Item Department:</span>							<select title="category">								<option>- Select a Department -</option>								<xsl:for-each select="//ArrayOfCategory/Category">									<option>										<xsl:attribute name="value">											<xsl:value-of select="CategoryID"/>										</xsl:attribute>										<xsl:value-of select="CategoryName"/>									</option>								</xsl:for-each>							</select>							<p>What department can this item be found in?</p>						</div>						<script type="text/javascript">// work around to display selects in light window								if ($('lightwindow_contents') != null) {									lightwindow.prototype._toggleTroubleElements('visible', true);								}</script>					</xsl:if>					<div class="separator">						<span class="fieldName">Quantity:</span>						<input type="text" class="Quantity" title="quantity" value="1" maxlength="3"/>						<div id="ProductPlusMinusButtons">							<a class="ProductAddToListPlus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', 1, 99);"/>							<a class="ProductAddToListMinus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', -1, 99);"/>						</div>						<select title="randomweight" style="display: none;"/>						<span class="quantitymeasure" style="display: none;">lb.</span>						<span class="quantityhelp">							<p>How many/no. of pounds?</p>						</span>					</div>					<div class="separator">						<span class="fieldName">Additional Information:</span>						<textarea title="description" maxlength="499"/>					</div>					<div class="disclaimer">Please note that items added here will be added to your cart and reflected with your final bill, but will not reflect in the running cart total while you continue to shop.</div>					<div class="addButtons">						<a class="button" id="btnAddOwnItem" onclick="AddOwnItem('lightwindow_contents');">							<span>Add Item</span>						</a>						<a class="button red" id="btnAddAnotherItem" onclick="AddOwnItem('lightwindow_contents', true);">							<span>Add Another Item</span>						</a>					</div>				</div>			</div>		</div>		<div id="availablevarieties"></div>		<input>			<xsl:attribute name="id">hfOGSRequiresVarieties</xsl:attribute>			<xsl:attribute name="type">hidden</xsl:attribute>			<xsl:attribute name="value">true</xsl:attribute>		</input>		<!--<xsl:apply-templates select="//ExternalAds">			<xsl:with-param name="Tile" select="'1'" />		</xsl:apply-templates>		<xsl:apply-templates select="//ExternalAds">			<xsl:with-param name="Tile" select="'2'" />		</xsl:apply-templates>-->	</xsl:template></xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->