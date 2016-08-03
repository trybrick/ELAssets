<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/WeeklyAd/WeeklyAdPage.xsl" />
	<xsl:output method="html" />
  
	<xsl:template match="/">
   		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="count(//StoreCircular/Pages/StoreCircularPage) > 0">
				<div id="CircularAd">
					<script src="/Assets/Common/js/Circulars/Circulars.js" type="text/javascript"></script>
					<script src="/Assets/Common/Js/ToolTips/cas_tips.js" type="text/javascript" />
					<script src="/Assets/Common/Js/Circulars/WeeklyAd.js" type="text/javascript" />
					<xsl:if test="//StoreCircular/Pages/StoreCircularPage/Items/StoreCircularItem">
						<div id="CircularLists">
							<select id="ddlDepartment" onchange="DisplayCircularItemsByCategoryID();">
								<option value="-1">- Shop By Dept. -</option>
								<xsl:for-each select="//StoreCircular/Categories/Category">
									<xsl:sort select="CategoryName" />
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="CategoryID" />
										</xsl:attribute>
										<xsl:attribute name="exportkeyid">
											<xsl:value-of select="ExportKeyID" />
										</xsl:attribute>
										<xsl:value-of select="CategoryName" />
									</option>
								</xsl:for-each>
							</select>
							<span class="or">-or-</span>
							<select id="ddlBrand" onchange="DisplayCircularItemsByBrand();">
								<option value="-1">- Shop By Brand -</option>
								<xsl:choose>
									<xsl:when test="//StoreCircular/BrandList/Brand">
										<xsl:for-each select="//StoreCircular/BrandList/Brand">
											<xsl:sort select="BrandName" />
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="BrandName" />
												</xsl:attribute>
												<xsl:attribute name="exportkeyid">
													<xsl:value-of select="ExportKeyID" />
												</xsl:attribute>
												<xsl:value-of select="BrandName" />
											</option>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="//StoreCircular/Brands/string">
											<xsl:sort select="node()" />
											<option>
												<xsl:attribute name="value">
													<xsl:value-of select="node()" />
												</xsl:attribute>
												<xsl:value-of select="node()" />
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
					<div id="CircularAdGrid">
						<xsl:if test="//StoreCircular/Pages/StoreCircularPage">
							<div>
								<ul id="CircularPagerTop" style="display:block;visibility:visible;">
									<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
										<xsl:sort select="PageNumber" data-type="number" />
										<li style="cursor:pointer">
											<xsl:attribute name="onmouseover">
											<xsl:value-of select="concat('if (this.className != &quot;activePage&quot;) doTipFromTag(this, &quot;CircularPageHover:', CircularPageID, '&quot;);')" />
											</xsl:attribute>
											<xsl:attribute name="id">PageListTop<xsl:value-of select="CircularPageID" /></xsl:attribute>
											<xsl:attribute name="onclick">
												<xsl:variable name="animationtype" select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value" />
												<xsl:variable name="animationoptions" select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value" />DisplayCircularAdPage('<xsl:value-of select="CircularPageID" />',<xsl:choose><xsl:when test="string-length($animationtype) > 0">'<xsl:value-of select="$animationtype" />'</xsl:when><xsl:otherwise>''</xsl:otherwise></xsl:choose>,<xsl:choose><xsl:when test="string-length($animationoptions) > 0"><xsl:value-of select="$animationoptions" /></xsl:when><xsl:otherwise>undefined</xsl:otherwise></xsl:choose>);</xsl:attribute>
											<xsl:attribute name="class">
												<xsl:if test="position()=1">activePage</xsl:if>
											</xsl:attribute>
											<span>
												<xsl:value-of select="position()" />
											</span>
										</li>
									</xsl:for-each>
								</ul>
								<div id="AdContent">
									<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage[position() = 1]">
										<xsl:call-template name="PageDisplay" />
									</xsl:for-each>
								</div>
								<ul id="CircularPagerBottom" style="display:block;visibility:visible;">
									<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
										<xsl:sort select="PageNumber" data-type="number" />
										<li style="cursor:pointer;">
											<xsl:attribute name="onmouseover">
													<xsl:value-of select="concat('if (this.className != &quot;activePage&quot;) doTipFromTag(this, &quot;CircularPageHover:', CircularPageID, '&quot;);')" />
											</xsl:attribute>
											<xsl:attribute name="id">PageListBottom<xsl:value-of select="CircularPageID" /></xsl:attribute>
											<xsl:attribute name="onclick">
												<xsl:variable name="animationtype" select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value" />
												<xsl:variable name="animationoptions" select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value" />DisplayCircularAdPage('<xsl:value-of select="CircularPageID" />',<xsl:choose><xsl:when test="string-length($animationtype) > 0">'<xsl:value-of select="$animationtype" />'</xsl:when><xsl:otherwise>''</xsl:otherwise></xsl:choose>,<xsl:choose><xsl:when test="string-length($animationoptions) > 0"><xsl:value-of select="$animationoptions" /></xsl:when><xsl:otherwise>undefined</xsl:otherwise></xsl:choose>);</xsl:attribute>
											<xsl:attribute name="class">
												<xsl:if test="position()=1">activePage</xsl:if>
											</xsl:attribute>
											<span>
												<xsl:value-of select="position()" />
											</span>
										</li>
									</xsl:for-each>
								</ul>
							</div>
							<div style="display:none;">
								<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
									<span>
										<xsl:attribute name="id">
											<xsl:value-of select="concat('CircularPageHover:', CircularPageID)" />
										</xsl:attribute>
										<div id="hoverAdPage" class="thumbNail">
											<div class="top">
												<h1>
													Click to view
												</h1>
												
											</div>
												<div class="middle">
													<img alt="">
														<xsl:attribute name="src">
															<xsl:value-of select="ImageUrl" />
														</xsl:attribute>
													</img>
												</div>
											<div class="bottom"> </div>
										</div>
									</span>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<p>There are currently no circular pages available for this store.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>    