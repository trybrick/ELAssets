<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="smallcase" select="'/.abcdefghijklmnopqrstuvwxyz'"></xsl:variable>
		<xsl:variable name="uppercase" select="'/.ABCDEFGHIJKLMNOPQRSTUVWXYZ'"></xsl:variable>
		<xsl:variable name="absolutePath" select="translate(/ExpressLane/Uri/AbsolutePath, $uppercase, $smallcase)"></xsl:variable>
		
		<xsl:if test="string-length(//GenericConsumer) &gt; 0">
			<!--<img style="display:none; visibility: hidden; width: 0px; height: 0px;">
				<xsl:attribute name="src">//i.simpli.fi/dpx?action=100&amp;segment=GSNUniversal&amp;cid=3249</xsl:attribute>
			</img>-->
			<img style="display:none; visibility: hidden; width: 0px; height: 0px;">
				<!--<xsl:attribute name="src">http://ib.adnxs.com/getuid?https://dataapi.gsn2.com/api/v1/partner/linkadnx/<xsl:value-of select="//SiteCatalyst/ConsumerId" />?adnxs_uid=$UID</xsl:attribute>-->
				<xsl:attribute name="src">http://ib.adnxs.com/getuid?https://dataapi.gsn2.com/api/v1/partner/linkadnx/<xsl:value-of select="//GenericConsumer/ConsumerID" />/<xsl:value-of select="//GenericChain/ChainID" />?adnxs_uid=$UID</xsl:attribute>
			</img>
			<!--
			<xsl:if test="contains($absolutePath, '/recipes/')">
				<img style="display:none; visibility: hidden; width: 0px; height: 0px;">
					<xsl:attribute name="src">//i.simpli.fi/dpx?action=100&amp;segment=GSNRecipe&amp;cid=3249</xsl:attribute>
				</img>
			</xsl:if>
      
      <xsl:if test="contains($absolutePath, '/recipes/recipecenter')">
        <img style="display:none; visibility: hidden; width: 0px; height: 0px;">
          <xsl:attribute name="src">//insight.adsrvr.org/track/evnt/?adv=mnsh080&amp;ct=0:4ipxnwo9&amp;fmt=3</xsl:attribute>
        </img>
			</xsl:if>
			
			<xsl:if test="contains($absolutePath, '/shop/weeklyad')">
				<img style="display:none; visibility: hidden; width: 0px; height: 0px;">
					<xsl:attribute name="src">//i.simpli.fi/dpx?action=100&amp;segment=GSNCircular&amp;cid=3249</xsl:attribute>
				</img>
			</xsl:if>
			
			<xsl:if test="contains($absolutePath, '/shop/coupons')">
				<img style="display:none; visibility: hidden; width: 0px; height: 0px;">
					<xsl:attribute name="src">//i.simpli.fi/dpx?action=100&amp;segment=GSNCoupon&amp;cid=3249</xsl:attribute>
				</img>
			</xsl:if>-->
		</xsl:if>

		<script type="text/javascript">	
			//shopper welcome - start
			var chainId = <xsl:value-of select="//GenericChain/ChainID" />;
		</script>

		<script src="/Assets/Common/js/ShoppingList/ShoppingListPage.js" type="text/javascript"></script>
		<script src="//cdn.gsngrocers.com/script/sw2/1.1.0/sw2-expresslane.min.js" type="text/javascript"></script>
	</xsl:template>
</xsl:stylesheet>