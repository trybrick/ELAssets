<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="ShoppingListItems.xsl"/>
	<xsl:import href="/assets/Common/Xslt/AdPod.xsl"/>
	<xsl:import href="/assets/common/xslt/GlobalQuickSearch.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="ShoppingList"><style>
	   		#availablevarietiestop,
			#availablevarietiesmiddle	{background:none;}
			#availablevarietiesbottom	{display:none}
			#availablevarietiestop h2 	{color:black;}
			
			area:hover	{background-color:yellow}
			
			/** shopping list tab styles **/
			#sidebar, #recipesidebar	{margin-top:35px;}
			#ShoppingListHeaderSmall	{float:left; width:300px; height:37px; background:url(/Assets/98/Images/shoplist_300_drawer.png) no-repeat;}
			#ShopListDrawer			{ position:fixed; top:0; left:747px; z-index:1000!important}
			#ShoppingList 			{ background:url(/Assets/Common/Images/shadow_drawer.png) no-repeat right bottom;margin-bottom:0px; padding-right:10px; padding-bottom:12px; margin-bottom:-10px;}
			#ShoppingListDisplay, 
			#availablevarieties,
			#FiveListButtons		{ float:left; margin:0; background-color:#f2f2f2; width:300px;}
			#ShoppingListTabs 		{ clear:both; float:left; width:100%; background: none url(/Assets/Common/Images/tabline_transparent_upsidedown.gif) repeat-x top; font-size:10px; line-height:normal; margin-bottom:12px; }
			#ShoppingListTabs ul 	{ margin:0; padding:0; list-style:none; }
			#ShoppingListTabs li 	{ float:left; background:url(/Assets/Common/Images/left_drawer.png) no-repeat left bottom; margin:0 -6px 0 0; padding:0 0 0 9px;}
			#ShoppingListTabs a 	{ float:left; display:block; background:url(/Assets/Common/Images/right_drawer.png) no-repeat right bottom; text-decoration:none; font-weight:bold; color:#765; padding: 5px 19px 17px 0}
			/* Commented Backslash Hack hides rule from IE5-Mac \*/
			#ShoppingListTabs a 	{ float:none; }
			/* End IE5-Mac hack */
			#ShoppingListTabs a:hover 	{ color:red; }
			#ShoppingListTabs .Selected { background:url(/Assets/Common/Images/left_on_drawer.png) no-repeat left bottom; border-width:0 }
			#ShoppingListTabs .Selected a { background: url(/Assets/Common/Images/right_on_drawer.png) no-repeat right bottom; color:black; }
			#ShoppingList table div.shopListItemSmall {font-weight:normal;}
			#ShoppingListTabs .ListItems	{font-size:13px; }
			#ShoppingListTabs .ListItems em	{font-size:8.5px; margin-left:5px;}
	   </style>
	
	
	
	
	
		
		
		<xsl:choose>
			<xsl:when test="//ChainSettings/Setting[SettingID=14][Value='true']">
				<style>
					<!-- removes the search box over the ad and widens the dropdowns to fill the space -->
						#CircularLists select		{width:37%;}
                        #CircularLists input,
                        #CircularLists a.button		{display:none; }</style>
				<xsl:call-template name="GlobalQuickSearchDisplay"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- no search -->
			</xsl:otherwise>
		</xsl:choose>
       
       <script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingList.js" />
       <script type="text/javascript" src="/assets/common/js/ShoppingList/ShoppingListPage.js"/>
                
       
                
       <div id="ShopListDrawer">
	   
		<script type="text/javascript">
                    new Draggable('ShopListDrawer', {handle:'ShoppingListTabs', constraint:'horizontal'});
       	</script>            
        
        <div id="ShoppingList" style="display:none;">
                
                
                <div id="ShoppingListHeaderSmall" />
    
                
                
                <div id="ShoppingListDisplay" class="ListItems">
                    <div id="ShoppingListItemsDisplay">
                        <xsl:call-template name="ShoppingListItems" />
                    </div>
                </div>
                    
                    <div id="availablevarieties" class="AvailableVarieties" style="display:none;">
                    	<p>No varieties exist for this item.</p>
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
                    
                    <div id="AddYourOwnItems">
                        <a class="lightwindow" href="#OwnItems">
                            <xsl:attribute name="title">Add Your Own Items</xsl:attribute>
                            <xsl:attribute name="style">margin:0</xsl:attribute>
                            <xsl:attribute name="params">"lightwindow_width=600;lightwindow_height=400"</xsl:attribute>Add Your Own Items!</a>
                    </div>
                    
                    <div id="OwnItems" style="display:none;width:600px;">
                        <div class="OwnItems">
                            <h3>Add Your Own Items</h3>
                            <p>Can't find the item you are looking for?<br/>
                                Just input the information below and add it to your list.</p>
                            <div>
                                <span>Item Name:</span>
                                <input type="text" title="name"/>
                            </div>
                            <div>
                                <span>Item Size:</span>
                                <input type="text" title="size"/>
                            </div>
                            <!--<div>
                                <span>Item Category: </span>
                                <select title="category">
                                </select>
                            </div>-->
                            <div>
                                <span>Item Quantity:</span>
                                <input type="text" title="quantity"/>
                                <select title="randomweight" style="display: none;"/>
                            </div>
                            <div>
                                <span>Item Description:</span>
                                <input type="text" title="description" maxlength="499"/>
                            </div>
                            <div>
                                <button id="btnAddOwnItem" onclick="AddOwnItem('lightwindow_contents');">Add</button>
                            </div>
                        </div>
                    </div>
                
                    
                
            </div>

					<div id="ShoppingListTabs">
                        <ul style="cursor:pointer;">
                            <li class="ListItems Selected">
                                <span onclick="ExpandShoppingListItems();">
                                    <a name="list"><xsl:text>My List</xsl:text> <em><xsl:value-of select="ExpressLane/GenericShoppingList/Total" /> items</em></a>
                                </span>
                            </li>
                            <!--
                            <li class="AvailableVarieties" id="Varieties" style="display:none;">
                                <span onclick="ExpandAvailableVarieties();">
                                    <a name="varieties"><xsl:text>Available Varieties</xsl:text></a>
                                </span>
                            </li>
                            -->
							<li id="HideAll" style="display:none;">
                                <span onclick="HideDrawer();">
                                    <a name="hide"><xsl:text>X</xsl:text></a>
                                </span>
                            </li>                         
                         </ul>
                    </div>
                 
        </div>
                    
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
        
        
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-99-ShoppingList.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->