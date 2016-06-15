<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <a>
		<xsl:attribute name="class">lightwindow</xsl:attribute>
		<xsl:attribute name="href">http://www.giantfoodstores.com/shareddev/sharedcontent/GSNHC</xsl:attribute>
		<xsl:attribute name="title">Create Your Own Personalized Shopping List!</xsl:attribute>
		<xsl:attribute name="params">lightwindow_width=800,lightwindow_close=true</xsl:attribute>
      <img>
        <xsl:attribute name="src">##root##/Assets/123/Images/giant_help.gif</xsl:attribute>
      	<xsl:attribute name="border">0</xsl:attribute>
	  </img>
	
   </a>

	<br/>
		
  </xsl:template>
</xsl:stylesheet>