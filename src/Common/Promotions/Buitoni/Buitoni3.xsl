<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<style>
    		@import url(##root##/Assets/Common/Promotions/Buitoni/styles/style3.css);
    	</style>
		<div id="Container">
			<div class="Header">
				<div class="Logo">
					<img class="Logo" alt="">
						<xsl:attribute name="src">##root##/Assets/Common/Promotions/Buitoni/images/logo2.jpg</xsl:attribute>
					</img>
				</div>
				<div class="verbiage"/>
			</div>
			<div id="Main">
				<div class="PromoHeader">
					<p>Products shown may not be available in all stores.</p>
				</div>
				<xsl:for-each select="//Category">
					<div class="Category">
						<div class="CategoryImage">
							<h2 class="CategoryHeading">
								<xsl:value-of select="Name"/>
							</h2>
							<img height="193" width="230">
								<xsl:attribute name="src">##root##/Assets/Common/Promotions/Buitoni/images/<xsl:value-of select="image"/></xsl:attribute>
							</img>
						</div>
						<div class="ProductList">
							<table class="ProductList">
								<xsl:for-each select="SubCategory/Product">
									<tr>
										<td valign="bottom">
											<a class="ListAdd">
												<xsl:attribute name="href">
															javascript:clickThru('%c','12787','Buitoni','<xsl:value-of select="." disable-output-escaping="yes"/>','24842','1','','','','','','<xsl:value-of select="concat('206299739',ancestor::Category/id,position())"/>');
														</xsl:attribute>
											</a>
										</td>
										<td valign="top" class="botborder">
											<span class="ProductName">
												<xsl:value-of select="."/>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</table>
						</div>
					</div>
				</xsl:for-each>
			</div>
			<div class="PromoFooter">
				<p>** products with &gt; 0.5g Sodium/Serving</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
