<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		
		<script language="javascript">
			<![CDATA[	
			
			function elemOnStaticContent(elem_id)
			{
				if($(elem_id))
					$(elem_id).removeClassName('hidden');
			}
			
			function elemOffStaticContent(elem_id)
			{
				if($(elem_id))
					$(elem_id).addClassName('hidden');
			}
			
			function hideAllStaticContent()
			{
				var staticContentPages = $$('.staticContentEntry');
				for( var i = 1; i <= staticContentPages.length; i++ )
					elemOffStaticContent( 'staticContentDiv_'+i );
			}
			
			function showAllStaticContent()
			{
				var staticContentPages = $$('.staticContentEntry');
				for( var i = 1; i <= staticContentPages.length; i++ )
					elemOnStaticContent( 'staticContentDiv_'+i );
			}
			
			function showOneStaticContent(elem_id)
			{
				hideAllStaticContent( );
				elemOnStaticContent( elem_id );
			}
	
			function getQueryVariable(variable)
			{
				var query = window.location.search.substring(1);
				var vars = query.split("&");
  				for (var i=0;i<vars.length;i++) 
				{
    				var pair = vars[i].split("=");
    				if (pair[0] == variable) 
					{
      					return pair[1];
    				}
  				}
				
				return 1; 
			}
			

			//we have to load page number that is passed in query string from home page links...
			window.onload = function(){
				var staticContentPages = $$('.staticContentEntry');
				for(var i = 1; i < staticContentPages.length; i++){
					staticContentPages[i].addClassName('hidden');
				}
				var pageNum = getQueryVariable('page');
				if(pageNum) { showOneStaticContent('staticContentDiv_'+pageNum); }
			}
			]]>
		</script>

		<xsl:if test="count(ExpressLane/ArrayOfStaticContent/StaticContent) &gt; 1">
			<div id="mainContentHeader">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number" />
				<xsl:variable name="subStringA" select="substring-after(Image,'.')" />
				<xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
				 <xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
					<a>
						<xsl:attribute name="class">button</xsl:attribute>
						<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" ><xsl:value-of select="Image" /></xsl:when>
							<xsl:otherwise>javascript:showOneStaticContent('staticContentDiv_<xsl:value-of select="position()"/>');</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
						<xsl:if test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" >
							<xsl:attribute name="target">_blank</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() = last()">
							<xsl:attribute name="style">margin-right:0;</xsl:attribute>
						</xsl:if>
						<span><xsl:value-of select="Title" disable-output-escaping="yes"/></span>
					</a>
				</xsl:for-each>
			</div>
		</xsl:if>

		<div id="mainContent">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number" />
				<div>
					<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
					<xsl:attribute name="class">staticContentEntry</xsl:attribute>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</div>
			</xsl:for-each>
		</div>
		
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