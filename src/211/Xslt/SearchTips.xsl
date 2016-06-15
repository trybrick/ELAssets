<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				var pages = <xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)"/>;<![CDATA[
				
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
				]]></xsl:comment>
		</script>
		<div id="SearchTips">
			<div id="SearchTipsHeader">
				<h2>Welcome to <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> Online Shopping!</h2>
			</div>
			<div id="HelpTopics">
				<h3>Help Topics:</h3>
				<ul>
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:sort select="SortBy" data-type="number" />
						<li>
							<a href="#">
								<xsl:attribute name="onclick">showOne('<xsl:value-of select="concat('div', position())" />')</xsl:attribute>
								<xsl:value-of select="Title" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
				<br/>
				<a class="button" href="/">
					<span>Back to Home</span>
				</a>
			</div>
			<div id="SearchTipsContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<div class="SearchTipsSubject">
						<xsl:attribute name="id">
							<xsl:value-of select="concat('div', position())" />
						</xsl:attribute>		
						<xsl:attribute name="style">
							<xsl:choose>
								<xsl:when test="position() = 1">display:block;</xsl:when>
								<xsl:otherwise>display:none;</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:value-of select="Description" disable-output-escaping="yes" />
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\124-PageTypeId-135-OGSSearchTips.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
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