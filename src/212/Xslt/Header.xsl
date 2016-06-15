<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="StoreHeader">
			<div id="StoreHeaderLogo">
				<a href="/">
					<img border="0">
						<xsl:attribute name="src">
							<xsl:value-of select="ExpressLane/header/logo"/>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div id="StoreHeaderRight">
            	<div id="StoreHeaderRightInner">
            		<img src="/Assets/212/Images/cobornsinc.jpg" border="0" alt="" />
                </div>
			</div>
			<div style="clear: both;" />	
		</div>
        <div id="StoreMenu" class="clearfix">
			<ul>
				<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
					<li>
						<a class="nav-link">
							<xsl:attribute name="href">
								<xsl:value-of select="Link"/>
							</xsl:attribute>
							<xsl:if test="Target">
								<xsl:attribute name="target">
										<xsl:value-of select="Target"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="Title"/>
						</a>
					</li>
				</xsl:for-each>
                <li>
                	<a class="nav-login" href="http://employee.cobornsinc.com/wfm/EmpLogin">Employee Login</a>
                </li>
			</ul>
		</div>	
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\70\XmlData\70-PageTypeId-3-Header.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->