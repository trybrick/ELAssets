<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/PersonalizedSpecials/PersonalizedSpecialsV3.xsl" />
	<xsl:output method="html" />	
	<xsl:template match="/">
		<style type="text/css">
			@import url(https://upload.brickinc.net/elvs/assets/common/styles/socialmedia/facebookdeals.css);
		</style>			
		<xsl:choose>
			<xsl:when test="/ExpressLane">
				<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>
				<script type="text/javascript" src="/Assets/Common/Js/Common.js"></script>
				<script type="text/javascript" src="/Assets/Common/Js/SocialMedia/FacebookDealsService.js"></script>
				<script type="text/javascript" src="/Assets/Common/Js/SocialMedia/FacebookDealsPage.js"></script>
				<script type="text/javascript" src="http://www.google.com/jsapi?key={//StoreLocatorData/ApiKey}"></script>
				<script type="text/javascript"> google.load("maps", "2"); </script>
				<script type="text/javascript">
					<![CDATA[
						function redirectPage(){
							top.location.href = "https://www.facebook.com/dialog/oauth?client_id=193356324028582&redirect_uri=http://www.facebook.com/pages/GSN-Test-Page/140902689308886?sk=app_193356324028582&scope=email,user_location";
						}
						window.fbAsyncInit = function() {
							FB.init({appId: '193356324028582', status: true, cookie: true, xfbml: true});
							FB.Canvas.setAutoGrow();
						};
					]]>
				</script>
				<script type="text/javascript">
					function getStore(storeID) {
						var store = stores.find(function (s) {
							return s.StoreID == storeID;
						});
						return store;
					}
					
					function getStoreItems(storeID) {
						//call webservice
						var requestArgs = GSNContext.RequestArguments;
						GSNServices.FacebookDealService.GetFacebookStoreItems(requestArgs,storeID,GSNServices.FacebookDealService.HandleGetFacebookStoreItemsOnSuccess,GSNServices.FacebookDealService.HandleGetFacebookStoreItemsOnSuccess);
					}
				</script>				
				<script type="text/javascript">
					var stores = [
						<xsl:for-each select="//StoreLocations/Locations/StoreLocation">
							<xsl:call-template name="StoreObject"/>
							<xsl:if test="position() != last()">,
							</xsl:if>
						</xsl:for-each>
					]
					
					<![CDATA[
					var map = null;
					var geocoder = null;
					var determineStoreGroup = null;
					
					function initialize() {
							//get store info
							var storeID = $('myStoreID');
							var store = getStore(storeID);
							createMarker(store);
							
							map = new google.maps.Map(
							document.getElementById('GoogleMapCanvas'), {
							  center: new google.maps.LatLng(store.Latitude, store.Longitude),
							  zoom: 13,
							  mapTypeId: google.maps.MapTypeId.ROADMAP
							});
							geocoder = new google.maps.Geocoder();
					}
					
					//create maker and set center.
					function createMarker(store) {
						if (store != null) {
							var point = new google.maps.LatLng(store.Latitude, store.Longitude);
							if (!setCenter) {
								map.setCenter(point); //marker will not overlay without center being set at least once
								setCenter=true;
							}
							var marker = new google.maps.Marker({
								  position: point,
								  map: map,
							});
							
							google.maps.event.addListener(marker, "click", function() {
								var infowindow = new google.maps.InfoWindow({
								  content: createStoreHtml(store)
								});
								infowindow.open(map,marker);
							});
						}
					}
					
					//create store html to be display here.
					function createStoreHtml(store) {
						var storeHTML;
						if(store) {
							storeHTML = '<a><b>' + store.StoreName + '</b></a>';
							storeHTML += '<p>';
							storeHTML += store.PrimaryAddress + '<br/>';
							storeHTML += store.City + ',' + store.StateAbbreviation + ' ' + store.PostalCode + '<br/>';
							storeHTML += store.Phone + '<br/>';
							if ((store.OpenHours != null) && (store.Openhours != '')){
								storeHTML += store.OpenHours;
							}
							storeHTML += '</p>';
						}
						return storeHTML;
					}
							
					//update map location.
					function updateStoreMap(storeID) {
						if (!geocoder || !storeID) { 
							window.setTimeout("searchStores('" + store.StoreID + "')", 5000);
							return; 
						}
						var store = getStore(storeID);
						createMarker(store);
					}

					function viewMap() {
						$("MapContent").style.display = "block";
					}
					]]>
				</script>
				<xsl:if test="//StoreLocatorData/ApiKey != ''">
					<script type="text/javascript" for="window" event="onload">
						if (document.all){
							initialize(); google.setOnLoadCallback(initialize);
						}
						else{
							window.document.addEventListener("DOMContentLoaded", initialize, true);
						} //firefox4
					</script>
				</xsl:if>
				<!--Main div call-->
				<xsl:call-template name="FacebookPage" />
			</xsl:when>
			<xsl:otherwise>
				<!--Skip reloading the javascripts-->
				<xsl:call-template name="MainContent" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FacebookPage">
		<xsl:variable name="ChainID" select="//GenericChain/ChainID" />
		<div id="fb-root">
			<script type="text/javascript" src="//connect.facebook.net/en_US/all.js"></script>
			<xsl:choose>
				<xsl:when test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0 or //SignedRequest/UserID">
					<div id="HeaderContent" class="ContentRow">
						<a id="HeaderLogo" href="##root##" target="_blank">
							<img src="{//GenericChain/ChainSettings/Setting[Name='SmallLogo']/Value}"/>
						</a>
						<div id="StoreInfo">
						<h2><xsl:value-of select="//GenericChain[ChainID = $ChainID]/ChainName"/> Facebook Deals</h2>
							<div class="StoreInfoRow">
								<label for="myStoreID">See Deals For Location: </label>
								<select name="myStoreID" id="myStoreID" >
									<xsl:attribute name="onChange">
										javascript:getStoreItems(value);
										javascript:updateStoreMap(value);
									</xsl:attribute>
									<xsl:for-each select="//StoreLocations/Locations/StoreLocation/Store">
										<xsl:variable name="storeID" select="StoreID"/>
										<option value="{$storeID}">
											<xsl:if test="//GenericStore/StoreID = $storeID">
												<xsl:attribute name="selected">selected</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="StoreName"/>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="StoreInfoRow">
								<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
									<a class="fbButton" href="javascript:void(0);" onclick="GSNPageItems.FacebookDeals.ToggleContent('SplashContent');">Home Page</a>
								</xsl:if>
								<a class="fbButton" href="javascript:void(0);" onclick="GSNPageItems.FacebookDeals.ToggleContent('MainContent');">Facebook Deals</a>
								<a class="fbButton" href="{concat(//GenericChain/DomainName, '/shop/weeklyad.aspx')}" id="Redirect_Url" target="_blank">Weekly Ad</a>
								<a class="fbButton" href="javascript:void(0);" onclick="GSNPageItems.FacebookDeals.ToggleContent('MapContent');javascript:initialize();">View Map</a>
							</div>
						</div>
						<div id="ProfileInfo"></div>
						<script>
							<![CDATA[
								var info = $('ProfileInfo'),
								update = function(response) {
									if (!response.session) {
										info.innerHTML = '<em>You must login using the controls at the top.</em>';
										return;
									}

									FB.api(
										{
											method: 'fql.query',
											query: 'SELECT name, pic_square FROM user WHERE uid=' + response.session.uid
										},
										function(response) {
											info.innerHTML = (
												'<img src="' + response[0].pic_square + '"/> ' +
												'<p>Welcome,<br/>' + response[0].name + '</p>'
											);
										}
									);
								};

								// update on login, logout, and once on page load
								FB.Event.subscribe('auth.login', update);
								FB.Event.subscribe('auth.logout', update);
								FB.getLoginStatus(update);

							]]>
						</script>
					</div>
					<xsl:choose>
						<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent">
							<div id="SplashContent" class="ContentRow">
								<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
									<xsl:sort select="SortBy" data-type="number"/>
									<xsl:value-of select="Description" disable-output-escaping="yes"/>
								</xsl:for-each>
							</div>
							<div id="MainContent" class="ContentRow hidden">
								<xsl:call-template name="MainContent" />
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div id="SplashContent" class="ContentRow hidden"></div>
							<div id="MainContent" class="ContentRow">
								<xsl:call-template name="MainContent" />
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<div id="MapContent" class="ContentRow hidden">
						<div id="googleMap"></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<p>Account has not been authorized yet. Please <a href="{//GenericChain/PreferedHost}/Profile/Signin.aspx">sign in here</a> with you facebook account.</p>
					<a href="javascript:void(0);" onclick="redirectPage()">Click here to see savings</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
<!-- ========================================================== -->
	<xsl:template name="MainContent" match="FacebookWebService">		
		<div class="GroupFrame">
			<h3>Current Specials</h3>
			<xsl:for-each select="//FacebookCircularItems/FacebookCircularItem">
				<xsl:call-template name="FacebookCircularItemDisplay" />
			</xsl:for-each>
		</div >
		<div class="GroupFrame">
			<h3>Popular Specials</h3>
			<xsl:for-each select="//TopPopularCircularItems/TopPopularCircularItem">
				<xsl:call-template name="TopPopularCircularItemsDisplay" />
			</xsl:for-each>
		</div>
		<div id="RecipesFrame" class="GroupFrame">
			<h3>Top Recipes</h3>
			<xsl:for-each select="//ArrayOfGenericRecipe/GenericRecipe">
				<xsl:call-template name="GenericRecipeDisplay" />
			</xsl:for-each>
		</div>
	</xsl:template>

<!-- ========================================================== -->
	<xsl:template name="FacebookCircularItemDisplay" match="FacebookCircularItem">
		<div class="GroupItem">
			<h5><xsl:value-of select="PriceString" /></h5>
			<h4><xsl:value-of select="CircularItemName" /></h4>
			<xsl:if test="string-length(SmallImageURL) &gt; 0">
				<img src="{SmallImageURL}" alt="{CircularItemName}" />
			</xsl:if>
			<p>
				<xsl:value-of select="CircularItemDescription" />
			</p>
			<a class="fbButton" href="javascript:void(0);">
				<xsl:attribute name="onclick">javascript:GSNServices.FacebookDeal.AddToShoppingList('<xsl:value-of select="CircularItemID"/>', 8);</xsl:attribute>
				<xsl:text>Add to List</xsl:text>
			</a>
			<xsl:call-template name="FacebookLikeButton">
				<xsl:with-param name="url" select="concat(//GenericChain/PreferedHost,'/Shop/WeeklyAd.aspx?circularitemid=',CircularItemID,'&amp;circularpageid=',CircularPageID,'&amp;show_faces=false&amp;layout=button_count')" />
			</xsl:call-template>
		</div>
	</xsl:template>

<!-- ========================================================== -->
	<xsl:template name="TopPopularCircularItemsDisplay" match="TopPopularCircularItems">
		<div class="GroupItem">
			<h5><xsl:value-of select="PriceString" /></h5>
			<h4><xsl:value-of select="CircularItemName" /></h4>
			<xsl:if test="string-length(SmallImageURL) &gt; 0">
				<img src="{SmallImageURL}" alt="" />
			</xsl:if>
			<p>
				<xsl:value-of select="CircularItemDescription" />
			</p>
			<a class="fbButton" href="javascript:void(0);">
				<xsl:attribute name="onclick">javascript:GSNServices.FacebookDeal.AddToShoppingList('<xsl:value-of select="CircularItemID"/>', 8);</xsl:attribute>
				<xsl:text>Add to List</xsl:text>
			</a>
			<xsl:call-template name="FacebookLikeButton">
				<xsl:with-param name="url" select="concat(//GenericChain/PreferedHost,'/Shop/WeeklyAd.aspx?circularitemid=',CircularItemID,'&amp;circularpageid=',CircularPageID,'&amp;show_faces=false&amp;layout=button_count')" />
			</xsl:call-template>
		</div>
	</xsl:template>

<!-- ========================================================== -->
	<xsl:template name="GenericRecipeDisplay" match="GenericRecipe">
		<xsl:variable name="url" select="concat(//GenericChain/PreferedHost,'/Recipes/RecipeFull.aspx?RecipeID=',RecipeID,'&amp;show_faces=false&amp;layout=button_count')" />
		<div class="GroupItem">
			<h4><xsl:value-of select="Title"/></h4>
			<xsl:if test="count(Images) &gt; 0">
				<img src="{Images/RecipeImage/RecipeImageURL}" alt="{Title} Image" />
			</xsl:if>
			<p>
				<xsl:value-of select="Description"/>
				<a class="fbButton" href="javascript:void(0);" onclick="javascript:window.open('{$url}');">View full recipe
				</a>
				<xsl:call-template name="FacebookLikeButton">
					<xsl:with-param name="url" select="$url" />
				</xsl:call-template>
			</p>
		</div>
	</xsl:template>

<!-- ========================================================== -->
	<xsl:template name="FacebookLikeButton">
		<xsl:param name="url" />
		<xsl:param name="class" select="'facebookLike'"/>
		<xsl:param name="style" select="'border:none; height:20px; width:90px; overflow:hidden'"/>
		<div ><!--styling messes up the the layout style="height:20px;"-->
			<iframe scrolling="no" frameborder="0">
				<xsl:attribute name="src">
					<xsl:value-of select="concat('http://www.facebook.com/widgets/like.php?href=', $url)"/>
				</xsl:attribute>
				<xsl:if test="$style">
					<xsl:attribute name="style">
						<xsl:value-of select="$style"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="string-length($class) &gt; 0">
					<xsl:attribute name="class">
						<xsl:value-of select="$class"/>
					</xsl:attribute>
				</xsl:if>
			</iframe>
		</div>
	</xsl:template>
	
<!-- ========================================================== -->
	<xsl:template name="StoreObject" match="StoreLocation">
		<xsl:variable name="StoreID" select="Store/StoreID"/>
		<xsl:text>{ </xsl:text>
			<xsl:text>GridElement: "</xsl:text><xsl:value-of select="concat('storeInfoZip:', Store/StoreID)"/>
			
			<xsl:text>", HeaderElement: </xsl:text>
				<xsl:choose>
					<xsl:when test="//StoreSettings[Store/StoreID = $StoreID]/StoreGroup">
						<xsl:text>"</xsl:text>
							<xsl:value-of select="concat('header_', translate(//StoreSettings[StoreID = $StoreID]/StoreGroup, ' ', '_'))"/>
						<xsl:text>"</xsl:text>
					</xsl:when>
					<xsl:otherwise>null</xsl:otherwise>
				</xsl:choose>
			<xsl:text>, </xsl:text>
			
			<xsl:for-each select="Store/node()[string-length(local-name()) &gt; 0]">
				<xsl:call-template name="Property"/>
				<xsl:if test="position() != last()">, </xsl:if>
			</xsl:for-each>
			<xsl:text>, </xsl:text>
		
		<xsl:for-each select="//StoreSettings[Store/StoreID = $StoreID]/node()[string-length(local-name()) &gt; 0][local-name() != 'StoreID']">
			<xsl:call-template name="Property"/>
			<xsl:if test="position() != last()">, </xsl:if>
		</xsl:for-each>
		<xsl:text> }</xsl:text>
	</xsl:template>
	
<!-- ========================================================== -->
	<xsl:template match="node()" name="Property">
		<xsl:value-of select="local-name()"/>
		<xsl:text>: </xsl:text>
		<xsl:choose>
			<xsl:when test="number(node())">
				<xsl:value-of select="node()"/>
			</xsl:when>
			<xsl:when test="node() = 'true' or node() = 'false'">
				<xsl:value-of select="node()" />
			</xsl:when>
			<xsl:when test="string-length(node()) = 0">null</xsl:when>
			<xsl:otherwise>"<xsl:value-of select="normalize-space(node())"/>"</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>



