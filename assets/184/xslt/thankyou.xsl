<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<!--<xsl:import href="../../EmailTemplates/ExactTargetScripts.xsl"/>-->
<xsl:output method="html" encoding="UTF-8"/>
<xsl:key name="meals-by-date" match="//MealPlannerList/MealPlanner" use="DisplayDate"/>
<xsl:template match="/">
    <xsl:variable name="ConsumerID" select="/ExpressLane/GenericChain/ConsumerID" />
    <xsl:variable name="SpacerImage" select="'##root##/Assets/Common/EmailTemplates/ThankYou/images/spacer.gif'" />
	<xsl:variable name="HeaderImage" select="'##root##/Assets/##chainid##/images/email_header2.jpg'" />
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
                       	<td colspan="4"><img width="539" height="73" src="{$HeaderImage}" /></td>
                    </tr>
                </table>
                <table id="Body" width="539" border="0" cellpadding="0" cellspacing="0">
               	  <tr>
                    	<td>
                        	<table id="Welcome" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td width="19" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgLeft.jpg"><img src="{$SpacerImage}" width="19" height="1"/></td>
                                    <td width="20" bgcolor="#FFFFFF"><img src="{$SpacerImage}" width="20" height="1"/></td>
                                    <td width="460" bgcolor="#FFFFFF"><br /><font face="Arial, Helvetica, sans-serif"  size="5" color="#414141">Welcome, <font face="Arial, Helvetica, sans-serif"  color="#5aa4ca"><xsl:value-of select="/ExpressLane/GenericConsumer/FirstName"/>!</font></font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="3" color="#414141">You may now use all the features of our online system.<br /><a class="ulink" href="##root##/Profile/SignIn.aspx">Click here</a> to sign in and start using your exclusive benefits!</font><br /><br /><div style="width:440px;overflow:hidden;"><xsl:value-of select="//StaticContent/Description" disable-output-escaping="yes"/></div><br /></td>
                                    <td width="20" background="##root##/Assets/Common/EmailTemplates/ThankYou/images/bgRight.jpg"><img src="{$SpacerImage}" width="20" height="1" /></td>
                                </tr>
                            </table>
                            <table id="Footer" width="539" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td colspan="3"><img src="##root##/Assets/Common/EmailTemplates/ThankYou/images/footerBlank.jpg" width="539" height="27" /></td>
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
												</xsl:attribute>unsubscribe</a> | <a href="##root##/Profile/PrivacyPolicy.aspx">privacy policy</a> | <a href="http://crm.festfoods.com">contact us</a> | <a href="##root##/Profile/SignIn.aspx">sign in to your account</a></font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141"><b>NOTE:</b> To ensure delivery to your inbox (not bulk or junk folders), please add <b><i><xsl:value-of select="/ExpressLane/ChainEmailData/FromAddress"/></i></b> to your address book or safelist.</font><br /><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#414141">This email address was obtained through e-mail sign up on our website located at  <xsl:value-of select="/ExpressLane/GenericChain/PreferedHost"/>.</font><br /><font face="Arial, Helvetica, sans-serif"  size="1" color="#9b9b9b">Copyright 2015 Brick, Inc</font><br /><br /></td>
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