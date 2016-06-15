<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	<style>
		@import url(<xsl:value-of select="//LandingPage/Stylesheet" />);
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
	<!--<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>	-->
	<script type="text/javascript">
		<![CDATA[
		function redirectCircular() {
			window.location.replace('http://'+window.location.hostname+'/Shop/WeeklyAd.aspx');
		}
		]]>
	</script>
<div id="LandingPageContainer">
      <div id="LandingPageMain">
        <div class="Logo">
        	<img class="Logo" alt="">
	 			<xsl:attribute name="src"><xsl:value-of select="//LandingPage/ImagePath" /><xsl:value-of select="//LandingPage/Logo" /></xsl:attribute>
			</img>   
        </div>
        <xsl:for-each select="//LandingPage/ProductList/Product">
          <xsl:sort select="Sort" />
          <div class="Product">
			<xsl:if test="ItemCategory = 'Hot Pockets&#174; brand Panini'">
				<xsl:attribute name="style">background:#FFFFCC</xsl:attribute>
			</xsl:if>
            <table cellpadding="0" cellspacing="10" width="">
              <tr>
                <td rowspan="2" class="ImageCell">
					<img width="135" class="ProductImage" alt="">
                  		<xsl:attribute name="src"><xsl:value-of select="ancestor::LandingPage/ImagePath" /><xsl:value-of select="Image" /></xsl:attribute>
                  	</img>
				</td>
              	<td>
                	<h2>
						<xsl:choose>
						<xsl:when test="HeadingImg">
                    		<img>
                        		<xsl:attribute name="alt"><xsl:value-of select="Name" /></xsl:attribute>
                            	<xsl:attribute name="src"><xsl:value-of select="ancestor::LandingPage/ImagePath" /><xsl:value-of select="HeadingImg" /></xsl:attribute>
                         	</img>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ancestor::LandingPage/Brand" />&#174;&#160;brand&#160;<xsl:value-of select="ItemCategory" /><br/><span class="ProductName"><xsl:value-of select="Name" /></span>
						</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="Subtitle">
                        	<br />
                        	<em>(<xsl:value-of select="Subtitle" />)</em>
						</xsl:if>
                    </h2>
                  	<p class="Description"><xsl:value-of select="Description" /></p>
					<p class="DisplaySize">Servings per container: 2<br/>Ounces: <xsl:value-of select="DisplaySize" /></p>
			  	</td>
              </tr>
              <tr>
				 <td align="top">
                	<a class="ListAdd button" style="background-image:url(/Assets/Common/Promotions/Nestle/HotPockets/Images/submit_red_right.gif);">
                		<xsl:attribute name="href">javascript:clickThru('%c','<xsl:value-of select="ancestor::LandingPage/DepartmentID" />','<xsl:value-of select="ancestor::LandingPage/Brand" /> <xsl:value-of select="ItemCategory" />','<xsl:value-of select="Name" />','<xsl:value-of select="substring(UPC,0,6)" />','1','<xsl:value-of select="DisplaySize" />','','','','','<xsl:value-of select="UPC" />','<xsl:value-of select="UPC" />');</xsl:attribute>
						<span>Add to List</span>
                   	</a>
                </td>
              </tr>
            </table>
          </div>
        </xsl:for-each>
      </div>
    </div>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="HotPockets.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
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