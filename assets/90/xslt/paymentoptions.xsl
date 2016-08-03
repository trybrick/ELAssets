<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	<style type="text/css">
		#paymentData {display:none;}
	</style>
	<script type="text/javascript" src="/Assets/Common/Js/OGS/PaymentOptions.js" />
	<script type="text/javascript" src="/Assets/Common/js/XMLBuilder.js" />
	<script type="text/javascript">
		function savePaymentOption(){
			var paymentoptionList = $('PaymentOptionsList'); //$$('input[type="radio"][name="paymentoptions"]');
			var paymentoptionid = undefined;

			for( var i = 0; i &lt; paymentoptionList.childNodes.length; i++){
				if(paymentoptionList.childNodes[i].tagName &amp;&amp; paymentoptionList.childNodes[i].tagName == 'INPUT'){
					if(paymentoptionList.childNodes[i].name &amp;&amp; paymentoptionList.childNodes[i].name == 'paymentoptions'){
						if(paymentoptionList.childNodes[i].checked &amp;&amp; paymentoptionList.childNodes[i].value)
						{
							paymentoptionid = paymentoptionList.childNodes[i].value;
							break;
						}
					}
				}
			}
			//var paymentoptionid = paymentoptions; //.find(function(re) {return re.checked;} ).value; 
			var orderid = '<xsl:value-of select="ExpressLane/PaymentOptions/Order/OrderID" />';

			var xml = BuildXMLDiv('PaymentOptionsDisplay');

			SavePaymentOption(orderid, paymentoptionid, xml);
		}

		function LoadData(){
			var paymentoptionid = $$('input[type="radio"][name="paymentoptions"]').find(function(re) {return re.checked;} ).value; 
			PaymentOptionDisplay(paymentoptionid);
		}
	</script>
	<script type="text/javascript" for="window" event="onload">
		if (document.all) { LoadData(); }
		else { window.document.addEventListener("DOMContentLoaded", LoadData, true); } //firefox

	</script>
	<div id="PaymentOptions" class="CheckoutPage">
		<div id="PaymentOptionsList">
			<h1>Payment Options:</h1>
			
			<xsl:variable name="PaymentOptionID">
				<xsl:choose>
					<xsl:when test="number(//Order/PaymentOption/PaymentOptionID)">
						<xsl:value-of select ="//Order/PaymentOption/PaymentOptionID"></xsl:value-of>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>-1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:for-each select="//PaymentOptions/ArrayOfPaymentOption/PaymentOption">
				<xsl:sort select="DisplayOrder" />
				<xsl:variable name="idvalue" select="concat('paymentoption', position())" />

				<input>
					<xsl:attribute name="id"><xsl:value-of select="$idvalue" /></xsl:attribute>
					<xsl:attribute name="type">radio</xsl:attribute>
					<xsl:attribute name="name">paymentoptions</xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="PaymentOptionID" /></xsl:attribute>
					<xsl:attribute name="title"><xsl:value-of select="Description" /></xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:value-of select="concat('javascript:PaymentOptionDisplay(', PaymentOptionID, ');')" />
					</xsl:attribute>
					
					<xsl:choose>
						<xsl:when test="$PaymentOptionID = '-1'">
							<xsl:if test="position() = 1">
								<xsl:attribute name="checked">
									<!--<xsl:value-of select="'true'" /> -->
								</xsl:attribute>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="PaymentOptionID = $PaymentOptionID">
								<xsl:attribute name="checked">
									<!--<xsl:value-of select="'true'" /> -->
								</xsl:attribute>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>

				</input>
				<label>
					<xsl:attribute name="for"><xsl:value-of select="$idvalue" /></xsl:attribute>
					<xsl:value-of select="Name" />
				</label>
				<br />
			</xsl:for-each>
            <br/><br/>
			<div id="PaymentOptionsDisplay">
			</div>
			<div id="PaymentOptionsNav">
				<a>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:attribute name="href">javascript:GetPreviousCheckOutStep();</xsl:attribute>
					<span>Back</span>
				</a>
				<a>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:attribute name="href">javascript:GetCancelCheckOut();</xsl:attribute>
					<span>Cancel</span>
				</a>
				<a>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:attribute name="href">javascript:savePaymentOption();</xsl:attribute>
					<span>Continue</span>
				</a>
			</div>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XmlData\90-PageTypeId-148-PaymentOptions.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
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