<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:key name="CatID" match="ExpressLane/GenericShoppingList/VisibleItems/GenericShoppingListItem" use="CategoryID"/>
	<xsl:key name="PlanID" match="ExpressLane/GenericShoppingList/VisibleItems/GenericShoppingListItem" use="PlanogramPositionID"/>
	<xsl:key name="ChildPositions" match="ExpressLane/GenericShoppingList/PlanogramPositions/PlanogramPosition" use="ParentPlanogramPositionID"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="StoreID" select="ExpressLane/PrintList/GenericShoppingList/StoreID"/>
		<style type="text/css" media="print,screen">html,body		{background-color:#FFFFFF; background-image:none; font: 9pt Arial, Helvetica, sans-serif}
			.row1 			{background-color:#EEEEEE;}
			.row0 			{background-color:#FFFFFF;}
			THEAD			{display: table-header-group }
			TBODY			{display: table-row-group }
			ul				{text-align:left; list-style:none; margin:0 0 6px 5px; padding:0 0 0 0.25em;}
			li				{clear:both; text-indent:-0.25em; font-size:9pt}
			#categoryname	{font-size: 10pt; clear:both; width:100%; border-bottom:1px solid #CCCCCC; margin-bottom: 10px; margin-top: 20px; padding-top: 10px; font-family: 'arial black'}
			#column			{display:inline; width:100%; float:left; margin-left:2%; margin-top:0; }
			#littlebox		{width:12px; float:left; height:12px; margin:0 4px 0 0; border:1px solid black;}
			#couponicon		{width:14px; float:left; height:14px; margin:0 4px 10px 0; }
			#listcontent	{width:85%; float:left; margin:0 6px 10px 0;}
			#lightwindow, #lightwindow_overlay	{display:none}
			#container,
			#container-outer {background:none;left:0;margin:0;padding:0;text-align:left;width:100%;}
            th 			{background-color:black;color:white;}
			#footer-outer, .footer-bottom {display:none;}
			#child {margin-left: 20px; margin-top: 5px; margin-bottom: 11.5px;}
			#products {margin-left: 40px;}
			.header			{margin-bottom: -20px;}
			</style>
		
		<script type="text/javascript" src="http://cdn.gsngrocers.com/script/expresslane/gcprinter.js?nocache=11"></script>

		<xsl:if test="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem[ItemTypeID!=10 and IsVisible='true']">

			<table width="100%" border="0" class="header">
			<tbody>
				<tr>
					<td vAlign="bottom">
						<img id="logo">
							<xsl:attribute name="src">
								<xsl:value-of select="ExpressLane/GenericChain/DomainName"/>/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/printlogo.gif</xsl:attribute>
						</img>
					</td>
					<td align="left" valign="bottom" style="font-weight: normal; font-size: 9px; font-family: verdana;">
						<p>Items on the list are sorted by aisle number; then from front to back of store within each aisle.</p>
						<p>
							<b>
								<xsl:text>Ad Prices Valid </xsl:text>
								<xsl:if test="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem/PriceStartDate">
									<xsl:variable name="sdate" select="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem/PriceStartDate"/>
									<xsl:variable name="edate" select="ExpressLane/GenericShoppingList/Items/GenericShoppingListItem/PriceEndDate"/>
									<xsl:text>from&#xA0;</xsl:text>
									<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
									<xsl:text>&#xA0;through&#xA0;</xsl:text>
									<xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
								</xsl:if>
								<xsl:text>&#xA0;at:</xsl:text>
							</b>
							<br/>
							<xsl:value-of select="concat(ExpressLane/GenericStore/PrimaryAddress, ' ')"/>
							<xsl:value-of select="ExpressLane/GenericStore/City"/>
							<xsl:text>, </xsl:text>
							<xsl:value-of select="concat(ExpressLane/GenericStore/State, ' ')"/>
							<xsl:value-of select="ExpressLane/GenericStore/PostalCode"/>
							<xsl:text> location only</xsl:text>
						</p>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colSpan="3" vAlign="bottom" height="12">
						<img height="2" src="/Assets/Common/Images/black_pixel.gif" width="100%"/>
					</td>
				</tr>
			</tbody>
		</table>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:if test="Image != ''">
					<div id="PromoImage" style="margin:1em; width:100%;">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="Image" disable-output-escaping="yes"/>
							</xsl:attribute>
						</img>
					</div>
				</xsl:if>
				<xsl:if test="Description != ''">
					<div id="PromoText" style="margin:1em; width:100%;">
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
					</div>
				</xsl:if>
			</xsl:for-each>

			<div id="column">
				<!--With planogram-->
				<xsl:for-each select="//GenericShoppingList/PlanogramPositions/PlanogramPosition">
					<xsl:sort select="SortOrder" data-type="number"/>
					<xsl:variable name="planogram" select="ParentPlanogramPositionID" />					
					<xsl:if test="string-length($planogram) &lt; 1 or $planogram=0">
						<div id="categoryname">
							<xsl:value-of select="PlanogramPositionName"/>
						</div>
						<xsl:call-template name="PlanogramPositionByParent">
							<xsl:with-param name="ParentID" select="PlanogramPositionID"/>
							<xsl:with-param name="ParentName" select="PlanogramPositionName"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:for-each>
				<!--No planogram-->
				<xsl:if test="count(//GenericShoppingList/VisibleItems/GenericShoppingListItem[string-length(PlanogramPositionID) = 0 and IsVisible='true']) > 0">
					<div id="categoryname">
						<xsl:text>Miscellaneous Grocery</xsl:text>
					</div>
					<div id="child">
						<b><xsl:text>General Grocery Items</xsl:text></b>
					</div>
					<xsl:for-each select="//GenericShoppingList/Categories/Category">
						<xsl:sort select="CategoryName"/>
						<xsl:call-template name="PlanogramPositionNilled">
							<xsl:with-param name="ShoppingListCatID" select="CategoryID"/>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:if>
			</div>
			<div class="clear" style="width:100%; height:20px;">&#xA0;</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="PlanogramPositionNilled" match="ExpressLane/GenericShoppingList/PlanogramPositions/PlanogramPosition[string-length(ParentPlanogramPositionID) &lt; 1 or ParentPlanogramPositionID=0]">
		<xsl:param name="ShoppingListCatID"/>
		
		<xsl:if test="count(//GenericShoppingList/VisibleItems/GenericShoppingListItem[string-length(PlanogramPositionID) = 0 and CategoryID = $ShoppingListCatID and IsVisible='true']) > 0">
			<div id="products">
				<xsl:call-template name="ShoppingListDetailNilled">
					<xsl:with-param name="ShoppingListCatID" select="$ShoppingListCatID"/>
				</xsl:call-template>
			</div>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="PlanogramPositionByParent" match="ExpressLane/GenericShoppingList/PlanogramPositions">
		<xsl:param name="ParentID"/>
		<xsl:param name="ParentName"/>
    <xsl:if test="../PlanogramPosition/ParentPlanogramPositionID/@xsi:nil='true'">
      <div id="products">
        <xsl:call-template name="ShoppingListDetail">
          <xsl:with-param name="PlanNameID" select="PlanogramPositionID"/>
        </xsl:call-template>
      </div>
    </xsl:if>
 
		<xsl:for-each select="../PlanogramPosition[ParentPlanogramPositionID=$ParentID]">
         <xsl:sort select="SortOrder" data-type="number"/>
      <xsl:variable name="planogram" select="PlanogramPositionID" />
      <xsl:variable name="counted" select="count(//GenericShoppingList/VisibleItems/GenericShoppingListItem[PlanogramPositionID = $planogram and IsVisible='true'])" />
      <xsl:if test="$counted > 0">
        <div style="display: inline-block;width: 100%;">
          <div id="child">
            <b>
              <xsl:value-of select="PlanogramPositionName"/>
            </b>
          </div>

        </div>
        <div id="products">
          <xsl:call-template name="ShoppingListDetail">
            <xsl:with-param name="PlanNameID" select="PlanogramPositionID"/>
          </xsl:call-template>
        </div>
      </xsl:if>
    </xsl:for-each>
		<!--
		<xsl:if test="key('PlanID',  $ParentID)">
			<xsl:if test="key('ChildPositions', $ParentID)">
				<div>
					<b>
					<xsl:value-of select="$ParentName"/>
					<xsl:text> - Aisle Info Unavaliable</xsl:text>
					</b>
				</div>
			</xsl:if>				
			<xsl:call-template name="ShoppingListDetail">
				<xsl:with-param name="PlanNameID" select="$ParentID"/>
				<xsl:with-param name="ShoppingListCatID" select="$ShoppingListCatID"/>
			</xsl:call-template>
		</xsl:if>
		-->
	</xsl:template>
	
	<xsl:template name="ShoppingListDetail" match="ExpressLane/GenericShoppingList/VisibleItems/GenericShoppingListItem">
		<xsl:param name="PlanNameID"/>
		<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<ul>
			<xsl:for-each select="key('PlanID',  $PlanNameID)">
				<xsl:sort select="Description"/>
				<xsl:if test="IsVisible='true'">
				<li>
					<div id="littlebox"/>
					<div id="couponicon">
						<xsl:choose>
							<xsl:when test="ItemTypeID='2'">
								<img height="14" src="{concat(//GenericChain/DomainName,'/Assets/Common/Images/manufacturercouponicon.gif')}"/>
							</xsl:when>
							<xsl:when test="ItemTypeID='10'">
								<img height="14">
									<xsl:attribute name="src">
										<xsl:choose>
											<xsl:when test="string-length(//ChainSettings/Setting[Name = 'StoreCouponIcon']/Value) &gt; 0">
												<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponIcon']/Value"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>##root##/Assets/Common/Images/store_coupons.gif</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div id="listcontent" style="text-transform:capitalize;">
						<xsl:value-of select="Quantity"/>
						<xsl:if test="number(Weight)">
							<xsl:variable name="Weight" select="number(Weight)"/>- <xsl:value-of select="VariableWeight/GenericFraction[StoredValue = $Weight]/DisplayValue"/>
							<xsl:choose>
								<xsl:when test="string-length(PriceUnit) &gt; 0">
									<xsl:value-of select="concat(' ', PriceUnit)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="' lbs.'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>:&#xA0;
						<xsl:value-of select="translate(Description,$upper,$lower)" disable-output-escaping="yes"/>
							<xsl:choose>
								<xsl:when test="Price&gt;0">,&#xA0;
									<xsl:if test="PriceMultiple&gt;1">
										<xsl:value-of select="PriceMultiple"/>/</xsl:if>$<xsl:value-of select="format-number(Price, '#.00')"/>
								</xsl:when>
								<xsl:when test="string-length(PriceString)&gt;1">,&#xA0;
									<xsl:value-of select="PriceString"/>
								</xsl:when>
							</xsl:choose>
						<xsl:choose>
							<xsl:when test="Comment != ''">
								<br/>
								<span class="ShoppingListComment">
									<xsl:value-of select="Comment"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="ShoppingListComment">
									<xsl:with-param name="ItemID" select="ItemID"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</li>
				</xsl:if>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="ShoppingListDetailNilled" match="ExpressLane/GenericShoppingList/VisibleItems/GenericShoppingListItem">
		<xsl:param name="ShoppingListCatID"/>
		<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<ul>
			<xsl:for-each select="key('CatID',  $ShoppingListCatID)">
				<xsl:sort select="Description"/>
				<xsl:if test="string-length(PlanogramPositionID) = 0 and IsVisible='true'">
				<li>
					<div id="littlebox"/>
					<div id="couponicon">
						<xsl:choose>
							<xsl:when test="ItemTypeID='2'">
								<img height="14" src="{concat(//GenericChain/DomainName,'/Assets/Common/Images/manufacturercouponicon.gif')}"/>
							</xsl:when>
							<xsl:when test="ItemTypeID='10'">
								<img height="14">
									<xsl:attribute name="src">
										<xsl:choose>
											<xsl:when test="string-length(//ChainSettings/Setting[Name = 'StoreCouponIcon']/Value) &gt; 0">
												<xsl:value-of select="//ChainSettings/Setting[Name='StoreCouponIcon']/Value"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>##root##/Assets/Common/Images/store_coupons.gif</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div id="listcontent" style="text-transform:capitalize;">
						<xsl:value-of select="Quantity"/>
						<xsl:if test="number(Weight)">
							<xsl:variable name="Weight" select="number(Weight)"/>- <xsl:value-of select="VariableWeight/GenericFraction[StoredValue = $Weight]/DisplayValue"/>
							<xsl:choose>
								<xsl:when test="string-length(PriceUnit) &gt; 0">
									<xsl:value-of select="concat(' ', PriceUnit)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="' lbs.'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>:&#xA0;
						<xsl:value-of select="translate(Description,$upper,$lower)" disable-output-escaping="yes"/>
							<xsl:choose>
								<xsl:when test="Price&gt;0">,&#xA0;
									<xsl:if test="PriceMultiple&gt;1">
										<xsl:value-of select="PriceMultiple"/>/</xsl:if>$<xsl:value-of select="format-number(Price, '#.00')"/>
								</xsl:when>
								<xsl:when test="string-length(PriceString)&gt;1">,&#xA0;
									<xsl:value-of select="PriceString"/>
								</xsl:when>
							</xsl:choose>
						<xsl:choose>
							<xsl:when test="Comment != ''">
								<br/>
								<span class="ShoppingListComment">
									<xsl:value-of select="Comment"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="ShoppingListComment">
									<xsl:with-param name="ItemID" select="ItemID"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</li>
			</xsl:if>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="ShoppingListComment" match="GenericShoppingListItem">
		<xsl:param name="ItemID"/>
		<xsl:if test="//ProductComments/ConsumerProductComment[ProductID = $ItemID]">
			<br/>
			<span class="ShoppingListComment">
				<strong>Comment:</strong>
				<xsl:value-of select="//ProductComments/ConsumerProductComment[ProductID = $ItemID]/Comment"/>
			</span>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>