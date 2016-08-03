<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
	<!-- Get this to match up with div on server end -->
	<xsl:template match="/">
		<div id="EditElements">
			<xsl:for-each
				select="//ArrayOfGenericCircularItemDealBuster/GenericCircularItemDealBuster">
				<div>
					<xsl:attribute name="id">Edit_<xsl:value-of select="CircularItemID"
					/></xsl:attribute> Price Buster for circular item: <xsl:value-of select="CircularItemID"/>
					<br/>
					<a>
						<xsl:attribute name="href">javascript:EditPriceBuster('<xsl:value-of
							select="CircularItemID"/>');</xsl:attribute> Edit </a> | 
					<a>
						<xsl:attribute name="href">javascript:DeletePriceBuster('<xsl:value-of
							select="CircularItemID"/>');</xsl:attribute> Delete </a>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/">
		<script type="text/javascript">		
			 function getStyle(id,style) {
			 
			 	var obj = document.getElementById('PriceBuster'+id);
			 	var image = document.getElementById('cpImage');
			 		 	
			 	var xCoord = findPosX(image);
			 	var yCoord = findPosY(image);
			 	
			 	var X = 0;
			 	var Y = 0;
			 	
			 	var strArray = style.split(';');
			 	
			 	for (var i = 0; i &lt; strArray.length; i++) {
		            if (strArray[i] == "") {
		                continue;
		            }
		
		            var test = strArray[i].search("top");
		            if (test >= 0) {
		            	var str = strArray[i].replace("top:","");
		            	str = str.replace("px","").trim();
		                Y = new Number(str);
		                continue;
		            }
		
		            test = strArray[i].search("left");
		            if (test >= 0) {
		            	var str = strArray[i].replace("left:","");
		            	str = str.replace("px","").trim();
		            	X = new Number(str);
		            	continue;
		            }
		        }
			 	
			 	xCoord += X;
			 	yCoord += Y;
			 	
			 	obj.style.left = xCoord + 'px';
			 	obj.style.top = yCoord + 'px';
			}
			
			function addDivElements(obj, nameID, content) {
			    var txtDiv = document.createElement('p');
			    txtDiv.id = 'txtDealBuster' + nameID;
			    if(content != null) {
			        txtDiv.innerHTML = content;
			    }
			    obj.appendChild(txtDiv);
			    return obj;
			}
			
			//code by Peter-Paul Koch , Alex Tingle.
			//http://blog.firetree.net/2005/07/04/javascript-find-position/
			function findPosX(obj) {
			    var curleft = 0;
			    if (obj.offsetParent) {
			        while (1) {
			            curleft += obj.offsetLeft;
			            if (!obj.offsetParent)
			                break;
			            obj = obj.offsetParent;
			        }
			    }
			    else if (obj.x) {
			        curleft += obj.x;
			    }
			    return curleft;
			}
			function findPosY(obj) {
			    var curtop = 0;
			    if (obj.offsetParent) {
			        while (1) {
			            curtop += obj.offsetTop;
			            if (!obj.offsetParent)
			                break;
			            obj = obj.offsetParent;
			        }
			    }
			    else if (obj.y) {
			        curtop += obj.y;
			    }
			    return curtop;
			}
			//code copyrights end.
			
		</script>
		<script type="text/javascript" src="js/cas_tips.js"/>
		<script type="text/javascript" src="js/DealBuster.js"/>
		<script type="text/javascript" src="js/MouseEvents.js"/>
		<!-- <script type="text/javascript" src="/Assets/Common/Js/ToolTips/cas_tips.js"/> -->

		<!--
		<div id="EditHeader">
			<h2>Editing Price Buster for Circular item: None Selected</h2>
		</div>
		-->


		<!--Edit field
		<div id="EditField" style="float:left; height:auto; width:300px;"> X: <input id="txtX"
				type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) { SetPriceBusterX();
					return false; } </xsl:attribute>
			</input><br/> Y: <input id="txtY" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) { SetPriceBusterY();
					return false; } </xsl:attribute>
			</input><br/> Height: <input id="txtHeight" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) { SetPriceBusterHeight();
					return false; } </xsl:attribute>
			</input><br/> Width: <input id="txtWidth" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) { SetPriceBusterWidth();
					return false; } </xsl:attribute>
			</input><br/> BG Color: <input id="BGColor" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) {
					SetPriceBusterBGColor(); return false; } </xsl:attribute>
			</input><br/> Text Color: <input id="txtColor" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) {
					SetPriceBusterTextColor(); return false; } </xsl:attribute>
			</input><br/> Price String: <input id="PriceStr" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) {
					SetPriceBusterPriceStr(); return false; } </xsl:attribute>
			</input><br/> Price: <input id="PriceValue" type="text">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) {
					SetPriceBusterPriceValue(); return false; } </xsl:attribute>
			</input><br/> Feature Text: <br/>
			<textarea id="txtText" type="text" style="height:100px ">
				<xsl:attribute name="onkeypress"> if (event.keyCode == 13) { SetPriceBusterText();
					return false; } </xsl:attribute>
			</textarea><br/>
		-->
			<!--insert dealbuster element here-->



		<div id="ImageMap">
			<img id="cpImage">
				<xsl:attribute name="usemap">#CircularImageMap<xsl:value-of
						select="//CircularPageID"/></xsl:attribute>
				<xsl:attribute name="src">
					<xsl:value-of select="//GenericCircularPage/ImageURL"/>
				</xsl:attribute>
			</img>

			<xsl:if test="//ArrayOfGenericCircularItem/GenericCircularItem">
				<map>
					<xsl:attribute name="id">CircularImageMap<xsl:value-of select="//CircularPageID"
						/></xsl:attribute>
					<xsl:attribute name="name">CircularImageMap<xsl:value-of
							select="//CircularPageID"/></xsl:attribute>
					<xsl:for-each
						select="//ArrayOfGenericCircularItem/GenericCircularItem">
						<area>
							<xsl:attribute name="alt">
								<xsl:value-of select="CircularItemName"/>
							</xsl:attribute>
							<xsl:attribute name="onclick"> AddPriceBuster(this,'<xsl:value-of select="CircularItemID"/>',0); </xsl:attribute>
							<xsl:attribute name="onmouseover"> doTipFromTag(this, '<xsl:value-of
									select="CircularItemID"/>span'); </xsl:attribute>
							<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
							<xsl:attribute name="coords">
								<xsl:value-of select="AreaCoordinates"/>
							</xsl:attribute>
							<xsl:attribute name="shape">
								<xsl:choose>
									<xsl:when
										test="string-length(AreaCoordinates)-string-length(translate(AreaCoordinates, ',', ''))&gt;3"
										>poly</xsl:when>
									<xsl:otherwise>rect</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</area>
					</xsl:for-each>
				</map>

				<!--insert priceBuster in here-->
				<div id="PriceBuster" style="top: 284px;">
					<xsl:for-each select="//ArrayOfDealBusterEditor/DealBusterEditor">
						<xsl:call-template name="DealBusterItem"></xsl:call-template>
					</xsl:for-each>
				</div>

				<div style="display:none;visiblity:hidden;">
					<xsl:for-each
						select="//ArrayOfGenericCircularItem/GenericCircularItem">
						<span>
							<xsl:attribute name="id"><xsl:value-of select="CircularItemID"
								/>span</xsl:attribute>
							<div id="hoverAdPage" class="bigPage">
								<div class="top">
									<h1>Click to add to your shopping list.</h1>
								</div>
								<div class="middle">
									<div class="circularHoversImage">
										<xsl:if test="SmallImageURL">
											<img>
												<xsl:attribute name="alt">
												<xsl:value-of select="Name"/>
												</xsl:attribute>
												<xsl:attribute name="src">
												<xsl:value-of select="SmallImageURL"/>
												</xsl:attribute>
											</img>
										</xsl:if>
									</div>
									<div class="circularHoversPricing">
										<h2>
											<xsl:value-of select="CircularItemName"/>
										</h2>
										<h3>
											<xsl:value-of select="ProductDescription"
												disable-output-escaping="yes"/>
										</h3>
										<h4>
											<xsl:value-of select="PriceString"/>
										</h4>
									</div>
									<h5>Click to add to your list.</h5>
								</div>
								<div class="bottom"/>
							</div>
						</span>
					</xsl:for-each>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<!--DealBusterItem-->
	<xsl:template name="DealBusterItem">
		<!-- I dont know how to use variables.....
		<xsl:variable name="Stores">
			<xsl:attribute name="select" >
				<xsl:for-each select="//Stores/GenericStore">
					<xsl:value=of select="StoreID" />,
				</xsl:for-each>
			</xsl:attribute>
		</xsl:variable >
		-->
		<div>
			<xsl:attribute name="id">PriceBuster<xsl:value-of select="GenericDealBuster/CircularItemID"/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/></xsl:attribute>
			<xsl:attribute name="class">PriceBuster</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:value-of select="GenericDealBuster/HtmlStyle"/> visibility:hidden;
			</xsl:attribute>
			<p>
				<xsl:attribute name="id">PriceStr<xsl:value-of select="GenericDealBuster/CircularItemID"
					/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/></xsl:attribute>
				<!--<xsl:value-of select="Price"/> -->
				<xsl:if test="GenericDealBuster/PriceString != ''">
					<xsl:value-of select="GenericDealBuster/PriceString"/>
				</xsl:if>
			</p>
			<div>
				<xsl:attribute name="id">resizeSouth<xsl:value-of select="GenericDealBuster/CircularItemID"
					/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/></xsl:attribute>
				<xsl:attribute name="style">height: 8px; width: 8px; position: absolute; top: 100%;
					left: 100%; background-color: black; cursor: nw-resize;</xsl:attribute>
			</div>
			<div>
				<xsl:attribute name="id">txtDealBuster<xsl:value-of select="GenericDealBuster/CircularItemID"
					/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/></xsl:attribute>
				<xsl:attribute name="class">Hidden</xsl:attribute>
				<xsl:if test="GenericDealBuster/TextContent != ''">
					<xsl:value-of select="GenericDealBuster/TextContent"/>
				</xsl:if>
			</div>
			<div>
				<xsl:attribute name="id">Stores<xsl:value-of select="GenericDealBuster/CircularItemID"
					/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/></xsl:attribute>
				<xsl:attribute name="class">Hidden</xsl:attribute>
				<xsl:if test="Stores != ''">
					<xsl:value-of select="Stores"/>
				</xsl:if>
			</div>
			<script type="text/javascript">
				//getStyle('<xsl:value-of select="CircularItemID"/>','<xsl:value-of select="HtmlStyle"/>');
				dragDrop.initElement('PriceBuster<xsl:value-of select="GenericDealBuster/CircularItemID"/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/>');
				resize.initElement('resizeSouth<xsl:value-of select="GenericDealBuster/CircularItemID"/>_<xsl:value-of select="GenericDealBuster/CircularItemDealBusterID"/>');
			</script>
		</div>
	</xsl:template>
</xsl:stylesheet>
