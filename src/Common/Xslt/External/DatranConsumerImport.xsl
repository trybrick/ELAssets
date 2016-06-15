<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	<xsl:template match="/">
		<!-- ***************** README ***************** 
			 This file is kept in SVN for document history only.  It is not
			 referenced from business rules on the the production webfarm.
			 To make production changes to the this document you must upload 
			 it to akamai at the directory of 35005/assets/common/xslt/external!
			 ******************************************-->
		<xsl:variable name="delimiter">
			<xsl:text>,</xsl:text>
		</xsl:variable>
		<xsl:variable name="newline">
<xsl:text>
</xsl:text>
		</xsl:variable>

		<xsl:variable name="DefaultEmailListing">
			<xsl:for-each select="//ArrayOfWeekDay/WeekDay">
				<xsl:text>0</xsl:text><xsl:value-of select="$delimiter" />
			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="StaticChainInfo">
			<xsl:call-template name="ChainEmailData">
				<xsl:with-param name="delimiter" select="$delimiter" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:for-each select="//ArrayOfDatranConsumer/DatranConsumer">
			<xsl:call-template name="ConsumerData">
				<xsl:with-param name="delimiter" select="$delimiter" />
			</xsl:call-template>

			<xsl:value-of select="$StaticChainInfo" />

			<xsl:call-template name="ConsumerEmailSubscriptions">
				<xsl:with-param name="Consumer" select="." />
				<xsl:with-param name="DefaultList" select="$DefaultEmailListing" />
				<xsl:with-param name="delimiter" select="$delimiter" />
			</xsl:call-template>
		
