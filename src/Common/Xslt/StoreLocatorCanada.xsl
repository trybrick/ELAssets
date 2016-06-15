<?xml version="1.0"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/42-PageType-77.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/">
		<style>#sidebar	{display:none}</style>


		<!--show elements based on database settings-->
		<xsl:element name="script">
			<xsl:attribute name="language">javascript</xsl:attribute><![CDATA[
			var map = null;
			var geocoder = null;
			var setCenter = false;
			var latAverage=0, lonAverage=0, latlonExceptions=0, latMin=0, latMax=0, lonMin=0, lonMax=0, zoomMin=4;
			var divCount;

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
					if (storeListing) {tmpHTML = "<div id='newrow' style='clear:both;height:6px; width=100%;'></div><div id='storeInfoZip'>"; }
					}
				if (divCount % 3 != 0) {
					if (! storeListing) {tmpHTML = "<div id='storeInfoMap' style='width:" + bubbleWidth + "px;'>"; }
					if (storeListing) {tmpHTML = "<div id='storeInfoZip'>"; }
				}
				
				tmpHTML = tmpHTML + "<b>" + storeArray[arrPos][0] + "</b><br/>";
				tmpHTML = tmpHTML + storeArray[arrPos][3] + "<br/>";
				tmpHTML = tmpHTML + storeArray[arrPos][4] + "<br/>" + storeArray[arrPos][20] + ' ' + storeArray[arrPos][5] + "<br/>";
				tmpHTML = tmpHTML + storeArray[arrPos][6] + "<br/>";
				
				if (storeArray[arrPos][9] != '') { tmpHTML = tmpHTML + "<b>Store Hours:</b><br/> " + storeArray[arrPos][9] + "<br/>"; }                
				
				if (! storeListing) {
					//check for custom content
					
					if (storeArray[arrPos][18] != '') { tmpHTML = tmpHTML + "<u>Pharmacy Hours:</u> " + storeArray[arrPos][18] + "<br/>"; }					
					if (storeArray[arrPos][12] != '') { tmpHTML = tmpHTML + "<u>Bank Hours:</u> " + storeArray[arrPos][12] + "<br/>"; }
					if (storeArray[arrPos][19] != '') { tmpHTML = tmpHTML + "<u>Ticketmaster:</u> " + storeArray[arrPos][19] + "<br/>"; }
					if (storeArray[arrPos][11] != '') { tmpHTML = tmpHTML + storeArray[arrPos][11] + "<br/>"; }
					if (storeArray[arrPos][13] != '') { tmpHTML = tmpHTML + storeArray[arrPos][13] + "<br/>"; }
					if (storeArray[arrPos][14] != '') { tmpHTML = tmpHTML + storeArray[arrPos][14] + "<br/>"; }
					if (storeArray[arrPos][15] != '') { tmpHTML = tmpHTML + storeArray[arrPos][15] + "<br/>"; }
					if (storeArray[arrPos][16] != '') { tmpHTML = tmpHTML + storeArray[arrPos][16] + "<br/>"; }
					if (storeArray[arrPos][17] != '') { tmpHTML = tmpHTML + storeArray[arrPos][17] + "<br/>"; }
				}
				
				if (storeListing) {
					tmpHTML = tmpHTML + '<a href="#" onclick="populateMap(' + arrPos + ');">View Store Details</a><br/><br/>'; 
				}
				
				tmpHTML = tmpHTML + '<a href="/StoreLocator.aspx?StoreID=' + storeArray[arrPos][2] + '">View Weekly Flyer</a><br/><br/>';
				
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
				if (resultCount == 1) {
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
					var p1 = new google.maps.LatLng(latMin, lonMax);
					var p2 = new google.maps.LatLng(latMax, lonMin);
					
					bounds = new google.maps.LatLngBounds(p1, p2);
				}
				else { bounds = map.getBounds(); }

				var zoom = map.getBoundsZoomLevel(bounds);
				if (zoom < zoomMin) { zoom = zoomMin; }
				
				//return map.getBoundsZoomLevel(bounds);
				return zoom;
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
					map.setCenter(point, latlonGetZoom()); 

					document.getElementById('GoogleMapStoreList').innerHTML = allHTML;
				}
				else {
					var zip, distance;

					zip = document.getElementById('zip').value;
					distance = document.getElementById('distance')[document.getElementById('distance').selectedIndex].value;

        			geocoder.getLatLng(
          				zip,
          				function(point) {
            				if (!point) {
              					alert(zip + " not found");
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
								
									map.setCenter(point, latlonGetZoom()); 
									setCenter=true;
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


			<xsl:for-each select="//ArrayOfGenericStore/GenericStore">
				<xsl:sort select="State" order="descending"/>
				<xsl:sort select="City"/>
				<xsl:sort select="StoreName"/>

				<xsl:variable name="CommonStoreID">
					<xsl:value-of select="StoreID"/>
				</xsl:variable>
				<xsl:variable name="jsIndex">
					<xsl:value-of select="position()-1"/>
				</xsl:variable>storeArray [<xsl:value-of select="$jsIndex"/>] = new Array(9);
				storeArray [<xsl:value-of select="$jsIndex"/>][0] = "<xsl:value-of select="StoreName"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][1] = "<xsl:value-of select="StoreNumber"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][2] = "<xsl:value-of select="StoreID"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][3] = "<xsl:value-of select="PrimaryAddress"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][4] = "<xsl:value-of select="City"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][5] = "<xsl:value-of select="PostalCode"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][6] = "<xsl:value-of select="Phone"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][7] = "<xsl:value-of select="Latitude"/>";
	        	storeArray [<xsl:value-of select="$jsIndex"/>][8] = "<xsl:value-of select="Longitude"/>";
				storeArray [<xsl:value-of select="$jsIndex"/>][9] = "<xsl:value-of select="OpenHours"/>";
				//default values
				storeArray [<xsl:value-of select="$jsIndex"/>][10] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][11] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][12] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][13] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][14] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][15] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][16] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][17] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][18] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][19] = '';
				storeArray [<xsl:value-of select="$jsIndex"/>][20] = "<xsl:value-of select="State"/>";
				<xsl:for-each select="//CustomStores/Store">
					<xsl:variable name="CustomStoreID">
						<xsl:value-of select="StoreID"/>
					</xsl:variable>
					<xsl:if test="$CustomStoreID = $CommonStoreID">storeArray [<xsl:value-of select="$jsIndex"/>][9] = "<xsl:value-of select="StoreHours"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][10] = "<xsl:value-of select="StorePhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][11] = "<xsl:value-of select="BankPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][12] = "<xsl:value-of select="BankHours"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][13] = "<xsl:value-of select="FloralPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][14] = "<xsl:value-of select="DeliPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][15] = "<xsl:value-of select="BakeryPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][16] = "<xsl:value-of select="PizzaPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][17] = "<xsl:value-of select="PharmacyPhone"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][18] = "<xsl:value-of select="PharmacyHours"/>";
						storeArray [<xsl:value-of select="$jsIndex"/>][19] = "<xsl:value-of select="Ticketmaster"/>";</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:element>

		<xsl:if test="//StoreLocatorData/ApiKey != ''">
			<xsl:element name="script">
				<xsl:attribute name="language">javascript</xsl:attribute>
				<xsl:attribute name="for">window</xsl:attribute>
				<xsl:attribute name="event">onload</xsl:attribute>if (document.all) { initialize(); }
				else if(!!navigator.userAgent.match(/Trident.*rv 11\./) || !!navigator.userAgent.match(/Trident\/7\./)) window.document.addEventListener("DOMContentLoaded", initialize(), true);
				else { window.document.addEventListener("DOMContentLoaded", function() {initialize();}, true); } //firefox</xsl:element>
		</xsl:if>

		<div id="StoreLocator">

			<!--********************************
	 		 generic drop-down menu of stores
			*********************************-->

			<div ID="StoreLocatorDropDown">

				<h2>Select Your Favorite Store:</h2>

				<select name="storeID" onchange="document.location.href='/storeLocator.aspx?storeID='+document.aspnetForm.storeID[document.aspnetForm.storeID.selectedIndex].value;">
					<option value="">Select a Store</option>
					<xsl:for-each select="//ArrayOfGenericStore/GenericStore">
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="StoreID"/>
							</xsl:attribute>
							<xsl:value-of select="StoreName"/>
						</option>
					</xsl:for-each>
				</select>

				<!--&#xA0;<input type="button" value="go" onclick="document.location.href='/storeLocator.aspx?storeID='+document.form1.storeID[document.form1.storeID.selectedIndex].value"/>-->
			</div>

			<!--*************************************************************
	 		 google map lookup of stores - must generic key for each domain.
			**************************************************************-->

			<div id="StoreLocatorZipLookup">
				<div id="GoogleMapCanvas"></div>

				<div id="storeZipEntryForm">
					<!-- CHANGED:Use chain setting for heading text. Not hardcoded. --> 
					<h2>	
						<xsl:choose>
							<xsl:when test="//ChainSettings/Setting[SettingID=274]/Value">
		                        <xsl:value-of select="//ChainSettings/Setting[SettingID=274]/Value" />
		                    </xsl:when>
							<xsl:otherwise>
								<xsl:text>Locate Your Favorite Store:</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
                	</h2>

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
						<span>Postal Code:</span>
						<input type="text" id="zip" name="zip" onKeyPress="return submitenter(this,event)"/>
						<span>Find stores within</span>
						<select ID="distance">
							<option value="8" selected="true">8</option>
							<option value="16">16</option>
							<option value="32">32</option>
							<option value="64">64</option>
						</select>
						<span>km</span>
					</p>

					<a class="button" href="javascript:searchStores('basicSearch');">
						<span>Search</span>
					</a>

					<p style="width:300px; clear:both; margin-top:4px; float:left">

						<a class="button" href="javascript:searchStores('showAll');">
							<span>Show All Stores</span>
						</a>

						<a class="button" href="javascript:clearMapPoints();">
							<span>Clear Map</span>
						</a>
					</p>
				</div>

				<!--display containers-->
				<div id="GoogleMapStoreList"></div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>