<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:output method="html"/>
	<!-- ========================================================== -->
	<!-- This object is now being populated via the 'TrackingTag' table in the database, so it renders consistently across all sites without XSLT-->
	<xsl:template name="GoogleAnalytics_PageTracking" match="/">
		<script src="/Assets/Common/Js/Analytics/GoogleAnalytics_Scripts.js" type="text/javascript"/>
		<script type="text/javascript">
			if (typeof (GSNTrackingItems) == 'undefined' || GSNTrackingItems == null) {
			    var GSNTrackingItems = new Object();
			}

			GSNTrackingItems.PageTracking = {
				TrackingKey: '', 
				TrackingHost: document.location.hostname
			}

			//submit page tracking to google analytics - both global and chain are handled by the function
			submitPageTracking();
		</script>
		<!-- Here's what the script calls look like in the database - they look the same but pull in different chain settings-->
		<script type="text/javascript">
			if (typeof (GSNTrackingItems) == 'object') {
				GSNTrackingItems.PageTracking.TrackingKey = '##TrackingKey##'; 
				submitPageTracking(); 
			}
		</script>
	</xsl:template>
	<!-- ========================================================== -->
	<xsl:template name="GoogleAnalytics_OrderInvoice" match="/">
		<xsl:if test="((//GenericChain/ChainSettings/Setting[SettingName = 'EnableGoogleEcommerceTracking']/Value = 1) or (//GenericChain/ChainSettings/Setting[Name = 'EnableGoogleEcommerceTracking']/Value = 1)) and (//Order/Chain/ChainID = //GenericChain/ChainID)">
			<script type="text/javascript">
				if (typeof (GSNOrderItems) == 'undefined' || GSNOrderItems == null) {
				    var GSNOrderItems = new Object();
				}

				GSNOrderItems.Order = {
					OrderID: [<xsl:value-of select="//Order/OrderID"/>],
					StoreName: ['<xsl:call-template name="CleanOutput">
					<xsl:with-param name="InputValue" select="//Order/Store/StoreName"/>
					</xsl:call-template>'],
					Total: [<xsl:value-of select="format-number(//Order/OrderInformation/Total, '#.00')"/>],
					Tax: [<xsl:choose>
							<xsl:when test="string-length(//Order/OrderInformation/TaxTotal) &gt; 0"><xsl:value-of select="format-number(//Order/OrderInformation/TaxTotal, '#.00')"/></xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>],
					DeliveryFee: [<xsl:value-of select="format-number(//Order/OrderInformation/AppliedDeliveryFee, '#.00')"/>],
					City: ['<xsl:call-template name="CleanOutput">
					<xsl:with-param name="InputValue" select="//Order/Store/City"/>
					</xsl:call-template>'],
					State: ['<xsl:call-template name="CleanOutput">
					<xsl:with-param name="InputValue" select="//Order/Store/StateAbbreviation"/>
					</xsl:call-template>'],
					Country: ['<xsl:call-template name="CleanOutput">
					<xsl:with-param name="InputValue" select="//Order/Chain/ChainSettings/Setting[Name='ChainCountries']/Value"/>
					</xsl:call-template>'],
					TotalItems: [<xsl:value-of select="count(//Order/Items/OrderItem)"/>],
					SubSelectOptions: [
						<xsl:for-each select="//Order/Items/OrderItem">
							{ UPC: [<xsl:value-of select="UPC11"/>], 
							  ProductName: ['<xsl:call-template name="CleanOutput">
								<xsl:with-param name="InputValue" select="ProductDescription"/>
								</xsl:call-template>'], 
							  Category: ['Product'], 
							  UnitPrice: [<xsl:value-of select="format-number(Price, '#.00')"/>],
							  Quantity: [<xsl:value-of select="Quantity"/>],
							 }<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
					]
				}
			
				//submit transaction to google analytics
				document.observe("dom:loaded", function() {
				  	submitTransactionTracking();	
				});
			</script>
		</xsl:if>
	</xsl:template>
	<!-- ========================================================== -->
	<xsl:template name="CleanOutput">
		<xsl:param name="InputValue"/>
		<xsl:variable name="DirtyChars">"'*</xsl:variable>
		<xsl:variable name="CleanChars"> </xsl:variable>
		<xsl:value-of select="translate($InputValue,$DirtyChars,$CleanChars)"/>
	</xsl:template>
	<!-- ========================================================== -->
</xsl:stylesheet>
