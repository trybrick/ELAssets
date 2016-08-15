<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				<![CDATA[
				var pages = ]]><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[last()]/SortBy" /><![CDATA[;
				function elemOn(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "block";
				}
				function elemOff(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "none";
				}
				function hideAll(){
					for( var i = 1; i <= pages; i++ )
						elemOff( 'div'+i );
				}
				function showAll(){
					for( var i = 1; i <= pages; i++ )
						elemOn( 'div'+i );
				}
				function showOne(elem_id){
					hideAll( );
					elemOn( elem_id );
				}

				]]>
			</xsl:comment>
		</script>
		<div id="Bakery" class="departmentPage">
			<!-- <h3 class="pageHeading">Bakery</h3> -->
			<div class="leftnav">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" />
					<a href="#">
						<xsl:attribute name="onclick">javascript:showOne('div<xsl:value-of select="SortBy" />');</xsl:attribute>
						<xsl:value-of select="Title" />
					</a>
				</xsl:for-each>
				<a href="/Assets/148/Images/weddingbakery.pdf">Bridal Guide</a>
					
			</div>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" />
				<div class="contentDiv">
					<xsl:attribute name="id">div<xsl:value-of select="SortBy" /></xsl:attribute>
					<xsl:if test="SortBy &gt; 1">
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:if> 
					<h4><xsl:value-of select="Title" /></h4>
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</div>
			</xsl:for-each>			
			
		</div>
	</xsl:template>
</xsl:stylesheet>