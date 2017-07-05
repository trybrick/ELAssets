<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:import href="/Assets/Common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:variable name="SpacerURL" select="'https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/spacer.gif'"/>

	<xsl:template match="/">
		<!-- EXACT TARGET CODE FOR MAIN -->
		<xsl:call-template name="ExactTargetScript_Personalized"/>

		<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="font-family: Arial, helvetica, sans-serif; font-size: 12px; color: #666;">
			<style>
				#email-coupon-img { height: 60px; width: 110px; overflow:hidden;}
			</style>
		
			<table width="728" height="1307" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="142" scope="col">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<th scope="col">
					<table width="720" border="0" cellpadding="0" cellspacing="0">
					   <tr>
					   <td width="24"></td>
					   <td width="429">
					  <table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
						<tr>
						  <td colspan="2" scope="col">
							<img src="https://upload.brickinc.net/elvs/Common/cliptop_1.jpg" width="429" height="83" style="display:block;"  border="0"/>
						  </td>
						</tr>
						<tr>
						  <td rowspan="2">
							<img src="https://upload.brickinc.net/elvs/Common/cliptop_l.jpg" width="53" height="129" style="display:block;"  border="0"/>
						  </td>
						  <td valign="top">
							<img src="##root##/Assets/##chainid##/images/headerlogo.gif" height="75" style="display:block; height: 75px; max-width: 365px;"  border="0"/>
						  </td>
						  </tr>
						<tr>
						  <td>
							<table>
								<tr>
									<td>
										<img src="https://upload.brickinc.net/elvs/Common/mini_coupon.jpg" style="display:block;"  border="0"/>
									</td>
									<td>
										<table>
											<tr>
												<td align="left">
													<xsl:call-template name="CouponsTeaser"/>
												</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:call-template name="YoutechCouponsTeaser"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						  </td>
						  </tr>
						</table>
						</td>
						<td width="298">
					  <table width="289" height="50" border="0" align="left" cellpadding="0" cellspacing="0">
						<tr>
						  <th colspan="2" scope="col">
							<img src="https://upload.brickinc.net/elvs/Common/cliptop_2.jpg" width="298" height="104" style="display:block;"  border="0" align="left"/>
						  </th>
						</tr>
						<tr>
						  <td width="244" align="right">
							<center><font face="Arial, Helvetica, sans-serif" color="#4775b6" size="2">Hello, 
									<xsl:call-template name="ExactTargetRetrieve_FirstName" /></font>
								<br/>
							<a href="##root##/Profile/SignIn.aspx"><img src="https://upload.brickinc.net/elvs/Common/SignIn.jpg" alt="Sign In" style="display:block;"  border="0"/></a>
							<a href="##root##/Shop/WeeklyAd.aspx">
							<img src="https://upload.brickinc.net/elvs/Common/viewAd.jpg" style="display:block;"  border="0"/>
							</a>
							</center>
						  </td>
						  <td>
							<img src="https://upload.brickinc.net/elvs/Common/cliptop_r.jpg" width="46" height="108" align="right" style="display:block;"  border="0"/>
						  </td>
						  </tr>
					  </table>
					   </td>
						<td width="23"></td>
						</tr>
					  </table>
					  
					  </th>
					</tr>
				</table></td>
			  </tr>
			  <tr>
				<td align="center">
				<xsl:call-template name="ExactTargetRetrieve_StoreContent"/>  
					
				<!-- 	<img src="http://assets.gsngrocers.com/assets/common/emailtemplates/dailyemailclipboard/images/GrocersContent.jpg" align="middle" width="680" style="display:block;"  border="0"/>-->
				</td>
			  </tr>
			  <tr>
				<td height="72">
				
				<table width="710" border="0" align="center" cellpadding="0" cellspacing="0">
				  
				  <tr>
					<td width="28%" rowspan="2" scope="col">
						<img src="https://upload.brickinc.net/elvs/Common/Featured_Items_Tag.jpg" width="207" height="71" align="right" style="display:block;"  border="0"/>
					</td>
					<td width="72%" height="50" scope="col" style="font-size: 12px;" valign="bottom">
						<xsl:variable name="sdate" select="//StoreCircularSummary/StartDate"/>
						<xsl:variable name="edate" select="//StoreCircularSummary/EndDate"/>
						<xsl:variable name="StartDate" select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
						<xsl:variable name="EndDate" select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
						<xsl:variable name="EffectiveDates" select="concat($StartDate, ' - ', $EndDate)"/> 

						<xsl:variable name="DisplayText" select="concat('Ad Prices Valid From ', $EffectiveDates)" />

						<font face="Arial, Helvetica, sans-serif" color="#666666" size="1">
							<xsl:value-of select="$DisplayText"/>
						</font>
					</td>
				  </tr>
				  <tr>
					<td valign="bottom">
						<img src="https://upload.brickinc.net/elvs/Common/Featured_topr.jpg" width="520" height="16" align="left" style="display:block;"  border="0"/>
					</td>
				  </tr>
				</table></td>
			  </tr>
			  <tr>
				<td height="105">
				
				<table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="3%" rowspan="2" scope="col">
						<img src="https://upload.brickinc.net/elvs/Common/Featured_L.jpg" width="19" height="154" style="display:block;"  border="0"/></td>
					<td width="94%" height="138" scope="col">
						<xsl:call-template name="ExactTargetRetrieve_PersonalizedContent"/>   
					</td>
					<td width="3%" rowspan="2" scope="col"><img src="https://upload.brickinc.net/elvs/Common/Featured_r.jpg" width="23" height="154" style="display:block;"  border="0"/></td>
				  </tr>
				  <tr>
					<td valign="bottom" scope="col"><img src="https://upload.brickinc.net/elvs/Common/featured_bottom_17.jpg" width="685" height="10" align="bottom" style="display:block;"  border="0"/></td>
				  </tr>
				</table>
				
				</td>
			  </tr>
			  <tr>
				<td>
				<table width="677" height="30" border="0" align="center" cellpadding="0" cellspacing="5">
					<tr>
					  <td>
						<xsl:call-template name="WeeklyAd"/> 
					 </td>
					  <td>
						<xsl:call-template name="Coupons"/>  
					  </td>
					  <td>
						<xsl:call-template name="FeaturedRecipe"/> 
					  </td>
					  <td>
						<xsl:call-template name="FeaturedVideo"/> 
					  </td>
					</tr>
				</table></td>
			  </tr>
			  <!--
			  <tr>
				<td height="90" align="center" bgcolor="#999999">Ad Here</td>
			  </tr> 
			  -->
			  <tr>
				<td>
				<table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="59" rowspan="2" valign="bottom" scope="col">
						<img src="https://upload.brickinc.net/elvs/Common/footer_left.jpg" width="45" height="181" align="bottom" style="display:block;"  border="0"/>
					</td>
					<td width="618" height="130" scope="col" align="center" style="font-size: 12px;">
						<xsl:variable name="ChainEmailAddress">
							<xsl:choose>
								<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value) &gt; 0">
									<xsl:value-of select="concat(//GenericChain/ChainSettings/Setting[Name='DatranEmailFromAddress']/Value, '@grocerywebsites.com')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>gsn@grocerywebsites.com</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="UnsubscribeLink" select="concat(//GenericChain/PreferedHost, '/Profile/Unsubscribe.aspx?ConsumerID=%%= v(@consumerid) =%%')" />
						
						<table align="center">
							<xsl:call-template name="SocialFooterIcons"/>
						</table>
						
						<p>
							<a href="{$UnsubscribeLink}">Unsubscribe</a> 
							| <a href="##root##/Profile/PrivacyPolicy.aspx">Privacy Policy</a> 
							| <a href="##root##/Contact">Contact Us</a> 
							| <a href="##root##/Profile/SignIn.aspx">Sign In to Your Account</a>
						</p>
						<p>NOTE: To ensure delivery to your inbox (not bulk or junk folders), please add <xsl:value-of select="$ChainEmailAddress"/> to your address book or safelist.</p>
						<p>Email News is an opt-in, recurring email from <xsl:value-of select="//GenericChain/ChainName"/>.  This email address was obtained through email sign-up on our website located at <a href="{//GenericChain/PreferedHost}"><xsl:value-of select="//GenericChain/PreferedHost"/></a></p>
					</td>
					<td width="43" rowspan="2" valign="bottom" scope="col">
						<img src="https://upload.brickinc.net/elvs/Common/footer_right.jpg" width="48" height="181" align="bottom" style="display:block;"  border="0"/>
					</td>
				  </tr>
				  <tr>
					<td valign="bottom">
						<img src="https://upload.brickinc.net/elvs/Common/footer_bottom.jpg" width="634" height="38" align="bottom" style="display:block;"  border="0"/>
					</td>
					</tr>
				</table></td>
			  </tr>
			</table>
			<xsl:text disable-output-escaping="yes"><![CDATA[<custom name="opencounter" type="tracking" />]]></xsl:text>
		</body>
	</xsl:template>


<!-- XSL Templates -->
	<xsl:template name="CouponsTeaser">
		<a href="##root##/Shop/Coupons.aspx" style="text-decoration:none; color:black; font-size: 14px; font-style: italic;">
			<b>
				<i>
					<font face="Arial, Helvetica, sans-serif" color="#cc0000">##manufacturercoupontotalsavings##</font>
				</i>
			</b> 
			<font face="Arial, Helvetica, sans-serif"><i><xsl:text> in Printable Coupons</xsl:text></i></font>
		</a>
	</xsl:template>

	<xsl:template name="YoutechCouponsTeaser">
		<a href="##root##/CardLoadableValues.aspx" style="text-decoration:none; color:black; font-size: 14px; font-style: italic;">
			<b>
				<i>
					<font face="Arial, Helvetica, sans-serif" color="#cc0000">##youtechcoupontotalsavings##</font>
				</i>
			</b> 
			<font face="Arial, Helvetica, sans-serif"><i><xsl:text> in Card Loadable Coupons</xsl:text></i></font>
		</a>
	</xsl:template>


<!--Pods -->
	<xsl:template name="WeeklyAd">
		<!-- weeklyadpreview_roundys.xsl -->
		<xsl:call-template name="ExactTargetRetrieve_WeeklyAdContent"/> 
	</xsl:template> 
	
	<xsl:template name="PodTemplate">
		<xsl:param name="headerImage" />
		<xsl:param name="bodyContent" />
		<xsl:param name="destination" />
		
		<table width="168" height="181" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3">
					<img src="{$headerImage}" width="168" height="45" style="display:block;"  border="0"/>
				</td>
			</tr>
			<tr>
				<td width="10" bgcolor="#E8E6CF">
					<img src="https://upload.brickinc.net/elvs/Common/pod_left.jpg" width="10" height="112" style="display:block;"  border="0"/>				
				</td>
				<td width="180" bgcolor="#E8E6CF" align="center" valign="top">
					<xsl:choose>
						<xsl:when test="$bodyContent = 'Coupons'">
							<a href="{$destination}" style="text-decoration:none;">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="2">
									<i>
										<font color="#cc0000" size="3">
												<b>##manufacturercoupontotalsavings##</b>
										</font><br/>
										in Printable Coupons
									</i>
								</font>
							</a>
							<p></p>
							<a href="##root##/CardLoadableCoupons.aspx" style="text-decoration:none;">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="2">
									<i>
										<font color="#cc0000" size="3">
												<b>##youtechcoupontotalsavings##</b>
										</font><br/>
										in Card Loadable Coupons
									</i>
								</font>
							</a>
						</xsl:when>
						<xsl:when test="$bodyContent = 'FeaturedRecipe'">
							<div style="width: 120px; height: 100px; overflow:hidden;">
								<a href="{$destination}">
									<img src="{//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL}" border="0" alt="Featured Recipe: {//RecipeData/GenericRecipe/Title}" style="display:block;" width="100"/>
								</a>
							</div>
						</xsl:when>
						<xsl:when test="$bodyContent = 'FeaturedVideo'">
							<a href="{$destination}">
								<xsl:choose>
									<xsl:when test="string-length(//Video/ThumbNail) &gt; 0">
										<img src="{//Video/ThumbNail}" border="0" alt="Featured Video" style="display:block;" width="120"/>
									</xsl:when>
									<xsl:otherwise>
										<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podFeatVid.jpg" border="0" alt="Featured Video" style="display:block;" width="120"/>
									</xsl:otherwise>
								</xsl:choose>
							</a>
						</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</td>
				<td width="10" bgcolor="#E8E6CF">
					<img src="https://upload.brickinc.net/elvs/Common/pod_right.jpg" width="10" height="112" style="display:block;"  border="0"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$destination}">
						<img src="https://upload.brickinc.net/elvs/Common/pod_bottom.jpg" width="168" height="25" style="display:block;"  border="0"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
		
	<xsl:template name="Coupons">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_coup.jpg'" />
			<xsl:with-param name="destination" select="'##root##/Shop/Coupons.aspx'" />
			<xsl:with-param name="bodyContent" select="'Coupons'" />
		</xsl:call-template>
	</xsl:template> 
	
	<xsl:template name="FeaturedRecipe">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_recipe.jpg'" />
			<xsl:with-param name="destination" select="concat('##root##/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)" />
			<xsl:with-param name="bodyContent" select="'FeaturedRecipe'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="FeaturedVideo">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_video.jpg'" />
			<xsl:with-param name="destination" select="'##root##/Recipes/RecipeVideos.aspx'" />
			<xsl:with-param name="bodyContent" select="'FeaturedVideo'" />
		</xsl:call-template>
	</xsl:template> 
		
	<xsl:template name="SocialFooterIcons">
		<xsl:variable name="FacebookUrl" select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value"/>
		<xsl:variable name="FacebookIcon" select="//GenericChain/ChainSettings/Setting[SettingID=267]/Value"/>
		<xsl:variable name="TwitterUrl" select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
		<xsl:variable name="TwitterIcon" select="//GenericChain/ChainSettings/Setting[SettingID=269]/Value"/>
		<tr>
        	<td>
        		<xsl:if test="string-length($FacebookUrl) &gt; 0">
        			<a id="headerFBIcon" href="{$FacebookUrl}" target="_blank">
						<img alt="Facebook" style="display:block;" border="0">
							<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/fbIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
        	</td>
        	<td>
        		<xsl:if test="string-length($TwitterUrl) &gt; 0">
					<a id="headerTWIcon" href="{$TwitterUrl}" target="_blank">
						<img alt="Twitter" style="display:block;" border="0">
						<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/twIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
        	</td>
        	<td>
        		<xsl:if test="(string-length($TwitterUrl) &gt; 0) or (string-length($FacebookUrl) &gt; 0)" >
        			<img alt="Follow Us Online" style="display:block;" border="0">
        				<xsl:attribute name="src">https://upload.brickinc.net/elvs/assets/common/emailtemplates/dailyemailclipboard/images/followUs.jpg</xsl:attribute> 
        			</img>
        		</xsl:if>
        	</td>
        </tr>
	</xsl:template>
</xsl:stylesheet>