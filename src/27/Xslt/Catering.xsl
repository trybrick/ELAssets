<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="catering">
			<h3>Party Platters</h3>
			<div id="ordering1">
				<table>
					<tr>
						<td>TO ORDER CALL:</td>
					</tr>
					<tr>
						<td>Jackson Street Store</td>
						<td>270-443-6219</td>
					</tr>
					<tr>
						<td>Lone Oak Road Store</td>
						<td>270-554-0087</td>
					</tr>
				</table>
			</div>
			<div id="menu">
				<xsl:for-each select="ExpressLane/CateringMenu/Item">
						<hr/>
						<div class="item">
							<h4 class="itemheading"><xsl:value-of select="Name"/></h4>
							<img>
								<xsl:attribute name="src">
									##root##/Assets/27/Images/<xsl:value-of select="Image"/>
								</xsl:attribute>
							</img>
							<table class="price">
								<tr>
									<td><b>Small </b></td>
									<td><xsl:value-of select="Sizes/Small/Guests"/> Guests</td>
									<td>$<xsl:value-of select="Sizes/Small/Price"/> </td>
								</tr>
								<xsl:if test="Sizes/Medium">
									<tr>
										<td><b>Medium </b></td>
										<td><xsl:value-of select="Sizes/Medium/Guests"/> Guests</td>
										<td>$<xsl:value-of select="Sizes/Medium/Price"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="Sizes/Large">	
									<tr>
										<td><b>Large </b></td>
										<td><xsl:value-of select="Sizes/Large/Guests"/> Guests</td>
										<td>$<xsl:value-of select="Sizes/Large/Price"/></td>
									</tr>
								</xsl:if>
							</table>
						</div>
					</xsl:for-each>
				</div>
				<div id="ordering2">
					<table>
						<tr>
							<td>TO ORDER CALL:</td>
						</tr>
						<tr>
							<td>Jackson Street Store</td>
							<td>270-443-6219</td>
						</tr>
						<tr>
							<td>Lone Oak Road Store</td>
							<td>270-554-0087</td>
						</tr>
					</table>
				</div>
			</div>
		</xsl:template>
	</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Xml\Catering.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->