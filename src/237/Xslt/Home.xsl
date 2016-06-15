<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
     			function redirectPage()
        		{
                window.location = "index.aspx?linkid=0"
        		}
				]]></xsl:comment>
		</script>
		<script id="js" type="text/javascript" language="javascript">
      redirectPage();
    </script>
	</xsl:template>
</xsl:stylesheet>
