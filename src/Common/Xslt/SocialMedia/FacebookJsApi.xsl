<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="FacebookLoginButtonApi">
		<script type="text/javascript">
			function fbButtonClick(fun) { 
				if (typeof(GSNServices) == 'object' &amp;&amp; typeof(GSNServices.ConsumerSettingService) == 'object') {
					GSNServices.ConsumerSettingService.SetConsumerSettingByName('DisableFacebookSingleSignOn', 'false');
				}
				FB.login(function() {
	        		var currentPath = window.location.pathname.toLowerCase();
					
					/*Only reload the page if it is NOT the sign in page, otherwise redirect to site root*/
					if (currentPath != '/profile/signin.aspx') {
						window.location.reload();
					} else {
						window.location = '/';
					}
				}, {scope:'<xsl:value-of select="ExpressLane/FacebookSettings/ExtendedPermissions" />'});
			}
		</script>
	</xsl:template>
	<xsl:template match="/" name="FacebookJsApi">
		<xsl:if test="ExpressLane/FacebookSettings/IsActive = 'true'">
			<div id="fb-root"></div>
			<script>window.fbAsyncInit = function() {
		        	var currentPath = window.location.pathname.toLowerCase();
		        	FB.init({appId: '<xsl:value-of select="ExpressLane/FacebookSettings/ClientID"/>', status: true, cookie: true, xfbml: true, oauth: true});
				<xsl:if test="ExpressLane/GenericConsumer/IsLoggedIn = 'false'">FB.Event.subscribe('auth.authResponseChange', function(response) {
					    if (response.authResponse) {
							/*Only reload the page if it is NOT the sign in page, otherwise redirect to site root*/
							if (currentPath != '/profile/signin.aspx') {
								//window.location.reload(); /* Removed for Fixing Facebook login looping issue*/
							} else {
								//window.location = '/'; /* Removed for Fixing Facebook login looping issue*/
							}
					    } else {
					      // The user has logged out, and the cookie has been cleared
					    }
					});</xsl:if>};
			  
			    // Load the SDK asynchronously
				(function(d){
				var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
				if (d.getElementById(id)) {return;}
				js = d.createElement('script'); js.id = id; js.async = true;
				js.src = "//connect.facebook.net/en_US/all.js";
				ref.parentNode.insertBefore(js, ref);
				}(document));
			</script>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>