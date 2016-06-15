<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/WeeklyAd/WeeklyAdPageScaled.xsl" />
	<xsl:output method="html" />
  
	<xsl:template match="/">
    <xsl:choose>
			<xsl:when test="//StoreCircular/Pages/StoreCircularPage">
				<div id="CircularAd">
					<script src="/Assets/Common/js/Circulars/Circulars.js" type="text/javascript"></script>
					<script src="/Assets/Common/js/wz_tooltip.js" type="text/javascript"></script>
					<script src="/Assets/Common/Js/Circulars/WeeklyAdScaled.js" type="text/javascript" />
					<xsl:if test="//StoreCircular/Pages/StoreCircularPage/Items/StoreCircularItem">
						<div id="CircularLists">
							<select id="ddlScale" onchange="javascript:RefreshWeeklyAdPage();">
								<option value="1.0">100%</option>
								<option value="0.9">90%</option>
								<option value="0.8">80%</option>
								<option value="0.7">70%</option>
								<option value="0.6">60%</option>
								<option value="0.5">50%</option>
								<option value="0.4">40%</option>
								<option value="0.3">30%</option>
								<option value="0.2">20%</option>
								<option value="0.1">10%</option>
							</select>
							<select id="ddlDepartment" onchange="javascript:DisplayCircularItemsByCategoryID();">
								<option value="-1">- Shop By Department -</option>
								<xsl:for-each select="//StoreCircular/Categories/Category">
									<xsl:sort select="CategoryName" />
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="CategoryID" />
										</xsl:attribute>
										<xsl:value-of select="CategoryName" />
									</option>
								</xsl:for-each>
							</select>
							<select id="ddlBrand" onchange="javascript:DisplayCircularItemsByBrand();">
								<option value="-1">- Shop By Brand -</option>
								<xsl:for-each select="//StoreCircular/Brands/string">
									<xsl:sort select="node()" />
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="node()" />
										</xsl:attribute>
										<xsl:value-of select="node()" />
									</option>
								</xsl:for-each>
							</select>
							<input id="txtSearch" type="text" value="Search Sale Items" onclick="this.value=''" onkeypress="if (event.keyCode==13) SearchByKeyWord(); return event.keyCode!=13;" />
							<a class="button" href="javascript:SearchByKeyWord();">
								<span>Go</span>
							</a>
							<span>
								<a href="WeeklyAdTextOnly.aspx">TEXT ONLY VERSION</a>
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
											<xsl:attribute name="id">PageListTop<xsl:value-of select="CircularPageID" /></xsl:attribute>
											<xsl:attribute name="onclick">
												DisplayCircularAdPage('<xsl:value-of select="CircularPageID" />');
											</xsl:attribute>
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
									<xsl:apply-imports />
								</div>
								<ul id="CircularPagerBottom" style="display:block;visibility:visible;">
									<xsl:for-each select="//StoreCircular/Pages/StoreCircularPage">
										<xsl:sort select="PageNumber" data-type="number" />
										<li style="cursor:pointer;">
											<xsl:attribute name="id">PageListBottom<xsl:value-of select="CircularPageID" /></xsl:attribute>
											<xsl:attribute name="onclick">
												DisplayCircularAdPage('<xsl:value-of select="CircularPageID" />','<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 162]/Value" />', <xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID = 163]/Value" />);
											</xsl:attribute>
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