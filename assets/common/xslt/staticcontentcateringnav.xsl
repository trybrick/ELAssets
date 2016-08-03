<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	<xsl:template match="/">
    
		    <script id="jsImage" type="text/javascript" language="javascript">
		      <xsl:comment>
				<![CDATA[

				var pages = ]]><xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)" /><![CDATA[;
				function elemOn(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "block";
				}
				function elemOff(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "none";
				}
				function hideAll(){
					for( var i = 0; i <= pages; i++ )
						elemOff( 'div_'+i );
				}
				function showAll(){
					for( var i = 0; i <= pages; i++ )
						elemOn( 'div_'+i );
				}
				function showOne(elem_id){
					hideAll( );
					elemOn( elem_id );
				}

				]]>
		      </xsl:comment>

		    </script>
			<div id="StaticContentButtons">
				<div id="ContentMain">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
						<div class="StaticContentButtonsEntry">
							<xsl:attribute name="id">div_<xsl:value-of select="position()" /></xsl:attribute>
							<xsl:if test="position() &gt; 1"><xsl:attribute name="style">display:none</xsl:attribute></xsl:if>
							<h2><xsl:value-of select="Title" /></h2>
                            <xsl:if test="Image !=''">
                                <img alt="">
                                    <xsl:attribute name="src"><xsl:value-of select="Image" /></xsl:attribute>
                                </img>
                            </xsl:if>
							<p><xsl:value-of select="Description" disable-output-escaping="yes" /></p>
						</div>
					</xsl:for-each>
				</div>
				<div id="StaticContentButtonsNav">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:variable name="subStringA" select="substring-after(Image,'.')" />
					<xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
				 	<xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
						<a class="leftnavbutton">
						<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" ><xsl:value-of select="Image" /></xsl:when>
							<xsl:otherwise>javascript:showOne('div_<xsl:value-of select="position()"/>');</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
                        <xsl:if test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" >
                        	<xsl:attribute name="target">_blank</xsl:attribute>
                        </xsl:if>
						<xsl:value-of select="Title" disable-output-escaping="yes"/>
					</a>
					</xsl:for-each>
				</div>
			</div>	
	</xsl:template>
</xsl:stylesheet>


<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

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