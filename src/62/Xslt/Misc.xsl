<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <style>
      img			{text-align:center; margin:0 auto;}
      #staticimg	{width:100%; text-align:center; }
    </style>

    <script id="jsImage" type="text/javascript" language="javascript">

      <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
        <xsl:if test="position()=last()">
          <![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
        <![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1] = ']]><xsl:value-of select="Image"/><![CDATA[';]]>
      </xsl:for-each>
      <xsl:comment>
        <![CDATA[
    
    function showImage(page)
    {
		page = page-1;
        var img = document.getElementById('Image');
        img.src = images[page];
    }
	]]>
      </xsl:comment>

    </script>
    <div style="clear:both; float:left;">
      <table>
        <tr>
          <td>
            <div id="staticimg">
              <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
                <xsl:if test="not(SortBy = '99')">
                  <a>
                    <xsl:attribute name="href">
                      javascript:showImage(<xsl:value-of select="SortBy"/>);
                    </xsl:attribute>
                    <xsl:value-of select="SortBy"/>
                  </a>
                  <xsl:if test="position()!=last()">
                    |
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <div id="mainImage">
              <img id="Image">
                <xsl:attribute name="src">
                  <xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent/Image"/>
                </xsl:attribute>
              </img>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <div id="cardImage">
              <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
                <xsl:if test="SortBy = '99'">
                  <a>
                    <xsl:attribute name="href">
                      /Contact/default.aspx?page=Loyalty
                    </xsl:attribute>
                    <img id="CardImage">
                      <xsl:attribute name="src">
                        ##root##/Assets/<xsl:value-of select="ChainID"/>/Images/Clubcard.jpg
                      </xsl:attribute>
                    </img>
                  </a>
                </xsl:if>
              </xsl:for-each>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\Ted's IGA&#x2D;Misc.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->