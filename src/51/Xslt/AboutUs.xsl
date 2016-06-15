<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>


	<xsl:template match="/">
		<script id="jsImage" type="text/javascript" language="javascript">

			<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
				<xsl:if test="position()=last()">
					<![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
				</xsl:if>
			</xsl:for-each>
			<![CDATA[
		for (var i = 0; i <images.length; i++)
		{
			images[i] = new Array(5);
		}
		]]>
			<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1][0] = ]]><xsl:value-of select="StoreID"/><![CDATA[;]]>
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1][1] = '/Assets/]]><xsl:value-of select="ChainID"/><![CDATA[/Images/map]]><xsl:value-of select="StoreID"/><![CDATA[.gif';]]>
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1][2] = 'Open between the hours of: ]]><xsl:value-of select="OpenHoursDisplay"/><![CDATA[';]]>
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1][3] = 'Located: ]]><xsl:value-of select="PrimaryAddress"/>, <xsl:value-of select="City"/>, <xsl:value-of select="Abbreviation"/>, <xsl:value-of select="PostalCode"/> <![CDATA[';]]>
				<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1][4] = 'Phone: ]]><xsl:value-of select="Phone"/><![CDATA[';]]>
			</xsl:for-each>
			<xsl:comment>
				<![CDATA[
    
    function showImage()
    {
        var img = document.getElementById('ImageMap');
        var sel = document.getElementById('selStore');
		var spaaddress = document.getElementById('spanaddress');
		var spaphone = document.getElementById('spanphone');
        
        var opt = sel.options[sel.selectedIndex];
                
        for (var i = 0; i <images.length; i++){
            if( images[i][0] == opt.value)
            {
                img.src = images[i][1];
				spaaddress.innerText = images[i][3];			
				spaphone.innerText = images[i][4];

                break;
            }
        }
    }
	]]>
			</xsl:comment>
		</script>
		<div id='AboutUs'>

			<h3>About Us</h3>

			<div id="AboutUsContainer">

				<div id='StoreSelector'>
					<p>Choose a location:</p>
					<div class="dropDownLocation">
						<select title="SelectedStore" onchange="javascript:showImage();" name="selStore" id="selStore">
							<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
								<option selected="true">
									<xsl:attribute name="value">
										<xsl:value-of select="StoreID"/>
									</xsl:attribute>
									<!--<xsl:if test="AboutUs/Consumer/PrimaryStoreID = StoreID">
							<xsl:attribute name="selected">true</xsl:attribute>
						</xsl:if>-->
									<xsl:value-of select="StoreName"/>
								</option>
							</xsl:for-each>
						</select>
					</div>
					<br/>
					<br/>
					<div id="storedescription">
						<div id="spanaddress"></div>
						<div id="spanphone"></div>
					</div>
				</div>

				<div id="divImageMap">
					<img id="ImageMap" name="ImageMap">
						<xsl:attribute name="src">
							/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/map<xsl:value-of select="Common/ArrayOfGenericStore/GenericStore/StoreID"/>.gif
						</xsl:attribute>
					</img>
				</div>

			</div>
		</div>
		<script id="beginload" type="text/javascript" language="javascript">
			<xsl:comment>
				<![CDATA[
		showImage();
		]]>
			</xsl:comment>
		</script>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Plumb's Valu-Rite Foods-AboutUs.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth=""
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