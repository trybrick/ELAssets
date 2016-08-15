<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="ReferAFriendResponse.xsl" />
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:param name="Consumer" select="ExpressLane/Common/Consumer[IsLoggedIn = 'true']"/>
		<script type="text/javascript" src="/Assets/Common/js/Profile/ProfileService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/ReferAFriend/ReferAFriendPage.js"/>
		<script type="text/javascript">
			GSNPageItems.ReferAFriend = {
				<xsl:choose>
					<xsl:when test="count(//Referrals/Referral) &gt; 0">IsPromotional: true,</xsl:when>
					<xsl:otherwise>IsPromotional: false,</xsl:otherwise>
				</xsl:choose>
				ConsumerEmail: '<xsl:value-of select="//GenericConsumer/Email"/>'
			};
		</script>
		<div id="ReferAFriendHeader">
			<h1>Refer a Friend</h1>
			<p>Please enter your friends' names &amp; email addresses and we'll email them about our service.</p>
		</div>
		<div id="ReferredFriends">
			<h2>Referred Friends</h2>
			<div id="ReferAFriendList">
				<xsl:call-template name="PreviousReferrals" />
			</div>
		</div>
		<div id="ReferAFriendError" style="display:none;"></div>
		<div id="ReferAFriendMain">
			<xsl:call-template name="FriendControl">
				<xsl:with-param name="i">1</xsl:with-param>
			</xsl:call-template>
		</div>
		<div id="ReferAFriendButtons">
			<a id="cmdCancel" class="button" href="##root##">
				<span>Cancel</span>
			</a>
			<a id="cmdSubmit" class="button" href="javascript:void(0);" onclick="GSNPages.ReferAFriend.Save();">
				<span>Send</span>
			</a>
		</div>
	</xsl:template>
	<xsl:template name="FriendControl">
		<xsl:param name="i"></xsl:param>
		<div id="{concat('Friend', $i)}" class="Friend">
			<h2>Add a Referral</h2>
			<div id="{ concat('FriendControls', $i) }">
				<table>
					<tr>
						<td id="{ concat('FirstNameLabel', $i) }" class="FriendFormLabel">
							First Name:
						</td>
						<td>
							<input id="{ concat('txtFirstName', $i) }" name="{ concat('txtFirstName', $i) }" title="First Name" type="text" width="50" onkeypress="if (event.keyCode==13) GSNPages.ReferAFriend.Save(); return event.keyCode!=13;">
							</input>
						</td>
					</tr>
					<tr>
						<td id="{ concat('LastNameLabel', $i) }" class="FriendFormLabel">
							Last Name:
						</td>
						<td>
							<input id="{ concat('txtLastName', $i) }" name="{ concat('txtLastName', $i) }" title="Last Name" type="text" width="50" onkeypress="if (event.keyCode==13) GSNPages.ReferAFriend.Save(); return event.keyCode!=13;">
							</input>
						</td>
					</tr>
					<tr>
						<td id="{ concat('EmailLabel', $i) }" class="FriendFormLabel">Email Address:</td>
						<td>
							<input id="{ concat('txtEmail', $i) }" name="{ concat('txtEmail', $i) }" title="Friend Email" type="text" width="250px" onkeypress="if (event.keyCode==13) GSNPages.ReferAFriend.Save(); return event.keyCode!=13;">
							</input>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>