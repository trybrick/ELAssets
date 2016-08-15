<?xml version="1.0"?><!-- DWXMLSource="file:///MacbookPro/Users/pat/Desktop/xml/73-PageTypeId-77-StoreLocator.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/"><style>#sidebar	{display:none}</style>
		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

		<!--show elements based on database settings
		<xsl:element name="script">
			<xsl:attribute name="type">text/javascript</xsl:attribute>
			
			<xsl:choose>
				<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent[Title='WeeklyAdLinkText']">
					var WeeklyAdLinkText = '<xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[Title='WeeklyAdLinkText']/Description" />';
				</xsl:when>
				<xsl:otherwise>
					var WeeklyAdLinkText = 'View Weekly Specials';
				</xsl:otherwise>
			</xsl:choose>

			<![CDATA[
			var map = null;
			var geocoder = null;
			var setCenter = false;
			var latAverage=0, lonAverage=0, latlonExceptions=0, latMin=0, latMax=0, lonMin=0, lonMax=0, zoomMin=4;
			var divCount;
			var determineStoreGroup = null;

			function initialize() {
        			var storeInit = stores[0];
					map = new google.maps.Map(
						document.getElementById('GoogleMapCanvas'), {
						  center: new google.maps.LatLng(storeInit.Latitude, storeInit.Longitude),
						  zoom: 13,
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
			
			function populateMap(arrPos) {
				if (geocoder) {
					createMarker(storeArray[arrPos][7], storeArray[arrPos][8], getStoreHTML(arrPos,false));
					var point = new google.maps.LatLng(storeArray[arrPos][7], storeArray[arrPos][8]);
					map.setCenter(point, 13);
				}
			}

			function getStoreHTML(arrPos, storeListing) {
				var tmpHTML="", bubbleWidth=170;
				
				if (divCount % 3 == 0) {
					if (! storeListing) {tmpHTML = "<div id='storeInfoMap' style='width:" + bubbleWidth + "px;'>"; }
					if (storeListing) {tmpHTML = "<div id='newrow' style='clear:both;height:1px; width:100%;'></div><div id='storeInfoZip'>"; }
					}
				if (divCount % 3 != 0) {
					if (! storeListing) {tmpHTML = "<div id='storeInfoMap' style='width:" + bubbleWidth + "px;'>"; }
					if (storeListing) {tmpHTML = "<div id='storeInfoZip'>"; }
				}
				
				if (storeArray[arrPos][21] != determineStoreGroup) {
					if (storeListing) {
						determineStoreGroup = storeArray[arrPos][21];

						if (storeArray[arrPos][21] !=''){
							tmpHTML = "<div id='newrow' style='clear:both;height:1px; width:100%;'></div><h2>" + determineStoreGroup + "</h2><div id='storeInfoZip'>";
							divCount = 0;
						}
						else {
							tmpHTML = "<hr style='height:1px; width:100%; margin-bottom:12px;'/><div id='storeInfoZip'>";
							divCount = 0;
						}

					}
				}


				tmpHTML = tmpHTML + "<a href=# onclick=populateMap(" + arrPos + ");><h1>" + storeArray[arrPos][0] + "</h1></a>";
				tmpHTML = tmpHTML + "<strong>Operating in:</strong><br/>" + storeArray[arrPos][3] + "<br/>";
				tmpHTML = tmpHTML + "<a href='" + storeArray[arrPos][1] + "/shop/weeklyad.aspx' target='_blank'>View weekly specials</a><br/>";
				
				if (storeListing) {
					tmpHTML = tmpHTML + '<a href="#" onclick="populateMap(' + arrPos + ');">View Information</a><br/>'; 
				}
				
				
				if (storeListing) { tmpHTML = tmpHTML + "</div>"; }		 
				
				divCount++;

				return tmpHTML;
			}

			function createMarker(lat, lng, bubbleHTML) {
					var point = new google.maps.LatLng(lat, lng);
					if (!setCenter) {
						map.setCenter(point, 13); //marker will not overlay without center being set at least once
						setCenter=true;
					}
					
					var marker = new google.maps.Marker({
						  position: point,
						  map: map,
					});
					
					google.maps.event.addListener(marker, "click", function() {
						var infowindow = new google.maps.InfoWindow({
						  content: bubbleHTML
						});
						infowindow.open(map,marker);
					});
			}

			function addResultsMessage(resultsHTML, resultCount) {
				if (!resultCount || resultCount <= 1) {
					resultsHTML = '<p class="result">We found <b>' + resultCount + '</b> store matching your search.</p>' + resultsHTML;
				} else {
					resultsHTML = '<p class="result">We found <b>' + resultCount + '</b> stores matching your search.</p>' + resultsHTML;
				}
				return resultsHTML;
			}

			function clearMapPoints() {
				if (GBrowserIsCompatible()) {
					map.clearOverlays();
				}
			}

			function latlonAdd(lat, lon) {
				if (lat != '' && lon != '') {
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
				//var arrLenAdjusted = arrLen-latlonExceptions;
				//latAverage = latAverage/arrLenAdjusted;
				//latAverage = Math.round(latAverage*1000000)/1000000;
				//lonAverage = lonAverage/arrLenAdjusted;
				//lonAverage = Math.round(lonAverage*1000000)/1000000;

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
					var allHTML='';
					var tmpLat=0;

					latlonReset();					

					for (i=0; i < storeArray.length; i++) {
						allHTML = allHTML + getStoreHTML(i,true);
						createMarker(storeArray[i][7], storeArray[i][8], ''); //getStoreHTML(i,false)
						latlonAdd(storeArray[i][7], storeArray[i][8]);
					}

					latlonCalcAverage(storeArray.length);

					var point = new google.maps.LatLng(latAverage, lonAverage);
					//var dZoom = map.getZoom();
					map.setCenter(point); map.setZoom(latlonGetZoom());

					document.getElementById('GoogleMapStoreList').innerHTML = allHTML;
				}
				else {
					var zip, distance;

					zip = document.getElementById('zip').value;
					var select_distance = document.getElementById('distance');
					distance = select_distance[select_distance.selectedIndex].value;

        			geocoder.getLatLng(
          				zip,
          				function(point) {
            				if (!point) {
								//if (Number(zip).toString() == 'NaN') {
								//	alert("No locations mathcing City: " + zip + " were found");
								//}
								//else {
              					//	alert("No locations matching Zip Code: " + zip + " were found");
								//}

								var searchHTML = '',
									difference, 
									counter=0;

								clearMapPoints();
            				} 
							else {
								clearMapPoints();
								
								var searchHTML = '',
									difference, 
									counter=0;

								latlonReset();

								for (i=0; i < storeArray.length; i++) {
									difference = distantAssistant(point.y, point.x, storeArray[i][7], storeArray[i][8]);
									if (difference <= distance) {
										searchHTML = searchHTML + getStoreHTML(i,true);
										createMarker(storeArray[i][7], storeArray[i][8], ''); 
										latlonAdd(storeArray[i][7], storeArray[i][8]);
										counter++;
									}
								}
								
								if (latAverage != 0) {
									latlonCalcAverage(counter);
									var point = new google.maps.LatLng(latAverage, lonAverage);
								
									map.setCenter(point); map.setZoom(latlonGetZoom());
									setCenter=true;
								}
								
								if (counter == 0){
									if(select_distance[select_distance.selectedIndex].value != '100') {
										//check next highest distance
										select_distance.selectedIndex = (select_distance.selectedIndex) + 1;
										searchStores(searchType);
									} else {
										//reset selected index
										select_distance.selectedIndex = 1;
									}
								}
								
								searchHTML = addResultsMessage(searchHTML, counter);
								document.getElementById('GoogleMapStoreList').innerHTML = searchHTML;
            				}
          				}
        			);
      			}
			}

			storeArray = new Array();
			]]>
			
			<xsl:for-each select="//ChainLocations/Chain">

				<xsl:sort select="ChainName"/>
				<xsl:variable name="CustomStoreID" select="ChainID" />
				<xsl:variable name="CommonStoreID"><xsl:value-of select="ChainID" /></xsl:variable>
				<xsl:variable name="jsIndex"><xsl:value-of select="position()-1" /></xsl:variable>

				storeArray [<xsl:value-of select="$jsIndex"/>] = new Array(21);
				storeArray [<xsl:value-of select="$jsIndex"/>][0] = "<xsl:value-of select="ChainName"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][1] = "<xsl:value-of select="DomainName"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][2] = "<xsl:value-of select="ChainID"/>";
                storeArray [<xsl:value-of select="$jsIndex"/>][3] = "<xsl:for-each select="//ChainLocations/State[ChainID=$CustomStoreID]"><xsl:value-of select="State"/> (<xsl:value-of select="Locations"/> Store<xsl:if test="Locations &gt; 1">s</xsl:if>)&lt;br&gt;</xsl:for-each>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][4] = "<xsl:value-of select="GoogleMapIcon"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][5] = "<xsl:value-of select="GoogleMapIconSize"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][7] = "<xsl:value-of select="Latitude"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][8] = "<xsl:value-of select="Longitude"/>";
	
			</xsl:for-each>
		</xsl:element>


-->

		<xsl:element name="script">
			<xsl:attribute name="type">text/javascript</xsl:attribute>
              (function() {
				window.onload = function(){
					// Creating a LatLng object containing the coordinate for the center of the map  
				  var latlng = new google.maps.LatLng(56.83, 15.16);  
				  // Creating an object literal containing the properties we want to pass to the map  
				  var options = {  
					zoom: 7,
					center: latlng,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				  };  
				  // Calling the constructor, thereby initializing the map  
				  var map = new google.maps.Map(document.getElementById('map'), options);  
									
				  var marker = new google.maps.Marker({
					position: new google.maps.LatLng(56.8848, 14.7730), 
					map: map,
					title: 'My workplace',
					clickable: false,
					icon: 'http://ucook.beta.groceryshopping.net/assets/186/images/googlemap.png'
				  });
				}
			  })();
		</xsl:element>

<!--
		<xsl:if test="//StoreLocatorData/ApiKey != ''">
			<xsl:element name="script">
			<xsl:attribute name="language">javascript</xsl:attribute>
			<xsl:attribute name="for">window</xsl:attribute>
			<xsl:attribute name="event">onload</xsl:attribute>
				if (document.all) { initialize(); }
				else if(!!navigator.userAgent.match(/Trident.*rv 11\./) || !!navigator.userAgent.match(/Trident\/7\./)) window.document.addEventListener("DOMContentLoaded", initialize(), true);
				else { window.document.addEventListener("DOMContentLoaded", function() {initialize();}, true); } //firefox
			</xsl:element>
		</xsl:if>
-->

		<div id="StoreLocator">
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number" />
						<xsl:value-of select="Description" disable-output-escaping="yes" />
					</xsl:for-each>
				</div>
			</xsl:if>


			<!--*************************************************************
	 		 google map lookup of stores - must generic key for each domain.
			**************************************************************-->

			<div id="StoreLocatorZipLookup">
            
            	<h2>Choose a location close to you:</h2>
                
                
				<div id="map" style="width:100%; height:400px;"></div>

				<div id="storeZipEntryForm">
					
				<xsl:choose>
					<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent/Title='PageTitle'">
						<xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[Title='PageTitle']/Description" disable-output-escaping="yes" />
					</xsl:when>
					<xsl:otherwise>
						<h2>Locate Your Favorite Store:</h2>
					</xsl:otherwise>
				</xsl:choose>
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

					<p><span>Zip or City, State:</span> <input type="text" id="zip" name="zip" onKeyPress="return submitenter(this,event)" /> <span>Find stores within</span>
						<select ID="distance">
							<option value="5">5</option>
							<option value="10" selected="true">10</option>
							<option value="20">20</option>
							<option value="40">40</option>
							<option value="100">100</option>
						</select> <span>miles</span></p>

					<a class="button red" href="javascript:searchStores('basicSearch');"><span>Search</span></a>

					<p style="width:300px; clear:both; margin-top:4px; float:left">
						<a class="button" href="javascript:searchStores('showAll');"><span>Show All Stores</span></a>
						<a class="button" href="javascript:clearMapPoints();"><span>Clear Map</span></a>
					</p>

					</div>
					
				<!--display containers-->
				<div id="GoogleMapStoreList"></div>
                
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Xml\ChainLocations.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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