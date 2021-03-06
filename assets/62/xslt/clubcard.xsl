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
                    <xsl:attribute name="href"></xsl:attribute>
                    <img id="CardImage">
                      <xsl:attribute name="src">
                        <xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent/Image"/>
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
</xsl:stylesheet>