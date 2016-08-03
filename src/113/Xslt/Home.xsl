<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>

	<xsl:template match="/">

		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
     			function changeDIV(hide, show)
        		{
            		var d = new Object();
            		d = document.getElementById(hide);
            		d.style.display = "none";

            		d = document.getElementById(show);
            		d.style.display = "";
        		}


				var rand1 = 0;
				var useRand = 0;

				images = new Array;
				images[1] = new Image();
				images[1].src = "]]>/Assets/113/Images/SplashImage_f01.jpg<![CDATA[";
				images[2] = new Image();
				images[2].src = "]]>/Assets/113/Images/SplashImage_f02.jpg<![CDATA[";
				images[3] = new Image();
				images[3].src = "]]>/Assets/113/Images/SplashImage_f03.jpg<![CDATA[";
				images[4] = new Image();
				images[4].src = "]]>/Assets/113/Images/SplashImage_f04.jpg<![CDATA[";
				images[5] = new Image();
				images[5].src = "]]>/Assets/113/Images/SplashImage_f05.jpg<![CDATA[";
				images[6] = new Image();
				images[6].src = "]]>/Assets/113/Images/SplashImage_f06.jpg<![CDATA[";
				images[7] = new Image();
				images[7].src = "]]>/Assets/113/Images/SplashImage_f07.jpg<![CDATA[";

				function swapPic() {
				var imgnum = images.length - 1;
				do {
				var randnum = Math.random();
				rand1 = Math.round((imgnum - 1) * randnum) + 1;
				} while (rand1 == useRand);
				useRand = rand1;
				document.randimg.src = images[useRand].src;
				}

				window.onload = function() {  swapPic(); };
				]]></xsl:comment>
		</script>
		<div id="div1">
			<div id="SplashContainer">
				<div id="SplashImage">

					<a href="#" onClick="swapPic();">
						<img>
							<xsl:attribute name="name">randimg</xsl:attribute>
							<xsl:attribute name="width">792</xsl:attribute>
							<xsl:attribute name="height">384</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="splashblocks">
				<div style="float:left; margin:0 10px 0 35px">
					<a>
						<xsl:attribute name="href">/</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/113/Images/shop_online.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
				<div style="float:left; margin:0 10px">
					<a>
						<xsl:attribute name="href">/catering.aspx</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/113/Images/catering.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
				<div style="float:left; margin:0 0 0 10px">
					<a>
						<xsl:attribute name="href">/Page.aspx?Display=56</xsl:attribute>
						<img>
							<xsl:attribute name="src">/Assets/113/Images/gift_baskets.jpg</xsl:attribute>
							<xsl:attribute name="border">0</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
			<div id="StoreFooter" style="width:100%">
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td align="left" class="centered">
							<h3 class="centered" style="margin-bottom:4px;">1214 Anderson Ave. Fort Lee, NJ 07024</h3>
							<b>Phone: 201-224-7900, 201-224-7159</b>
							<br/>
							<b>Store hours:</b>Mon-Fri 8:30am-7pm, Sat 8:30am-6:30pm, Sun 9am- 3:00pm<br/>
							<b>Map: <u><a><xsl:attribute name="href"><![CDATA[http://maps.google.com/maps?f=q&hl=en&geocode=&q=1214+Anderson+Ave.+Fort+Lee,+NJ+07024&sll=37.0625,-95.677068&sspn=45.284089,70.400391&ie=UTF8&z=16&iwloc=addr]]></xsl:attribute>
										<xsl:attribute name="target">_new</xsl:attribute>Google Maps</a></u></b>
						</td>
					</tr>
					<tr>
						<td align="left">
						<a href="http://www.facebook.com/home.php?#!/pages/Fort-Lee-NJ/Cafassos-Fairway-Market/141018159254873?v=wall" target="_blank"><img src="/Assets/113/Images/Find-Us-Facebook.jpg" /></a>
						</td>

					</tr>
				</table>
				<br/>
				<br/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\98\XmlData\98-PageTypeId-30-Home.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
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
