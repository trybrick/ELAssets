<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/"  name="TabsWithListButtons">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<style>
			#shoppinglist-notification-content-list { width: 65%; float:left; }
			#shoppinglist-notification-content-cart { width: 65%; float:left; }
			
			#shoppinglist-notification-item { background: none; height: 23px; margin-top: 1px; }
			#shoppinglist-notification-item img { float:right; padding: 3px 3px 0 0}
		</style>

		<script type="text/javascript">
			function RunGlobalQuickSearchTabs(){
				<xsl:choose>
					<xsl:when test="translate(//GenericChain/ChainSettings/Setting[Name='Google Search Enable']/Value, $ucletters, $lcletters)  = 'true'">var searchUrlType = '/Shop/ProductSearchGoogle.gsn?Keyword='</xsl:when>
					<xsl:otherwise>var searchUrlType = '/Shop/ProductSearch.gsn?Keyword='</xsl:otherwise>
				</xsl:choose>
				var searchterm = $('txtGlobalQuickSearch').value.strip();
				if(searchterm == ''){
					alert('Please enter a search term');
					return;
				}				
				var searchurl = '##root##' + searchUrlType + searchterm;
				window.location.replace(searchurl);
			}
			
			/*if (typeof (GSNPageItems) == undefined || GSNPageItems == null) {
				var GSNPageItems = new Object();
			}
			
			GSNPageItems.ShoppingListNotification = {
				Enabled: true
			}*/
		</script>
		<script type="text/javascript">
				var currentStoreNumber = <xsl:value-of select="ExpressLane/GenericStore/StoreNumber"/>;
				
				function showOGSPanel() {
					$('convertToOGS').removeClassName('hiddenElement');
				}

				function hideOGSPanel() {
					$('convertToOGS').addClassName('hiddenElement');
				}
				<![CDATA[				
				function convertToOGS() {	
					var selectedIndex = $('ogsLocationList').selectedIndex;
					var selectedStoreNumber = $('ogsLocationList').options[selectedIndex].value;
					
					
					if (selectedStoreNumber != undefined && selectedStoreNumber > 0){
						window.location='/Index.aspx?linkid=1&ogs=true&sn=' + selectedStoreNumber;
					}
					else {
						alert('Please select a store');
					}
				}

				function convertToList() {	
					window.location='/Index.aspx?linkid=1&ogs=false&sn=' + currentStoreNumber;				
				}
				]]>
		</script>
		<xsl:call-template name="Tabs" />
		<xsl:call-template name="ShoppingListTabs" />
	<!--	<xsl:call-template name="Notification" />-->
	</xsl:template>
	
	<xsl:template name="Tabs">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PrimaryStoreID" select="//GenericConsumer/PrimaryStoreID"/>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
			<!-- this is used to set the active tab -->
			<xsl:choose>
				<!-- recipe pages use the same tab. Videos has it's own tab but is a recipe page which is why it is tested first -->
				<xsl:when test="contains($AbsolutePath, '/recipes/recipevideos.gsn')">
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.gsn'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="currentUrlIndex">
			<!-- this is used to determine the active tab index and put in a variable -->
			<xsl:for-each select="//tabs/tab">
				<xsl:variable name="tabPathIndex" select="translate(url, $ucletters, $lcletters)"/>
				<xsl:if test="contains($tabPathIndex, $aTabPath)">
					<xsl:value-of select="position()"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		
		<div id="secondary-navigation" class="group" role="navigation">
			<ul class="group">
				<xsl:for-each select="//tabs/tab">
					<xsl:variable name="tabPath" select="translate(url, $ucletters, $lcletters)"/>
					<xsl:choose>
						<!--<xsl:when test="url = 0">-->
							<!-- an empty tab space -->
							<!--<li class="blank" id="{concat('secondary-nav-tab', position())}">
								<xsl:value-of select="text" disable-output-escaping="yes"/>
							</li>
						</xsl:when>-->
						<xsl:when test="($IsOGS != 'true') and (type = 'OGSonly')">
							<!-- Skip OGSonly Tab for nonOGS stores -->
						</xsl:when>
						<xsl:when test="contains($aTabPath, $tabPath)">
							<li class="current" id="{concat('secondary-nav-tab', position())}">
								<a href="{url}">
									<xsl:choose>
											<xsl:when test="($IsOGS = 'true')">
												<xsl:attribute name="title">
													<xsl:value-of select="tooltipOGS" disable-output-escaping="yes" /> 
												</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="title">
													<xsl:value-of select="tooltip" disable-output-escaping="yes" /> 
												</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
									<xsl:value-of select="text" disable-output-escaping="yes"/>
								</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="urlIndex" select="position() - 1"/>
							<li id="{concat('secondary-nav-tab', position())}">
								<xsl:if test="$urlIndex = $currentUrlIndex">
									<xsl:attribute name="class">tabNoBkg</xsl:attribute>
								</xsl:if>
								<span>
									<a href="{url}">
										<xsl:choose>
											<xsl:when test="($IsOGS = 'true')">
												<xsl:attribute name="title">
													<xsl:value-of select="tooltipOGS" disable-output-escaping="yes" /> 
												</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="title">
													<xsl:value-of select="tooltip" disable-output-escaping="yes" /> 
												</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:value-of select="text" disable-output-escaping="yes"/>
									</a>
								</span>
							</li>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>

	<xsl:template name="Notification">
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- do not remove this style from being hidden in-line.  I need it here to unhide it later with prototype-->
		<div id="shoppinglist-notification">
			<xsl:attribute name="style">
				<xsl:choose>
					<xsl:when test="ExpressLane/GenericShoppingList/Total &gt; 0">display:block;</xsl:when>
					<xsl:otherwise>display:none;</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			
			<div id="shoppinglist-notification-content">
				<!-- only show when IS ogs and when there are items in the list-->
				<div id="shoppinglist-notification-content-cart">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="$IsOGS = 'true'">
								<xsl:choose>
									<xsl:when test="ExpressLane/GenericShoppingList/Total &gt; 0">display:block;</xsl:when>
									<xsl:otherwise>display:none;</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>display:none;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
			
					<span id="secondaryshoppinglistsubtotal">
						<xsl:value-of select="format-number(ExpressLane/GenericShoppingList/SubTotal, '$###,###.00')" />
					</span>
					<strong>
						<span class="secondaryshoppinglistcount">
							<xsl:value-of select="ExpressLane/GenericShoppingList/Total" />
						</span>
					</strong>
					<span class="secondaryshoppinglistitemdisplay">items</span>
					 in your cart
				</div>
				
				<div id="shoppinglist-notification-content-list">
					<!-- only show when is NOT ogs and when there are items in the list-->
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="$IsOGS = 'true'">display:none;</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ExpressLane/GenericShoppingList/Total &gt; 0">display:block;</xsl:when>
									<xsl:otherwise>display:none;</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					
					You have 
					<strong>
						<span class="secondaryshoppinglistcount">
							<xsl:value-of select="ExpressLane/GenericShoppingList/Total" />
						</span>
					</strong>
					<span class="secondaryshoppinglistitemdisplay">items</span>
					 on your shopping list
				</div>
				<div id="shoppinglist-notification-item" style="display:none">
					<span>
						Item Updated!
					</span>
					<img src="/Assets/224/Images/itemadded_arrow.png" />
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="ShoppingListTabs">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericStore/StoreSettings/Setting[Name='IsOGS']/Value = 'true'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="subnavigation">
			<xsl:variable name="ShowGlobalSearch" select="translate(//ChainSettings/Setting[SettingID=14]/Value,$ucletters,$lcletters)" />
			<xsl:if test="$ShowGlobalSearch = 'true'">
				<div id="navigation-search">
				<h2>Product Search</h2>
				<input onkeypress="if (event.keyCode==13) RunGlobalQuickSearchTabs(); return event.keyCode!=13;" id="txtGlobalQuickSearch"/>
				<a class="button" href="javascript:RunGlobalQuickSearchTabs();">
					<span>Search</span>
				</a>
				<div id="SearchTipsLink">
				<a class="searchTips">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$IsOGS = 'true'">/ecartFAQ.gsn</xsl:when>
							<xsl:otherwise>/FAQ.gsn</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:text>Helpful Tips</xsl:text>
				</a>
				<xsl:text> | </xsl:text>
				<a class="lightwindow" href="#OwnItems" title="Can't Find It? Add Your Own Item Here." params="lightwindow_width=600;lightwindow_height=400">Can't Find It? Add an item.</a>
			</div>
			<!-- AddYourOwnItem --> 
			<div id="OwnItems" style="display:none;">
				<script type="text/javascript">
				<![CDATA[
					//IE9  maxlength attribute does not work for text area.
					/*dont work
					window.onload = function() { 
						var txtAreaElements = document.getElementsByTagName('TEXTAREA');
						for(var i = 0, l = txtAreaElements.length; i < l; i++) {
							if(/^[0-9]+$/.test(txtAreaElements[i].getAttribute("maxlength"))) { 
								try{
									txtAreaElements[i].onkeyup = CheckMaxLength;
									txtAreaElements[i].onblur = CheckMaxLength;
								}catch(ex)
								{
									var q= 1;
								}
							}
						}
					}*/
					function CheckMaxLength(ele){
						var len = parseInt(ele.getAttribute("maxlength"), 10); 
						if(ele.value.length > len) {
							ele.value = ele.value.substr(0, len); 
						}
					}
					]]>
				</script>
				<div class="OwnItems" style="width:580px;">
					<h2>Enter information for this product:</h2>
					<div class="separator">
						<span class="fieldName">Product Name:</span>
						<input type="text" maxlength="60" title="name" class="productname"/>
						<p>Please enter a brand name and variety name or flavor. Example: Kellogg's Corn Flakes.</p>
					</div>
					<div class="separator">
						<span class="fieldName">Size:</span>
						<input type="text" class="Size" maxlength="30" title="size"/>
						<p>Please specify what size item you are looking for: such as "72 oz. box", or "2 liter bottle".</p>
					</div>
					<xsl:if test="//ArrayOfCategory">
						<div class="separator">
							<span class="fieldName">Item Department:</span>
							<select title="category">
								<option>- Select a Department -</option>
								<xsl:for-each select="//ArrayOfCategory/Category">
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="CategoryID"/>
										</xsl:attribute>
										<xsl:value-of select="CategoryName"/>
									</option>
								</xsl:for-each>
							</select>
							<p>What department can this item be found in?</p>
						</div>
						<script type="text/javascript">// work around to display selects in light window
							if ($('lightwindow_contents') != null) {
								lightwindow.prototype._toggleTroubleElements('visible', true);
							}</script>
					</xsl:if>
					<div class="separator">
						<span class="fieldName">Quantity:</span>
						<input type="text" class="Quantity" title="quantity" value="1" maxlength="3"/>
						<div id="ProductPlusMinusButtons">
							<a class="ProductAddToListPlus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', 1, 99);"/>
							<a class="ProductAddToListMinus" href="javascript:ChangeOwnItemQuantity('lightwindow_contents', -1, 99);"/>
						</div>
						<p>How many?</p>
					</div>
					<div class="separator">
						<span class="fieldName">Additional Information:</span>
						<textarea title="description" maxlength="60" onKeyUp="CheckMaxLength(this);" onBlur="CheckMaxLength(this);"/>
					</div>
					<div class="disclaimer">Please note that items added here will be added to your cart and reflected with your final bill, but will not reflect in the running cart total while you continue to shop.</div>
					<div class="addButtons">
						<a class="button" id="btnAddOwnItem" onclick="AddOwnItem('lightwindow_contents');">
							<span>Add Item</span>
						</a>
						<a class="button red" id="btnAddAnotherItem" onclick="AddOwnItem('lightwindow_contents', true);">
							<span>Add Another Item</span>
						</a>
					</div>
				</div>
			</div>
			
			</div>
			</xsl:if>
			<div id="FiveListButtons">
				<!-- 
					Ok, so I totally know this is cludgy, but I couldn't get the [isogsflag = $IsOGS] to work right
					And if you take this out like:
						<xsl:variable name="x">
							<xsl:choose>
								<xsl:when test="$IsOGS = 'true'></xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
					
					you will have problems too.
					
					So, for a quick/dirty solution, this is it.
				-->
				<xsl:choose>
					<xsl:when test="$IsOGS = 'true'">
						<xsl:variable name="shoplistbuttons" select="//buttongroups/buttongroup[isogsflag = 'true']/buttons" />
						<xsl:for-each select="$shoplistbuttons/button">
							<xsl:sort select="displayorder" data-type="number" />
	
							<xsl:call-template name="shoppinglistbutton" />
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="shoplistbuttons" select="//buttongroups/buttongroup[isogsflag = 'false']/buttons" />
						<xsl:for-each select="$shoplistbuttons/button">
							<xsl:sort select="displayorder" data-type="number" />
	
							<xsl:call-template name="shoppinglistbutton" />
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</div><!--Five List Buttons-->
		</div>
	</xsl:template>

	<xsl:template name="shoppinglistbutton" match="button">
		<a class="{classname}">
			<xsl:if test="string-length(id) &gt; 0">
				<xsl:attribute name="id">
					<xsl:value-of select="id" />
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="string-length(onclick) &gt; 0">
				<xsl:attribute name="onclick">
					<xsl:value-of select="onclick" />
				</xsl:attribute>
			</xsl:if>
		
			<xsl:if test="string-length(href) &gt; 0">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="requireslogin = 'true'">
							<xsl:choose>
								<xsl:when test="//GenericConsumer/IsLoggedIn='true'">
									<xsl:choose>
										<xsl:when test="//Uri/PathAndQuery = '/Shop/ManageList.gsn'">
											<xsl:choose>
												<xsl:when test="string-length(managelisthref) &gt; 0">
													<xsl:value-of select="managelisthref" />	
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="href" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="href" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									javascript:alert('<xsl:value-of select="loginalert" />');
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="//Uri/PathAndQuery = '/Shop/ManageList.gsn'">
									<xsl:choose>
										<xsl:when test="string-length(managelisthref) &gt; 0">
											<xsl:value-of select="managelisthref" />	
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="href" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="href" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>
		
			<span>
				<xsl:value-of select="text" disable-output-escaping="yes" />
			</span>
		</a>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Xml\224-PageTypeId-31-Tabs.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->