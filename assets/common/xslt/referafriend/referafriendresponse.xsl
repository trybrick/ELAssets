<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template name="PreviousReferrals" match="/">
		<table id="ReferAFriendList">
			<xsl:for-each select="//Referrals/Referral">
				<tr>
					<td class="FriendName"><xsl:value-of select="FirstName"/>&#xA0;<xsl:value-of select="LastName"/></td>
					<td class="FriendEmail">
						<xsl:value-of select="FriendEmail"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<div id="SuccessMessage" style="display:none;">
			<xsl:choose>
				<xsl:when test="//ReferAFriendResponse/Code = 0">
					<h2 class="pageHeader">Thank you for referring a friend!</h2>
					<xsl:choose>
						<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent">
							<div class="StaticContent">
								<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
									<xsl:sort select="SortBy" data-type="number"/>
									<xsl:value-of select="Description" disable-output-escaping="yes"/>
								</xsl:for-each>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<p>Thank you for sharing our site!  Email(s) have been sent to your friend(s).</p>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="//ReferAFriendResponse/Code = 1">
					<p>You have already referred this friend.</p>
				</xsl:when>
				<xsl:when test="//ReferAFriendResponse/Code = 2">
					<p>Someone has already referred this friend.</p>
				</xsl:when>
				<xsl:otherwise>
					<h2 class="pageHeader">Thank you for referring a friend!</h2>
					<p>Thank you for sharing our site!  Email(s) have been sent to your friend(s).</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>
