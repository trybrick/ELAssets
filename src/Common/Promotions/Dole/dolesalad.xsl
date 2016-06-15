<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<style>
    		@import url(##root##/Assets/Common/Promotions/Dole/styles/style.css);
    	</style>
		<div id="Container">
			<div class="Logo"/>
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
							<img>
								<xsl:attribute name="src">##root##/Assets/Common/Promotions/Dole/images/<xsl:value-of select="image"/></xsl:attribute>
							</img>
							<table class="ProductList">
								<tr>
									<td valign="bottom" width="53">
										<a class="ListAdd">
											<xsl:attribute name="href">
															javascript:clickThru('%c','10347','Dole','<xsl:value-of select="Name" disable-output-escaping="yes"/>','24842','1','','','','','','<xsl:value-of select="concat('206299739',ancestor::Category/id,position())"/>');
														</xsl:attribute>
										</a>
									</td>
									<td valign="top" class="botborder">
										<span class="ProductName">
											<xsl:value-of select="Name"/>
										</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>