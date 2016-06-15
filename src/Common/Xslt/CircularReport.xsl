<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:key name="xClientAdID" match="//ExpressLane/CircularReport/Unlinked/ExternalClientAdID" use="."/>
	<xsl:key name="yClientAdID" match="//ExpressLane/CircularReport/Unconfirmed/ExternalClientAdID" use="."/>

	<xsl:output method="html"/>

	<xsl:template match="/">
		<h1>
			Circular Report: <xsl:value-of select="CircularReport/CircularTitle/CircularDescription"/>
		</h1>
		<div class="grid_12">
			<span>Unlinked Items: </span>
			<xsl:for-each select="//CircularReport/Active[CircularPageID = //Unlinked/CircularPageID]">
				<xsl:if test="position() &gt; 1">
					<xsl:text> | </xsl:text>
				</xsl:if>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('#unlinked_', CircularPageID)" />
					</xsl:attribute>
					<xsl:value-of select="concat('Page ', PageNumber, ', ', ExternalClientAdID)"/>
				</a>
			</xsl:for-each>
		</div>
		<br />
		<div class="grid_12">
			<span>Unconfirmed Items: </span>
			<xsl:for-each select="//CircularReport/Active[CircularPageID = //Unconfirmed/CircularPageID]">
				<xsl:if test="position() &gt; 1">
					<xsl:text> | </xsl:text>
				</xsl:if>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat('#unconfirmed_', CircularPageID)" />
					</xsl:attribute>
					<xsl:value-of select="concat(ExternalGroupTitle, ': page ', PageNumber, ', ', ExternalClientAdID)"/>
				</a>
			</xsl:for-each>
		</div>
		<br />
		<div class="grid_12">
			<a href="#store_assignment">Store Assignment</a>
		</div>
		<br />
		<h1>Unlinked Items</h1>
		<xsl:for-each select="//CircularReport/Active[CircularPageID = //Unlinked/CircularPageID]">
			<xsl:variable name="CircularPageID" select="CircularPageID"/>
			<h3>
				<a>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('unlinked_', CircularPageID)" />
					</xsl:attribute>
					<xsl:value-of select="concat('Page ', PageNumber, ', ', ExternalClientAdID)"/>
				</a>
			</h3>
			<a href="#">back to top</a>
			<table border="1" style="width:80%;border-collapse:collapse;" align="center">
				<tr class="rowstyle">
					<td>
						<b>CircularItemName</b>
					</td>
				</tr>
				<xsl:for-each select="//CircularReport/Unlinked[CircularPageID = $CircularPageID]">
					<tr class="rowstyle">
						<td>
							<xsl:value-of select="CircularItemName"/>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
		<br/>
		<h1>Unconfirmed Items</h1>
		
		<xsl:for-each select="//CircularReport/Active[CircularPageID = //Unconfirmed/CircularPageID]">
			<xsl:variable name="CircularPageID" select="CircularPageID"/>
			<h3>
				<a>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('unconfirmed_', CircularPageID)" />
					</xsl:attribute>
					<xsl:value-of select="concat(ExternalGroupTitle, ': page ', PageNumber, ', ', ExternalClientAdID)"/>
				</a>
			</h3>
			<a href="#">back to top</a>
			<table border="1" style="width:80%;border-collapse:collapse;" align="center">
				<tr class="rowstyle">
					<td>
						<b>CircularItemName</b>
					</td>
				</tr>
				<xsl:for-each select="//CircularReport/Unconfirmed[CircularPageID = $CircularPageID]">
					<tr class="rowstyle">
						<td>
							<xsl:value-of select="CircularItemName"/>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
		<!--<h1>Unconfirmed</h1>

		<table border="1" style="width:80%;border-collapse:collapse;" align="center">


			<xsl:for-each select="//CircularReport/Unconfirmed">
				<xsl:variable name="exID" select="ExternalClientAdID"/>

				<xsl:if test="generate-id($exID) = generate-id(key('yClientAdID', $exID)[1])">
					<tr>
						<td colspan="3" class="headerstyle">
							<b>
								<xsl:value-of select="$exID"/>
							</b>
							<br/>
						</td>
					</tr>
					<tr class="rowstyle">
						<td>
							<b>CircularItemName</b>
						</td>
					</tr>
				</xsl:if>

				<tr class="rowstyle">
					<td>
						<xsl:value-of select="CircularItemName"/>
						<br/>
					</td>
				</tr>
			</xsl:for-each>
		</table> -->

		<br/>
		<h1><a name="store_assignment">Store Assignment</a></h1>
		<a href="#">back to top</a>
		<table border="1" style="width:80%;border-collapse:collapse;" align="center">
			<tr>
				<th>Store</th>
				<th>Page Count</th>
			</tr>
			<xsl:for-each select="//CircularReport/StoreAssignment">
				<tr>
					<td class="rowstyle">
						<xsl:value-of select="StoreName"/>
						<xsl:text>-</xsl:text>
						<xsl:value-of select="StoreNumber"/>
					</td>
					<td>
						<xsl:value-of select="PageCount"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\CircularReport.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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