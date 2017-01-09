<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/ShoppingList/ShoppingListOGS2Buttons.xsl"/>
	<xsl:import href="/Assets/Common/Xslt/AdPod.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">
			window.location.href = "http://www.hannaford.com/";
		</script>
	</xsl:template>
</xsl:stylesheet>