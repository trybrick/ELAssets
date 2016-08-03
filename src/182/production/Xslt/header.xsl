<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <style type="text/css">
@import url(http://foodcity.gsngrocers.com/production/foodcity-overrides.css);
</style>
    
    <!--Import your own CSS file hosted on FTP-->
    <div  class="header-wrap">
      <div class="header centered">
        <div id="logo-wrap"><a href="http://www.foodcity.com/" class="centered"><img class="logo-header centered" src="http://www.foodcity.com/site/images/content/logo-header.png" alt="Food City" /> </a> </div>
        <div id="login-wrap">
          <div class="login float-right"><a class="block" href="http://my.foodcity.com"></a></div>
        </div>
      </div>
    </div>
    <!-- ***** End Header ***** -->
    <!-- ***** Begin Primary Nav ***** -->
    <div class="nav">
      <ul class="nav horizontal float-left">
        <li><a class="block" href="http://www.foodcity.com/shop">Shop</a> </li>
        <li><a class="block" href="http://www.foodcity.com/save">Save</a> </li>
        <li><a class="block" href="http://www.foodcity.com/plan">Plan</a> </li>
        <li><a class="block" href="http://www.foodcity.com/learn">Learn</a> </li>
        <li><a class="block" href="http://www.foodcity.com/pharmacy">Pharmacy</a> </li>
        <li><a class="block" href="http://www.foodcity.com/join">Join</a> </li>
        <li><a class="block" href="http://www.foodcity.com/valucard/partners">Valucard</a> </li>
        <li><a class="block" href="http://www.foodcity.com/community/community-events">Community</a> </li>
      </ul>
     <div align="right" style="  float: right; height: 20px; margin-top: 8px; width: 250px; color:#FFF">
        <xsl:choose>
          <xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
            
          </xsl:when>
          <xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
            
          </xsl:when>
        </xsl:choose>
      </div>
    </div>
    <div class="clear"></div>
    <div id="content-spacer-top"></div>
    <!-- ***** End Primary Nav ***** -->
  </xsl:template>
</xsl:stylesheet>