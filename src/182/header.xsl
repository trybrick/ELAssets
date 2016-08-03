<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/"><style type="text/css">
@import url(http://foodcity.gsngrocers.com/beta/foodcity-overrides.css);
</style>
    
    
    <!--Import your own CSS file hosted on FTP-->
    <div  class="header-wrap">
      <div class="header centered">
        <div id="logo-wrap"><a href="http://www.foodcity.com/" class="centered"><img class="logo-header centered" src="http://www.foodcity.com/site/images/content/logo-header.png" alt="Food City" /> </a> </div>
        <div id="login-wrap">
        <div class="login float-right"><a class="block" href="http://foodcity.gsnrecipes.com/Profile/SignIn.aspx" target="_blank"></a></div>
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
        <li><a class="block" href="http://www.foodcity.com/valucard/partners" target="_blank">Valucard</a> </li>
        <li><a class="block" href="http://www.foodcity.com/community/community-events" target="_blank">Community</a> </li>
      </ul>
      <div align="right" style="width: 250px; height:44px;">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
								<strong style="color:#FFF">Not logged in</strong> <a href="##root##/Profile/SignUp.aspx" style="color:#FFF">Register</a> or <a href="##root##/Profile/SignIn.aspx" style="color:#FFF">Login</a></xsl:when>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<strong style="color:#FFF">Welcome <xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></strong><a href="##root##/Profile/Signup.aspx">Edit My Profile</a> | <a href="##root##/Profile/SignOut.aspx">Logout</a></xsl:when>
						</xsl:choose>
					</div>

    </div>
    <div id="content-spacer-top"></div>
    <!-- ***** End Primary Nav ***** -->
  </xsl:template>
</xsl:stylesheet>