<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		
		<script language="javascript">

					var staticContentPages = <xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)"/>;
					
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
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number" />
					<a>
						<xsl:attribute name="class">button</xsl:attribute>
						<xsl:attribute name="href">#</xsl:attribute>
						<xsl:attribute name="onclick">showOneStaticContent('staticContentDiv_<xsl:value-of select="position()"/>');</xsl:attribute>
						<xsl:if test="position() = last()">
							<xsl:attribute name="style">margin-right:0;</xsl:attribute>
						</xsl:if>
						<span><xsl:value-of select="Title" disable-output-escaping="yes"/></span>
					</a>
				</xsl:for-each>
			</div>
		</xsl:if>

		<div id="mainContent" class="group">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number" />
				<div>
					<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
					<xsl:attribute name="class">staticContentEntry</xsl:attribute>
					<xsl:if test="position() != 1">
						<xsl:attribute name="style">display: none</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</div>
			</xsl:for-each>
		</div>
		
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

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