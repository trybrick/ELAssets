<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		
		<script language="javascript">
		<![CDATA[
					var staticContentPages = ]]><xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)"/><![CDATA[;
					
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

		<xsl:if test="count(ExpressLane/ArrayOfStaticContent/StaticContent) &gt; 1">
			<div id="LeftNav" class="left">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" data-type="number" />
				<xsl:variable name="subStringA" select="substring-after(Image,'.')" />
				<xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
				 <xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
					<a>
						<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" ><xsl:value-of select="Image" /></xsl:when>
							<xsl:otherwise>javascript:showOneStaticContent('staticContentDiv_<xsl:value-of select="position()"/>');</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
                        <xsl:if test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" >
                        	<xsl:attribute name="target">_blank</xsl:attribute>
                        </xsl:if>
						<xsl:value-of select="Title" disable-output-escaping="yes"/>
					</a>
				</xsl:for-each>
			</div>
		</xsl:if>

		<div id="mainContentLeftNav" class="left">
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number" />
				<div>
					<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
					<xsl:attribute name="class">staticContentEntryLeftNav</xsl:attribute>
					<xsl:if test="position() != 1">
						<xsl:attribute name="style">display: none</xsl:attribute>
					</xsl:if>
                    <xsl:choose>
                    <xsl:when test="Description = ''">
                    	<img alt="">
                        	<xsl:attribute name="src"><xsl:value-of select="Image" /></xsl:attribute>
                        </img>
                    </xsl:when>
                    <xsl:otherwise>
						<xsl:value-of select="Description" disable-output-escaping="yes"/>
                    </xsl:otherwise>
                    </xsl:choose>
				</div>
			</xsl:for-each>
			<div class="staticContentHomeButton">
                <a>
                    <xsl:attribute name="href">##root##</xsl:attribute>
                    <xsl:attribute name="class">button</xsl:attribute>
                   <span>Back to Home</span>
                </a>
            </div>
		</div>
		
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\PrintList.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->