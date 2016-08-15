<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<NewDataSet>
			<xsl:for-each select="//GenericShoppingList/VisibleItems/GenericShoppingListItem">
				<ListItems>
					<quantity>
						<xsl:choose>
							<xsl:when test="Quantity &lt; 1">1</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="Quantity"/>
							</xsl:otherwise>
						</xsl:choose>
					</quantity>
					<description>
						<xsl:value-of select="Description"/>
					</description>
					<xsl:call-template name="Positions"/>
					<ItemID>
						<xsl:value-of select="ShoppingListItemID"/>
					</ItemID>
				</ListItems>
			</xsl:for-each>
			<xsl:copy-of select="ExpressLane/ChainLogos"/>
			<xsl:call-template name="OffersValid"/>
			<xsl:choose>
				<xsl:when test="ExpressLane/ArrayOfGenericStore/GenericStore[StoreID = //GenericShoppingList/StoreID]">
					<xsl:apply-templates select="ExpressLane/ArrayOfGenericStore/GenericStore[StoreID = //GenericShoppingList/StoreID]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="//GenericStore"/>
				</xsl:otherwise>
			</xsl:choose>
		</NewDataSet>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="Positions">
		<xsl:param name="PlanogramPositionID" select="PlanogramPositionID"/>
		<xsl:param name="Position" select="//GenericShoppingList/PlanogramPositions/PlanogramPosition[PlanogramPositionID=$PlanogramPositionID]"/>
		<xsl:param name="Parent" select="//GenericShoppingList/PlanogramPositions/PlanogramPosition[PlanogramPositionID=$Position/ParentPlanogramPositionID]"/>
		<AisleName>
			<xsl:value-of select="$Position/PlanogramPositionName"/>
		</AisleName>
		<xsl:choose>
			<xsl:when test="$Parent">
				<DepartmentName>
					<xsl:value-of select="$Parent/PlanogramPositionName"/>
				</DepartmentName>
				<Sort>
					<xsl:value-of select="$Parent/SortOrder"/>
				</Sort>
			</xsl:when>
			<xsl:otherwise>
				<DepartmentName>
					<xsl:value-of select="$Position/PlanogramPositionName"/>
				</DepartmentName>
				<Sort>
					<xsl:value-of select="$Position/SortOrder"/>
				</Sort>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="StoreInfo" match="GenericStore">
		<StoreLocation>
			<address1>
				<xsl:value-of select="PrimaryAddress"/>
			</address1>
			<city>
				<xsl:value-of select="City"/>
			</city>
			<state>
				<xsl:value-of select="State"/>
			</state>
		</StoreLocation>
	</xsl:template>
	<xsl:template name="OffersValid">
		<OffersValid>
			<start_date>
				<xsl:choose>
					<xsl:when test="ExpressLane/StoreCircularSummary">
						<xsl:value-of select="ExpressLane/StoreCircularSummary/StartDateString"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ExpressLane/OffersValid/OfferRange/StartDate"/>
					</xsl:otherwise>
				</xsl:choose>
			</start_date>
			<end_date>
				<xsl:choose>
					<xsl:when test="ExpressLane/StoreCircularSummary">
						<xsl:value-of select="ExpressLane/StoreCircularSummary/EndDateString"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ExpressLane/OffersValid/OfferRange/EndDate"/>
					</xsl:otherwise>
				</xsl:choose>
			</end_date>
		</OffersValid>
	</xsl:template>
</xsl:stylesheet>