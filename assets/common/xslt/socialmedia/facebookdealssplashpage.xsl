<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="http://localhost/Assets/Common/Xslt/PersonalizedSpecials/PersonalizedSpecialsV3.xsl" />
	<xsl:output method="html" />
	<xsl:template match="/">
		<div id="fb-root"></div>
		<style type="text/css">

			.GroupFrame{
				clear: both;
				float: left;
				margin-bottom: 12px;
				width: 100%;
			}
			.GroupItem{
				border-right: 1px dotted #CCCCCC;
				display: inline;
				float: left;
				margin: 0;
				min-height: 250px;
				padding: 0;
				text-align: center;
				width: 140px;
			}
		</style>
		<script type="text/javascript" src="{//GenericChain/PreferedHost}/Assets/Common/Js/ShoppingList/ShoppingListPage.js"></script>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script type="text/javascript">
		<![CDATA[
		function redirectPage(){
				top.location.href = "https://www.facebook.com/dialog/oauth?client_id=193356324028582&redirect_uri=http://www.facebook.com/pages/GSN-Test-Page/140902689308886?sk=app_193356324028582&scope=email,user_location";
			}
			
		window.fbAsyncInit = function() {
    		FB.init({appId: '193356324028582', status: true, cookie: true,
             xfbml: true});
  			};
  			(function() {
    		var e = document.createElement('script'); 
			e.async = true;
    		e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
    		document.getElementById('fb-root').appendChild(e);
  			}());
			]]>
		</script>
			
		<xsl:choose>
			<xsl:when test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0 or //SignedRequest/UserID">
				<div id="info"></div>
				<script>
				<![CDATA[
				var
				  info   = document.getElementById('info'),
				  update = function(response) {
				    if (!response.session) {
				      info.innerHTML = '<em>You must login using the controls at the top.</em>';
				      return;
				    }
				
				    FB.api(
				      {
				        method: 'fql.query',
				        query: 'SELECT name, pic_square FROM user WHERE uid=' + response.session.uid
				      },
				      function(response) {
				        info.innerHTML = (
				          '<img src="' + response[0].pic_square + '"> ' +
				          'Welcome, ' + response[0].name + '!'
				        );
				      }
				    );
				  };
				
				// update on login, logout, and once on page load
				FB.Event.subscribe('auth.login', update);
				FB.Event.subscribe('auth.logout', update);
				FB.getLoginStatus(update);
				]]>
				</script>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="concat(//GenericChain/DomainName, '/FacebookDeals')"/>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src"><xsl:value-of select="concat('/Assets/','148/Images/haddock_header.jpg')"/></xsl:attribute>
					</img>
				</a>
				<br/>
				<xsl:text>Please Click on image to continue !!</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<p>Account has not been authorized yet. Please <a href="{//GenericChain/PreferedHost}/Profile/Signin.aspx">sign in here</a> with you facebook account.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
