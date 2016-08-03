<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	<xsl:if test="ExpressLane/CategoryDisplay/ArrayOfCategory/Category">
		<div class="CategoryHeader">
			<h3>
				<xsl:value-of select="ExpressLane/CategoryDisplay/Category/CategoryName" />
			</h3>
			<xsl:if test="ExpressLane/CategoryDisplay/Category/CategoryID &gt; 0 and ExpressLane/CategoryDisplay/Settings/TopNEnabled='True'">
				<a class="button" href="javascript:GetCategoryGrid(0);">
					<span>Display <xsl:value-of select="ExpressLane/CategoryDisplay/Settings/TopNText" /></span>
				</a>
			</xsl:if>
		</div>
		<div>
			<table class="GridItem">
				<thead>
					<tr>
						<th scope="col">
						</th>
						<th scope="col">
							<span>Item</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="ExpressLane/CategoryDisplay/ArrayOfCategory/Category" >
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 0">GridAlternatingItem</xsl:when>
									<xsl:otherwise>GridItem</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="AddButton">
								<a class="button" title="Add to shopping list">
									<xsl:attribute name="href">javascript:AddToShoppingList(<xsl:value-of select="CategoryID" /> , 1);</xsl:attribute>
									<span>Add</span>
								</a>
								<div style="display:none;">
									<xsl:attribute name="class">
										<xsl:value-of select="concat('ItemData_', CategoryID, '_1	')" />
									</xsl:attribute>
									<span class="ExportKeyID"><xsl:value-of select="ExportKeyID" /></span>
								</div>
							</td>
							<td class="ItemName">
								<xsl:value-of select="CategoryName" />
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>