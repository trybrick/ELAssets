<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="SlideShow" match="/">
	<div id="flashSlideShow" style="width:682px;">
		<p id="failover" style="visibility:hidden;">Flash Player version 8 or higher is required to view this content.<a href="http://get.adobe.com/flashplayer/" target="_blank">Get Flash.</a></p>
	</div>
	<!-- Paths to JS files must be absolute for IE6 -->
	<script type="text/javascript" src="/Assets/Common/js/swfobject.js"></script>
	<script type="text/javascript" src="/Assets/Common/js/ieupdate.js"></script>

	<!-- to add images, set variable name to img0, and value to image file name. start with 0 -->
	<!-- variable "ImageNum" is number of images in slideshow -->
	<!-- SWFObject Javascript class is used to embed Flash -->
	<script type="text/javascript">
		var so = new SWFObject("/Assets/Common/Flash/slideshow_v6.swf", "slideshow", "682", "300", "8", "#FFFFFF");
		var i = 0;
		<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number"/>
			so.addVariable("img"+i, "<xsl:value-of select="normalize-space(Image)" />");
			so.addVariable("link"+i, "<xsl:value-of select="normalize-space(Description)" />"); 
			i++;   
		</xsl:for-each>
		so.addVariable("ImageNum", "<xsl:value-of select="count(ExpressLane/ArrayOfStaticContent/StaticContent)" />");
		so.addVariable("PauseTime", "6");
		so.addParam("wmode","transparent");
		so.write("flashSlideShow");
						
		if(document.getElementById('failover')){
			var failOver = document.getElementById('failover');
			failover.style.visibility = "visible";
		}
	</script>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

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