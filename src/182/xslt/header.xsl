<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
			function MM_preloadImages() { //v3.0
			  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
			    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
			    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
			}

			function MM_swapImgRestore() { //v3.0
			  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
			}

			function MM_findObj(n, d) { //v4.01
			  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
			    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
			  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
			  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
			  if(!x && d.getElementById) x=d.getElementById(n); return x;
			}

			function MM_swapImage() { //v3.0
			  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
			   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
			}
				
				
				MM_preloadImages('/Assets/182/Images/btn_home2.jpg','/Assets/182/Images/btn_home2_over.jpg', '/Assets/182/Images/btn_about.jpg', '/Assets/182/Images/btn_about_over.jpg','/Assets/182/Images/btn_clubs.jpg', '/Assets/182/Images/btn_clubs_over.jpg','/Assets/182/Images/btn_valucard.jpg','/Assets/182/Images/btn_valucard_over.jpg','/Assets/182/Images/btn_brands.jpg','/Assets/182/Images/btn_brands_over.jpg','/Assets/182/Images/btn_departments.jpg','/Assets/182/Images/btn_departments_over.jpg','/Assets/182/Images/btn_community.jpg','/Assets/182/Images/btn_community_over.jpg','/Assets/182/Images/btn_party.jpg','/Assets/182/Images/btn_party_over.jpg','/Assets/182/Images/btn_press2.jpg','/Assets/182/Images/btn_press2_over.jpg');
			
	
			function submitfcFind(){
				var fcZip = $F("locator");
				var fcZipLookup = 'http:\/\/www.foodcity.com\/stores\/' + encodeURIComponent(fcZip);
				window.location = fcZipLookup;
			}

			function submitfcSearch(){
				var fcSearch = $F("searchq");
				var fcSearchLookup = 'http:\/\/www.foodcity.com\/search\/?q=' + encodeURIComponent(fcSearch) + '&amp;x=0&amp;y=0';
				window.location = fcSearchLookup;
			}
			
			]]>
			</xsl:comment>
		</script>


		<div id="wrapper">
			<div id="banner">
				<div id="bannerLogo">
					<img id="bannerImg" src="/Assets/182/Images/logo.jpg" alt="" width="574" height="90"/>
				</div>
				<div id="StoreHeaderRight">
					<div align="right">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
								<strong>Not logged in</strong>
								<br/>
								<a href="##root##/Profile/SignUp.aspx">Register</a> or <a href="##root##/Profile/SignIn.aspx">Login</a></xsl:when>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<strong>Welcome <xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></strong>
								<br/>
								<a href="##root##/Profile/Signup.aspx">Edit My Profile</a> | <a href="##root##/Profile/SignOut.aspx">Logout</a></xsl:when>
						</xsl:choose>
					</div>
				</div>

				<!-- end logo -->
				<div id="finders">
					<div id="searchContainer1">
						<div id="storeLocator">
							<input name="locator" id="locator" value="" size="15" type="text" onkeypress="if (event.keyCode==13) submitfcFind(); return event.keyCode!=13;"/>
						</div>
						<!-- end storeLocator -->
						<div id="personalizeCoupons">
							<a href="#" onclick="submitfcFind();">
								<img src="/Assets/182/Images/find.jpg" alt="Find" width="42" border="0" height="44"/>
							</a>
							<a href="##root##/Profile/Signin.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('personalize','','/Assets/182/Images/coupons2.jpg',1)">
								<img src="/Assets/182/Images/coupons2.jpg" alt="Personalize Your Coupons" name="personalize" id="personalize" width="138" border="0" height="44"/>
							</a>
						</div>
						<!-- end personalize -->
					</div>
					<!-- end searchContainer1 -->
					<div id="searchContainer2">
						<div id="searchContainer">
							<input name="q" id="searchq" value="" size="18" type="text" onkeypress="if (event.keyCode==13) submitfcSearch(); return event.keyCode!=13;"/>
						</div>
						<!-- end search -->
						<div id="searchGo">
							<a href="#" onclick="submitfcSearch();">
								<img src="/Assets/182/Images/searchGo.jpg" alt="Go" width="32" align="right" border="0" height="24"/>
							</a>
						</div>
						<!-- end searchGo -->
					</div>

					<!-- end of searchContainer2 -->
				</div>
				<!-- end searchContainer -->
			</div>
			<div style="clear: both;">
				<div id="qm0" class="qmmc">
					<a class="qmparent" href="http://www.foodcity.com/">
						<img qmvafter="1" width="145" height="32" style="visibility: inherit;" src="/Assets/182/Images/btn_home2.jpg" name="btn_Home" class="qm-is" id="btn_Home"
						     onmouseover="MM_swapImage('btn_Home','','/Assets/182/Images/btn_home2_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_home2_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/about_us">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_about.jpg" name="btn_About_Us" class="qm-is" id="btn_About_Us" onmouseover="MM_swapImage('btn_About_Us','','/Assets/182/Images/btn_about_over.jpg',1)"
						     onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_about_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/clubs">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_clubs.jpg" name="btn_Clubs" class="qm-is" id="btn_Clubs" onmouseover="MM_swapImage('btn_Clubs','','/Assets/182/Images/btn_clubs_over.jpg',1)"
						     onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_clubs_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/valucard/apply_online/">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_valucard.jpg" name="btn_ValuCard" class="qm-is" id="btn_ValuCard" onmouseover="MM_swapImage('btn_ValuCard','','/Assets/182/Images/btn_valucard_over.jpg',1)"
						     onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_valucard_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/our_brands">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_brands.jpg" name="btn_Our_Brands" class="qm-is" id="btn_Our_Brands"
						     onmouseover="MM_swapImage('btn_Our_Brands','','/Assets/182/Images/btn_brands_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_brands_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/departments">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_departments.jpg" name="btn_Departments" class="qm-is" id="btn_Departments"
						     onmouseover="MM_swapImage('btn_Departments','','/Assets/182/Images/btn_departments_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_departments_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/community">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_community.jpg" name="btn_Community" class="qm-is" id="btn_Community"
						     onmouseover="MM_swapImage('btn_Community','','/Assets/182/Images/btn_community_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_community_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/plan_a_party">
						<img qmvafter="1" style="visibility: inherit;" src="/Assets/182/Images/btn_party.jpg" name="btn_Plan-a-party" class="qm-is" id="btn_Plan-a-party"
						     onmouseover="MM_swapImage('btn_Plan-a-party','','/Assets/182/Images/btn_party_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_party_over.jpg" align="left" border="0"/>
					</a>
					<a class="qmparent" href="http://www.foodcity.com/news_and_press_room">
						<img qmvafter="1" width="145" height="32" style="visibility: inherit;" src="/Assets/182/Images/btn_press2.jpg" name="btn_Press_room" class="qm-is" id="btn_Press_room"
						     onmouseover="MM_swapImage('btn_Press_room','','/Assets/182/Images/btn_press2_over.jpg',1)" onmouseout="MM_swapImgRestore();" over="/Assets/182/Images/btn_press2_over.jpg" align="left" border="0"/>
					</a>
					<span class="qmclear">
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Header.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
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