<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				<![CDATA[
				var pages = ]]><xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+3" /><![CDATA[;
				function elemOn(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "block";
				}
				function elemOff(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "none";
				}
				function hideAll(){
					for( var i = 1; i <= pages; i++ )
						elemOff( 'div_'+i );
				}
				function showAll(){
					for( var i = 1; i <= pages; i++ )
						elemOn( 'div_'+i );
				}
				function showOne(elem_id){
					hideAll( );
					elemOn( elem_id );
				}

				]]>
			</xsl:comment>
		</script>
		<div id="deli" class="departmentPage">
			<div class="leftnav">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			      <xsl:sort select="SortBy" data-type="number" />
				  <xsl:variable name="subStringA" select="substring-after(Image,'.')" />
				  <xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
				  <xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
				  <a>
				  	<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="$fileExtension = 'pdf' or $fileExtension = 'doc'"><xsl:value-of select="Image" /></xsl:when>
						<xsl:otherwise>javascript:showOne('div_<xsl:value-of select="SortBy"/>');</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
					<xsl:value-of select="Title"/>
				  </a>
		          </xsl:for-each>
				  <a>
					<xsl:attribute name="href">javascript:showOne('div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+1"/>');</xsl:attribute>
				  	Catering To Go
				  </a>
				  <a>
					<xsl:attribute name="href">javascript:showOne('div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+2"/>');</xsl:attribute>
				  	Party Platters
				  </a>
				  <a>
					<xsl:attribute name="href">javascript:showOne('div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+3"/>');</xsl:attribute>
				  	Hours and Ordering by Location
				  </a>
				  
			</div>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number" />
			<xsl:variable name="subStringA" select="substring-after(Image,'.')" />
			<xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
			<xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
			<xsl:if test="$fileExtension != 'pdf' or $fileExtension != 'doc'">
				<div class="contentDiv">
					<xsl:attribute name="id">div_<xsl:value-of select="SortBy"/></xsl:attribute>
					<xsl:attribute name="style">display:<xsl:choose><xsl:when test="SortBy &gt; 1">none</xsl:when><xsl:otherwise>block</xsl:otherwise></xsl:choose>;</xsl:attribute>
					<h4><xsl:value-of select="Title" /></h4>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
					<xsl:if test="Image">
						<img alt="" border="0">
							<xsl:attribute name="src"><xsl:value-of select="Image"/></xsl:attribute>
						</img>
					</xsl:if>
				</div>
			</xsl:if>
			</xsl:for-each>
			<div class="contentDiv" style="display:none;">
			<xsl:attribute name="id">div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+1" /></xsl:attribute>
				<h4>Catering To Go</h4>
				<p>No matter what event you’re planning, Trig's can help with quality food, in the quantity you need, made fresh to your order. We do the work – you get the credit. You can choose hot foods or cold cuts, finger sandwiches or cheese and sausage, desserts or fruits and veggies – the combinations and options are endless and Trig’s makes it easy!</p>
				<h5>Special Events:</h5>
				<p>Each item listed serves 25 people unless otherwise indicated. Please allow 48-hour notice when ordering. Delivery fee is $1 per mile, $20 minimum.</p>
				<blockquote><a href="#breakfast">Breakfast Options</a> | <a href="#soup">Soup</a> | <a href="#lunch">Luncheon Options</a> | <a href="#special">Special Events</a><br /><a href="#boxsalads">Box Lunch Salads</a> | <a href="#boxsandwiches">Box Lunch Sandwiches</a> | <a href="#specialsides">Special Sides</a> | <a href="#desserts">Desserts</a>
				</blockquote>
				<em><a><xsl:attribute name="href">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/deli.pdf</xsl:attribute>Click here</a> for a printable PDF version of the Catering To Go brochure.</em>
				<div id="breakfastDiv" class="optiondiv">
					<a id="breakfast" name="breakfast"><h5>Breakfast Options</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/Breakfast/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
				<div id="soupDiv" class="optiondiv">
					<a id="soup" name="soup"><h5>Soup</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/Soup/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
				<div id="luncheonDiv" class="optiondiv">
					<a id="lunch" name="lunch"><h5>Luncheon Options</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/Luncheon/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
				<div id="specialDiv" class="optiondiv">
					<a id="special" name="special"><h5>Special Events</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/SpecialEvent/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
				<div id="boxsaladsDiv" class="optiondiv">
					<a id="boxsalads" name="boxsalads"><h5>Box Lunch Salads</h5></a>
					<p>All box lunch salads are packed in a convenient TO GO container.
					Each salad is served with a fresh-baked roll and butter, napkin, cutlery, salt, and pepper. <span class="price">$8.00</span> plus tax.</p>
					<ul>
						<li>Raspberry Walnut Salad: Fresh marinated grilled breast of chicken atop a fresh array of garden greens, fresh Asiago cheese with raspberry vinaigrette dressing and walnuts.</li>
						<li>House Chef Salad: Mixed salad greens, julienne strips of turkey, honey ham, Swiss cheese, and cheddar cheese, sliced fresh mushrooms, grape tomatoes &amp; hard boiled egg</li>
						<li>Tula's Signature Crab Salad: Surimi crabmeat with diced celery, green onion, mixed with a creamy dressing. Garnished with hard boiled egg, radish rose and grape tomatoes. Served on a bed of leaf lettuce.</li>
					</ul>
				</div>
				<div id="boxsandwichDiv" class="optiondiv">
					<a id="boxsandwiches" name="boxsandwiches"><h5>Box Lunch Sandwiches</h5></a>
					<p><strong>Boxed Lunches</strong> are <span class="price">$8.95</span> plus tax. Each lunch is served with napkin, cutlery, condiment packets, salt and pepper, 2.75 w oz. plain Frito Lay potato chips, 3.25 oz. cole slaw, and one cookie</p>
					<ol>
						<li>Meat: choose one smoked turkey breast, honey ham, slow roasted beef</li>
						<li>Cheese: choose one Cheddar, Baby Swiss</li>
						<li>Bread: choose one kaiser roll, croissant</li>
					</ol>
					<p>Box Lunch Salads/Sandwiches are single serving size. Each other item serves 25 people unless otherwise indicated.</p>
				</div>
				<div id="specialsidesDiv" class="optiondiv">
					<a id="specialsides" name="specialsides"><h5>Special Sides</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/SpecialSides/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
				<div id="dessertsDiv" class="optiondiv">
					<a id="desserts" name="desserts"><h5>Desserts</h5></a>
					<ul>
						<xsl:for-each select="ExpressLane/DeliContent/Catering/Desserts/Option">
							<li><strong><xsl:value-of select="Item" /></strong>,&#160;<xsl:value-of select="Qty" />&#160;<span class="price"><xsl:value-of select="Price" /></span></li>
						</xsl:for-each>
					</ul>
				</div>
			</div>
			
			<div class="contentDiv" style="display:none">
				<xsl:attribute name="id">div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+2" /></xsl:attribute>
				<h4>Throwing a Party? Pick a Party Platter!</h4>
				<p>You can choose from our assortment on hand, but we recommend ordering at least 24 hours ahead. Our Trig’s Deli Manager will be happy to offer serving suggestions and quantity recommendations, or you can browse our selection online and consult our party planning guide.</p>
				<blockquote><a href="#meat">Meat &amp; Cheese</a> | <a href="#vegetable">Vegetable</a> | <a href="#fruit">Fruit</a> | <a href="#cheese">Cheese</a><br /><a href="#seafood">Fish &amp; Seafood</a> | <a href="#sandwiches">Sandwiches</a> | <a href="#bread">Bread</a> | <a href="#misc">Miscellaneous</a>
				</blockquote>
				<em><a><xsl:attribute name="href">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/deli.pdf</xsl:attribute>Click here</a> for a printable PDF version of the Catering To Go brochure.</em>
				<xsl:for-each select="ExpressLane/DeliContent/PartyPlatters/Category">
					<div class="platterCategory">
						<a>
							<xsl:attribute name="id"><xsl:value-of select="Id" /></xsl:attribute>
							<xsl:attribute name="name"><xsl:value-of select="Id" /></xsl:attribute>
							<h5><xsl:value-of select="Heading" /></h5>
						</a>
						<xsl:for-each select="Platter">
							<table class="platterTable">
								<tr colspan="2"><h6><xsl:value-of select="Title" /></h6></tr>
								<tr>
									<td>
										<img class="platterImage">
											<xsl:attribute name="src">##root##/Assets/##chainid##/Images/<xsl:value-of select="Image" /></xsl:attribute>
										</img>
									</td>
									<td class="description">
										<p><xsl:value-of select="Description" /></p>
									</td>
								</tr>
							</table>
							<table class="platterInfo">
								<tr class="tableHeading">
									<td>Size</td>
									<td>Serves</td>
									<td>Price</td>
								</tr>
								<xsl:for-each select="Sizes/Size">
									<tr>
										<td><xsl:value-of select="Inches" /></td>
										<td><xsl:value-of select="Serving" /></td>
										<td><xsl:value-of select="Price" /></td>
									</tr>
								</xsl:for-each>
							</table>
						</xsl:for-each>
					</div>
				</xsl:for-each>
				<div class="platterCategory" id="sandwiches">
					<a name="sandwiches"><h5>Sandwiches</h5></a>
					<h6>Gourment Mini Croissant Platter</h6>
					<table class="platterInfo">
						<tr class="tableHeading">
							<td>Size</td>
							<td>Serves</td>
							<td>Price</td>
						</tr>
						<tr>	
							<td>12"</td>
							<td>4-6</td>
							<td>$22.00</td>
						</tr>
						<tr>	
							<td>16"</td>
							<td>7-10</td>
							<td>$32.00</td>
						</tr>
						<tr>
							<td>18"</td>
							<td>11-15</td>
							<td>$42.00</td>
						</tr>
					</table>
				</div>
				<div class="platterCategory" id="bread">
 					<a name="bread"><h5>Bread</h5></a>
					<h6>Assorted Bread and Dip Platter</h6>
					<table class="platterInfo">
						<tr class="tableHeading">
							<td>Size</td>
							<td>Serves</td>
							<td>Price</td>
						</tr>
						<tr>
							<td>12"</td>
							<td>6-9</td>
							<td>$14.00</td>
						</tr>
						<tr>
							<td>16"</td>
							<td>10-15</td>
							<td>$20.00</td>
						</tr>
						<tr>
							<td>18"</td>
							<td>16-22</td>
							<td>$27.00</td>
						</tr>
					</table>
				</div>
				<div class="platterCategory">
					<a name="misc"><h5>Miscellaneous</h5></a>
					<h6>Deviled Eggs Platter</h6>
					<table class="platterInfo">
						<tr class="tableHeading">
							<td>Size</td>
							<td>Serves</td>
							<td>Price</td>
						</tr>
						<tr>
							<td>12"</td>
							<td>6-9</td>
							<td>$14.00</td>
						</tr>
						<tr>
							<td>16"</td>
							<td>10-12</td>
							<td>$23.00</td>
						</tr>
						<tr>
							<td>18"</td>
							<td>13-16</td>
							<td>$28.00</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="contentDiv" style="display:none">
				<xsl:attribute name="id">div_<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)+3" /></xsl:attribute>
				<h4>Hours and Ordering by Location</h4>
				<table id="Hours">
					<tr class="tableHeading">
						<td>Location</td><td>Phone</td><td>Deli Hours</td>
					</tr>
					<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
						<tr>
							<td><xsl:value-of select="StoreName" /></td>
							<td><xsl:value-of select="Phone" /></td>
							<td>6am - 8pm Daily</td>
						</tr>
					</xsl:for-each>
				</table>
				<h5>Notice is Preferred on Orders</h5>
				<p>You can be sure to get everything you need for your event by ordering in advance.  A minimum 24 hours is recommended for deli tray orders and bulk chicken orders.  A minimum 48 hours is recommended for our Catering To Go options.</p>
			</div>
			</div>
		</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\148-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
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