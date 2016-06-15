<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/" name="Tabs">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="IsOGS">
			<xsl:choose>
				<xsl:when test="//GenericConsumer/ConsumerSettings/Setting[Name='DisplayOGSInterface']/Value = 1">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="StoreName" select="translate(//GenericStore/StoreName,' ','-')"/>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
			<!-- this is used to set the active tab -->
			<xsl:choose>
				<!-- recipe pages use the same tab. Videos has it's own tab but is a recipe page which is why it is tested first -->
				<xsl:when test="contains($AbsolutePath, '/recipes/recipevideos.gsn')">
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:when>
				<xsl:when test="contains($AbsolutePath, '/recipes/')">
					<xsl:value-of select="'/recipes/recipecenter.gsn'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$AbsolutePath"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="currentUrlIndex">
			<!-- this is used to determine the active tab index and put in a variable -->
			<xsl:for-each select="//tabs/tab">
				<xsl:variable name="tabPathIndex" select="translate(url, $ucletters, $lcletters)"/>
				<xsl:if test="contains($tabPathIndex, $aTabPath)">
					<xsl:value-of select="position()"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<div id="secondary-navigation" class="group" role="navigation">
			
			<ul class="group">
				<xsl:for-each select="//tabs/tab">
					<xsl:variable name="tabPath" select="translate(url, $ucletters, $lcletters)"/>
					<xsl:choose>
						<xsl:when test="url = 0">
							<!-- an empty tab space -->
							<li class="blank" id="{concat('secondary-nav-tab', position())}">
								<xsl:value-of select="text" disable-output-escaping="yes"/>
							</li>
						</xsl:when>
						<xsl:when test="($IsOGS != 'true') and (type = 'OGSonly')">
							<!-- Skip OGSonly Tab for nonOGS stores -->
						</xsl:when>
						<xsl:when test="contains($aTabPath, $tabPath)">
							<li class="current" id="{concat('secondary-nav-tab', position())}">
								<a href="{concat('##root##','/',$StoreName,url)}">
									<xsl:value-of select="text" disable-output-escaping="yes"/>
								</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="urlIndex" select="position() - 1"/>
							<li id="{concat('secondary-nav-tab', position())}">
								<xsl:if test="$urlIndex = $currentUrlIndex">
									<xsl:attribute name="class">tabNoBkg</xsl:attribute>
								</xsl:if>
								<span>
									<a href="{concat('##root##','/',$StoreName,url)}">
										<xsl:value-of select="text" disable-output-escaping="yes"/>
									</a>
								</span>
							</li>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
</xsl:stylesheet>
