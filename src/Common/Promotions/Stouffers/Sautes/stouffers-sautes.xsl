<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<!--========================================================================================== -->

	<xsl:template match="/">		
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script>
		function changeSrc(newSrc) {
			$('doubleClick').src=newSrc;
		}
		</script>
		<style>
			@import url(<xsl:value-of select="//CSS" />);
		</style>
		<div id="promoLP-wrap">
			<div id="promoLP-header">
					<img border="0" src="{concat(//ImagePath,//HeaderImage)}" alt="{//HeaderImage/@alt}" />
				<xsl:if test="string-length(//PageDescriptionText) &gt; 0">
					<h2><xsl:value-of select="//PageDescriptionText"/></h2>
				</xsl:if>
			</div>
			<div id="promoLP-main">
				<xsl:for-each select="//ProductGroup">
					<xsl:call-template name="ProductGroupDetail" />
				</xsl:for-each>
			</div>
			<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"></iframe>
			
			<!-- begin ad tag-->
			
			
			<script language="JavaScript" type="text/javascript">
			<![CDATA[ 
			if (typeof ord=='undefined') {ord=Math.random()*10000000000000000;}
			document.write('<script language="JavaScript" src="http://ad.doubleclick.net/adj/6394.test/;kw=stoufferslandingpage2012;sz=1x1;ord=' + ord + '?" type="text/javascript"><\/script>');]]>
			</script>
			<noscript>
			 
				<a href="http://ad.doubleclick.net/jump/6394.test/;kw=stoufferslandingpage2012;sz=1x1;ord=123456789?" target="_blank">
					<img src="http://ad.doubleclick.net/ad/6394.test/;kw=stoufferslandingpage2012;sz=1x1;ord=123456789?" width="1" height="1" border="0" alt=""/>
				</a>
			</noscript>
			
			<!-- End ad tag --> 
		</div>
	</xsl:template>
	
<!--========================================================================================== -->

	<xsl:template name="ProductGroupDetail" match="ProductGroup">
		<div id="{concat('promoLP-product-wrap',position())}" class="promoLP-product">
			<div class="promoLP-product-main">
				<xsl:for-each select="Product">
					<xsl:call-template name="ProductDetail" />
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

<!--========================================================================================== -->

	<xsl:template name="ProductDetail" match="Product">
		<xsl:param name="AdID" select="concat(//ManufacturerCode,ProductCode,position(),'1')" />
		<xsl:param name="CreativeID" select="concat(//ManufacturerCode,ProductCode,position(),'2')" />
		<div class="promoLP-product-listing">
			<img src="{concat(//ImagePath,Image)}">
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"/>
				</xsl:attribute>
			</img>
			<p><xsl:value-of select="Title" /></p>
			<em><xsl:value-of select="Description" /></em>		
			<a class="promoLP-button" title="Add Item to List" src="#null">
				<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode" />'); clickThru('%c',<xsl:value-of select="//DepartmentID" />,'<xsl:value-of select="Brand" />','<xsl:value-of select="Title" />', '<xsl:value-of select="//ManufacturerCode" />', 1, '','','','','', <xsl:value-of select="$AdID" />, <xsl:value-of select="$CreativeID" />);</xsl:attribute>
				<xsl:text>Add</xsl:text>
			</a>
		</div>
		
	</xsl:template>
	
</xsl:stylesheet>