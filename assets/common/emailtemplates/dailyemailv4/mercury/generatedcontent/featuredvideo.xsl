<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	<xsl:template match="/">
		<xsl:variable name="destination" select="'##root##/Recipes/RecipeVideos.aspx'"/>
		<div id="podFeaturedVideo" class="EmailPod">
			<h2>Featured Video</h2>
			<a href="{$destination}">
				<xsl:choose>
					<xsl:when test="string-length(//Video/ThumbNail) &gt; 0">
						<img src="{//Video/ThumbNail}" alt="Featured Video"/>
					</xsl:when>
					<xsl:otherwise>
						<img src="##root##/Assets/Common/EmailTemplates/DailyEmail/images/podFeatVid.jpg" alt="Featured Video"/>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
