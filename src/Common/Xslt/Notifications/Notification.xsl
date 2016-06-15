<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/Notifications/Notifications.js"></script>
		<style>#registration_Popup a {text-decoration:none;}
			#Notification a {text-decoration:none;}</style>
		<xsl:choose>
			<xsl:when test="ExpressLane/Notification">
				<xsl:for-each select="ExpressLane/Notification">
					<xsl:choose>
						<xsl:when test="DisplayMethodID = 2">
							<xsl:call-template name="LightBoxNotification"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SliderNotification"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="//ArrayOfNotification/Notification">
					<xsl:choose>
						<xsl:when test="DisplayMethodID = 2">
							<xsl:call-template name="LightBoxNotification"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SliderNotification"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Notification" name="SliderNotification">
		<div id="Notification" style="display:none;">
			<div id="regContainer">
				<xsl:if test="string-length(IconUrl) &gt; 0">
					<img alt="">
						<xsl:attribute name="src">
							<xsl:value-of select="IconUrl"/>
						</xsl:attribute>
					</img>
				</xsl:if>
				<xsl:value-of select="Message" disable-output-escaping="yes"/>
				<a href="#" class="closebox">
					<xsl:attribute name="onclick">Effect.toggle('Notification','blind', {duration: 0.5});</xsl:attribute>
				</a>
			</div>
		</div>
		<script type="text/javascript">
			function DisplayNotification() 
			{
				Effect.toggle('Notification','blind', {duration: 0.5});
				LogNotificationDisplay(<xsl:value-of select="NotificationID"/>);
			}
			<xsl:choose>
				<xsl:when test="number(Delay)">
					function OpenNotification() 
					{
						setTimeout(DisplayNotification, <xsl:value-of select="number(Delay) * 1000"/>);
					}
				</xsl:when>
				<xsl:otherwise>
					function OpenNotification() 
					{
						DisplayNotification();
					}
				</xsl:otherwise>
			</xsl:choose>
			Event.observe(window, 'load', OpenNotification);
		</script>
	</xsl:template>
	<xsl:template match="Notification" name="LightBoxNotification">
		 <!-- second overlay for registration pop-up. can't control lightwindow_overlay -->
        <div id="lightwindow_registration" style="display:none;"></div>
		<div id="Notification_PopupOrig" style="display:none;">
			<xsl:value-of select="Message" disable-output-escaping="yes"/>
		</div>
		<script type="text/javascript">
			function DisplayNotification() 
			{
				openNotificationPopup();
				LogNotificationDisplay(<xsl:value-of select="NotificationID"/>);
			}
			<xsl:choose>
				<xsl:when test="number(Delay)">
					function OpenNotification() 
					{
						setTimeout(DisplayNotification, <xsl:value-of select="number(Delay) * 1000"/>);
					}
				</xsl:when>
				<xsl:otherwise>
					function OpenNotification() 
					{
						DisplayNotification();
					}
				</xsl:otherwise>
			</xsl:choose>
			Event.observe(window, 'load', OpenNotification);
		</script>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-201-Notifications.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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