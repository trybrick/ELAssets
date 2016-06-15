<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

		<xsl:template match="/">
		<script language="javascript" id="jsImage" type="text/javascript">
			<xsl:comment>
				<![CDATA[
					var _oCurrentDiv = null;

					function swapDIV(show)
					{
			    		var _oNewDiv = new Object();
			    		_oNewDiv = document.getElementById(show);
						_oNewDiv.style.display = "";

						if (_oCurrentDiv == null)
						{
							_oCurrentDiv = document.getElementById('AboutUsMain');
						}

						if (_oCurrentDiv != null)
						{
							_oCurrentDiv.style.display = "none";
						}
						_oCurrentDiv = _oNewDiv;
					}

					function swapImage() 
					{ 
						var i,j=0,x,a=swapImage.arguments;
						document.sr=new Array; 
						for(i=0;i<(a.length-2);i+=3)
						if ((x=findObj(a[i]))!=null)
						{
							document.sr[j++]=x; 
							if(!x.oSrc) x.oSrc=x.src; x.src='##root##/Assets/##chainid##/Images/'+a[i+2];
						}
					}

					function findObj(n, d) 
					{
						var p,i,x;  
						if(!d) d=document; 
						if((p=n.indexOf("?"))>0&&parent.frames.length) 
						{
							d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
						}
						if(!(x=d[n])&&d.all) x=d.all[n]; 
						for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
						for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=findObj(n,d.layers[i].document);
					  	if(!x && d.getElementById) x=d.getElementById(n); 
						return x;
					}
				]]>
			</xsl:comment>
		</script>

		<div id="about">
			<div id="AboutUsMain">
				<img height="503" width="750" useMap="#m_about_us_home" border="0">
					<xsl:attribute name="src">
						##root##/Assets/<xsl:value-of select="//GenericChain/ChainID"/>/Images/<xsl:value-of select="ExpressLane/AboutUsContent/MainImage"/>
					</xsl:attribute>
				</img>

				<map name="m_about_us_home">
					<area shape="POLY" coords="414,460,434,269,686,297,666,488,414,460" href="javascript:swapDIV('AboutUsRiverFalls');" />
					<area shape="POLY" coords="251,128,525,114,536,277,435,270,433,283,261,292,251,128" href="javascript:swapDIV('AboutUsAmery');" />
					<area shape="RECT" coords="240,402,328,421" target="_blank" href="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=1121+S+Main+St+River+Falls+WI+54022&amp;btnG=Search" />
					<area shape="RECT" coords="136,237,223,256" target="_blank" href="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=1050+Riverplace%20Ml+Amery+WI+54001&amp;btnG=Search" />
				</map>
			</div>

			<div id="AboutUsAmery" style="display: none">
				<table cellSpacing="0" cellPadding="0" width="820" border="0">
					<tbody>
						<tr>
							<td><img src="/Assets/Common/Images/pixel.gif" height="1" width="187" border="0" /></td>
							<td><img src="/Assets/Common/Images/pixel.gif" height="1" width="633" border="0" /></td>
							<td><img src="/Assets/Common/Images/pixel.gif" height="1" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img name="about_us_amery_r1_c1" src="##root##/Assets/##chainid##/Images/about_us_amery_r1_c1.jpg" height="35" width="187" border="0" alt="" /></td>
							<td rowSpan="9"><img name="about_us_amery_r1_c2" src="##root##/Assets/##chainid##/Images/about_us_amery_r1_c2.jpg" height="549" width="633" border="0" /></td>
							<td><img name="spacer.gif" src="/Assets/Common/Images/pixel.gif" height="35" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img src="##root##/Assets/##chainid##/Images/about_us_amery_r2_c1.jpg" height="32" width="187" useMap="#m_about_us_amery_r2_c1" border="0" name="about_us_amery_r2_c1" /></td>
							<td><img src="/Assets/Common/Images/pixel.gif" height="32" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="32" src="##root##/Assets/##chainid##/Images/about_us_amery_r3_c1.jpg" width="187" useMap="#m_about_us_amery_r3_c1" border="0" name="about_us_amery_r3_c1" /></td>
							<td><img height="32" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="33" src="##root##/Assets/##chainid##/Images/about_us_amery_r4_c1.jpg" width="187" useMap="#m_about_us_amery_r4_c1" border="0" name="about_us_amery_r4_c1" /></td>
							<td><img height="33" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="34" src="##root##/Assets/##chainid##/Images/about_us_amery_r5_c1.jpg" width="187" useMap="#m_about_us_amery_r5_c1" border="0" name="about_us_amery_r5_c1" /></td>
							<td><img height="34" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="31" src="##root##/Assets/##chainid##/Images/about_us_amery_r6_c1.jpg" width="187" useMap="#m_about_us_amery_r6_c1" border="0" name="about_us_amery_r6_c1" /></td>
							<td><img height="31" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="33" src="##root##/Assets/##chainid##/Images/about_us_amery_r7_c1.jpg" width="187" useMap="#m_about_us_amery_r7_c1" border="0" name="about_us_amery_r7_c1" /></td>
							<td><img height="33" src="##root##/Assets/common/Images/spacer.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="32" src="##root##/Assets/##chainid##/Images/about_us_amery_r8_c1.jpg" width="187" useMap="#m_about_us_amery_r8_c1" border="0" name="about_us_amery_r8_c1" /></td>
							<td><img height="32" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="287" src="##root##/Assets/##chainid##/Images/about_us_amery_r9_c1.jpg" width="187" useMap="#m_about_us_amery_r9_c1" border="0" name="about_us_amery_r9_c1" /></td>
							<td><img height="287" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td colSpan="2"><img height="1" src="##root##/Assets/##chainid##/Images/about_us_amery_r10_c1.jpg" width="820" border="0" name="about_us_amery_r10_c1" /></td>
							<td><img height="1" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>

						<map name="m_about_us_amery_r2_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg','about_us_amery_r2_c1','','about_us_amery_r2_c1.jpg',1);"  onmouseover="swapImage('about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg','about_us_amery_r2_c1','','about_us_amery_r2_c1_f2.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r3_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_amery_r3_c1','','about_us_amery_r3_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r3_c1','','about_us_amery_r3_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f3.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r4_c1">
							<area shape="rect" coords="0,32,187,67" href="#" alt="" 
							onmouseout="swapImage('about_us_amery_r5_c1','','about_us_amery_r5_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  
							onmouseover="swapImage('about_us_amery_r5_c1','','about_us_amery_r5_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f5.jpg',1);" />
							<area shape="rect" coords="0,0,187,33" href="#" alt="" onmouseout="swapImage('about_us_amery_r4_c1','','about_us_amery_r4_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  
							onmouseover="swapImage('about_us_amery_r4_c1','','about_us_amery_r4_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f4.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r5_c1">
							<area shape="rect" coords="0,-1,187,34" href="#" alt="" onmouseout="swapImage('about_us_amery_r5_c1','','about_us_amery_r5_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r5_c1','','about_us_amery_r5_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f5.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r6_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_amery_r6_c1','','about_us_amery_r6_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r6_c1','','about_us_amery_r6_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f6.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r7_c1">
							<area shape="rect" coords="0,32,187,65" href="#" alt="" onmouseout="swapImage('about_us_amery_r8_c1','','about_us_amery_r8_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r8_c1','','about_us_amery_r8_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f8.jpg',1);" />
							<area shape="rect" coords="0,1,187,33" href="#" alt="" onmouseout="swapImage('about_us_amery_r7_c1','','about_us_amery_r7_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r7_c1','','about_us_amery_r7_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f7.jpg',1);" />
							<area shape="rect" coords="0,-31,187,1" href="#" alt="" onmouseout="swapImage('about_us_amery_r6_c1','','about_us_amery_r6_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r6_c1','','about_us_amery_r6_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f6.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r8_c1">
							<area shape="rect" coords="0,-1,187,32" href="#" alt="" onmouseout="swapImage('about_us_amery_r8_c1','','about_us_amery_r8_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r8_c1','','about_us_amery_r8_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f8.jpg',1);" />
						</map>
						<map name="m_about_us_amery_r9_c1">
							<area shape="rect" coords="0,32,187,99" href="##root##/Contact/AboutUs.aspx" alt="" onmouseout="swapImage('about_us_amery_r9_c1','','about_us_amery_r9_c1.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_amery_r9_c1','','about_us_amery_r9_c1_f2.jpg','about_us_amery_r1_c2','','about_us_amery_r1_c2_f2.jpg',1);" />
						</map>
					</tbody>
				</table>
			</div>

			<div id="AboutUsRiverFalls" style="display: none">
				<table cellSpacing="0" cellPadding="0" width="820" border="0">
					<tbody>
						<tr>
							<td><img height="1" src="/Assets/Common/Images/pixel.gif" width="187" border="0" /></td>
							<td><img height="1" src="/Assets/Common/Images/pixel.gif" width="633" border="0" /></td>
							<td><img height="1" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img name="about_us_riverfalls_r1_c1" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r1_c1.jpg" height="35" width="187" border="0" /></td>
							<td rowSpan="9"><img name="about_us_riverfalls_r1_c2" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r1_c2.jpg" height="549" width="633" border="0" /></td>
							<td><img src="/Assets/Common/Images/pixel.gif" height="35" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="32" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r2_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r2_c1" border="0" name="about_us_riverfalls_r2_c1" /></td>
							<td><img height="32" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="32" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r3_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r3_c1" border="0" name="about_us_riverfalls_r3_c1" /></td>
							<td><img height="32" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="33" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r4_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r4_c1" border="0" name="about_us_riverfalls_r4_c1" /></td>
							<td><img height="33" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="34" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r5_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r5_c1" border="0" name="about_us_riverfalls_r5_c1" /></td>
							<td><img height="34" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="31" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r6_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r6_c1" border="0" name="about_us_riverfalls_r6_c1" /></td>
							<td><img height="31" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="33" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r7_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r7_c1" border="0" name="about_us_riverfalls_r7_c1" /></td>
							<td><img height="33" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="32" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r8_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r8_c1" border="0" name="about_us_riverfalls_r8_c1" /></td>
							<td><img height="32" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td><img height="287" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r9_c1.jpg" width="187" useMap="#m_about_us_riverfalls_r9_c1" border="0" name="about_us_riverfalls_r9_c1" /></td>
							<td><img height="287" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>
						<tr>
							<td colSpan="2"><img height="1" src="##root##/Assets/##chainid##/Images/about_us_riverfalls_r10_c1.jpg" width="820" border="0" name="about_us_riverfalls_r10_c1" /></td>
							<td><img height="1" src="/Assets/Common/Images/pixel.gif" width="1" border="0" /></td>
						</tr>

						<map name="m_about_us_riverfalls_r2_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg','about_us_riverfalls_r2_c1','','about_us_riverfalls_r2_c1.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg','about_us_riverfalls_r2_c1','','about_us_riverfalls_r2_c1_f2.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r3_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r3_c1','','about_us_riverfalls_r3_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r3_c1','','about_us_riverfalls_r3_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f3.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r4_c1">
							<area shape="rect" coords="0,32,187,67" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r5_c1','','about_us_riverfalls_r5_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r5_c1','','about_us_riverfalls_r5_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f5.jpg',1);" />
							<area shape="rect" coords="0,0,187,33" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r4_c1','','about_us_riverfalls_r4_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r4_c1','','about_us_riverfalls_r4_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f4.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r5_c1">
							<area shape="rect" coords="0,-1,187,34" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r5_c1','','about_us_riverfalls_r5_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r5_c1','','about_us_riverfalls_r5_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f5.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r6_c1">
							<area shape="rect" coords="0,0,187,32" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r6_c1','','about_us_riverfalls_r6_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r6_c1','','about_us_riverfalls_r6_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f6.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r7_c1">
							<area shape="rect" coords="0,32,187,65" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r8_c1','','about_us_riverfalls_r8_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r8_c1','','about_us_riverfalls_r8_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f8.jpg',1);" />
							<area shape="rect" coords="0,1,187,33" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r7_c1','','about_us_riverfalls_r7_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r7_c1','','about_us_riverfalls_r7_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f7.jpg',1);" />
							<area shape="rect" coords="0,-31,187,1" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r6_c1','','about_us_riverfalls_r6_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r6_c1','','about_us_riverfalls_r6_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f6.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r8_c1">
							<area shape="rect" coords="0,-1,187,32" href="#" alt="" onmouseout="swapImage('about_us_riverfalls_r8_c1','','about_us_riverfalls_r8_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r8_c1','','about_us_riverfalls_r8_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f8.jpg',1);" />
						</map>
						<map name="m_about_us_riverfalls_r9_c1">
							<area shape="rect" coords="0,34,187,99" href="##root##/Contact/AboutUs.aspx" alt="" onmouseout="swapImage('about_us_riverfalls_r9_c1','','about_us_riverfalls_r9_c1.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2.jpg',1);"  onmouseover="swapImage('about_us_riverfalls_r9_c1','','about_us_riverfalls_r9_c1_f2.jpg','about_us_riverfalls_r1_c2','','about_us_riverfalls_r1_c2_f2.jpg',1);" />
						</map>

					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\Dick's Fresh Market&#x2D;AboutUs.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->