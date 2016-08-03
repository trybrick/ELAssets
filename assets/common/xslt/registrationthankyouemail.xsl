<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance\">
  <xsl:output method="html"/>
  <xsl:template match="/">	
    <div id="registrationcontainer" style="width:590px; clear:both; float:left">
      <div id="ThankYou">
	  	<xsl:choose>
			<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent/Title = '{pagecontent}'">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent[Title = '{pagecontent}']">
					<xsl:sort select="SortOrder" data-type="number" />
					<xsl:value-of select="Description" disable-output-escaping="yes" />
					<xsl:if test="Image">
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="Image" />
							</xsl:attribute>
						</img>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<h2>Welcome and Thank You for Registering!</h2>
		        <xsl:element name="br"/>
				<p>You may now use all the features of our online shopping system. Click <a href="##root##">here</a> to go to to our homepage.</p>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent[Title != '{pagecontent}']">
			<xsl:if test="Image != ''">
		        <img>
					<xsl:attribute name="src">
						<xsl:value-of select="Image" />
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:value-of select="Description" disable-output-escaping="yes" />
	            <em>
					Valid from 
					<xsl:variable name="sdate" select="StartDate"/>
	            	<xsl:value-of select="concat(substring($sdate, 6,2),'/',substring($sdate, 9, 2),'/',substring($sdate, 1,4))"/>
		            <xsl:if test="EndDate != ''">
		                <xsl:variable name="edate" select="EndDate"/>&#160;to
		                <xsl:value-of select="concat(substring($edate, 6,2),'/',substring($edate, 9, 2),'/',substring($edate, 1,4))"/>
		            </xsl:if>
				</em>
		</xsl:for-each>   
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///h:/GSNSites/BetaAssets/196/XmlData/196-PageTypeId-82-RegistrationThankYouEmail.xml" htmlbaseurl="" outputurl="" processortype="saxon8"
		          useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath=""
		          postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
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