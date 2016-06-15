<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<!--<xsl:import href="../../EmailTemplates/ExactTargetScripts.xsl"/>-->
<xsl:output method="html" encoding="UTF-8"/>
<xsl:key name="meals-by-date" match="//MealPlannerList/MealPlanner" use="DisplayDate"/>
<xsl:template match="/">
    <xsl:variable name="ConsumerID" select="/ExpressLane/GenericChain/ConsumerID" />
    <xsl:variable name="SpacerImage" select="'##root##/Assets/Common/EmailTemplates/ThankYou/images/spacer.gif'" />
	<xsl:variable name="HeaderImage" select="'##root##/Assets/##chainid##/images/email_thankyou_header.jpg'" />
    <xsl:variable name="HasCoupons" select="string-length(//GenericChain/ManufacturerCouponSiteCode) &gt; 0" />
    
    <!-- EXACT TARGET CODE FOR MAIN -->
	<!--<xsl:call-template name="ExactTargetScript_NonPersonalized" /> -->
        
    <body bgcolor="#f2f2f0" topmargin="25" rightmargin="0" bottommargin="0" leftmargin="150">
    <style type="text/css">
	<xsl:comment>
		body {background:#f2f2f0;}
		a:link,a:visited,a:active {color:#5aa4ca;text-decoration:underline;}
		a:hover {color:#0f616d;text-decoration:underline;}
		a.ulink,a:visited.ulink,a:active.ulink {color:#414141;text-decoration:none;font-size:11px;}
		a:hover.ulink {color:#414141;text-decoration:underline;}
		td,tr,table,img,br {margin:0!imporant;padding:0!imporant;border:0!imporant;}
	</xsl:comment>
	</style>
	<table id="Outer" width="539" border="0" cellpadding="0" cellspacing="0" bgcolor="#f2f2f0">
		<tr>
			<td>
       	  <table id="Header" width="539" border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="30"><img src="{$SpacerImage}" width="30" height="1"/></td>
                    	<td width="240"><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">Welcome to <xsl:value-of select="//ChainName"/>!</font></td>
                        <td width="240" align="right"><br /><font face="Arial, Helvetica, sans-serif"  size="1"><a class="ulink" href="##root##/Profile/SignIn.aspx">Sign-in Here</a></font></td>
                        <td width="30"><img src="{$SpacerImage}" width="30" height="1"/></td>
                    </tr>
                    <tr>
                    	<td height="5" colspan="4"><img src="{$SpacerImage}" width="1" height="5"/></td>
                    </tr>
                    <tr>
                       	<td colspan="4"><img width="539" height="165" src="{$HeaderImage}" /></td>
                    </tr>
                </table>
                <table id="Body" width="539" border="0" cellpadding="0" cellspacing="0">
               	  <tr>
                    	<td>
                        	<table id="Welcome" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="20" bgcolor="#FFFFFF"><img src="{$SpacerImage}" width="20" height="1"/></td>
                                    <td width="460" bgcolor="#FFFFFF"><br /><font face="Arial, Helvetica, sans-serif"  size="5" color="#414141">Welcome, <font face="Arial, Helvetica, sans-serif"  color="#5aa4ca"><xsl:value-of select="/ExpressLane/GenericConsumer/FirstName"/>!</font></font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="3" color="#414141">You may now use all the features of our online system.</font><br /><font face="Arial, Helvetica, sans-serif"  size="3" color="#414141"><a href="##root##/Profile/SignIn.aspx">Click here</a> to sign in and start using your exclusive benefits!</font><br /><br /><div style="width:440px;overflow:hidden;"><xsl:value-of select="//StaticContent/Description" disable-output-escaping="yes"/></div><br /></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                            </table>
                            <table id="NewMemberBenefits" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td width="5"><img src="{$SpacerImage}" width="5" height="1"/></td>
                                	<td width="264" bgcolor="#FFFFFF"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/memberBenefits.jpg" width="264" height="61"/></td>
                                    <td width="250" bgcolor="#FFFFFF"><img src="{$SpacerImage}" width="250" height="1" /></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                            </table>
                            <table id="FeaturedBenefits" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="250" colspan="3" bgcolor="#FFFFFF"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/weeklyAds.jpg" width="250" height="55" /></td>
                                    <td width="250" colspan="3" bgcolor="#FFFFFF">
                                    	<xsl:choose>
                                    		<xsl:when test="$HasCoupons">
                                   				<img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/couponSavings.jpg" width="250" height="55" />
                                        	</xsl:when>
                                        	<xsl:otherwise>
                                        		<img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/mealPlanner.jpg" width="250" height="55" />
                                        	</xsl:otherwise>
                                    	</xsl:choose>
                                    </td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                                <tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="14"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/weeklyAdsLeft.jpg" width="14" height="160" /></td>
                                    <td width="227" bgcolor="#e94f50" align="center">
                                    	<a href="##root##/Shop/WeeklyAd.aspx">
                                    		<img height="140" border="0">
                                    			<xsl:attribute name="src">
                                    				<xsl:choose>
                                    					<xsl:when test="string-length(//SmallImageUrl) &gt; 0"><xsl:value-of select="//SmallImageUrl" /></xsl:when>
                                    					<xsl:otherwise>##root##/Assets/Common/EmailTemplates/ThankYou/images/weeklyAd.gif</xsl:otherwise>
                                    				</xsl:choose>
                                    			</xsl:attribute>
                                    		</img>
                                    	</a>
                                    </td>
                                    <td width="9"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/weeklyAdsRight.jpg" width="9" height="160" /></td>
                                    <td width="9"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/couponSavingsLeft.jpg" width="9" height="160" /></td>
                                    <td width="227">
                                    	<xsl:choose>
                                    	<xsl:when test="$HasCoupons">
                                    	<table id="CouponSavings" width="227" height="160" bgcolor="#e94f50" border="0" cellpadding="0" cellspacing="0">
                                        	<tr>
                                            	<td width="227" height="10" colspan="3"><img src="{$SpacerImage}" width="227" height="10"/></td>
                                            </tr>
                                        	<tr>
                                            	<td width="40"><img src="{$SpacerImage}" width="40" height="1"/></td>
                                                <td width="147" height="140" bgcolor="#FFFFFF" align="center"><font face="Arial, Helvetica, sans-serif"  size="5" color="#414141">You could save<br /><font face="Arial, Helvetica, sans-serif"  color="#e94f50" size="6">##manufacturercoupontotalsavings##</font><br />this week!</font></td>
                                                <td width="40"><img src="{$SpacerImage}" width="40" height="1"/></td>
                                            </tr>
                                            <tr>
                                            	<td width="227" height="10" colspan="3"><img src="{$SpacerImage}" width="227" height="10"/></td>
                                            </tr>
                                        </table>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <table id="MealPlanner" width="227" height="160" bgcolor="#e94f50" border="0" cellpadding="0" cellspacing="0">
                                        	<tr>
                                            	<td width="227" height="0" colspan="3"><img src="{$SpacerImage}" width="227" height="0"/></td>
                                            </tr>
                                        	<tr>
                                            	<td width="20"><img src="{$SpacerImage}" width="20" height="1"/></td>
												<td width="187" height="140" valign="top" align="left">
                                                	<xsl:for-each select="//MealPlannerList/MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
														<xsl:sort select="DisplayOrderDate" order="ascending"/>
                                                        <xsl:if test="position() = 1">
														<font face="Arial, Helvetica, sans-serif"  size="3" style="font-weight:bold" color="#000000"><xsl:value-of select="DisplayDate"/></font>
														<ul style="list-style-type:none;margin:0;padding:0;">
                                                        <xsl:for-each select="key('meals-by-date', DisplayDate)">
															<xsl:sort select="RecipeTitle"/>
                                                            <li style="margin-bottom:5px;margin-left:3px;"><a href="{RecipeURL}">
																<font face="Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><xsl:value-of select="RecipeTitle" disable-output-escaping="yes"/></font>
															</a></li>
                                                        </xsl:for-each>
														</ul>
														</xsl:if>
                                                    </xsl:for-each>
                                                </td>  
												<td width="20"><img src="{$SpacerImage}" width="20" height="1"/></td>
                                            </tr>
                                            <tr>
                                            	<td width="227" height="10" colspan="3"><img src="{$SpacerImage}" width="227" height="10"/></td>
                                            </tr>
                                        </table>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td width="14"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/couponSavingsRight.jpg" width="14" height="160" /></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                 </tr>
                                 <tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="250" colspan="3" bgcolor="#FFFFFF"><a href="##root##/Shop/WeeklyAd.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/weeklyAdsView.jpg" width="250" height="38" border="0"/></a></td>
                                    <xsl:choose>
                                    	<xsl:when test="$HasCoupons"> 
                                    		<td width="250" colspan="3" bgcolor="#FFFFFF"><a href="##root##/Shop/Coupons.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/couponSavingsView.jpg" width="250" height="38" border="0"/></a></td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        	<td width="250" colspan="3" bgcolor="#FFFFFF"><a href="##root##/Recipes/MealPlannerFull.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/mealPlannerView.jpg" width="250" height="38" border="0"/></a></td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                            </table>
                            <table id="OtherBenefits" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="168" colspan="3"><a href="##root##/Recipes/RecipeCenter.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/recipeIdeas.jpg" width="168" height="153" border="0"/></a></td>
                                    <td width="164" colspan="3"><a href="##root##/Recipes/RecipeVideos.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/cookingVideos.jpg" width="164" height="153" border="0"/></a></td>
                                    <td width="168" colspan="3"><a href="##root##/Profile/MyFavorites.aspx"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/groceryLists.jpg" width="168" height="153" border="0"/></a></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                                <tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="17" bgcolor="#FFFFFF" align="right" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsLeft.jpg" width="12" height="60" /></td>
                                    <td width="139" bgcolor="#E6E6E6" valign="center"><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">View new recipe ideas to share with the family!</font><br /><font face="Arial, Helvetica, sans-serif"  size="1"><a href="##root##/Recipes/RecipeCenter.aspx">View Recipe Ideas ></a></font></td>
                                    <td width="12" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsRight.jpg" width="12" height="60" /></td>
                                    <td width="12" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsLeft.jpg" width="12" height="60" /></td>
                                    <td width="140" bgcolor="#E6E6E6" valign="center"><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">Watch videos to improve your cooking methods!</font><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141"><a href="##root##/Recipes/RecipeVideos.aspx">Watch Cooking Videos ></a></font></td>
                                    <td width="12" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsRight.jpg" width="12" height="60" /></td>
                                    <td width="12" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsLeft.jpg" width="12" height="60" /></td>
                                    <td width="139" bgcolor="#E6E6E6" valign="center"><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">Create and save lists to make shopping quicker!</font><br /><font face="Arial, Helvetica, sans-serif"  size="1"><a href="##root##/Profile/MyFavorites.aspx">Create Your List Here ></a></font></td>
                                    <td width="17" bgcolor="#FFFFFF" align="left" valign="top"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/benefitsRight.jpg" width="12" height="60" /></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                            </table>
                            <table id="Footer" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td colspan="3"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/footer.jpg" width="539" height="27" /></td>
                                </tr>
                                <tr>
                                	<td width="30"><img src="{$SpacerImage}" width="30" height="1"/></td>
                                	<td width="480"><br />
										<xsl:variable name="UnsubURL">
											<xsl:value-of select="concat(//GenericChain/PreferedHost, '/Profile/Unsubscribe.aspx?ConsumerID=', //GenericConsumer/ConsumerID)" />
										</xsl:variable>
										<font face="Arial, Helvetica, sans-serif"  size="1">
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$UnsubURL" />
												</xsl:attribute>unsubscribe</a> | <a href="##root##/Profile/PrivacyPolicy.aspx">privacy policy</a> | <a href="##root##/Contact/">contact us</a> | <a href="##root##/Profile/SignIn.aspx">sign in to your account</a></font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141"><b>NOTE:</b> To ensure delivery to your inbox (not bulk or junk folders), please add <b><i><xsl:value-of select="/ExpressLane/ChainEmailData/FromAddress"/></i></b> to your address book or safelist.</font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">Email News is an opt-in, recurring email from <xsl:value-of select="/ExpressLane/GenericChain/ChainName"/>. This email address was obtained through e-mail sign up on our website located at  <xsl:value-of select="/ExpressLane/GenericChain/PreferedHost"/>.</font><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#9b9b9b">Copyright 2014 Grocery Shopping Network</font><br /><br /></td>
                                    <td width="30"><img src="{$SpacerImage}" width="30" height="1"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
			</td> 
		</tr>
	</table>
</body>
</xsl:template>
</xsl:stylesheet>