<!--			<xsl:call-template name="MonthlyEmailSubscriptions">
				<xsl:with-param name="delimiter" select="$delimiter" />
			</xsl:call-template>-->

			<xsl:call-template name="AdHocEmailSubScription">
				<xsl:with-param name="delimiter" select="$delimiter" />
			</xsl:call-template>

			<xsl:value-of select="$newline" />
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="ConsumerData" match="DatranConsumer">
		<xsl:param name="delimiter" />

		<!-- ExternalID (ConsumerID) --><xsl:value-of select="ConsumerID" /><xsl:value-of select="$delimiter" />
		<!-- First Name --><xsl:value-of select="FirstName" /><xsl:value-of select="$delimiter" />
		<!-- Last Name--><xsl:value-of select="LastName" /><xsl:value-of select="$delimiter" />
		<!-- Email Address--><xsl:value-of select="Email" /><xsl:value-of select="$delimiter" />
		<!-- State --><xsl:value-of select="State" /><xsl:value-of select="$delimiter" />
		<!-- Postal Code--><xsl:value-of select="PostalCode" /><xsl:value-of select="$delimiter" />
		<!-- ChainName --><xsl:value-of select="//GenericChain/ChainName" /><xsl:value-of select="$delimiter" />
		<!-- ChainID --><xsl:value-of select="ChainID" /><xsl:value-of select="$delimiter" />
		<!-- StoreID --><xsl:value-of select="PrimaryStoreID" /><xsl:value-of select="$delimiter" />
		<!-- Create Date--><xsl:value-of select="CreateDate" /><xsl:value-of select="$delimiter" />
	</xsl:template>
	
	<xsl:template name="ChainEmailData">
		<xsl:param name="delimiter" />

		<xsl:variable name="RegularSubjectLine">
			<xsl:if test="//ArrayOfEmailRecord/EmailRecord/Template/PersonalizedContent != 'true'">
				<xsl:value-of select="//ArrayOfEmailRecord/EmailRecord/Template/Subject" />
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="PersonalizedSubjectLine">
			<xsl:if test="//ArrayOfEmailRecord/EmailRecord/Template/PersonalizedContent = 'true'">
				<xsl:value-of select="//ArrayOfEmailRecord/EmailRecord/Template/Subject" />
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="ReplyToAddress">
			<xsl:value-of select="substring-before(//EmailRecord/Template/ReplyAddress, '@')" />
			<!--<xsl:value-of select="substring-before(//GenericChain/ChainSettings/Setting[Name = 'DatranReplyToAddress']/Value, '@')" />-->
		</xsl:variable>
		<xsl:variable name="ReplyToDomain">
			<xsl:value-of select="substring-after(//EmailRecord/Template/ReplyAddress, '@')" />
			<!--<xsl:value-of select="substring-after(//GenericChain/ChainSettings/Setting[Name = 'DatranReplyToAddress']/Value, '@')" /> -->
		</xsl:variable>

		<!-- Friendly Name--><xsl:value-of select="//GenericChain/ChainSettings/Setting[Name = 'DatranEmailFromName']/Value" /><xsl:value-of select="$delimiter" />
		<!-- Datran From Address--><xsl:value-of select="//GenericChain/ChainSettings/Setting[Name = 'DatranEmailFromAddress']/Value" /><xsl:value-of select="$delimiter" />
		<!-- Reply To Address--><xsl:value-of select="$ReplyToAddress" /><xsl:value-of select="$delimiter" />
		<!-- Reply To Domain--><xsl:value-of select="$ReplyToDomain" /><xsl:value-of select="$delimiter" />
		<!-- Subject Line--><xsl:value-of select="$RegularSubjectLine" /><xsl:value-of select="$delimiter" />
		<!-- Personalized Subject Line--><xsl:value-of select="$PersonalizedSubjectLine" /><xsl:value-of select="$delimiter" />
	</xsl:template>
	
	<xsl:template name="ConsumerEmailSubscriptions">
		<xsl:param name="Consumer" />
		<xsl:param name="DefaultList" />
		<xsl:param name="delimiter" />

		<xsl:variable name="SubscribedList">
			<xsl:for-each select="//ArrayOfWeekDay/WeekDay">
				<xsl:variable name="WeekDayID" select = "WeekDayID" />
			
				<xsl:choose>
					<xsl:when test="string-length($Consumer/SubscribedEmails/ConsumerEmail[WeekDayID = $WeekDayID]/ConsumerID) &gt; 0">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$delimiter" />
			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="RegularSubjectLine">
			<xsl:if test="//ArrayOfEmailRecord/EmailRecord/Template/PersonalizedContent != 'true'">
				<xsl:value-of select="//ArrayOfEmailRecord/EmailRecord/Template/Subject" />
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="MonthlyDefault">
			<xsl:text>0</xsl:text><xsl:value-of select="$delimiter" /><xsl:text></xsl:text><xsl:value-of select="$delimiter" />
		</xsl:variable>
		
		<xsl:variable name="MonthlyList">
			<xsl:choose>
				<xsl:when test="number(//ArrayOfEmailRecord/EmailRecord[Type = 'Monthly']/EmailID)">
					<xsl:text>1</xsl:text><xsl:value-of select="$delimiter" />
					<xsl:value-of select="//ArrayOfEmailRecord/EmailRecord[Type = 'Monthly']/Template/Subject" /><xsl:value-of select="$delimiter" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$MonthlyDefault" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="NewsletterSubscribed">
			<xsl:choose>
				<!-- Test to see if they are subscribed to a weekly email-->
				<xsl:when test="$SubscribedList = $DefaultList">
					<xsl:choose>
						<!-- Test to see if they are subscribed to a monthly email-->
						<xsl:when test="$MonthlyList = $MonthlyDefault">
							<!-- They are not subsribed to either - return false-->
							<xsl:value-of select="'false'" />
						</xsl:when>
						<xsl:otherwise>
							<!-- They are subscribed to the monthly email - return true-->
							<xsl:value-of select="'true'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<!-- They are subscribed to a weekly email - return true-->
					<xsl:value-of select="'true'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="Newsletter">
			<xsl:choose>
				<xsl:when test="$NewsletterSubscribed = 'false'">
					<!--Unsubscribe--><xsl:text>0</xsl:text><xsl:value-of select="$delimiter" />
				</xsl:when>
				<xsl:otherwise>
					<!--Subscribe--><xsl:text>1</xsl:text><xsl:value-of select="$delimiter" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="ChainHost">
			<xsl:value-of select="//GenericChain/PreferedHost" /><xsl:value-of select="$delimiter" />
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="string-length($RegularSubjectLine) &gt; 0">
				<xsl:value-of select="$SubscribedList" /><xsl:value-of select="$DefaultList" /><xsl:value-of select="$Newsletter" /><xsl:value-of select="$ChainHost" /><xsl:value-of select="$MonthlyList" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$DefaultList" /><xsl:value-of select="$SubscribedList" /><xsl:value-of select="$Newsletter" /><xsl:value-of select="$ChainHost" /><xsl:value-of select="$MonthlyList" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--
	<xsl:template name="MonthlyEmailSubscriptions">
		<xsl:param name="delimiter" />

		<xsl:variable name="Default">
			<xsl:text>0</xsl:text><xsl:value-of select="$delimiter" /><xsl:text></xsl:text><xsl:value-of select="$delimiter" />
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="number(//ArrayOfEmailRecord/EmailRecord[Type = 'Monthly']/EmailID)">
				<xsl:text>1</xsl:text><xsl:value-of select="$delimiter" />
				<xsl:value-of select="//ArrayOfEmailRecord/EmailRecord[Type = 'Monthly']/Template/Subject" /><xsl:value-of select="$delimiter" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$Default" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

	<xsl:template name="AdHocEmailSubScription" match="DatranConsumer">
		<xsl:param name="delimiter" />

		<xsl:variable name="Default">
			<xsl:text>0</xsl:text><xsl:value-of select="$delimiter" />
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="number(EmailAdHocID)">
				<xsl:value-of select="EmailAdHocID" /><xsl:value-of select="$delimiter" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$Default" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\Users\amorger\Documents\ConsumerEmailBuild.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->