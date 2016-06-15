<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<style type="text/css" media="print,screen">
			html,body		{background-color:#FFFFFF; background-image:none; }
			.row1 		{background-color:#EEEEEE;}
			.row0 		{background-color:#FFFFFF;}
			THEAD		{display: table-header-group }
			TBODY		{display: table-row-group }
			#container,
			#container-outer {background:none;margin:0;padding:0;text-align:left;width:100%;}
			#lightwindow, #lightwindow_overlay	{display:none}
		</style>
		<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<div id="CouponDisplayDiv" style="display: none;">
					<h2>
						You have selected to print manufacturer coupons with your shopping list.
						In order to print these coupons from this computer, you will need to 
						install a one time printer application from Coupons Inc.
					</h2>
					<h3>
						This may take a few minutes to download.  Should the initial attempt be
						blocked, you may be asked to verify acceptance of the download.
					</h3>
		            <img alt="" src="/Assets/Common/Images/activex_message.jpg" />
		            <h3>
						Please note – to print your shopping list without downloading the software,
						hit ‘cancel’ then remove coupons from your shopping list under ‘manage
						list’ by clicking the trash can icon for each individual coupon."
					</h3>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\43\XmlData\43-PageTypeId-100-ShoppingListItems.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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