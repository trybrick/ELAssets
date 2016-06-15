<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Expires" content="-1"/>
    <title>Landing Page</title>
    <style>
    		@import url(<xsl:value-of select="LandingPage/Stylesheet" />);
    </style>
    <script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
    <script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    </head>
    <body>
    <div id="Container">
      <div id="Main">
		<div class="PromoHeader">
			<p></p>
		</div>
        <xsl:for-each select="LandingPage/Categories/Category">
          <xsl:sort select="Sort" />
		  <xsl:variable name="CatID" select="CategoryID" />
          <div class="CategoryDiv">
            <table class="CategoryTable" width="590" cellpadding="0" cellspacing="6">
            <tr>
            	<td width="170">
                	  <img>
                      <xsl:attribute name="src"><xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="Image" /></xsl:attribute>
                      </img>
                </td>
                <td valign="middle">
            		<h2 class="CategoryHeading"><xsl:value-of select="Name" /></h2>
                    <p class="CategoryHeading"><xsl:value-of select="Description" disable-output-escaping="yes" /></p>
                

                    
              	</td>
              </tr>
            </table>
            
            <hr/>
                
                	<xsl:for-each select="ancestor::LandingPage/child::ProductList/child::Product[./CategoryID = $CatID]">
                	<table class="ProductList">
						<xsl:call-template name="ProductRow" />
                    </table>
                    <hr />
                    </xsl:for-each>
                                
          </div>
        </xsl:for-each>
      </div>
    </div>
    </body>
    </html>
  </xsl:template>
  <xsl:template name="ProductRow" match="Product">
                     <tr>
                     	<td valign="middle">
                        	<img>
                            	<xsl:attribute name="src"><xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="UPC" />.jpg</xsl:attribute>
                                <xsl:attribute name="style">border:0;</xsl:attribute>
                            </img>
                        </td>
                        <td valign="middle" style="padding:0 10px;">
                			<a class="ListAdd">
                  				<xsl:attribute name="onmouseover">swapImage("AddButton<xsl:value-of select='Sort'/>","<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OverState" />");</xsl:attribute>
                  				<xsl:attribute name="onmouseout">swapImage("AddButton<xsl:value-of select='Sort'/>","<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OffState" />");</xsl:attribute>
                  				<xsl:attribute name="href">javascript:clickThru('%c','<xsl:value-of select="ancestor::LandingPage/child::DepartmentID"/>','<xsl:value-of select="ancestor::LandingPage/child::Brand"/>','- <xsl:value-of select="Name" />','<xsl:value-of select="substring(UPC,0,6)" />','1','<xsl:value-of select="DisplaySize" />','','','','','206299728-27636142-<xsl:value-of select="UPC" />');</xsl:attribute>
                  			<img alt="Add to List" class="AddButton">
                  				<xsl:attribute name="id">AddButton<xsl:value-of select="Sort" /></xsl:attribute>
                  				<xsl:attribute name="src"><xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OffState" /></xsl:attribute>
                  			</img>
                   			</a>
                        </td>
                        <td valign="middle">
                        	<span class="ProductName"><xsl:value-of select="Name" /><text>&#160;</text><xsl:value-of select="DisplaySize" /><xsl:if test="Sodium = 'true'">&#160;**</xsl:if></span>
                        </td>
					</tr>
  </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="DuncanHines.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->