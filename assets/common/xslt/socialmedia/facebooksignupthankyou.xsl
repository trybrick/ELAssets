<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="registrationcontainer" style="width:590px; clear:both; float:left">
			<div id="ThankYou">
				<xsl:if test="string-length(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 1]/Value) &gt; 0">
					<a href="##root##">
						<img style="width:590px;border:none;">
							<xsl:attribute name="alt">
								<xsl:value-of select="concat('Welcome to ', ExpressLane/GenericChain/ChainName)"/>
							</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 1]/Value"/>
							</xsl:attribute>
						</img>
					</a>
				</xsl:if>
				<h2>
					<xsl:if test="ExpressLane/SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value">
						<img class="profile" style="height:75px;width:75px;">
							<xsl:attribute name="src">
								<xsl:value-of select="concat('http://graph.facebook.com/', //SignUp/Consumer/ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=large')"/>
							</xsl:attribute>
						</img>
					</xsl:if>
					<xsl:text>Welcome </xsl:text>
					<span class="fbname">
						<xsl:value-of select="concat(//Consumer/FirstName, ' ', //Consumer/LastName)"/>
					</span>
				</h2>
				<p>
					<xsl:text>We're glad you joined </xsl:text>
					<xsl:value-of select="ExpressLane/GenericChain/ChainName"/>
					<xsl:text>. Your </xsl:text>
					<xsl:value-of select="ExpressLane/GenericChain/ChainName"/>
					<xsl:text> profile is almost complete. Please click </xsl:text>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="concat('##root##/index.aspx?id=', //IndexPageRequest/UrlEncodedValue)"/>
						</xsl:attribute>
						<xsl:text>here</xsl:text>
					</a>
					<xsl:text> to ender your preferred store, </xsl:text>
					<xsl:if test="ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 8]/Value">
						<xsl:value-of select="concat(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 8]/Value, ', ')"/>
					</xsl:if>
					<xsl:text>and dietary information to personalize your experience on our website. </xsl:text>
					<xsl:if test="ExpressLane/SignUp/Emails/EmailRecord">
						<xsl:text>You will also be include in our </xsl:text>
						<xsl:value-of select="translate(ExpressLane/SignUp/Emails/EmailRecord/Type, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
						<xsl:text> emails which have content personalized based on this information.</xsl:text>
					</xsl:if>
				</p>
				<p>
					<xsl:text>You can manage your profile anytime by clicking this link: &lt;</xsl:text>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="concat('##root##/index.aspx?id=', //IndexPageRequest/UrlEncodedValue)"/>
						</xsl:attribute>
						<xsl:text>My Preferences</xsl:text>
					</a>
					<xsl:text>&gt;</xsl:text>
				</p>
				<p>Thanks!</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-205-FacebookSignUp.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->