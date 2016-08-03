<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="footer">
			<a href="http://www.applemarketstjoe.com/?page=home" class="flink">
				<img src="/Assets/193/Images/bottom_home.png" width="58" height="20" alt="Home"/>
			</a>
			<a href="http://www.applemarketstjoe.com/?page=about" class="flink">
				<img src="/Assets/193/Images/bottom_about.png" width="68" height="20" alt="About"/>
			</a>
			<a href="http://www.applemarketstjoe.com/?page=contact" class="flink">
				<img src="/Assets/193/Images/bottom_contact.png" width="89" height="20" alt="Contact us"/>
			</a>
			<a href="http://www.applemarketstjoe.com/?page=employment" class="flink">
				<img src="/Assets/193/Images/bottom_employment.png" width="100" height="20" alt="Employment"/>
			</a>
			<a href="http://www.applemarketstjoe.com/?page=services" class="flink">
				<img src="/Assets/193/Images/bottom_services.png" width="76" height="20" alt="Services"/>
			</a>

			<a href="http://www.applemarketstjoe.com/?page=legal" class="flink">
				<img src="/Assets/193/Images/bottom_legal.png" width="55" height="20" alt="Legal"/>
			</a>
			<a href="http://www.applemarketstjoe.com/?page=privacy" class="flink">
				<img src="/Assets/193/Images/bottom_privacy.png" width="66" height="20" alt="Privacy"/>
			</a>
		</div>
		<xsl:call-template name="FacebookJsApi"/>
	</xsl:template>
</xsl:stylesheet>