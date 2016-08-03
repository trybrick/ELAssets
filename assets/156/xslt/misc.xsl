<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">


		<h2>Welcome to our Cooking Center!</h2>

					<h3>
						We offer dozens of videos on all facets of food preparation and cooking tips. Browse
						our video library on the right below, then click a video name to watch.</h3>


		<div id="recipevideos">

						<script language="javascript" type="text/javascript">
							if (AC_FL_RunContent == 0) {
								alert("This page requires AC_RunActiveContent.js.");
							} else {
								AC_FL_RunContent(
									'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0',
									'width', '490',
									'height', '415',
									'src', '/Assets/Common/Video/RecipeVideoPlayer_500',
									'quality', 'high',
									'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
									'align', 'middle',
									'play', 'true',
									'loop', 'true',
									'scale', 'showall',
									'wmode', 'transparent',
									'devicefont', 'true',
									'id', 'RecipeVideoPlayer',
									'bgcolor', '#ffffff',
									'name', 'RecipeVideoPlayer',
									'menu', 'true',
									'allowFullScreen', 'false',
									'allowScriptAccess','always',
									'movie', '/Assets/Common/Video/RecipeVideoPlayer_500',
									'FlashVars','158',
									'salign', ''
									); //end AC code
							}
						</script>

						<noscript>
							<object id="RecipeVideoPlayer "
								codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
								height="415" width="490" align="middle"
								classid=clsid:d27cdb6e-ae6d-11cf-96b8-444553540000 VIEWASTEXT>
								<PARAM NAME="_cx" VALUE="15716">
								<PARAM NAME="_cy" VALUE="10980">
								<PARAM NAME="FlashVars" VALUE="">
								<PARAM NAME="Movie" VALUE="RecipeVideoPlayer_500.swf">
								<PARAM NAME="Src" VALUE="RecipeVideoPlayer_500.swf">
								<PARAM NAME="WMode" VALUE="transparent">
								<PARAM NAME="Play" VALUE="-1">
								<PARAM NAME="Loop" VALUE="-1">
								<PARAM NAME="Quality" VALUE="High">
								<PARAM NAME="SAlign" VALUE="">
								<PARAM NAME="Menu" VALUE="-1">
								<PARAM NAME="Base" VALUE="">
								<PARAM NAME="AllowScriptAccess" VALUE="always">
								<PARAM NAME="Scale" VALUE="ShowAll">
								<PARAM NAME="DeviceFont" VALUE="-1">
								<PARAM NAME="EmbedMovie" VALUE="0">
								<PARAM NAME="BGColor" VALUE="FFFFFF">
								<PARAM NAME="SWRemote" VALUE="">
								<PARAM NAME="MovieData" VALUE="">
								<PARAM NAME="SeamlessTabbing" VALUE="1">
								<PARAM NAME="Profile" VALUE="0">
								<PARAM NAME="ProfileAddress" VALUE="">
								<PARAM NAME="ProfilePort" VALUE="0">
								<PARAM NAME="AllowNetworking" VALUE="all">
								<PARAM NAME="AllowFullScreen" VALUE="false">
								<param name="FlashVars" value="158" />
								<embed src="/Assets/Common/Video/RecipeVideoPlayer_500.swf"  
									quality="high" devicefont="true" bgcolor="#ffffff"                          
									width="490" height="415" name="RecipeVideoPlayer"  
									align="middle" allowScriptAccess="sameDomain"             
									allowFullScreen="false" type="application/x-shockwave-flash" wmode="transparent"
									pluginspage="http://www.macromedia.com/go/getflashplayer"/>
							</object>
						</noscript>
			<!-- end main content -->

		</div>


	</xsl:template>


</xsl:stylesheet>
