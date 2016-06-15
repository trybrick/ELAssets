<?xml version="1.0"?>
<!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/98-PageTypeId-86-WineList.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:if test="ExpressLane/WineConnectWineList/WineData">
			<xsl:apply-templates select="ExpressLane/WineConnectWineList" />
			<xsl:for-each select="ExpressLane/WineConnectWineList/WineData[position()&lt;4]">
				<xsl:call-template name="WineListLightBox" />
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="WineConnectWineList">
		<div id="winecontent">
			<table>
				<xsl:attribute name="cellpadding">0</xsl:attribute>
				<xsl:attribute name="cellspacing">0</xsl:attribute>
				<xsl:attribute name="border-collapse">collapse</xsl:attribute>
				<xsl:attribute name="style">margin-bottom:4px</xsl:attribute>
				<xsl:for-each select="WineData[position()&lt;4]">
					<tr>
						<td>
							<xsl:attribute name="class">WineName</xsl:attribute>
							<xsl:if test="position() != last()">
								<xsl:attribute name="style">border-bottom:1px dotted #999999</xsl:attribute>
							</xsl:if>
							<a>
								<xsl:attribute name="class">lightwindow</xsl:attribute>
								<!--<xsl:attribute name="rel">lightbox<xsl:value-of select="position()"/></xsl:attribute>-->
								<!--<xsl:attribute name="href">javascript:showLightWindow('#lightbox<xsl:value-of select="position()"/>');</xsl:attribute>-->
                				<xsl:attribute name="href">#lightbox<xsl:value-of select="position()"/></xsl:attribute>
								<xsl:attribute name="title">more information</xsl:attribute>
								<xsl:attribute name="style">margin:0</xsl:attribute>
                				<xsl:attribute name="params">"lightwindow_width=600;lightwindow_height=400"</xsl:attribute>
								<xsl:value-of select="WineAttributes/WineName" />
							</a>
						</td>
						<td>
							<xsl:attribute name="width">50</xsl:attribute>
							<xsl:if test="position() != last()">
								<xsl:attribute name="style">border-bottom:1px dotted #999999</xsl:attribute>
							</xsl:if>
							<a class="button">
								<xsl:attribute name="href">javascript:AddToShoppingList('<xsl:value-of select="ProductID"/>', <xsl:value-of select="ShoppingListItemTypeID"/>);</xsl:attribute>
								<span>Add</span>
							</a>
						</td>
					</tr>
				</xsl:for-each>
			</table>
			<span class="winename" style="font-size:80%; clear:both; font-style:italic">Wines are recomendations only and may not be carried by this store.</span>
		</div>
	</xsl:template>
	<xsl:template match="WineData" name="WineListLightBox">
		<div>
			<xsl:attribute name="id">lightbox<xsl:value-of select="position()"/></xsl:attribute>
			<xsl:attribute name="class">winebox</xsl:attribute>
			<table class="winetable">
				<tr>
					<td colspan="2">
						<h2>
							<xsl:value-of select="WineAttributes/WineName"/>
						</h2>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<table width="100%">
							<!--
								<tr>
								<td colspan="2">
									<a href="#attributes">Attributes</a>| <a href="#ratings">Ratings</a> | <a href="#foodmatches">Food Matches</a> | <a href="#wineterms">Wine Terms</a></td>
							</tr>
							-->
							<tr>
								<td colspan="2">
									<a name="attributes"></a>
									<h3>Attributes:</h3>
								</td>
							</tr>
							<xsl:if test="WineAttributes/Producer !=''">
								<tr>
									<td class="winedetailbold" width="100">Producer:</td>
									<td>
										<p>
											<xsl:value-of select="WineAttributes/Producer"/>
										</p>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="WineAttributes/Region !=''">
								<tr>
									<td class="winedetailbold" width="100">Region:</td>
									<td>
										<p>
											<xsl:value-of select="WineAttributes/Region"/>
										</p>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="WineAttributes/Varietal !=''">
								<tr>
									<td class="winedetailbold" width="100">Varietal:</td>
									<td>
										<p>
											<xsl:value-of select="WineAttributes/Varietal"/>
										</p>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="WineAttributes/BottleSize !=''">
								<tr>
									<td class="winedetailbold" width="100">Bottle Size:</td>
									<td>
										<p>
											<xsl:value-of select="WineAttributes/BottleSize"/>
										</p>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="WineDescription[position()&lt;9]">
								<tr>
									<td colspan="2">
										<a name="ratings"></a>
										<h3>
											<xsl:value-of select="Vintage"/>: <xsl:value-of select="Source"/> Rating: <xsl:value-of select="Rating"/></h3>
									</td>
								</tr>
								<xsl:if test="Acidity !=''">
									<tr>
										<td class="winedetailbold" width="100">Acidity:</td>
										<td>
											<p>
												<xsl:value-of select="Acidity"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Aromas !=''">
									<tr>
										<td class="winedetailbold" width="100">Aromas:</td>
										<td>
											<p>
												<xsl:value-of select="Aromas"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Body !=''">
									<tr>
										<td class="winedetailbold" width="100">Body:</td>
										<td>
											<p>
												<xsl:value-of select="Body"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Complexity !=''">
									<tr>
										<td class="winedetailbold" width="100">Complexity:</td>
										<td>
											<p>
												<xsl:value-of select="Complexity"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Compliments !=''">
									<tr>
										<td class="winedetailbold" width="100">Compliments:</td>
										<td>
											<p>
												<xsl:value-of select="Compliments"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Flavors !=''">
									<tr>
										<td class="winedetailbold" width="100">Flavors:</td>
										<td>
											<p>
												<xsl:value-of select="Flavors"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Fruit !=''">
									<tr>
										<td class="winedetailbold" width="100">Fruit:</td>
										<td>
											<p>
												<xsl:value-of select="Fruit"/>
											</p>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Texture !=''">
									<tr>
										<td class="winedetailbold" width="100">Texture:</td>
										<td>
											<p>
												<xsl:value-of select="Texture"/>
											</p>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<tr>
								<td colspan="2">
									<a name="foodmatches"/>
									<h3>Food Matches:</h3>
								</td>
							</tr>
							<xsl:for-each select="FoodMatches[not(CategoryName=preceding-sibling::FoodMatches/CategoryName)]">
								<xsl:sort select="CategoryName" />
								<xsl:call-template name="FoodMatch">
									<xsl:with-param name="CategoryName" select="CategoryName" />
									<xsl:with-param name="WineDataNode" select="parent::node()" />
								</xsl:call-template>
							</xsl:for-each>
							<tr>
								<td colspan="2">
									<xsl:for-each select="WineTerms/WineTerm">
										<br/>
										<xsl:if test="Name !=''">
											<div class="winedetailbold">
												<a name="wineterms"/>
												<xsl:value-of select="Name"/>:
											</div>
										</xsl:if>
										<xsl:if test="Definition !=''">
											<p>
												<xsl:value-of select="Definition"/>
											</p>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</td>
					<td width="200">
						<xsl:variable name="winegraphic" select="WineImages/File"/>
						<img>
							<xsl:attribute name="src">http://images.wineconnect.com/ImageLibrary/ImageHandler.ashx?imageid=<xsl:value-of select="translate(substring($winegraphic, 31),'.JPG','')"/>&amp;height=300&amp;width=200</xsl:attribute>
						</img>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="FoodMatch" match="FoodMatches">
		<xsl:param name="CategoryName" />
		<xsl:param name="WineDataNode" />
		<xsl:if test="$WineDataNode/FoodMatches[CategoryName=$CategoryName]">
			<tr>
				<td class="winedetailbold">
					<xsl:value-of select="CategoryName"/>:
				</td>
				<td>
					<xsl:for-each select="$WineDataNode/FoodMatches[CategoryName=$CategoryName]">
						<xsl:choose>
							<xsl:when test="position()=count($WineDataNode/FoodMatches[CategoryName=$CategoryName])">
								<xsl:value-of select="FoodName" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(FoodName, ', ')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>