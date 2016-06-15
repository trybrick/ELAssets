<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<xsl:template name="ExactTargetScript_NonPersonalized" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				<!-- ouput nothing - this is an Exact Target only script -->
			</xsl:when>
			<xsl:otherwise>
				%%[ Var @storeid, @storecontent, @weeklyad, @footer, @consumerid, @firstname
				
					SET @storeid = AttributeValue("StoreID")
					
					IF EMPTY(@storeid) THEN
						RaiseError("Invalid StoreID", true)
					ENDIF
					
					SET @storecontent = Lookup("StoreEmailContent", "StoreHTML", "StoreID", @storeid)
					SET @weeklyad = Lookup("StoreEmailContent", "WeeklyAdHTML", "StoreID", @storeid)
					SET @footer = Lookup("StoreEmailContent", "FooterHTML", "StoreID", @storeid)
					SET @firstname = AttributeValue("FirstName")
					
					SET @consumerid = _SubscriberKey
					
					<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EmailRequiresDynamicContent']/Value = 'True'">
						IF EMPTY(@storecontent) THEN
							RaiseError("Invalid Required Store Content", true)
						ENDIF
					</xsl:if>
				]%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetScript_Personalized" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				<!-- ouput nothing - this is an Exact Target only script -->
			</xsl:when>
			<xsl:otherwise>
				%%[ Var @storeid, @storecontent, @footer, @personalized, @defaultPersonalized, @profileid, @consumerid, @weeklyad, @firstname

					SET @storeid = AttributeValue("StoreID")
					
					IF EMPTY(@storeid) THEN
						RaiseError("Invalid StoreID", true)
					ENDIF	
					
					SET @storecontent = Lookup("StoreEmailContent", "StoreHTML", "StoreID", @storeid)
					SET @footer = Lookup("StoreEmailContent", "FooterHTML", "StoreID", @storeid)
					SET @personalized = Lookup("PersonalizedContent", "PersonalizedContent", "ConsumerID", _SubscriberKey)
					SET @defaultPersonalized = Lookup("PersonalizedDefaultContent", "DefaultHTML", "StoreID", @storeid)
					SET @profileid = AttributeValue("ProfileID")
					SET @weeklyad = Lookup("StoreEmailContent", "WeeklyAdHTML", "StoreID", @storeid)
					SET @firstname = AttributeValue("FirstName")
					
					SET @consumerid = _SubscriberKey
					
					<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EmailRequiresDynamicContent']/Value = 'True'">
						IF EMPTY(@storecontent) THEN
							RaiseError("Invalid Required Store Content", true)
						ENDIF
					</xsl:if>
					
					IF EMPTY(@personalized) THEN
						IF EMPTY(@defaultPersonalized) THEN
							RaiseError("Invalid Personalized Content", true)
						ENDIF
						
						SET @personalized = @defaultPersonalized
					ENDIF
					
					IF EMPTY(@profileid) THEN
						SET @profileid = _SubscriberKey
					ENDIF
				]%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_StoreContent" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				##StoreContent##
			</xsl:when>
			<xsl:otherwise>
				%%= v(@storecontent) =%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_FooterContent" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				##Footer##
			</xsl:when>
			<xsl:otherwise>
				%%= TreatAsContent(@footer) =%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_WeeklyAdContent" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				##WeeklyAd##
			</xsl:when>
			<xsl:otherwise>
				%%= v(@weeklyad) =%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_FirstName" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				##FirstName##
			</xsl:when>
			<xsl:otherwise>
				%%[ if not empty(@firstname) then ]%%
					%%= Concat(@firstname, '!') =%%
				%%[ endif ]%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_PersonalizedContent" match="/">
		<xsl:choose>
			<xsl:when test="//EmailIsAdmin//IsAdmin = 'true'">
				##PersonalizedContent##
			</xsl:when>
			<xsl:otherwise>
				%%= v(@personalized) =%%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_GiantProfileImage" match="/">
		<img width="160" height="137" style="margin-top:10px; display:block;" src="%%= Concat('http://www.giantfoodstores.com/shareddev/bcimage/Default.aspx?gsn=', @profileid) =%%"></img>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_GiantStoreLink" match="/">
		<a href="%%= Concat('http://giantfoodstores.gsnrecipes.com/index.aspx?LinkID=0&amp;StoreID=', @storeid) =%%">
			<img src="http://www.giantfoodstores.com/shareddev/sharedcontent/Email/Weekly/images/123/weekly_circular.jpg" width="160" height="103" border="0" style="display:block;"/>
		</a>
	</xsl:template>
	
	<xsl:template name="ExactTargetRetrieve_MartinsStoreLink" match="/">
		<a href="%%= Concat('http://martinsfoods.gsnrecipes.com/index.aspx?LinkID=0&amp;StoreID=', @storeid) =%%">
			<img src="http://www.giantfoodstores.com/shareddev/sharedcontent/Email/Weekly/images/125/weekly_circular.jpg" width="160" height="103" border="0" style="display:block;"/>
		</a>
	</xsl:template>

</xsl:stylesheet>