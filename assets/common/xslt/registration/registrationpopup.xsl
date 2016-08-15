<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript">var isLoggedIn = <xsl:value-of select="//GenericConsumer/IsLoggedIn"/>;</script>
		<script src="/Assets/Common/Js/Registration/RegistrationPopup.js" type="text/javascript"/>
		<div id="registration_Popup" style="display:none;">
			<xsl:if test="ExpressLane/header/logo != ''">
				<img border="0" id="registration_Logo">
					<xsl:attribute name="src">
						<xsl:value-of select="ExpressLane/header/logo"/>
					</xsl:attribute>
				</img>
			</xsl:if>
			<a id="registration_Close" href="javascript:closeRegistrationPopup();">
				</a>
			<a id="registration_SignUp" href="Profile/SignUp.aspx">
				</a>
			<a id="registration_SignIn" href="Profile/SignIn.aspx">
				</a>
		</div>
	</xsl:template>
</xsl:stylesheet>