<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="idealtabs">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
			<xsl:choose>
				<xsl:when test="contains($AbsolutePath, '/recipes/recipevideos.aspx')">
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.aspx'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div id="secondary-navigation" class="clearfix">
			<div class="pageHeaderContainer">
				<xsl:if test="$AbsolutePath = '/shop/product.aspx'">
					<span class="pageHeader">Shop by Department</span>
					<span class="pageSubHeader">Build your shopping list from the whole store.</span>
				</xsl:if>
				<xsl:if test="$AbsolutePath = '/shop/specials.aspx'">
					<span class="pageHeader">Items on Sale</span>
					<span class="pageSubHeader">In-store sales for this week.</span>
				</xsl:if>
				<xsl:if test="$AbsolutePath = '/shop/mypantry.aspx'">
					<span class="pageHeader">Things I Buy</span>
					<span class="pageSubHeader">View history of items added to your list.</span>
				</xsl:if>
				<xsl:if test="$AbsolutePath = '/default.aspx'">
					<h2 class="pageHeader">
						<xsl:text>Online shopping made easy!</xsl:text>
						<span>
							<xsl:text>Click on a category below to start.</xsl:text>
						</span>
					</h2>
				</xsl:if>
			</div>
			<ul>
				<xsl:for-each select="ExpressLane/Departments/tabs/tab">
					<xsl:variable name="tabPath">
						<xsl:value-of select="translate(url, $ucletters, $lcletters)"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$aTabPath = $tabPath">
							<li>
								<xsl:attribute name="id">
									<xsl:text>current</xsl:text>
								</xsl:attribute>
								<a style="text-align:center">
									<xsl:attribute name="href">
										<xsl:value-of select="url"/>
									</xsl:attribute>
									<xsl:value-of select="text" disable-output-escaping="yes"/>
								</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="url = 0">
									<li>
										<xsl:attribute name="id">
											<xsl:text>blank</xsl:text>
										</xsl:attribute>
										<xsl:value-of select="text" disable-output-escaping="yes"/>
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li>
										<span>
											<a style="text-align:center">
												<xsl:attribute name="href">
													<xsl:value-of select="url"/>
												</xsl:attribute>
												<xsl:value-of select="text" disable-output-escaping="yes"/>
											</a>
										</span>
									</li>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="AbsolutePath">
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->