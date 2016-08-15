<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/assets/common/EmailTemplates/ExactTargetScripts.xsl"/>
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<!-- EXACT TARGET CODE FOR MAIN -->
		<xsl:call-template name="ExactTargetScript_NonPersonalized"/>
		<!-- Code to call the store content display at exact target-->
		<xsl:call-template name="ExactTargetRetrieve_StoreContent"/>
		<!-- BEGIN FOOTER -->
		<div id="footer">
			<!-- Code to call the footer display at exact target-->
			<xsl:call-template name="ExactTargetRetrieve_FooterContent"/>
		</div>
		<xsl:text disable-output-escaping="yes"><![CDATA[<custom name="opencounter" type="tracking" />]]></xsl:text>
		<!-- END FOOTER -->
	</xsl:template>
</xsl:stylesheet>