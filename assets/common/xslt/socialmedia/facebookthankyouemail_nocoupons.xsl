<?xml version="1.0"?>
<!-- DWXMLSource="file:///Macintosh HD/Users/tegeder/Desktop/98-PageTypeId-220-FacebookSignUpThankyouEmail.xml" -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<body bgcolor="#F2F2F0" style="font-family:Arial, Helvetica, sans-serif; color: #666666; font-weight: lighter;">
			<style>
body {background:#f2f2f0;font-family: Arial, Helvetica, sans-serif; color: #666666; font-weight:lighter;}
a:link,a:visited,a:active {color:#619ac6;}
			</style>
			<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin: auto;">
				<tr>
					<th scope="col">
						<xsl:if test="string-length(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 1]/Value) &gt; 0">
							<a href="##root##">
								<img border="0" style="width:590px;border:none;" width="590">
									<xsl:attribute name="alt">
										<xsl:value-of select="concat('Welcome to ', ExpressLane/GenericChain/ChainName)"/>
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 1]/Value"/>
									</xsl:attribute>
								</img>
							</a>
						</xsl:if>
					</th>
				</tr>
				<tr>
					<td>
						<table border="0" align="center" cellpadding="5" valign="center">
							<tr>
								<th width="65" align="center" scope="col">
									<xsl:if test="ExpressLane/SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value">
										<img class="profile" style="height:65px;width:65px;">
											<xsl:attribute name="src">
												<xsl:value-of select="concat('http://graph.facebook.com/', //SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=large')"/>
											</xsl:attribute>
										</img>
									</xsl:if>
								</th>
								<th align="center" scope="col">
									<h2 align="left">
										<xsl:text>Welcome, </xsl:text>
										<em style="color:#619ac6;">
											<span class="fbname">
												<xsl:value-of select="concat(//Consumer/FirstName, ' ', //Consumer/LastName)"/>
											</span>
											<xsl:text>!</xsl:text>
										</em>
									</h2>
								</th>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border="0" cellpadding="20">
							<tr>
								<th scope="col" align="left" style="border-top: 1px dashed; border-color: #ccc; font-weight: normal; ">
									<p>
										<center>
											<h3>That was easy! Thank you for joining us. </h3>
										</center>
									</p>
									<p>We ask that you take one minute to fill out a few additional preferences. These extra preferences will help us personalize your experience on our site. Just follow the link:</p>
									<p>
										<a style="color:#619ac6;">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('##root##/index.aspx?id=', //IndexPageRequest/UrlEncodedValue)"/>
											</xsl:attribute>
											<xsl:text>My Preferences</xsl:text>
										</a>
									</p>
									<p>Some website features that require this information may not be available until the preferences are complete. If you have already updated your preferences, please ignore this email. </p>
								</th>
							</tr>
						</table>
						<xsl:if test="string-length(//StaticContent/Description) &gt; 0">
							<table width="600" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="80">
										<img alt="" src="##root##/Assets/Common/EmailTemplates/ThankYou/images/spacer.gif" width="80"/>
									</td>
									<td width="440">
										<div style="width:440px;overflow:hidden;">
											<xsl:value-of select="//StaticContent/Description" disable-output-escaping="yes"/>
										</div>
									</td>
									<td width="80">
										<img alt="" src="##root##/Assets/Common/EmailTemplates/ThankYou/images/spacer.gif" width="80"/>
									</td>
								</tr>
							</table>
						</xsl:if>
						<table width="600" border="0" cellspacing="10" cellpadding="0">
							<tr>
								<th scope="col" width="40%">
									<xsl:call-template name="FeaturedRecipe"/>
								</th>
								<th scope="col" width="40%">
									<xsl:call-template name="FeaturedVideo"/>
								</th>
							</tr>
						</table>
					</td>
				</tr>
				<tr/>
				<tr>
					<td style="border-top: 1px dashed; border-color: #ccc;">
						<table width="100%" bgcolor="#FAFAED" cellpadding="20" style="font-size: x-small; border: 2px solid; border-color: #FFF;">
							<tr>
								<td>
									<center>
										<p>Copyright 2011 <b>%%Member_Busname%%</b><br/>%%Member_Addr%% %%Member_City%%, %%Member_State%%, %%Member_PostalCode%%, %%Member_Country%%</p>
									</center>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</body>
	</xsl:template>
	<xsl:template name="FeaturedRecipe">
		<xsl:variable name="RecipeURL">
			##root##<xsl:value-of select="concat('/Recipes/RecipeFull.aspx?RecipeID=', //RecipeData/GenericRecipe/RecipeID)"/>
		</xsl:variable>
		<table border="0" cellpadding="0" cellspacing="0" width="152" align="center">
			<tr>
				<td colspan="3">
					<img src="##root##//Assets/Common/EmailTemplates/DailyEmail/images/podHead_FeatRec.jpg" border="0" height="50" width="172" alt="Featured Recipe" style="display:block;">
                   
                    </img>
				</td>
			</tr>
			<tr bgcolor="#e6e6e6">
				<td width="20">
					<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podLeft.jpg" border="0" height="140" width="20" style="display:block;"/>
				</td>
				<td align="center" width="132" valign="middle">
					<a href="{$RecipeURL}">
						<img src="{//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL}" border="0" alt="Featured Recipe: {//FeaturedRecipeList/FeaturedRecipe/RecipeTitle}" style="display:block;" width="120"/>
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
		<xsl:variable name="Destination" select="'##root##/Recipes/RecipeVideos.aspx'"/>
		<table border="0" cellpadding="0" cellspacing="0" width="172" align="center">
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
</xsl:stylesheet>
