<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
  <xsl:template match="/">
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="//StoreCircular/Pages/StoreCircularPage">
				<div id="CircularAd">
					<script src="/Assets/Common/js/Circulars/Circulars.js" type="text/javascript"></script>
					<script src="/Assets/Common/Js/ToolTips/cas_tips.js" type="text/javascript"/>
					<script src="/Assets/Common/Js/Circulars/WeeklyAdMultipleCirculars.js" type="text/javascript"/>
					<xsl:if test="//StoreCircular/Pages/StoreCircularPage/Items/StoreCircularItem">
						<div id="CircularLists">
							<select id="ddlDepartment" onchange="javascript:DisplayCircularItemsByCategoryID();">
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
							<select id="ddlBrand" onchange="javascript:DisplayCircularItemsByBrand();">
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
							<xsl:if test="//ChainSettings/Setting[SettingID=14][Value!='true']">							
								<input id="txtSearch" type="text" value="Search Sale Items" onclick="this.value=''" onkeypress="if (event.keyCode==13) SearchByKeyWord(); return event.keyCode!=13;" />
								<a class="button" href="javascript:SearchByKeyWord();">
									<span>Go</span>
								</a>
							</xsl:if>
							<span>
								<a href="/Shop/WeeklyAdTextOnly.aspx">TEXT ONLY VERSION</a>
							</span>
						</div>
					</xsl:if>
					<div id="CircularAdGrid" class="group">
						<xsl:if test="//StoreCircular/Pages/StoreCircularPage">
								<div id="PageIndex" class="group">
									<xsl:for-each select="//StoreCircular/CircularTypes/StoreCircularType">
										<xsl:sort select="CircularTypeID" data-type="number"/>
										<xsl:call-template name="CircularTypePageList"/>
									</xsl:for-each>
								</div>
								<div id="PageDisplay" class="group" style="display:none;">
									<a class="backtoweeklyad" href="javascript:ShowPageList();">
										<xsl:text>Back to Page Listings</xsl:text>
									</a>
									<xsl:apply-templates select="//StoreCircular/CircularTypes">
										<xsl:with-param name="ID" select="'PagerTop'"/>
									</xsl:apply-templates>
									<div id="AdContent"></div>
									<a class="backtoweeklyad" href="javascript:ShowPageList();">
										<xsl:text>Back to Page Listings</xsl:text>
									</a>
									<xsl:apply-templates select="//StoreCircular/CircularTypes">
										<xsl:with-param name="ID" select="'PagerBottom'"/>
									</xsl:apply-templates>
								</div>
						</xsl:if>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<p>There are currently no circular pages available for this store</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
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
				<ul class="CircularPageMenu">
					<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage[CircularTypeID=$CircularTypeID]">
						<li>
							<xsl:attribute name="onmouseover">
								<xsl:value-of select="concat('doTipFromTag(this, &quot;CircularPageHover:', CircularPageID, '&quot;);')"/>
							</xsl:attribute>
							<a>
								<xsl:attribute name="href">
									<xsl:variable name="animationtype" select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value"/>
									<xsl:variable name="animationoptions" select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value"/>javascript:DisplayCircularAdPage('<xsl:value-of select="CircularPageID"/>',<xsl:choose><xsl:when test="string-length($animationtype) &gt; 0">'<xsl:value-of select="$animationtype"/>'</xsl:when><xsl:otherwise>''</xsl:otherwise></xsl:choose>,<xsl:choose><xsl:when test="string-length($animationoptions) &gt; 0"><xsl:value-of select="$animationoptions"/></xsl:when><xsl:otherwise>undefined</xsl:otherwise></xsl:choose>);</xsl:attribute>
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</a>
							<div style="display:none;">
								<span>
									<xsl:attribute name="id">
										<xsl:value-of select="concat('CircularPageHover:', CircularPageID)"/>
									</xsl:attribute>
									<div id="hoverAdPage" class="thumbNail">
										<div class="top">
											<h1>Click to view <xsl:value-of select="concat(' Page ', position())"/></h1>
										</div>
										<div class="middle">
											<img alt="">
												<xsl:attribute name="src">
													<xsl:value-of select="ImageUrl"/>
												</xsl:attribute>
											</img>
										</div>
										<div class="bottom"></div>
									</div>
								</span>
							</div>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
	</xsl:template>
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
						<xsl:value-of select="concat('if (this.className != &quot;activePage&quot;) doTipFromTag(this, &quot;CircularPageHover:', CircularPageID, '&quot;);')"/>
					</xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:variable name="animationtype" select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value"/>
						<xsl:variable name="animationoptions" select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value"/>DisplayCircularAdPage('<xsl:value-of select="CircularPageID"/>',<xsl:choose><xsl:when test="string-length($animationtype) &gt; 0">'<xsl:value-of select="$animationtype"/>'</xsl:when><xsl:otherwise>''</xsl:otherwise></xsl:choose>,<xsl:choose><xsl:when test="string-length($animationoptions) &gt; 0"><xsl:value-of select="$animationoptions"/></xsl:when><xsl:otherwise>undefined</xsl:otherwise></xsl:choose>);</xsl:attribute>
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