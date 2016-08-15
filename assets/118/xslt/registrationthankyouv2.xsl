<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
    	<xsl:variable name="IsOGS" select="//GenericChain/ChainSettings/Setting[SettingID = 130]/Value" />
        <div id="SignUpV2">
			<h2>Free Membership</h2>
            <div class="signUpSteps5">
  				<xsl:choose>
					<xsl:when test="$IsOGS = 'True'">
						<img src="/Assets/Common/Images/Registration/pReg_OGS_step5.png" />
					</xsl:when>
					<xsl:otherwise>
						<img src="/Assets/Common/Images/Registration/pReg_step5.png" />
					</xsl:otherwise>
				</xsl:choose>
            </div>
    		<div>
				<div id="signUpPhoto">
					<img src="/Assets/Common/Images/Registration/pReg_shopper2.jpg" alt="Grocery Shopper"/>
				</div>
				<div class="signUpText"><label>Thank you for registering.</label><label>You may now use all of our features.</label></div>
				<div id="navigation">
					<div class="homeButton" onclick="parent.location='/'">Home Page</div>
					<div class="profileButton" onclick="parent.location='/Profile/SignUp.aspx'">Edit Profile</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->