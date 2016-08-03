<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	<script type="text/javascript" src="/Assets/189/js/header.js"></script>
	<style type="text/css">
@media print
{
.noprint {display:none;}
}</style>
		<div id="sHeader" class="noprint">
    		<ul>
        		<li><a href="http://superonefoods.gsnrecipes.com/Shop/WeeklyAd.aspx">Weekly Ad</a></li>
        		<li><a href="http://www.superonefoods.com/locator/">Find Store</a></li>
        		<li><a href="/Profile/SignUp.aspx">Manage My Account</a></li>
      		</ul>
			<xsl:if test="//GenericConsumer/PrimaryStoreID &gt; 0">
				<xsl:variable name="StoreID">
					<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
				</xsl:variable>
				<div id="myStore" style="display:block;">
      				<span>My Store</span>
      				<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
      				<xsl:if test="//GenericStore[StoreID = $StoreID]/SecondaryAddress != ''">
						<xsl:value-of select="//GenericStore[StoreID = $StoreID]/SecondaryAddress"/>
					</xsl:if>
					<xsl:text> - </xsl:text>
					<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>, 
					<xsl:value-of select="//GenericStore[StoreID = $StoreID]//State"/>
					<a href="#" id="cancelStore" onclick="changeMyStore()" onmouseover="showStoreToolTip()" ></a>
					<em style="display:none;">Change Store</em>
      			</div><!-- // myStore -->
			</xsl:if>
			<div id="searchwrapper">
				<xsl:if test="//GenericConsumer/PrimaryStoreID &gt; 0">
					<xsl:attribute name="style">display:none;</xsl:attribute>
				</xsl:if>
        		<!-- <form action="http://dev.superonefoods.com/locator/default.aspx" method="post">
          			<input type="text" id="searchbox" name="searchbox" value="Search Locations" onclick="this.value=&quot;&quot;;"/>
          			<input type='hidden' id='headerSearch' name='headerSearch' value='1' />
          			<input type="image" src="/Assets/189/Images/layout/0.png" id="searchbox_submit"  />
				</form> -->
				<input type="text" id="searchbox" name="searchbox" value="Search Locations" onclick="this.value=&quot;&quot;;"/>
				<a href="#" id="searchbox_submit">Submit</a>
      		</div><!-- // searchwrapper -->
			<h1><a href='http://www.superonefoods.com'>Super One Foods</a></h1>
    	</div>
    <!-- // header -->
    <div id="navigation" class="clearfix noprint">
    	<ul id="topMenu">
        	<li> <a href="http://www.superonefoods.com">Home</a> </li>
        	<li><span>|</span></li>
        	<li> <a><xsl:attribute name="href">##root##/Shop/WeeklyAd.aspx</xsl:attribute>Weekly Ad</a></li>
        	<li><span>|</span></li>
        	<li> <a href="http://www.superonefoods.com/locator/">Store Locator</a> </li>
        	<li><span>|</span></li>
        	<li> <a><xsl:attribute name="href">##root##/Recipes/Recipecenter.aspx</xsl:attribute>Recipes</a></li>
        	<li><span>|</span></li>
        	<li id="dept"> <a href="#">Department</a>
          		<ul>
            		<li> <a href="http://www.superonefoods.com/produce/">Produce</a> </li>
            		<li> <a href="http://www.superonefoods.com/meat/">Meat and Poultry</a> </li>
            		<li> <a href="http://www.superonefoods.com/deli/">Deli</a> </li>
            		<li> <a href="http://www.superonefoods.com/bakery/">Bakery</a> </li>
          		</ul>
        	</li>
        	<li><span>|</span></li>
        	<li> <a href="http://www.superonefoods.com/employment/">Employment</a> </li>
        	<li><span>|</span></li>
        	<li> <a href="http://www.superonefoods.com/contact/">Contact</a></li>
        	<li><span>|</span></li>
        	<li> <a href="http://www.superonefoods.com/about/">About</a> </li>
      	</ul>
    	<!--logout button-->
		<xsl:choose>
			<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
				<a  id="btn_logout" title="Log Out">
				<xsl:attribute name="href">##root##/Profile/SignOut.aspx</xsl:attribute>
					Log Out
				</a>
			</xsl:when>
			<xsl:otherwise>
				<!--login button-->
				<a id="btn_login" title="Log In">
					<xsl:attribute name="href">##root##/Profile/SignIn.aspx</xsl:attribute>
					Log In
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</div>
	<a name="content"></a>
	</xsl:template>
</xsl:stylesheet>