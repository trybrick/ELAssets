<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/"><style>
			#sidebar	{display:none}
		</style>
		<xsl:variable name="StoreID">
			<xsl:value-of select="//ApiParameters/StoreID" />
		</xsl:variable>
		
		
		<input type="hidden" id="keyword" name="keyword" value="next" />
		<input type="hidden" id="storeid" name="storeid">
			<xsl:attribute name="value">
				<xsl:value-of select="$StoreID" />
			</xsl:attribute>
		</input>
		<script id="commonjs" language="javascript" src="/Assets/Common/Js/Common.js" type="text/javascript" />
		<script type="text/javascript">
		<![CDATA[
			
			function DoAction(action) {
				
				$('keyword').value = action;

				document.forms[0].submit();
			}

			function SelectStore(storeID) {

				$('storeid').value = storeID;

				$('CurrentStore').innerHTML = $('storeInfoZip:' + storeID).innerHTML;
			}

		]]>
		</script>
		<div id="StoreLocator">
			<div id="StoreLocatorZipLookup">
				<div id="Instructions">
					<h2>Your Current Store:</h2>
					<p>
						Please confirm your current store by clicking the "Continue Checkout' button below.
					</p>
					<div id="CurrentStore">
						<xsl:apply-templates select="//ArrayOfGenericStore[1]/GenericStore[StoreID = $StoreID][position() = 1]" />
					</div>
				</div>
				<div id="controls">
					<a href="javascript:DoAction('cancel');" class="button">
						<span>Continue Shopping</span>
					</a>
					<a href="javascript:DoAction('next');" class="button red">
						<span>Continue Checkout</span>
					</a>
				</div>
				<div id="stores">
                	<h2>To Change Store:</h2>
					<p>To order from a different store, click the appropriate location below, and then the 'Continue' button above.</p>
					<xsl:for-each select="//ArrayOfGenericStore[1]/GenericStore">
						<xsl:sort select="StoreName" />
						<div>
							<xsl:attribute name="id">
								<xsl:value-of select="concat('storeInfoZip:', StoreID)" />
							</xsl:attribute>
                            <xsl:attribute name="class">storeInfoZip</xsl:attribute>
							<xsl:call-template name="StoreDisplay" />
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="StoreDisplay" match="GenericStore">
    	<xsl:variable name="StoreID" select="StoreID" />

    	<div>
             <xsl:attribute name="onclick"><xsl:value-of select="concat('javascript:SelectStore(', StoreID, ');')" /></xsl:attribute>
             <xsl:attribute name="style">cursor:pointer</xsl:attribute>
                <span id="storeAddress">
                    <p>
                    <strong><xsl:value-of select="StoreName" /></strong><br/>
                    <xsl:value-of select="PrimaryAddress" /><br />
                    <xsl:value-of select="concat(City, ', ', State, ' ', PostalCode)" /><br/>
                    <xsl:value-of select="Phone" />
                    </p>
					<xsl:if test="//ArrayOfStoreZone/StoreZone[StoreID = $StoreID]">
                    <br />
						<p>
							<strong>Delivery Zones: </strong><br />
							<xsl:for-each select="//ArrayOfStoreZone/StoreZone[StoreID = $StoreID]">
								<xsl:sort select="PostalCode" data-type="number" />
								<xsl:if test="position() &gt; 1">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="PostalCode" />
							</xsl:for-each>
						</p>
					</xsl:if>
                 </span>
        </div>
        

      	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\185\XmlData\185-PageTypeId-160-SecureStoreLocator.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
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