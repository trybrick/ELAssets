<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	
	<!--========================================================================================== -->
	
	<xsl:template match="/" name="AdPodMaster">
		<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'9'"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template name="AdPod" match="ExternalAds">
		<xsl:param name="Tile"/>
		<xsl:param name="Request" select="AdPods/AdPod[Tile=$Tile]/Request"/>
		<xsl:param name="Zone" select="AdPods/AdPod[Tile=$Tile]/Zone"/>
		<xsl:param name="UnitName" select="AdPods/AdPod[Tile=$Tile]/UnitName"/>
		<xsl:param name="UnitNameRoot" select="AdPods/AdPod[Tile=$Tile]/UnitNameRoot"/>
		<xsl:param name="Departments" select="AdPods/AdPod[Tile=$Tile]/Departments"/>
		<xsl:param name="BrandName" select="AdPods/AdPod[Tile=$Tile]/BrandName"/>
		<xsl:param name="PageName" select="AdPods/AdPod[Tile=$Tile]/PageName"/>
		<xsl:variable name="sep" select='"&apos;,&apos;"'/>
		<xsl:variable name="apos" select='"&apos;"'/>
		<xsl:if test="$Request">
			<div id="brxLeaderboardSmall"></div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Categories.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Browse.js"/>
		<xsl:call-template name="PageHeading" />
		<div id="ThreePane">
			<div id="ListBoxes">
				<div id="Department" class="DepartmentAisleCategory">
					<h3>Department</h3>
					<select id="lstDepartments" class="CategoryList" size="4" onchange="UpdateAisles();"/>
				</div>
				<div id="InBetween1">&gt;</div>
				<div id="Aisles" class="DepartmentAisleCategory">
					<h3>Aisle</h3>
					<select id="lstAisles" class="CategoryList" size="4" onchange="UpdateCategories();"/>
				</div>
				<div id="InBetween2">&gt;</div>
				<div id="Category" class="DepartmentAisleCategory">
					<h3>Category</h3>
					<select id="lstCategory" class="CategoryList" size="4" onchange="UpdateGrid();"/>
				</div>
			</div>
			<div id="UpdateProgress1" style="display: none;">
				<div id="ProcessingPanel"><img alt="Wait" src="/Assets/Common/Images/Wait.gif"/>
				Processing...
			</div>
		</div>
		<div id="LineItem"/>
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div id="browseStaticContent" class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>		
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="PageHeading">
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='BrowsePageTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='BrowsePageTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>Browse the Aisles</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
		<xsl:variable name="CartOrList">
			<xsl:choose>
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageHeaderDescription" select="concat('Select a department to view and add items to your ', $CartOrList,'.')" />
		
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" />
			<span><xsl:value-of select="$PageHeaderDescription" /></span>
		</h2>

		<xsl:call-template name="AdPodMaster"></xsl:call-template>

	</xsl:template>	
</xsl:stylesheet>
