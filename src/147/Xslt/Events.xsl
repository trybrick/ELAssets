<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>


	<xsl:template match="/">

			<style type="text/css">
				.eventsimages {float:left;margin-left:100px;}
			</style>

			<script id="jsImage" type="text/javascript" language="javascript">
		    function showImage(page)
		    {
				var divs = document.getElementsByClassName('eventsimages');

				for(i = 0; i &lt; divs.length; i++){
					var div = divs[i];

					if(div.id == ('Image' + page)){
						div.style.display = 'block';
					}else{
						div.style.display = 'none';
					}
				}
			}
			<![CDATA[
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
			]]>

			//we have to load page number that is passed in query string from home page links...
			window.onload = function(){
				var pageNum = getQueryVariable('page');
				showImage(pageNum);
			}


			</script>
				<div id="EventsDiv">
					<xsl:choose>
						<xsl:when test="count(ExpressLane/ArrayOfStaticContent/StaticContent) > 0">
							<div id="numbers">
								<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
									<xsl:sort select="SortBy" data-type="number"/>
									<a>
										<xsl:attribute name="href">javascript:showImage(<xsl:value-of select="position()"/>);</xsl:attribute>
										<xsl:value-of select="SortBy"/>
									</a>
									<xsl:if test="position()!=last()">
										|
									</xsl:if>
								</xsl:for-each>
							</div>
							<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
								<xsl:sort select="SortBy" data-type="number"/>
								<div>
									<xsl:attribute name="id">Image<xsl:value-of select="position()" /></xsl:attribute>
									<xsl:attribute name="class">eventsimages</xsl:attribute>
									<xsl:if test="position() != 1">
										<xsl:attribute name="style">display: none;</xsl:attribute>
									</xsl:if>

									<xsl:choose>
										<xsl:when test="string-length(Description) > 0">
											<a>
												<xsl:attribute name="href"><xsl:value-of select="Description" /></xsl:attribute>
												<img id="Image" alt="">
													<xsl:attribute name="src"><xsl:value-of select="Image" /></xsl:attribute>
												</img>
											</a>
										</xsl:when>
										<xsl:otherwise>
											<img id="Image" alt="">
												<xsl:attribute name="src"><xsl:value-of select="Image" /></xsl:attribute>
											</img>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<div id="noContent">
								<h2 style="border:none;">There are no promotions at this time. Please check again soon.</h2>
							</div>
						</xsl:otherwise>
					</xsl:choose>


<!--					<xsl:choose>
						<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image != ''">
							<div id="numbers">
								<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
									
							<a>
								<xsl:attribute name="href">javascript:showImage(<xsl:value-of select="SortBy"/>,'<xsl:value-of select="Description"/>');</xsl:attribute>
								<xsl:value-of select="SortBy"/>
							</a>
							<xsl:if test="position()!=last()">
								|
							</xsl:if>
							</xsl:for-each>
							</div>
							<div id="staticImage">
							<xsl:choose>
								<xsl:when test="string-length(ExpressLane/ArrayOfStaticContent/StaticContent[1]/Description) > 0">
									<a>
										<xsl:attribute name="href"><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Description" /></xsl:attribute>
										<img id="Image" alt="">
											<xsl:attribute name="src"><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image" /></xsl:attribute>
										</img>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<img id="Image" alt="">
										<xsl:attribute name="src"><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image" /></xsl:attribute>
										<script type="text/javascript">
											<xsl:comment>
											<![CDATA[
												loadArrays();
												showImage();
											]]>
											</xsl:comment>
										</script>
									</img>
								</xsl:otherwise>
							</xsl:choose>
							</div>
							<div id="PromoDescription">
							</div>
						</xsl:when>
					</xsl:choose>-->
				</div>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\147-PageTypeId-44-Events.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
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