<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">

		<script language="javascript"><![CDATA[
					var staticContentPages = ]]>
			<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)"/><![CDATA[;
					
					function elemOnStaticContent(elem_id){
						if($(elem_id))
							$(elem_id).style.display = "block";
					}
					function elemOffStaticContent(elem_id){
						if($(elem_id))
							$(elem_id).style.display = "none";
					}
					function hideAllStaticContent(){
						for( var i = 1; i <= staticContentPages; i++ )
							elemOffStaticContent( 'staticContentDiv_'+i );
					}
					function showAllStaticContent(){
						for( var i = 1; i <= staticContentPages; i++ )
							elemOnStaticContent( 'staticContentDiv_'+i );
					}
					function showOneStaticContent(elem_id){
						hideAllStaticContent( );
						elemOnStaticContent( elem_id );
					}

					function getQueryVariable(variable){
						var query = window.location.search.substring(1);
						var vars = query.split("&");
  						for (var i=0;i<vars.length;i++) {
    						var pair = vars[i].split("=");
    						if (pair[0] == variable) {
      							return pair[1];
    					}
  					}
				
					return 1; 
			}
			

			//we have to load page number that is passed in query string from home page links...
			
					window.onload = function(){
						var pageNum = getQueryVariable('page');
						showOneStaticContent('staticContentDiv_'+pageNum);
					}
		]]>
		</script>
		<div id="LeftNav" class="left">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number"/>
				<xsl:variable name="subStringA" select="substring-after(Image,'.')"/>
				<xsl:variable name="subStringB" select="substring-after($subStringA,'.')"/>
				<xsl:variable name="fileExtension" select="substring-after($subStringB,'.')"/>
				<xsl:choose>
					<xsl:when test="(count(//ArrayOfStaticContent/StaticContent) &lt; 2) and ($fileExtension = 'pdf' or $fileExtension = 'doc') and (Description = '')">
						<style>#LeftNav {float:none;margin:0 auto;} #LeftNav a {text-align:center;}</style>
					</xsl:when>
					<xsl:when test="(count(//ArrayOfStaticContent/StaticContent) &lt; 2) and ($fileExtension != 'pdf' and $fileExtension != 'doc')">
						<style>#LeftNav {display:none;}</style>
					</xsl:when>
				</xsl:choose>
				<a>
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''">
								<xsl:value-of select="Image"/>
							</xsl:when>
							<xsl:otherwise>javascript:showOneStaticContent('staticContentDiv_<xsl:value-of select="position()"/>');</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''">
						<xsl:attribute name="target">_blank</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="Title" disable-output-escaping="yes"/>
				</a>
			</xsl:for-each>
		</div>

		<div id="mainContentLeftNav" class="group">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number"/>
				<xsl:if test="not(starts-with(Description, 'http://'))">
					<div>
						<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
						<xsl:attribute name="class">staticContentEntryLeftNav</xsl:attribute>
						<xsl:if test="position() != 1">
							<xsl:attribute name="style">display: none</xsl:attribute>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="Description = ''">
								<img alt="">
									<xsl:attribute name="src">
										<xsl:value-of select="Image"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="Description" disable-output-escaping="yes"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:if>
			</xsl:for-each>
			<div class="staticContentHomeButton">
				<a>
					<xsl:attribute name="href">/</xsl:attribute>
					<xsl:attribute name="class">button</xsl:attribute>
					<span>Back to Home</span>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>