<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="Tabs">
		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="AbsolutePath" select="translate(//Uri/AbsolutePath, $ucletters, $lcletters)"/>
		<xsl:variable name="aTabPath">
		<!-- this is used to set the active tab -->
			<xsl:choose>
				<!-- recipe pages use the same tab. Videos has it's own tab but is a recipe page which is why it is tested first -->
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
		<div id="secondary-navigation" class="group" role="navigation">
			<ul class="group">
				<xsl:for-each select="//tabs/tab">
					<xsl:variable name="tabPath" select="translate(url, $ucletters, $lcletters)"></xsl:variable>
					<xsl:choose>
						<xsl:when test="contains($tabPath, $aTabPath)">
							<li id="current">
								<a href="{url}">
									<xsl:value-of select="text" disable-output-escaping="yes"/>
								</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="url = 0">
									<!-- an empty tab space -->
									<li id="blank">
										<xsl:value-of select="text" disable-output-escaping="yes"/>
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li>
										<span>
											<a href="{url}">
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
</xsl:stylesheet>