<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	  <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
    <!-- Javascript URL redirection     -->
    <script type="text/javascript">
        window.location.replace("/Shop/Coupons.aspx");
    </script>
    </xsl:template>
</xsl:stylesheet>