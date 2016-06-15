<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:import href="/Assets/Common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:variable name="SpacerURL" select="'http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/spacer.gif'"/>

	<xsl:template match="/">
		<!-- EXACT TARGET CODE FOR MAIN -->
		<xsl:call-template name="ExactTargetScript_NonPersonalized"/>

		<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="font-family: Arial, helvetica, sans-serif; font-size: 12px; color: #666;">
			<style>
				#email-coupon-img { height: 60px; width: 110px; overflow:hidden;}
			</style>

        
        <table width="730" border="0" align="center" cellpadding="0" cellspacing="0" style="background-repeat: no-repeat; background-position: center top;" background="http://upload.gsngrocers.com/elvs/Common/clipBoard_header.jpg">
            <tr height="70"><td></td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td height="10">
                                
                                <table>
                                    <tr>
                                        <td width="60"> 
                                        </td>
                                        <td valign="top" width="350">
                                            <table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="2">
                                                        <img src="http://upload.gsngrocers.com/elvs/VirtualStore/Content/custom/themes/##chainid##/logoMail.png" height="100" style="display:block; height: 100px; width: 300px;"  border="0"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="50">
                                                    <img src="http://upload.gsngrocers.com/elvs/Common/mini_coupon.jpg" style="display:block;"  border="0"/>
                                                    </td>
                                                    <td>
                                                        <xsl:call-template name="CouponsTeaser"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="260" align="right"><br/><br/>
                                            <center><font face="Arial, Helvetica, sans-serif" color="#4775b6" size="2"><b>Hello, 
                                                    <xsl:call-template name="ExactTargetRetrieve_FirstName" /></b></font>
                                                <br/>
                                            <a href="##root##/Account/Login"><img src="http://upload.gsngrocers.com/elvs/Common/SignIn.jpg" alt="Sign In" style="display:block;"  border="0"/></a>
                                            <a href="##root##/Circulars">
                                            <img src="http://upload.gsngrocers.com/elvs/Common/viewAd.jpg" style="display:block;"  border="0"/>
                                            </a>
                                            </center>
                                        </td>
                                        <td width="60">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td >
                    <table>
                        <tr>
                            <td width="40">
                            </td>
                            <td align="center">
                                <xsl:call-template name="ExactTargetRetrieve_StoreContent"/>  
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
				<td height="30">
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
                    </table>
                </td>
			</tr>
            <tr>
                <td>
                    <table> 
                        <tr>
                            <td width="59" height="181">
                            </td>
                                                        <td width="618" scope="col" align="center" valign="top" style="font-size: 12px;">
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
                                    <a href="##root##/Account/Manage">Manage Account and Unsubscribe</a> 
                                    | <a href="##root##/Privacy">Privacy Policy</a> 
                                    | <a href="##root##/Home/ContactUs">Contact Us</a> 
                                    | <a href="##root##/Account/Login">Sign In to Your Account</a>
                                </p>
                                <p>NOTE: To ensure delivery to your inbox (not bulk or junk folders), please add <xsl:value-of select="$ChainEmailAddress"/> to your address book or safelist.</p>
                                <p>Email News is an opt-in, recurring email from <xsl:value-of select="//GenericChain/ChainName"/>.  This email address was obtained through email sign-up on our website located at <a href="{//GenericChain/PreferedHost}"><xsl:value-of select="//GenericChain/PreferedHost"/></a></p>
                            </td>

                            <td width="53">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            	<td>
                	<img src="http://upload.gsngrocers.com/elvs/Common/clipBoard_footer.jpg"/>
                </td>
            </tr>

        </table>
            
			<xsl:text disable-output-escaping="yes"><![CDATA[<custom name="opencounter" type="tracking" />]]></xsl:text>
		</body>
	</xsl:template>


<!-- XSL Templates -->
	<xsl:template name="CouponsTeaser">
		<a href="##root##/Coupons" style="text-decoration:none; color:black; font-size: 14px; font-style: italic;">
			<b>
				<i>
					<font face="Arial, Helvetica, sans-serif" color="#cc0000" size="5">##manufacturercoupontotalsavings##</font>
				</i>
			</b> 
			<font face="Arial, Helvetica, sans-serif"><b><i><xsl:text> in Coupon Savings!</xsl:text></i></b></font>
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
					<img src="http://upload.gsngrocers.com/elvs/Common/pod_left.jpg" width="10" height="112" style="display:block;"  border="0"/>				
				</td>
				<td width="180" bgcolor="#E8E6CF" align="center">
					<xsl:choose>
						<xsl:when test="$bodyContent = 'Coupons'">
							<a href="{$destination}" style="text-decoration:none;">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="3">
									<i>You Could Save
										<br/>
										<b><font color="#cc0000" size="5">
												##manufacturercoupontotalsavings##
											</font><br/>
											This Week!
										</b>
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
										<img src="http://upload.gsngrocers.com/elvs/Assets/Common/EmailTemplates/DailyEmail/images/podFeatVid.jpg" border="0" alt="Featured Video" style="display:block;" width="120"/>
									</xsl:otherwise>
								</xsl:choose>
							</a>
						</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</td>
				<td width="10" bgcolor="#E8E6CF">
					<img src="http://upload.gsngrocers.com/elvs/Common/pod_right.jpg" width="10" height="112" style="display:block;"  border="0"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$destination}">
						<img src="http://upload.gsngrocers.com/elvs/Common/pod_bottom.jpg" width="168" height="25" style="display:block;"  border="0"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
		
	<xsl:template name="Coupons">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_coup.jpg'" />
			<xsl:with-param name="destination" select="'##root##/Coupons'" />
			<xsl:with-param name="bodyContent" select="'Coupons'" />
		</xsl:call-template>
	</xsl:template> 
	
	<xsl:template name="FeaturedRecipe">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_recipe.jpg'" />
			<xsl:with-param name="destination" select="concat('##root##/RecipeCenter/Recipe/', //RecipeData/GenericRecipe/RecipeID)" />
			<xsl:with-param name="bodyContent" select="'FeaturedRecipe'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="FeaturedVideo">
		<xsl:call-template name="PodTemplate">
			<xsl:with-param name="headerImage" select="'http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/podtop_video.jpg'" />
			<xsl:with-param name="destination" select="'##root##/RecipeCenter/RecipeVideo'" />
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
							<xsl:attribute name="src">http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/fbIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
        	</td>
        	<td>
        		<xsl:if test="string-length($TwitterUrl) &gt; 0">
					<a id="headerTWIcon" href="{$TwitterUrl}" target="_blank">
						<img alt="Twitter" style="display:block;" border="0">
						<xsl:attribute name="src">http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/twIcon.jpg</xsl:attribute>
						</img>
					</a>
				</xsl:if>
        	</td>
        	<td>
        		<xsl:if test="(string-length($TwitterUrl) &gt; 0) or (string-length($FacebookUrl) &gt; 0)" >
        			<img alt="Follow Us Online" style="display:block;" border="0">
        				<xsl:attribute name="src">http://upload.gsngrocers.com/elvs/assets/common/emailtemplates/dailyemailclipboard/images/followUs.jpg</xsl:attribute> 
        			</img>
        		</xsl:if>
        	</td>
        </tr>
	</xsl:template>
</xsl:stylesheet>