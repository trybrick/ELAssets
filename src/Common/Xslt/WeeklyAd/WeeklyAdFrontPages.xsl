<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:import href="WeeklyAdPage.xsl"/>
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
	
<!--========================================================================================== -->
	
	<xsl:template match="/">
		<xsl:param name="CircularTypes" select="//StoreCircular/CircularTypes/StoreCircularType[CircularTypeID = //StoreCircularPage/CircularTypeID]"/>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value" />		
	    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="ShowGlobalSearch">
			<xsl:choose>
				<xsl:when test="string-length(//ChainSettings/Setting[SettingID=14]/Value) &gt; 0">
        			<xsl:value-of select="translate(//ChainSettings/Setting[SettingID=14]/Value,$ucletters,$lcletters)" />
				</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="CartOrList">
			<xsl:choose>
         		<xsl:when test="$IsOGS = 'true'">cart</xsl:when>
         		<xsl:otherwise>list</xsl:otherwise>
     		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='WeeklyAdPageTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='WeeklyAdPageTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>Weekly Circular Items</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="PageHeaderDescription">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='WeeklyAdPageSubTitle']/Value) &gt; 0">
					<xsl:value-of select="//GenericChain/ChainSettings/Setting[Name='WeeklyAdPageSubTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="concat('Click on an item to add to your ',$CartOrList,'.')" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<h2 class="pageHeader">
			<xsl:value-of select="$PageHeaderText"/>
			<span><xsl:value-of select="$PageHeaderDescription"/></span>
		</h2>

		<xsl:call-template name="AdPodMaster"></xsl:call-template>
		
		<xsl:if test="count(//ArrayOfGenericStore/GenericStore) &gt; 1">
			<p class="validThruDates">Circular<xsl:if test="count($CircularTypes) &gt; 1">s</xsl:if> valid for <strong><xsl:value-of select="//StoreCircular/Store/StoreName" disable-output-escaping="yes"/></strong> location only.</p>
		</xsl:if>
		<span class="text-only-link">
			<xsl:if test="count(//StoreCircular/Pages/StoreCircularPage/Items/StoreCircularItem) &gt; 1">
			<a href="/Shop/WeeklyAdTextOnly.aspx">Text Only Version<br/>All Sale Items</a>
			</xsl:if>
		</span>
		<div id="doTipFromImageTemplate" style="display:none;visiblity:hidden;">
			<div id="hoverAdPage" class="thumbNail">
				<div class="top">
					<h1>#text#</h1>
				</div>
				<div class="middle">
					<img alt="" src="#imageUrl#?thumb"/>
				</div>
				<div class="bottom"/>
			</div>
		</div>
		<xsl:choose>
			<xsl:when test="count(//StoreCircular/Pages/StoreCircularPage) &gt; 0">
				<div id="CircularAd">
					<script src="/assets/common/js/Circulars/Circulars.js" type="text/javascript"/>
					<script src="/Assets/Common/Js/ToolTips/cas_tips.js" type="text/javascript"/>
					<script src="/assets/Common/Js/Circulars/WeeklyAdMultipleCirculars.js" type="text/javascript"/>
					<div id="CircularAdGrid">
						<xsl:if test="//StoreCircular/Pages/StoreCircularPage/Items/StoreCircularItem">
							<div id="CircularLists">
								<select id="ddlDepartment" onchange="DisplayCircularItemsByCategoryID();">
									<option value="-1">- Shop By Dept. -</option>
									<xsl:for-each select="//StoreCircular/Categories/Category">
										<xsl:sort select="CategoryName"/>
										<option>
											<xsl:attribute name="value">
												<xsl:value-of select="CategoryID"/>
											</xsl:attribute>
											<xsl:attribute name="exportkeyid">
												<xsl:value-of select="ExportKeyID"/>
											</xsl:attribute>
											<xsl:value-of select="CategoryName"/>
										</option>
									</xsl:for-each>
								</select>
								<span class="or">-or-</span>
								<select id="ddlBrand" onchange="DisplayCircularItemsByBrand();">
									<option value="-1">- Shop By Brand -</option>
									<xsl:choose>
										<xsl:when test="//StoreCircular/BrandList/Brand">
											<xsl:for-each select="//StoreCircular/BrandList/Brand">
												<xsl:sort select="BrandName"/>
												<option>
													<xsl:attribute name="value">
														<xsl:value-of select="BrandName"/>
													</xsl:attribute>
													<xsl:attribute name="exportkeyid">
														<xsl:value-of select="ExportKeyID"/>
													</xsl:attribute>
													<xsl:value-of select="BrandName"/>
												</option>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//StoreCircular/Brands/string">
												<xsl:sort select="node()"/>
												<option>
													<xsl:attribute name="value">
														<xsl:value-of select="node()"/>
													</xsl:attribute>
													<xsl:value-of select="node()"/>
												</option>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</select>
								<xsl:if test="$ShowGlobalSearch != 'true'">							
									<input id="txtSearch" type="text" value="Search Sale Items" onclick="this.value=''" onkeypress="if (event.keyCode==13) SearchByKeyWord(); return event.keyCode!=13;"/>
									<a class="button" href="javascript:SearchByKeyWord();">
										<span>Go</span>
									</a>
								</xsl:if>
							</div>
						</xsl:if>
						<xsl:if test="//StoreCircular/Pages/StoreCircularPage">
								<div id="PageIndex" class="group">
									<xsl:if test="count($CircularTypes) = 1">
										<xsl:attribute name="style">display:none;</xsl:attribute>
									</xsl:if>
									<xsl:for-each select="//StoreCircular/CircularTypes/StoreCircularType">
										<xsl:sort select="CircularTypeID" data-type="number"/>
										<xsl:call-template name="CircularTypePageList"/>
									</xsl:for-each>
								</div>
								<div id="PageDisplay" class="group">
									<xsl:if test="count($CircularTypes) &gt; 1">
										<xsl:attribute name="style">display:none;</xsl:attribute>
										<a><xsl:attribute name="class">backtoweeklyad</xsl:attribute><xsl:attribute name="href">javascript:ShowPageList();</xsl:attribute>Choose Another Ad</a>
									</xsl:if>
									<xsl:apply-templates select="//StoreCircular/CircularTypes">
										<xsl:with-param name="ID" select="'PagerTop'"/>
									</xsl:apply-templates>
									<div id="AdContent" class="group">
										<xsl:if test="count($CircularTypes) = 1">
											<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage[position() = 1]">
												<xsl:call-template name="PageDisplay"/>
											</xsl:for-each>
										</xsl:if>
									</div>
									<xsl:apply-templates select="//StoreCircular/CircularTypes">
										<xsl:with-param name="ID" select="'PagerBottom'"/>
									</xsl:apply-templates>
								</div>
						</xsl:if>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<p class="noPagesAvailable">There are currently no ad pages available for this store.</p>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
	
