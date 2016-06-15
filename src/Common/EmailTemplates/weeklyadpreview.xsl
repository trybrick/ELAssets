<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailscoring2.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="UTF-8" indent="no"/><xsl:template match="/">	<xsl:variable name="ChainID" select="//GenericChain/ChainID" />	<xsl:variable name="StoreID" select="//GenericStore/StoreID" />	<xsl:variable name="Domain" select="//GenericChain/PreferedHost" />	<xsl:variable name="ConsumerID"  select="//GenericConsumer/ConsumerID" />	<xsl:variable name="EmailID" select="//EmailID" />	<xsl:variable name="EmailTemplateID" select="//EmailTemplates/EmailTemplate/EmailTemplateID" />		<table width="210" bgcolor="#FFFFCC" STYLE="border: medium double #C02407; border-collapse: separate; border-spacing: 10pt 5pt; padding:0; vertical-align:top;">		<tr>			<td>				<h2 style="font-family:Georgia, 'Times New Roman', Times, serif;margin:6px 0 0 0; display:block; clear:both; color:#FF0000; font-weight:normal; font-size:20px; text-align:center; width:100%; ">					<a href="##root##/Shop/WeeklyAd.aspx">						Check out our<br/>Weekly Ads!					</a>				</h2>			<p>				<xsl:attribute name="align">center</xsl:attribute>				<xsl:attribute name="style">text-align:center; color:#000000; font-size:12px;</xsl:attribute>				Click on an item, find a 					<a href="##root##/Recipes/RecipeCenter.aspx">						<xsl:text> recipe</xsl:text>					</a> 					to match, and create your own 					<a href="##root##">						<xsl:text> shopping list</xsl:text>					</a>. 					<br/>				<xsl:variable name="Circular" select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>  				<xsl:choose>					<xsl:when test="$Circular">						<a href="##root##/Shop/WeeklyAd.aspx">							<img  border="0" src="{$Circular}" style="margin:12px auto"/>                                                                      						</a>					</xsl:when>					<xsl:otherwise>						<img>							<xsl:attribute name="border">0</xsl:attribute>							<xsl:attribute name="src"><xsl:value-of select="concat($Domain, '/Assets/Common/Images/CircularThumb.png')"/></xsl:attribute>							<xsl:attribute name="style">margin:12px auto</xsl:attribute>						</img>					</xsl:otherwise>				</xsl:choose>			</p>		</td>	</tr></table></xsl:template><xsl:template name="RedirectUrl">	<xsl:param name="Destination" />	<xsl:value-of select="Destination" />	<!--	<xsl:variable name="ChainID" select="//GenericChain/ChainID" />	<xsl:variable name="StoreID" select="//GenericStore/StoreID" />	<xsl:variable name="Domain" select="//GenericChain/PreferedHost" />	<xsl:variable name="ConsumerID" select="//GenericConsumer/ConsumerID" />	<xsl:variable name="EmailID" select="//EmailID" />	<xsl:value-of select="$Domain" />/EmailRedirect.aspx?redirect=<xsl:value-of select="$Destination"/>&amp;ChainID=<xsl:value-of select="$ChainID"/>&amp;StoreID=<xsl:value-of select="$StoreID"/>&amp;ConsumerID=<xsl:value-of select="$ConsumerID"/>&amp;EmailID=<xsl:value-of select="$EmailID"/>&amp;EmailTemplateID=<xsl:value-of select="//EmailTemplates/EmailTemplate/EmailTemplateID"/>&amp;SentDate=<xsl:value-of select="//MealPlannerList/MealPlanner/DisplayDate"/>	--></xsl:template></xsl:stylesheet>