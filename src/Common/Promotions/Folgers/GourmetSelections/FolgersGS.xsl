<?xml version='1.0'?><!-- DWXMLSource="FolgersGS.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
	<style>
		@import url(/Assets/Common/Promotions/Folgers/GourmetSelections/Styles/gs.css);
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    <script type="text/javascript">
	//<![CDATA[
		function swapImage(imageID,imageFile){
			var img = document.getElementById(imageID);
			img.src = imageFile;
		}

		var arVersion = navigator.appVersion.split("MSIE")
		var version = parseFloat(arVersion[1])

		if ((version >= 5.5) && (document.body.filters)) 
		{
		   for(var i=0; i<document.images.length; i++)
		   {
		      var img = document.images[i]
		      var imgName = img.src.toUpperCase()
		      if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
		      {
		         var imgID = (img.id) ? "id='" + img.id + "' " : ""
		         var imgClass = (img.className) ? "class='" + img.className + "' " : ""
		         var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
		         var imgStyle = "display:inline-block;" + img.style.cssText 
		         if (img.align == "left") imgStyle = "float:left;" + imgStyle
		         if (img.align == "right") imgStyle = "float:right;" + imgStyle
		         if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
		         var strNewHTML = "<span " + imgID + imgClass + imgTitle
		         + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
		         + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
		         + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
		         img.outerHTML = strNewHTML
		         i = i-1
		      }
		   }
		}
		
	//]]>
	</script>	
<div id="LandingPageContainer">
      <div id="LandingPageMain">
        <div class="Logo">
        	<img class="Logo" alt="Folgers Gourmet Selections">
	 		<xsl:attribute name="src">/Assets/Common/Promotions/Folgers/GourmetSelections/Images/logo.png</xsl:attribute>
			</img>
        	<h1><img class="Logo" alt="Wake Up to Folgers Finest Roasts"><xsl:attribute name="src">/Assets/Common/Promotions/Folgers/GourmetSelections/Images/tagLine.gif</xsl:attribute></img></h1>    
        </div>
        <xsl:for-each select="LandingPage/ProductList/Product">
          <xsl:sort select="Sort" />
          <div class="Product">
            <table cellpadding="0" cellspacing="10">
              <tr>
                <td rowspan="2"><img width="50" height="153" class="ProductImage" alt="">
                  <xsl:attribute name="src">/Assets/Common/Promotions/Folgers/GourmetSelections/Images/<xsl:value-of select="Image" /></xsl:attribute>
                  </img> </td>
                <td align="top">
                	<a class="ListAdd">
                		<xsl:attribute name="onmouseover">swapImage("AddButton<xsl:value-of select='Sort'/>","/Assets/Common/Promotions/Folgers/GourmetSelections/Images/add_button_over.png");</xsl:attribute>
                		<xsl:attribute name="onmouseout">swapImage("AddButton<xsl:value-of select='Sort'/>","/Assets/Common/Promotions/Folgers/GourmetSelections/Images/add_button.png");</xsl:attribute>
                		<xsl:attribute name="href">javascript:clickThru('%c','12797','Folgers Gourmet Selections','<xsl:value-of select="Name" />','25500','1','','','','','','206299728-27636142-<xsl:value-of select="UPC" />');</xsl:attribute>
                  		<img alt="Add to List">
                  			<xsl:attribute name="id">AddButton<xsl:value-of select="Sort" /></xsl:attribute>
							<xsl:attribute name="src">/Assets/Common/Promotions/Folgers/GourmetSelections/Images/add_button.png</xsl:attribute>
                        </img>
                   	</a>
                </td>
              </tr>
              <tr>
                <td align="top">
                	<h2>
                    	<img>
                        	<xsl:attribute name="alt"><xsl:value-of select="Name" /></xsl:attribute>
                            <xsl:attribute name="src">/Assets/Common/Promotions/Folgers/GourmetSelections/Images/<xsl:value-of select="HeadingImg" /></xsl:attribute>
                         </img>
                         <br />
                         <em>(<xsl:value-of select="Subtitle" />)</em>
                    </h2>
                  <p class="Description"><xsl:value-of select="Description" /></p></td>
              </tr>
            </table>
          </div>
        </xsl:for-each>
      </div>
    </div>
</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="pork_recipes" userelativepaths="yes" externalpreview="no" url="pork.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->