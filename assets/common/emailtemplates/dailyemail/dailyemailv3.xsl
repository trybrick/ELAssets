<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:import href="../ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:variable name="SpacerURL" select="'##root##/Assets/Common/EmailTemplates/DailyEmail/images/spacer.gif'"/>
	<xsl:template match="/">
		<!-- EXACT TARGET CODE FOR MAIN -->
		<xsl:call-template name="ExactTargetScript_Personalized"/>
		<body bgcolor="#f2f2f0" topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0">
			<style type="text/css">
				body {background:#f2f2f0;font-family: Trebuchet MS, Arial, Helvetica, sans-serif;}
				a:link,a:visited,a:active {color:#4775b6;text-decoration:none;}
				a:hover {color:#0f616d;text-decoration:underline;}
				td,tr,table,img,br {margin:0!imporant;padding:0!imporant;border:0!imporant;font-family: Trebuchet MS, Arial, Helvetica, sans-serif;}
			</style>
			<table id="Outer" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f2f2f0" align="center">
				<tr>
					<td width="40">
						<img src="{$SpacerURL}" width="40" style="display:block;"/>
					</td>
					<td width="728">
						<table id="Content" width="728" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
							<tr>
								<td width="728">
									<xsl:call-template name="Header"/>
									<xsl:call-template name="Body"/>
								</td>
							</tr>
						</table>
					</td>
					<td width="40">
						<img src="{$SpacerURL}" width="40" style="display:block;"/>
					</td>
				</tr>
			</table>
			
			<xsl:text disable-output-escaping="yes"><![CDATA[<custom name="opencounter" type="tracking" />]]></xsl:text>
		</body>
	</xsl:template>
	<xsl:template name="Header">
		<xsl:variable name="sdate" select="//StoreCircularSummary/StartDate"/>
		<xsl:variable name="edate" select="//StoreCircularSummary/EndDate"/>
		<xsl:variable name="StartDate" select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
		<xsl:variable name="EndDate" select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
		<xsl:variable name="EffectiveDates" select="concat($StartDate, ' - ', $EndDate)"/>
		<table id="Header" width="728" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/headBkgLeft.jpg" border="0" height="185" width="20" style="display:block;"/>
				</td>
				<td width="650">
					<table id="HeaderContents" width="650" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td colspan="2">
								<img src="{$SpacerURL}" height="10" style="display:block;"/>
							</td>
						</tr>
						<tr>
							<td width="325" align="center" valign="middle">
								<img src="##root##/Assets/##chainid##/images/headerlogo.gif" alt="Chain Logo" height="100" style="display:block;"/>
							</td>
							<td width="325" align="center" valign="middle">
								<font size="4" color="#414141">Hello, </font>
								<font size="4" color="#4775b6">
									<xsl:call-template name="ExactTargetRetrieve_FirstName" />
								</font>
								<br/>
								<a href="##root##/Profile/SignIn.aspx">
									<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/signIn.jpg" border="0" style="display:block;"/>
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img src="{$SpacerURL}" height="10" style="display:block;"/>
							</td>
						</tr>
						<tr>
							<td width="325" align="center" valign="middle">
								<xsl:call-template name="WeeklyAdTeaser"/>
							</td>
							<td width="325" align="center" valign="middle">
								<xsl:if test="string-length(//GenericChain/ManufactureCouponSiteCode) &gt; 0">
									<xsl:call-template name="CouponsTeaser"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td width="325" align="center" valign="middle">
								<font face="Arial, Helvetica, sans-serif" color="#666666" size="1">Ad Prices Valid From <xsl:value-of select="$EffectiveDates"/></font>
							</td>
							<td width="325" align="center" valign="middle">
							</td>
						</tr>
					</table>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/headBkgRight.jpg" border="0" height="185" width="20" style="display:block;"/>
				</td>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/headBkgBot.jpg" border="0" height="45" width="690" style="display:block;"/>
				</td>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Body">
		<table id="Body" width="728" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td align="center" colspan="3">
					<xsl:call-template name="ExactTargetRetrieve_StoreContent"/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<xsl:call-template name="ExactTargetRetrieve_PersonalizedContent"/>
				</td>
			</tr>
			<tr>
				<td height="10" colspan="3">
					<img src="{$SpacerURL}" width="10" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
				<td>
					<!-- PODS -->
					<table width="690" border="0" cellpadding="0" cellspacing="0" align="left">
						<tr valign="top">
							<td width="172" align="center">
								<xsl:call-template name="WeeklyAd"/>
							</td>
							<td width="172" align="center">
								<xsl:choose>
									<xsl:when test="string-length(//GenericChain/ManufactureCouponSiteCode) &gt; 0">
										<xsl:call-template name="Coupons"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="MealPlanner"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="172" align="center">
								<xsl:choose>
									<!-- do a negation check here because it is far more common for the chain TO have the recipe center-->
									<xsl:when test="//GenericChain/ChainSettings/Setting[SettingName = 'ChainHasRecipeCenter']/Value = 'false'">
										<xsl:call-template name="GroceryLists"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="FeaturedRecipe"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="172" align="center">
								<xsl:call-template name="FeaturedVideo"/>
							</td>
						</tr>
					</table>
				</td>
				<td width="19">
					<img src="{$SpacerURL}" width="19" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td width="690" colspan="3">
					<table width="690">
						<tr>
							<!-- as per Rick, we aren't showing this yet since we don't have the destination page built -->
							<!-- <td align="left" width="50%"> -->
							<!-- <xsl:call-template name="ShareWithAFriend"></xsl:call-template> -->
							<!--</td> -->
							<td align="center" width="690" valign="middle">
								<xsl:call-template name="SocialMedia"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="10" colspan="3">
					<img src="{$SpacerURL}" width="10" style="display:block;"/>
				</td>
			</tr>
<!--			<tr>
				<td colspan="3" width="728">
					<a href="http:/jelmar.com/experts/expertswomen1.htm">
						<img src="http://staticcontent.gsngrocers.com/Email/UploadFiles/211/2011/4/4/728x90%20BK.gif" border="0" alt="Header Ad" width="728" height="90" style="display:block;"/>
					</a>
				</td>
			</tr>-->
			<tr>
				<td height="10" colspan="3">
					<img src="{$SpacerURL}" width="10" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<xsl:call-template name="SubFooter"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="{$SpacerURL}" width="14" style="display:block;"/>
					<!-- FOOTER -->
					<div id="footer">
						<!-- Code to call the footer display at exact target-->
						<xsl:call-template name="ExactTargetRetrieve_FooterContent"/>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="WeeklyAdTeaser">
		<a href="##root##/Shop/WeeklyAd.aspx">
			<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/viewAd.jpg" border="0" style="display:block;"/>
		</a>
	</xsl:template>
	<xsl:template name="CouponsTeaser">
		<table>
			<tr>
				<td>
					<a href="##root##/Shop/Coupons.aspx">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/saveText1.jpg" border="0" style="display:block;"/>
					</a>
				</td>
				<td>
					<a href="##root##/Shop/Coupons.aspx" style="text-decoration:none;">
						<b>
							<i>
								<font face="Arial, Helvetica, sans-serif" color="#cc0000" size="5">##manufacturercoupontotalsavings##</font>
							</i>
						</b>
					</a>
				</td>
				<td>
					<a href="##root##/Shop/Coupons.aspx">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/saveText2.jpg" border="0" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="WeeklyAd">
		<!-- weeklyadpreviewV3.xsl -->
		<xsl:call-template name="ExactTargetRetrieve_WeeklyAdContent"/>
	</xsl:template>
	<xsl:template name="GroceryLists">
		<xsl:variable name="Destination" select="'##root##/Shop/WeeklyAd.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_GroLists.jpg" border="0" height="50" width="172" alt="Grocery Lists" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podGroLists.jpg" border="0" alt="Grocery Lists" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="MealPlanner">
		<xsl:variable name="Destination" select="'##root##/Recipe/RecipeCenter.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_GroLists.jpg" border="0" height="50" width="172" alt="Meal Planner" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podMealPlanner.jpg" border="0" alt="Meal Planner" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Coupons">
		<xsl:variable name="Destination" select="'##root##/Shop/Coupons.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_Coup.jpg" border="0" height="50" width="172" alt="Coupon Savings" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" bgcolor="#FFFFFF" width="132" valign="middle">
					<a href="{$Destination}" style="text-decoration:none;">
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
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="FeaturedRecipe">
		<xsl:variable name="RecipeURL">
			##root##<xsl:value-of select="concat('/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
		</xsl:variable>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_FeatRec.jpg" border="0" height="50" width="172" alt="Featured Recipe" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$RecipeURL}">
						<img src="{//RecipeData/GenericRecipe/Images/RecipeImage/RecipeImageURL}" border="0" alt="Featured Recipe: {//RecipeData/GenericRecipe/Title}" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$RecipeURL}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="FeaturedVideo">
		<xsl:variable name="Destination" select="'##root##/Recipe/RecipeVideos.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_FeatVid.jpg" border="0" height="50" width="172" alt="Featured Video" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<xsl:choose>
							<xsl:when test="string-length(//Video/ThumbNail) &gt; 0">
								<img src="{//Video/ThumbNail}" border="0" alt="Featured Video" style="display:block;" width="120"/>
							</xsl:when>
							<xsl:otherwise>
								<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podFeatVid.jpg" border="0" alt="Featured Video" style="display:block;" width="120"/>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="BrowseTheAisles">
		<xsl:variable name="Destination" select="'##root##/Shop/Browse.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_Browse.jpg" border="0" height="50" width="172" alt="Browse the Aisles" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBrowse.jpg" border="0" alt="Browse the Aisles" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="ShopNow">
		<xsl:variable name="Destination" select="'##root##/Shop/Product.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_ShopNow.jpg" border="0" height="50" width="172" alt="Shop Now" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podShopNow.jpg" border="0" alt="Shop Now" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="StoreCoupon">
		<!-- I currently don't have a link for this one-->
		<xsl:variable name="Destination" select="'##root##/Shop/Coupons.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_StoreCoup.jpg" border="0" height="50" width="172" alt="Store Coupon" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podStoreCoup.jpg" border="0" alt="Store Coupon" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="MfgCoupon">
		<!-- I currently don't have a link for this one-->
		<xsl:variable name="Destination" select="'##root##/Shop/Coupons.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172">
			<tr>
				<td colspan="3">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podHead_MfgCoup.jpg" border="0" height="50" width="172" alt="Manufacturer Coupon" style="display:block;"/>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podMfgCoup.jpg" border="0" alt="Manufacturer Coupon" style="display:block;" width="120"/>
					</a>
				</td>
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podRight.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="{$Destination}">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podBot.jpg" border="0" height="25" width="172" style="display:block;"/>
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="ShareWithAFriend">
		<!-- I currently don't have a link for this one-->
		<a href="">
			<img src="" style="display:block;"/>
			<font size="2">
				Share With A Friend
			</font>
		</a>
	</xsl:template>
	<xsl:template name="SocialMedia">
		<xsl:variable name="FacebookIcon">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=267]/Value) &gt; 0">
					<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=267]/Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>##root##/Assets/Common/Images/SocialNetworking/facebook_icon.png</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="FacebookURL">
			<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=270]/Value"/>
		</xsl:variable>
		<xsl:variable name="TwitterIcon">
			<xsl:choose>
				<xsl:when test="string-length(//GenericChain/ChainSettings/Setting[SettingID=269]/Value) &gt; 0">
					<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=269]/Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>##root##/Assets/Common/Images/SocialNetworking/twitter_icon.png</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="TwitterURL">
			<xsl:value-of select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
		</xsl:variable>
		<xsl:if test="string-length($FacebookURL) &gt; 0 or string-length($TwitterURL) &gt; 0">
			<table>
				<tr>
					<td valign="center">
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/followUs.jpg" border="0" height="38" width="125" alt="Follow Us Online" style="display:block;"/>
					</td>
					<xsl:if test="string-length($FacebookURL) &gt; 0">
						<td>
							<a href="{$FacebookURL}">
								<img src="{$FacebookIcon}" border="0" width="30" style="margin:0 3px 0 3px; display:block;"/>
							</a>
						</td>
					</xsl:if>
					<xsl:if test="string-length($TwitterURL) &gt; 0">
						<td>
							<a href="{$TwitterURL}">
								<img src="{$TwitterIcon}" border="0" width="30" style="margin:0 3px 0 3px; display:block;"/>
							</a>
						</td>
					</xsl:if>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="SubFooter">
		<table width="690">
			<tr>
				<td align="center">
					<table width="70%">
						<tr>
							<td>
								<a href="##root##/Profile/Unsubscribe.aspx?ConsumerID=%%= v(@consumerid) =%%" style="text-decoration:none;">
									<font size="2" color="">
										unsubscribe
									</font>
								</a>
							</td>
							<td>
								<a href="##root##/profile/PrivacyPolicy.aspx" style="text-decoration:none;">
									<font size="2" color="">
										privacy policy
									</font>
								</a>
							</td>
							<td>
								<a href="##root##/contact/Default.aspx" style="text-decoration:none;">
									<font size="2" color="">
										contact us
									</font>
								</a>
							</td>
							<td>
								<a href="##root##/Profile/SignIn.aspx" style="text-decoration:none;">
									<font size="2" color="">
										sign into your account
									</font>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
