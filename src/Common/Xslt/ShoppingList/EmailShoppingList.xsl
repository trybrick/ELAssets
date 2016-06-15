<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<div id="EmailShoppingList">
			<xsl:choose>
				<xsl:when test="count(//GenericShoppingList/VisibleItems/GenericShoppingListItem) &gt; 0">
					<script type="text/javascript" src="/Assets/Common/Js/Email/EmailService.js"/>
					<script type="text/javascript" src="/Assets/Common/Js/Email/EmailShoppingListPage.js"/>
					<xsl:choose>
						<xsl:when test="Name != ''">
							<input type="hidden" id="hfMessageHeader" value="You are receiving this message because #Name# (#EmailFrom#) created a shopping list for you to see."/>
						</xsl:when>
						<xsl:otherwise>
							<input type="hidden" id="hfMessageHeader" value="You are receiving this message because #EmailFrom# created a shopping list for you to see."/>
						</xsl:otherwise>
					</xsl:choose>
					<h1>Email My Shopping List</h1>
					<div id="EmailForm">
						<h3>From:</h3>
						<div>
							<span class="txtLabel">Your Name:</span>
							<input type="text" id="txtName" title="Name">
								<xsl:attribute name="value">
									<xsl:if test="//GenericConsumer/FirstName">
										<xsl:value-of select="concat(//GenericConsumer/FirstName, ' ', //GenericConsumer/LastName)"/>
									</xsl:if>
								</xsl:attribute>
							</input>
						</div>
						<div>
							<span class="txtLabel">Your Email:</span>
							<input type="text" id="txtEmailFrom" title="EmailFrom">
								<xsl:attribute name="value">
									<xsl:value-of select="//GenericConsumer/Email"/>
								</xsl:attribute>
							</input>
						</div>
						<div>
							<span class="txtLabel">Subject:</span>
							<input type="text" id="txtSuject" title="Subject"/>
						</div>
						<h3>To:</h3>
						<div>
							<span class="txtLabel">Send To Email:</span>
							<input type="text" id="txtEmailTo" title="Email To"/>
						</div>
						<div>
							<textarea id="txtEmailBody" rows="14" cols="60">
								<xsl:for-each select="//GenericShoppingList">
									<xsl:call-template name="EmailBody"/>
								</xsl:for-each>
							</textarea>
						</div>
						<div id="sendButton">
							<a href="javascript:SendShoppingListEmail();" class="button">
								<span>Send</span>
							</a>
						</div>
						<div id="cancelButton">
							<a href="javascript: history.go(-1);" class="button">
								<span>Cancel</span>
							</a>
						</div>
					</div>
					<div id="ResponseMessage" style="display:none;">
						<div id="ResponseTarget"/>
						<p>Click <a href="/Shop/WeeklyAd.aspx">here</a> to continue shopping.</p>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div>
						<h3>
							<xsl:text>There are no items in your shopping</xsl:text>
								 
								<xsl:choose>
									<xsl:when test="$IsOGS = 'true'"> cart</xsl:when>
									<xsl:otherwise> list</xsl:otherwise>
								</xsl:choose>
							<xsl:text> to email.</xsl:text>
						</h3>
						<p>
							<xsl:text>Click </xsl:text> 
								<a> 
									<xsl:attribute name="href">
									/Shop/WeeklyAd.aspx
									</xsl:attribute>
									here
								</a> 
							<xsl:text>to create a shopping</xsl:text> 
							<xsl:choose>
								<xsl:when test="$IsOGS = 'true'"> cart.</xsl:when>
								<xsl:otherwise> list.</xsl:otherwise>
							</xsl:choose>
						</p>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="GenericShoppingList" name="EmailBody">
		<xsl:for-each select="Categories/Category">
			<xsl:value-of select="concat('&#xD;&#xD;', CategoryName)"/>
			<xsl:call-template name="CategoryItems">
				<xsl:with-param name="CategoryID" select="CategoryID"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CategoryItems">
		<xsl:param name="CategoryID"/>
		<xsl:for-each select="//GenericShoppingList/VisibleItems/GenericShoppingListItem[CategoryID = $CategoryID]">
			<xsl:call-template name="EmailItem"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="GenericShoppingListItem" name="EmailItem">
		<xsl:value-of select="concat('&#xD; ', Quantity, ' - ', Description)"/>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-88-Footer.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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