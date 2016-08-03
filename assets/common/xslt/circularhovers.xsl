<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">

		<script src="http://www.ucook.com/assets/common/js/ToolTips/cas_tips.js" type="text/javascript"/>


		<xsl:if test="ExpressLane/ArrayOfGenericCircularItem/GenericCircularItem">
			<map>
				<xsl:attribute name="id">CircularImageMap<xsl:value-of select="//CircularPageID"/></xsl:attribute>
				<xsl:attribute name="name">CircularImageMap<xsl:value-of select="//CircularPageID"/></xsl:attribute>
				<xsl:for-each select="ExpressLane/ArrayOfGenericCircularItem/GenericCircularItem">
					<area>
						<xsl:attribute name="alt">
							<xsl:value-of select="CircularItemName"/>
						</xsl:attribute>
						<xsl:attribute name="onmouseover">doTipFromTag(this, '<xsl:value-of select="CircularItemID"/>span');</xsl:attribute>
						<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
						<xsl:attribute name="coords">
							<xsl:value-of select="AreaCoordinates"/>
						</xsl:attribute>
						<xsl:attribute name="shape">
							<xsl:choose>
								<xsl:when test="string-length(AreaCoordinates)-string-length(translate(AreaCoordinates, ',', ''))&gt;3">poly</xsl:when>
								<xsl:otherwise>rect</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</area>
				</xsl:for-each>
			</map>
			<div style="display:none;visiblity:hidden;">
				<xsl:for-each select="ExpressLane/ArrayOfGenericCircularItem/GenericCircularItem">
					<span>
						<xsl:attribute name="id"><xsl:value-of select="CircularItemID"/>span</xsl:attribute>
						<div id="hoverAdPage" class="bigPage">
							<div class="top">
								<h1>Click to add to your shopping list.</h1>
							</div>
							<div class="middle">
								<div class="circularHoversImage">
									<xsl:if test="SmallImageURL">
										<img>
											<xsl:attribute name="alt">
												<xsl:value-of select="Name"/>
											</xsl:attribute>
											<xsl:attribute name="src">
												<xsl:value-of select="SmallImageURL"/>
											</xsl:attribute>
										</img>
									</xsl:if>
								</div>
								<div class="circularHoversPricing">
									<h2>
										<xsl:value-of select="CircularItemName"/>
									</h2>
									<h3>
										<xsl:value-of select="ProductDescription" disable-output-escaping="yes"/>
									</h3>
									<h4>
										<xsl:value-of select="PriceString"/>
									</h4>
								</div>
								<h5>Click to add to your list.</h5>
							</div>
							<div class="bottom"></div>
						</div>
					</span>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Documents and Settings\sremiger\Desktop\Hovers.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
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