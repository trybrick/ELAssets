<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
<xsl:output method="html"/>
<xsl:template match="/">

		<xsl:variable name="consumerstoreid" select="//Order/StoreID" />
		<xsl:variable name="storenumber" select="//ArrayOfGenericStore[1]/GenericStore[StoreID = $consumerstoreid]/StoreNumber" />
		<xsl:variable name="dZones" select="//Zone[StoreNumbers/StoreNumber = $storenumber]" />

		<xsl:if test="//Google/GoogleMapsKey != ''">
			<!--include google js file-->
			<xsl:element name="script">
				<xsl:attribute name="language">javascript</xsl:attribute>
				<xsl:attribute name="type">text/javascript</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:value-of select="//Google/GoogleMapsUrl"/>
					<xsl:value-of select="//Google/GoogleMapsKey"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<script type="text/javascript" src="/Assets/Common/Js/GoogleMapsUtilities.js" />
		<script type="text/javascript" src="/Assets/Common/Js/OGS/DeliveryZones/DeliveryZone.js" />
		<script type="text/javascript">

			var polygons = [];
			var fees = [];
			var titles = [];
			var map;
			
			function LoadMap(){

				map = new GMap2(document.getElementById("GMapCanvas"));
				map.setCenter(new GLatLng(<xsl:value-of select="ExpressLane/DeliveryZones/MapInformation/Center/lat" />, <xsl:value-of select="ExpressLane/DeliveryZones/MapInformation/Center/lng" />), <xsl:value-of select="ExpressLane/DeliveryZones/MapInformation/Zoom" />);

				GEvent.addListener(map, "click", function(overlay, point) {
					if(!overlay){
						SaveDeliveryFee(point);
					}
				});
				
				<xsl:for-each select="$dZones">
					<xsl:variable name="title" select="title" />
					<xsl:variable name="polyarray" select="concat('polyarray',position())" />
					<xsl:variable name="polygon" select="concat('polygon', position())" />

					var <xsl:value-of select="$polyarray" /> = [];

					fees.push('<xsl:value-of select="DeliveryFee" />');
					titles.push('<xsl:value-of select="Title" />');

					<xsl:for-each select="points/point">
						<xsl:value-of select="$polyarray" />.push(new GLatLng(<xsl:value-of select="lat" /> , <xsl:value-of select="lng" />));
					</xsl:for-each>

					var <xsl:value-of select="$polygon" /> = new GPolygon(<xsl:value-of select="$polyarray" />,'<xsl:value-of select="Line/color" />',<xsl:value-of select="Line/width" />,<xsl:value-of select="Line/opacity" />,'<xsl:value-of select="Overlay/color" />',<xsl:value-of select="Overlay/opacity" />, {clickable:false});

					map.addOverlay(<xsl:value-of select="$polygon" />);
					polygons.push(<xsl:value-of select="$polygon" />);

				</xsl:for-each>
				
<!--				var address = '<xsl:value-of select="//OrderInformation/Address1" />  + ' ' 
							  + <xsl:value-of select="//OrderInformation/Address2" /> + ', ' 
							  + <xsl:value-of select="//OrderInformation/City" /> + ', '
							  + <xsl:value-of select="//OrderInformation/State" />';

				showAddress(address);
				showAddress('1600 S Ashland Ave, Green Bay, WI');-->

			}

			function showAddress(address){
				var geocoder = new GClientGeocoder();

				geocoder.getLatLng(
					address,
					function(point){
						if(!point){
							alert(address + ' not found');
						}else{
							for (var i=0; i &lt; polygons.length; i++) {
								if (polygons[i].containsLatLng(point)) {
									var marker = new GMarker(point);
									map.addOverlay(marker);
									marker.openInfoWindowHtml(address);

									break;
								}
							}							
						}
					}
				);
			}
			
			function SaveDeliveryFee(point){
				for (var i=0; i &lt; polygons.length; i++) {
					if (polygons[i].containsLatLng(point)) {
						map.openInfoWindowHtml(point,'A delivery fee of ' + fees[i] + ' has been added to your order.<br /> Close the window using the close link in the upper right corner.');
						parent.DisplayDeliveryFee(titles[i],  fees[i]);
						AddDeliveryFeeToOrder(<xsl:value-of select="//Order/OrderID" />, fees[i]);
						break;
					}
				}
			}


		</script>


	<div style="clear:both; width:702px; margin:0 auto;">
		<xsl:choose>
			<xsl:when test="count($dZones) > 0">
				<div id="DeliveryZoneLegend">
					<table style="text-align: center; margin-left: auto; margin-right: auto;" >
						<tr>
						<xsl:for-each select="$dZones">
							<xsl:variable name="colorexample" select="concat('colordiv', position())" />
							<td align="center" valign="middle" style="float: left; margin: 10px;">
								<div>
									<xsl:attribute name="id"><xsl:value-of select="$colorexample" /></xsl:attribute>
									<xsl:attribute name="class">deliveryzonecolor</xsl:attribute>
									<xsl:attribute name="style">
										background-color:<xsl:value-of select="Overlay/color" />;
										opacity: <xsl:value-of select="Overlay/opacity" />;
										width: 25px;
										height: 25px;
										border-color: #000000;
										border-style: solid;
									</xsl:attribute>
								</div>
								<h3><xsl:value-of select="Title" /></h3>
							</td>
						</xsl:for-each>
						</tr>
					</table>
				</div>
				<div id="GMapCanvas" style="width: 600px; height: 600px; margin-left: auto; margin-right: auto;"></div>
			</xsl:when>
			<xsl:otherwise>
				<br />
				<h2>There are no delivery zones avaliable for this store.</h2>
				<br />
			</xsl:otherwise>
		</xsl:choose>
		<script type="text/javascript">
			Event.observe(window, 'load', LoadMap);
		</script>
	</div>

</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\XmlData\184-PageTypeId-140-OGSDeliveryZone.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
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