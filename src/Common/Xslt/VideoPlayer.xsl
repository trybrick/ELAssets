<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
	<html>
	<head>
		<title>GSN Video Player</title>
	</head>
	<body>
		<p id='preview' style="width:400px;height:300px;text-align:center;background-image:url('http://www.groceryshopping.net/images/grocers/logo.gif');background-repeat:no-repeat;background-attachment:fixed;background-position:center;">The player will show in this paragraph</p>

	<script type='text/javascript' src='http://upload.gsngrocers.com/elvs/js/swfobject.js'></script>
	<script type='text/javascript'>
		<![CDATA[
		var $queryString = window.location.search.substr(1);
		var $pos = $queryString.indexOf("=");
		var $title = $queryString.substr($pos+1);
		var so = new SWFObject('http://upload.gsngrocers.com/elvs/player.swf','player','400','300','9');
		so.addParam('allowfullscreen','true');
		so.addParam('allowscriptaccess','always');
		var aspxURI = encodeURI('##root##/Recipes/VideoPlayList.aspx?videotitle='+$title);
		alert(aspxURI);
		so.addVariable('file',aspxURI);
		so.addVariable('autostart','true');
		so.addVariable('repeat','list');
		so.write('preview');
		]]>
	</script>
	<div id="flashbanner">
	</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>