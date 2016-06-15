<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="TotalCount" select="count(ExpressLane/ArrayOfStaticContent/StaticContent)"/>
		<script language="javascript">

					var staticContentPages = <xsl:value-of select="$TotalCount"/>;
					
					function elemOnStaticContent(elem_id){
						if($(elem_id))
							$(elem_id).style.display = "block";
					}
					function elemOffStaticContent(elem_id){
						if($(elem_id))
							$(elem_id).style.display = "none";
					}
					function hideAllStaticContent(){
						for( var i = 1; i &lt;= staticContentPages; i++ )
							elemOffStaticContent( 'staticContentDiv_'+i );
					}
					function showAllStaticContent(){
						for( var i = 1; i &lt;= staticContentPages; i++ )
							elemOnStaticContent( 'staticContentDiv_'+i );
					}
					function showOneStaticContent(elem_id){
						hideAllStaticContent( );
						elemOnStaticContent( elem_id );
					}
		</script>
		<xsl:if test="count(ExpressLane/ArrayOfStaticContent/StaticContent) &gt; 1">
			<div id="mainContentHeader" class="group">
				<xsl:variable name="ButtonWidth" >
					<xsl:if test="$TotalCount &gt; 0">
						<xsl:value-of select="floor(870 div $TotalCount)" />
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<a class="button" href="#null" style="{concat('width:',$ButtonWidth,'px')}">						
						<xsl:attribute name="onclick">showOneStaticContent('staticContentDiv_<xsl:value-of select="position()"/>');</xsl:attribute>
						<span>
							<xsl:value-of select="Title" disable-output-escaping="yes"/>
						</span>
					</a>
				</xsl:for-each>
			</div>
		</xsl:if>
		<div id="mainContent" class="group">
			<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number"/>
				<div class="staticContentEntry group">
					<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
					<xsl:if test="position() != 1">
						<xsl:attribute name="style">display: none</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>