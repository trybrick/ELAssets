<?xml version="1.0"?>
<!-- DWXMLSource="file:///MacbookPro/Users/pat/Desktop/xml/73-PageTypeId-77-StoreLocator.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style>#sidebar	{display:none}</style>
		<script src="/Assets/Common/Js/Common.js" type="text/javascript"></script>
		<!--show elements based on database settings-->
		<script type="text/javascript">
			<!-- I moved the link text to a chain setting. This used to be loaded from static content -->
			<!-- Always make sure there is s default to fall back on - the default chain settings are not loaded 
				into the xml. --><![CDATA[
			var map = null;
			var geocoder = null;
			var setCenter = false;
			var latAverage=0, lonAverage=0, latlonExceptions=0, latMin=0, latMax=0, lonMin=0, lonMax=0, zoomMin=4;
			var divCount;
			var determineStoreGroup = null;
			var infowindow = null;
			var markersArray = [];

			function initialize() {
        			var storeInit = stores[0];
					map = new google.maps.Map(
						document.getElementById('GoogleMapCanvas'), {
						  center: new google.maps.LatLng(storeInit.Latitude, storeInit.Longitude),
						  zoom: 13,
						  panControl: false,
						  zoomControl: true,
						  scaleControl: true,
						  streetViewControl: false,
						  mapTypeId: google.maps.MapTypeId.ROADMAP
					  });
					geocoder = new google.maps.Geocoder();

					var queryIndex = location.search.indexOf('?query=');

					if (queryIndex >= 0)
					{
						var query = location.search.replace('?query=', '');

						document.getElementById('zip').value = unescape(query);

						searchStores('basicSearch');
					}
					else
					{
						searchStores('showAll');
					}
    		}

			function submitenter(myfield,e)
			{
			      var keycode;
			      if (window.event) keycode = window.event.keyCode;
			      else if (e) keycode = e.which;
			      else return true;

			      if (keycode == 13)
			      {
			            if (myfield.name == 'zip') {
			                  searchStores('basicSearch');
			            }
			            return false;
			      }
			      else
			            return true;
			}

			function GetStore(storeID) {
				var store = stores.find(function (s) {
					return s.StoreID == storeID;
				});

				return store;
			}
			
			function populateMap(storeID) {
				if (geocoder) {
					var store = GetStore(storeID);

					createMarker(store, getStoreHTML(store, false));
					var point = new google.maps.LatLng(store.Latitude, store.Longitude);
					map.setCenter(point, 13);
				}
			}
			
			function getStoreHTML(store, storeListing) {

				var tmpHTML = '<div class="gmnoprint" style="max-width: 300px;">' + $(store.GridElement).innerHTML + '</div>';

				return tmpHTML;
			}

			function openInfoWindowHtml(map, store, marker) {
				if (infowindow) { infowindow.close(); infowindow = null; }
				infowindow = new google.maps.InfoWindow({
				  content: getStoreHTML(store, false)
				});
				infowindow.open(map,marker);
			}

			function createMarker(store, display) {
				if (store != null) {
					var point = new google.maps.LatLng(store.Latitude, store.Longitude);
					if (!setCenter) {
						map.setCenter(point, 13); //marker will not overlay without center being set at least once
						setCenter=true;
					}
					var marker = new google.maps.Marker({
						  position: point,
						  map: map,
					});
					markersArray.push(marker);
					
					google.maps.event.addListener(marker, "click", function() {
					    openInfoWindowHtml(map, store, marker);
					});
					
					if (display != '') {
						if (infowindow) { infowindow.close(); infowindow = null; }
						map.setCenter(point); 
						map.setZoom(16);
					}
				}
			}

			function addResultsMessage(resultCount) {
				var resultsHTML = '';
				if (resultCount == 1) {
					resultsHTML = '<p class="result">We found <b>' + resultCount + '</b> store matching your search.</p>' + resultsHTML;
				} else {
					resultsHTML = '<p class="result">We found <b>' + resultCount + '</b> stores matching your search.</p>' + resultsHTML;
				}
				return resultsHTML;
			}

			function clearMapPoints() {
			  for (var i = 0; i < markersArray.length; i++ ) {
				markersArray[i].setMap(null);
			  }
			  markersArray = [];
			}

			function latlonAdd(lat, lon) {
				
				lat = new Number(lat);
				lon = new Number(lon);

				if (lat != null && lon != null && lat.toString() != 'NaN' && lon.toString() != 'NaN') {
					latAverage += Math.round(lat*100)/100;
					lonAverage += Math.round(lon*100)/100;
					if (lat < latMin || latMin==0) { latMin=lat; }
					if (lat > latMax || latMax==0) { latMax=lat; }
					if (lon < lonMin || lonMin==0) { lonMin=lon; }
					if (lon > lonMax || lonMax==0) { lonMax=lon; }
				}
				else { latlonExceptions++; }
			}

			function latlonCalcAverage(arrLen) {
				//actually getting the middle - if any - to more accurately center map
				if (latMin == latMax) { latAverage = latMin; }
				else {
					latAverage=((Math.round(latMin*1000)/1000)+(Math.round(latMax*1000)/1000))/2;
				}

				if (lonMin == lonMax) { lonAverage = lonMax; }
				else {
					lonAverage=((Math.round(lonMin*1000)/1000)+(Math.round(lonMax*1000)/1000))/2;
				}
			}

			function latlonReset() {
				latAverage=0;
				lonAverage=0;
				latMin=0;
				latMax=0;
				lonMin=0;
				lonMax=0;
				latlonExceptions=0;
				divCount=0;
			}

			function latlonGetZoom() {
				//try to zoom map based on scope of points to show. default to current zoom
				if (latAverage > 0) {
					var p1 = new google.maps.LatLng(latMin, lonMin);
					var p2 = new google.maps.LatLng(latMax, lonMax);
					
					bounds = new google.maps.LatLngBounds(p1, p2);
				}
				else { bounds = map.getBounds(); }

				var zoom = getBoundsZoomLevel(bounds, $('GoogleMapCanvas').getDimensions());
				if (zoom < zoomMin) { zoom = zoomMin; }
				
				//return map.getBoundsZoomLevel(bounds);
				return zoom;
			}
			
			function getBoundsZoomLevel(bounds, mapDim) {
				var WORLD_DIM = { height: 256, width: 256 };
				var ZOOM_MAX = 16;

				function latRad(lat) {
					var sin = Math.sin(lat * Math.PI / 180);
					var radX2 = Math.log((1 + sin) / (1 - sin)) / 2;
					return Math.max(Math.min(radX2, Math.PI), -Math.PI) / 2;
				}

				function zoom(mapPx, worldPx, fraction) {
					return Math.floor(Math.log(mapPx / worldPx / fraction) / Math.LN2);
				}

				var ne = bounds.getNorthEast();
				var sw = bounds.getSouthWest();

				var latFraction = (latRad(ne.lat()) - latRad(sw.lat())) / Math.PI;

				var lngDiff = ne.lng() - sw.lng();
				var lngFraction = ((lngDiff < 0) ? (lngDiff + 360) : lngDiff) / 360;

				var latZoom = zoom(mapDim.height, WORLD_DIM.height, latFraction);
				var lngZoom = zoom(mapDim.width, WORLD_DIM.width, lngFraction);

				return Math.min(latZoom, lngZoom, ZOOM_MAX);
			}

			function searchStores(searchType) {
				if (infowindow) { infowindow.close(); infowindow = null; }
				$('results-message').innerHTML = '';
				if (!geocoder) { 
					window.setTimeout("searchStores('" + searchType + "')", 5000);
					return; 
				}

				if (searchType == 'showAll') {
					var tmpLat=0;

					latlonReset();

					$$('.storeGroupHeader').each(function (h) {
						h.hide();
					});

					for (i=0; i < stores.length; i++) {

						var store = stores[i];
						
						if ($(store.GridElement) == null) continue;
						
						$(store.GridElement).show();

						var headerElement = $(store.HeaderElement);

						if (headerElement != null) {
							headerElement.show();
						}
						
						createMarker(store, '');
						latlonAdd(store.Latitude, store.Longitude);
					}

					latlonCalcAverage(stores.length);

					var point = new google.maps.LatLng(latAverage, lonAverage);
					//var dZoom = map.getZoom();
					if (stores.length > 1) {
						map.setCenter(point); map.setZoom(latlonGetZoom());
					}
				}
				else {
					var zip = $('zip').value;
					var distance = $('distance').value;
        			geocoder.geocode(
          				{ 'address': zip },
          				function(results, status) {
            				if (status != google.maps.GeocoderStatus.OK) {
								var searchHTML = '',
									difference, 
									counter=0;

								clearMapPoints();
            				} 
							else {
								var point = { y: results[0].geometry.location.lat(), x: results[0].geometry.location.lng()};

								clearMapPoints();
								
								var searchHTML = '',
									difference, 
									counter=0;

								latlonReset();

								$$('.storeGroupHeader').each(function (h) {
									h.hide();
								});

								for (i=0; i < stores.length; i++) {

									var store = stores[i];
									var gridElement = $(store.GridElement);
									var headerElement = $(store.HeaderElement);
									difference = distantAssistant(point.y, point.x, store.Latitude, store.Longitude);

									if (difference <= distance) {
										
										gridElement.show();

										if (headerElement != null) {
											headerElement.show();
										}

										createMarker(store, ''); 
										latlonAdd(store.Latitude, store.Longitude);
										counter++;
									}
									else {
										gridElement.hide();
									}
								}
								
								if (latAverage != 0) {
									latlonCalcAverage(counter);
									var point = new google.maps.LatLng(latAverage, lonAverage);
								
									if (stores.length > 1) {
										map.setCenter(point); map.setZoom(latlonGetZoom());
									}
									setCenter=true;
								}
								
								if (counter == 0){
									if($('distance').value != '100') {
										//check next highest distance
										$('distance').selectedIndex += 1;
										searchStores(searchType);
									} else {
										//reset selected index
										$('distance').selectedIndex = 1;
									}
								}
								
								$('results-message').innerHTML = addResultsMessage(counter);
            				}
          				}
        			);
      			}
			}]]>var stores = [
			<xsl:for-each select="//ArrayOfGenericStore/GenericStore[(not(StoreID = //StoreSettings[string-length(StoreGroup) &gt; 0]/StoreID)) and ((StoreID = //StoreSettings[string-length(PharmacyPhone) &gt; 0]/StoreID) or (StoreID = //StoreSettings[string-length(PharmacyHours) &gt; 0]/StoreID))]">
				<xsl:call-template name="StoreObject"/>
				<xsl:if test="position() != last()">,
				</xsl:if>
			</xsl:for-each>]
		</script>
		<xsl:if test="//StoreLocatorData/ApiKey != ''">
			<script>
				<xsl:attribute name="language">javascript</xsl:attribute>
				<xsl:attribute name="for">window</xsl:attribute>
				<xsl:attribute name="event">onload</xsl:attribute>if (document.all) { initialize(); }
				else if(!!navigator.userAgent.match(/Trident.*rv 11\./) || !!navigator.userAgent.match(/Trident\/7\./)) window.document.addEventListener("DOMContentLoaded", initialize(), true);
				else { window.document.addEventListener("DOMContentLoaded", function() {initialize();}, true); } //firefox4</script>
		</xsl:if>
		<div id="StoreLocator">
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number"/>
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</xsl:for-each>
				</div>
			</xsl:if>
			<!--*************************************************************
	 		 google map lookup of stores - must generic key for each domain.
			**************************************************************-->
			<div id="StoreLocatorZipLookup">
				<div id="GoogleMapCanvas"></div>
				<div id="storeZipEntryForm">
					<h2>Quick Shoppe Locations:</h2>
					<xsl:if test="//StoreLocatorData/ApiKey != ''">
						<!--include google js file-->
						<xsl:element name="script">
							<xsl:attribute name="language">javascript</xsl:attribute>
							<xsl:attribute name="type">text/javascript</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:choose>
									<xsl:when test="ExpressLane/Common/Uri/Scheme = 'http'"><![CDATA[http://maps.googleapis.com/maps/api/js?sensor=false]]></xsl:when>
									<xsl:otherwise><![CDATA[https://maps.googleapis.com/maps/api/js?sensor=false]]></xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:element>
					</xsl:if>
					<p>
						<span>Zip or City, State:</span>
						<input type="text" id="zip" name="zip" onKeyPress="return submitenter(this,event)"/>
						<span>Find stores within</span>
						<select ID="distance">
							<option value="5">5</option>
							<option value="10" selected="true">10</option>
							<option value="20">20</option>
							<option value="40">40</option>
							<option value="100">100</option>
						</select>
						<span>miles</span>
					</p>
					<a class="button red" href="javascript:searchStores('basicSearch');">
						<span>Search</span>
					</a>
					<div class="map-button-group">
						<a class="button" href="javascript:searchStores('showAll');">
							<span>Show All Stores</span>
						</a>
						<a class="button" href="javascript:clearMapPoints();">
							<span>Clear Map</span>
						</a>
					</div>
				</div>
				<div id="results-message"></div>
				<!--display containers-->
				<div id="GoogleMapStoreList">
					<xsl:for-each select="//ArrayOfGenericStore/GenericStore[(not(StoreID = //StoreSettings[string-length(StoreGroup) &gt; 0]/StoreID)) and ((StoreID = //StoreSettings[string-length(PharmacyPhone) &gt; 0]/StoreID) or (StoreID = //StoreSettings[string-length(PharmacyHours) &gt; 0]/StoreID))]">
						<xsl:sort select="State"/>
						<xsl:sort select="City"/>
						<xsl:sort select="StoreName"/>
						<xsl:call-template name="StoreGrid">
							<xsl:with-param name="Position" select="position()" />
						</xsl:call-template>
					</xsl:for-each>
					
					<!-- Commenting out to Remove Store Groups without Pharmacy Hours to show-->
					
					<!--<xsl:for-each select="//StoreSettings/StoreGroup[not(node() = preceding::StoreSettings/StoreGroup)]">
						<xsl:sort select="node()" order="descending"/>
						<xsl:variable name="StoreGroup" select="node()"/>
						<h2 class="storeGroupHeader">
							<xsl:attribute name="id">
								<xsl:value-of select="concat('header_', translate($StoreGroup, ' ', '_'))"/>
							</xsl:attribute>
							<xsl:value-of select="$StoreGroup"/>
						</h2>
						<xsl:for-each select="//ArrayOfGenericStore/GenericStore[StoreID = //StoreSettings[StoreGroup = $StoreGroup]/StoreID]">
							<xsl:sort select="State"/>
							<xsl:sort select="City"/>
							<xsl:sort select="StoreName"/>
							<xsl:call-template name="StoreGrid">
								<xsl:with-param name="Position" select="position()"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:for-each>-->
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="StoreGrid" match="GenericStore">
		<xsl:param name="Position" />
		<xsl:variable name="StoreID" select="StoreID"/>
		<xsl:variable name="LinkText">
			<xsl:choose>
				<xsl:when test="//StoreSettings[StoreID = $StoreID]/IsOGS = 'true'">
					<xsl:choose>
						<xsl:when test="//ChainSettings/Setting[SettingID=265]/Value">
							<xsl:value-of select="//ChainSettings/Setting[SettingID=265]/Value"/>
						</xsl:when>
						<xsl:otherwise>Shop Online!</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="string-length(//ChainSettings/Setting[SettingID=264]/Value) &gt; 0">
							<xsl:value-of select="//ChainSettings/Setting[SettingID=264]/Value"/>
						</xsl:when>
						<xsl:otherwise>View Weekly Specials</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="storeInfoZip vcard" id="{concat('storeInfoZip:', StoreID)}">
			<!-- this page uses microformats. http://microformats.org -->
			<xsl:if test="($Position = 1) or (($Position + -1) mod 3 = 0)">
				<xsl:attribute name="class">storeInfoZip storegrid-column1 vcard</xsl:attribute>
			</xsl:if>
			<h3><a class="fn org" href="#">
				<xsl:attribute name="onclick">
					<xsl:value-of select="concat('populateMap(', StoreID, ');')"/>
				</xsl:attribute>
				<!--<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="string-length(//StoreSettings[StoreID = $StoreID]/StoreHost) &gt; 0">
							<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/StoreHost"/>
						</xsl:when>
						<xsl:when test="//StoreSettings[StoreID = $StoreID]/IsOGS = 'true'">
							<xsl:value-of select="concat('/Index.aspx?ogs=1&amp;sn=', StoreNumber, '&amp;linkid=23')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('StoreLocator.aspx?StoreID=', StoreID)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>-->
				<xsl:value-of select="StoreName" />
			</a></h3>
			<p class="adr">
				<span class="street-address"><xsl:value-of select="concat(PrimaryAddress,' ')" disable-output-escaping="yes"/></span>
				<span class="locality"><xsl:value-of select="concat(City,', ')" /></span>
				<abbr class="state" title="{State}"><xsl:value-of select="StateAbbreviation"/></abbr>
				<xsl:text> </xsl:text>
				<span class="postal-code"><xsl:value-of select="PostalCode"/></span>
			</p>
			<div class="phone">
				<xsl:value-of select="Phone" disable-output-escaping="yes"/>
			</div>
			<xsl:if test="string-length(OpenHours) &gt; 0">
				<u>Store Hours:</u>
				<div class="store-hours">
					<xsl:value-of select="OpenHours"/>
				</div>
			</xsl:if>
			<div class="extendedContent">
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/PharmacyHours">
					<u>Pharmacy Hours:</u>
					<br/>
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/PharmacyHours" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/BankHours">
					<u>Bank Hours:</u>
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/BankHours" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/TicketMaster">
					<u>Ticketmaster:</u>
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/TicketMaster" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/BankPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/BankPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/FloralPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/FloralPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/DeliPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/DeliPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/BakeryPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/BakeryPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/PizzaPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/PizzaPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
				<xsl:if test="//StoreSettings[StoreID = $StoreID]/PharmacyPhone">
					<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/PharmacyPhone" disable-output-escaping="yes"/>
					<br/>
				</xsl:if>
			</div>
			<a href="#" class="gridContent">
				<xsl:attribute name="onclick">
					<xsl:value-of select="concat('populateMap(', StoreID, ');')"/>
				</xsl:attribute>
				<xsl:text>View Store Details</xsl:text>
			</a>
			<br/>
			<!--<a>
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="string-length(//StoreSettings[StoreID = $StoreID]/StoreHost) &gt; 0">
							<xsl:value-of select="//StoreSettings[StoreID = $StoreID]/StoreHost"/>
						</xsl:when>
						<xsl:when test="//StoreSettings[StoreID = $StoreID]/IsOGS = 'true'">
							<xsl:value-of select="concat('/Index.aspx?ogs=1&amp;sn=', StoreNumber, '&amp;linkid=23')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('StoreLocator.aspx?StoreID=', StoreID)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$LinkText"/>
			</a>-->
			<br/>
		</div>
	</xsl:template>
	<xsl:template name="StoreObject" match="GenericStore">
		<xsl:variable name="StoreID" select="StoreID"/>
		<xsl:text>{ </xsl:text>
		<xsl:text>GridElement: "</xsl:text>
		<xsl:value-of select="concat('storeInfoZip:', StoreID)"/>
		<xsl:text>", HeaderElement: </xsl:text>
		<xsl:choose>
			<xsl:when test="//StoreSettings[StoreID = $StoreID]/StoreGroup">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="concat('header_', translate(//StoreSettings[StoreID = $StoreID]/StoreGroup, ' ', '_'))"/>
				<xsl:text>"</xsl:text>
			</xsl:when>
			<xsl:otherwise>null</xsl:otherwise>
		</xsl:choose>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="node()[string-length(local-name()) &gt; 0]">
			<xsl:call-template name="Property"/>
			<xsl:if test="position() != last()">, </xsl:if>
		</xsl:for-each>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="//StoreSettings[StoreID = $StoreID]/node()[string-length(local-name()) &gt; 0][local-name() != 'StoreID']">
			<xsl:call-template name="Property"/>
			<xsl:if test="position() != last()">, </xsl:if>
		</xsl:for-each>
		<xsl:text> }</xsl:text>
	</xsl:template>
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