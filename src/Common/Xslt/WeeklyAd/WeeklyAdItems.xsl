<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/IconLegend.xsl"/>
	<xsl:output method="html"/>
  
	<xsl:template match="/">
    <xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfStoreCircularItem/StoreCircularItem[Name != 'Information']">
				<table id="Options">
					<tbody>
						<tr>
							<th scope="col" class="AddButton"/>
							<th scope="col" class="ItemImage"/>
							<th scope="col" class="ItemName">Item</th>
							<th scope="col" class="ItemPrice">Price</th>
							<th scope="col" class="ItemIcon"/>
						</tr>
						<xsl:for-each select="ExpressLane/ArrayOfStoreCircularItem/StoreCircularItem[Name != 'Information']">
							<xsl:sort select="Name" data-type="text"/>
							<xsl:call-template name="CircularItemLine"/>
						</xsl:for-each>
					</tbody>
				</table>
				<div style="display:none;">
					<xsl:for-each select="ExpressLane/ArrayOfStoreCircularItem/StoreCircularItem[Name != 'Information']">
						<span>
							<xsl:attribute name="id">
								<xsl:value-of select="CircularItemID"/>span</xsl:attribute>
							<div id="hoverAdPage" class="thumbNail">
								<div class="top">
									<h1>Enlarged View</h1>
								</div>
								<div class="middle">
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="Description"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="ImageUrl"/>
										</xsl:attribute>
									</img>
									<h5>
										<xsl:choose>
											<xsl:when test="LinkedItemCount &gt; 1">Click to view available varieties <br/> and add to </xsl:when>
											<xsl:otherwise>
												<xsl:text>Click to add to </xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="$IsOGS = 'true'">cart.</xsl:when>
											<xsl:otherwise>list.</xsl:otherwise>
										</xsl:choose>
									</h5>
								</div>
								<div class="bottom"></div>
							</div>
						</span>
					</xsl:for-each>
				</div>
				<xsl:call-template name="IconLegend" />
			</xsl:when>
			<xsl:otherwise>
				<p>No results were found matching your key word.</p>
				<a id="results-back-link" href="{//GenericChain/PreferredHost}/Shop/WeeklyAd.aspx" title="Return to weekly ad page">Back to Weekly Ad</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CircularItemLine" match="StoreCircularItem">
		<xsl:param name="CircularItemID" select="CircularItemID"/>
		<xsl:param name="AddToList">
			<xsl:value-of select="concat('AddToShoppingList(', CircularItemID, ', 8);')"/>
      	</xsl:param>
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">GridAlternatingItem</xsl:when>
					<xsl:otherwise>GridItem</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<td class="AddButton">
				<a class="button">
					<xsl:attribute name="href">javascript:<xsl:value-of select="$AddToList"/></xsl:attribute>
					<span>Add</span>
				</a>
				<a>
					<xsl:attribute name="href">javascript:DisplayCircularAdPage(<xsl:value-of select="CircularPageID"/>);</xsl:attribute>View Page
				</a>
				<div style="display:none;">
					<xsl:attribute name="class">
						<xsl:value-of select="concat('ItemData_', CircularItemID, '_8')"/>
					</xsl:attribute>
					<span class="ExportKeyID">
						<xsl:value-of select="ExportKeyID"/>
					</span>
					<xsl:if test="number(BrandExportKeyID)">
						<span class="ExportKeyID">
							<xsl:value-of select="BrandExportKeyID"/>
						</span>
					</xsl:if>
					<xsl:if test="number(DepartmentExportKeyID)">
						<span class="ExportKeyID">
							<xsl:value-of select="DepartmentExportKeyID"/>
						</span>
					</xsl:if>
					<xsl:if test="number(CategoryExportKeyID)">
						<span class="ExportKeyID">
							<xsl:value-of select="CategoryExportKeyID"/>
						</span>
					</xsl:if>
					<xsl:if test="number(AisleExportKeyID)">
						<span class="ExportKeyID">
							<xsl:value-of select="AisleExportKeyID"/>
						</span>
					</xsl:if>
					<xsl:if test="number(ShelfExportKeyID)">
						<span class="ExportKeyID">
							<xsl:value-of select="ShelfExportKeyID"/>
						</span>
					</xsl:if>
				</div>
			</td>
			<td class="ItemImage">
				<xsl:if test="SmallImageUrl">
					<img style="cursor:pointer;">
						<xsl:attribute name="onclick">
							<xsl:value-of select="$AddToList"/>
						</xsl:attribute>
						<xsl:attribute name="onmouseover">
							<xsl:value-of select="concat('doTipFromTag(this, &quot;', CircularItemID, 'span&quot;);')"/>
						</xsl:attribute>
						<xsl:attribute name="src">
							<xsl:value-of select="SmallImageUrl"/>
						</xsl:attribute>
						<xsl:attribute name="value">Add To List</xsl:attribute>
					</img>
				</xsl:if>
			</td>
			<td class="ItemName">
				<xsl:value-of select="Name"/>
				<xsl:if test="string-length(Description) &gt; 0">
					<xsl:value-of select="concat(', ', substring(Description, 0, 250))"/>
				</xsl:if>
			</td>
			<td class="ItemPrice">
				<xsl:value-of select="PriceString"/>
			</td>
			<td class="ItemIcon">			
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>