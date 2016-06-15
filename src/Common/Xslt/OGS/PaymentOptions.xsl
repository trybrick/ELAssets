<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	<script type="text/javascript" src="/Assets/Common/Js/OGS/PaymentOptions.js" />
	<script type="text/javascript" src="/Assets/Common/js/XMLBuilder.js" />
	<script type="text/javascript">
		function displayPaymentOption(paymentoptionid){
			
			displayPaymentOptionCC('false');
			PaymentOptionDisplay(paymentoptionid);
		}

		function savePaymentOption(){
			var paymentOptions = document.getElementsByName('paymentoptions');
			var paymentoptionid = -1;

			for (var i = 0; i &lt; paymentOptions.length; i++) {
				if (paymentOptions[i].checked) {
					paymentoptionid = paymentOptions[i].value;
				}
			}
		
			if (paymentoptionid &gt; 0){
				var orderid = '<xsl:value-of select="ExpressLane/PaymentOptions/Order/OrderID" />';
				var xml = BuildXMLDiv('PaymentOptionsDisplay');
				SavePaymentOption(orderid, paymentoptionid, xml);
			}
		}
		
		function displayPaymentOptionCC(show){
			var ccdiv = $('paymentData');
			var optiondiv = $('PaymentOptionsDisplay');
			var navdiv = $('PaymentOptionsNav');

			if(typeof(ccdiv) == 'object'){
				if(show == 'true'){
					ccdiv.style.display = 'block';
					optiondiv.style.display = 'none';
					navdiv.style.display = 'none';
				}
				else{
					ccdiv.style.display = 'none';
					optiondiv.style.display = 'block';
					navdiv.style.display = 'block';
				}
			}
		}

		function LoadData(){

			<xsl:choose>
				<xsl:when test="number(ExpressLane/PaymentOptions/Order/PaymentOption/PaymentOptionID)">
					var paymentoptionid = '<xsl:value-of select="ExpressLane/PaymentOptions/Order/PaymentOption/PaymentOptionID" />';
				</xsl:when>
				<xsl:otherwise>
					var paymentoptionid = '<xsl:value-of select="ExpressLane/PaymentOptions/ArrayOfPaymentOption/PaymentOption/PaymentOptionID" />';
				</xsl:otherwise>
			</xsl:choose>

			if(paymentoptionid == parseInt(paymentoptionid)){
				var options = document.getElementsByName('paymentoptions');

				for(i=0; i &lt; options.length; i++){
					var option = options[i];

					if(option.value == paymentoptionid){
						option.checked = true;
						
						if(option.title == 'Credit Card'){
							displayPaymentOptionCC('true');
						}
						else{
							displayPaymentOption(paymentoptionid);
						}
						break;
					}
				}
			}
		}
		
		
	</script>
	<script type="text/javascript" for="window" event="onload">
		if (document.all) { LoadData(); }
		else { window.document.addEventListener("DOMContentLoaded", LoadData, true); } //firefox

	</script>
	<div id="PaymentOptions" class="CheckoutPage">
		<div id="PaymentOptionsList">
			<h1>Payment Options:</h1>
			<xsl:choose>
				<xsl:when test="//DeliveryType = 'Delivery'">
					<xsl:call-template name="PaymentOptionListDelivery" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PaymentOptionListPickup" />
				</xsl:otherwise>
			</xsl:choose>
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
				<!-- a necessary evil. believe me -->
				<a class="button" style="background-image:none;"><span style="background-image:none; color:#fff;">Clear</span></a>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</xsl:template>

<!-- ================================================== -->

	<xsl:template name="PaymentOptionListPickup">
		<xsl:for-each select="//PaymentOptions/ArrayOfPaymentOption/PaymentOption">
		<xsl:sort select="DisplayOrder" />
			<xsl:call-template name="PaymentOptionItem" />
		</xsl:for-each>
	</xsl:template>

<!-- ================================================== -->

	<xsl:template name="PaymentOptionListDelivery">
		<xsl:for-each select="//PaymentOptions/ArrayOfPaymentOption/PaymentOption[not(Description = 'Cash or Check')]">
		<xsl:sort select="DisplayOrder" />
			<xsl:call-template name="PaymentOptionItem" />
		</xsl:for-each>
	</xsl:template>

<!-- ================================================== -->

	<xsl:template name="PaymentOptionItem" match="PaymentOption">
		<xsl:variable name="idvalue" select="concat('paymentoption', position())" />
		<input>
			<xsl:attribute name="id"><xsl:value-of select="$idvalue" /></xsl:attribute>
			<xsl:attribute name="type">radio</xsl:attribute>
			<xsl:attribute name="name">paymentoptions</xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="PaymentOptionID" /></xsl:attribute>
			<xsl:attribute name="title"><xsl:value-of select="Description" /></xsl:attribute>
			<xsl:choose>
				<xsl:when test="(Description = 'Credit Card')">
					<xsl:attribute name="onclick">javascript:displayPaymentOptionCC('true');</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="onclick">javascript:displayPaymentOption(this.value);</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</input>
		<label>
			<xsl:attribute name="for"><xsl:value-of select="$idvalue" /></xsl:attribute>
			<xsl:value-of select="Name" />
		</label>
		<br />
	</xsl:template>

<!-- ================================================== -->

</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->