<!--========================================================================================== -->
	
	<xsl:template match="StoreCircularType" name="CircularTypePageList">
		<xsl:param name="CircularTypeID" select="CircularTypeID"/>
		<xsl:param name="Name" select="Name"/>
		<xsl:if test="//StoreCircular/Pages/StoreCircularPage[CircularTypeID=$CircularTypeID]">
			<div class="CircularTypeBox">
				<xsl:attribute name="id">
					<xsl:value-of select="concat('CircularType_', CircularTypeID)"/>
				</xsl:attribute>
				<h3>
					<xsl:value-of select="Name"/>
				</h3>
				<xsl:variable name="circularName" select="Name" />
				<ul class="CircularPageMenu">
					<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage[CircularTypeID=$CircularTypeID]">
						<xsl:if test="position() = 1">
							<li>
								<xsl:attribute name="onmouseover">
									<xsl:value-of select="concat('doTipFromImage(this, &quot;', ImageUrl, '&quot;,', '&quot;Click to view this ad&quot;);')"/>
								</xsl:attribute>
								<xsl:variable name="sdate" select="StartDate"/>
								<xsl:variable name="edate" select="EndDate"/>
								<small>Ad Prices Valid From<br /><xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/> - <xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/></small>
								<script>
                                        _gaq.push(['_trackEvent', 'Weekly Ad Types', 'Impression', '<xsl:value-of select='translate($circularName, "&apos;","’")'/>']);
								</script>
								<a>
									<xsl:variable name="animationtype">
										<xsl:choose>
											<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 162]/Value) &gt; 0">
												<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value" />
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="animationoptions">
										<xsl:choose>
											<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID = 163]/Value) &gt; 0">
												<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value" />
											</xsl:when>
											<xsl:otherwise>undefined</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:attribute name="href">#</xsl:attribute>
                                    <xsl:attribute name="onclick">DisplayCircularAdPage('<xsl:value-of select="CircularPageID"/>','<xsl:value-of select="$animationtype"/>','<xsl:value-of select="$animationoptions"/>');_gaq.push(['_trackEvent', 'Weekly Ad Types', 'Click', '<xsl:value-of select='translate($circularName, "&apos;","’")'/>']);return false;</xsl:attribute>
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="concat($Name, ' Page ', position())"/>
										</xsl:attribute>
										<xsl:attribute name="src">
											<xsl:value-of select="SmallImageUrl"/>
										</xsl:attribute>
									</img>
								</a>
							</li>
						</xsl:if>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
	</xsl:template>
	
<!--========================================================================================== -->
	
	<xsl:template match="StoreCircularType" name="PagerList">
		<xsl:param name="CircularTypeID" select="CircularTypeID"/>
		<xsl:param name="ID"/>
		<xsl:if test="//StoreCircular/Pages/StoreCircularPage[CircularTypeID=$CircularTypeID]">
			<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage[CircularTypeID=$CircularTypeID]">
				<xsl:sort select="PageNumber" data-type="number"/>
				<li style="cursor:pointer;">
					<xsl:attribute name="id">
						<xsl:value-of select="concat($ID, '_CircularPage:', CircularPageID, '_CircularType:', $CircularTypeID)"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="CircularPageID"/>
					</xsl:attribute>
					<xsl:attribute name="onmouseover">
						<xsl:value-of select="concat('if (this.className != &quot;activePage&quot;) doTipFromImage(this, &quot;', ImageUrl, '&quot;,', '&quot;Click to view this page&quot;);')"/>
					</xsl:attribute>
					<xsl:attribute name="onmouseout">UnTip();</xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:value-of select="concat('DisplayCircularAdPage(', CircularPageID, ');scroll(0,0);')"/>
            		</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:if test="position()=1">activePage</xsl:if>
					</xsl:attribute>
					<span>
						<xsl:value-of select="position()"/>
					</span>
				</li>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
<!--========================================================================================== -->
	
	<xsl:template name="Pager" match="CircularTypes">
		<xsl:param name="ID"/>
		<ul class="CircularPager">
			<xsl:attribute name="id">
				<xsl:value-of select="$ID"/>
			</xsl:attribute>
			<xsl:for-each select="StoreCircularType">
				<xsl:sort select="CircularTypeID" data-type="number"/>
				<xsl:call-template name="PagerList">
					<xsl:with-param name="ID" select="$ID"/>
				</xsl:call-template>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	
</xsl:stylesheet>
