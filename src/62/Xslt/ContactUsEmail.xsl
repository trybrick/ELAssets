<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<xsl:if test="ExpressLane/ContactUs/formdata/formtype = 'Contact'">
			<div id="ContactUsThanks">
				<h2>Thank you for contacting us, your comments are appreciated!</h2>
				<h3>You will receive a copy of this through email if you provided us with your email address.</h3>

				<ul>
					<li>
						<strong>
							<xsl:text>Name: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/fullname"/>
					</li>
					<li>
						<strong>
							<xsl:text>Address: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/address"/>
					</li>
					<li>
						<strong>
							<xsl:text>City: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/city"/>
					</li>
					<li>
						<strong>
							<xsl:text>State: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/statetext"/>
					</li>
					<li>
						<strong>
							<xsl:text>Zip Code: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/zipcode"/>
					</li>
					<li>
						<strong>
							<xsl:text>Phone: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/areacode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/citycode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/housecode"/>
					</li>
					<li>
						<strong>
							<xsl:text>E-mail Address: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/emailaddress"/>
					</li>
					<li>
						<strong>
							<xsl:text>Store: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/selectedstoretext"/>
					</li>
					<li>
						<strong>
							<xsl:text>Compliment or Concern: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/commentconcern"/>
					</li>
				</ul>
				<p>
					<strong>What grocery shopping factors, services, or departments are most important to you?</strong>
				</p>
				<ul>
					<xsl:if test="ExpressLane/ContactUs/formdata/deli = 'true'">
						<li>Deli</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/onlineshopping = 'true'">
						<li>Online Shopping</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/specials = 'true'">
						<li>Store Specials</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/meat= 'true'">
						<li>Meat Department</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/price= 'true'">
						<li>Product Prices</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/promotions= 'true'">
						<li>Store Promotions</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/storelocation= 'true'">
						<li>Store Locations</li>
					</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/itemselection= 'true'">
						<li>Product Selection</li>
					</xsl:if>
				</ul>
				<p>
					<strong>Do we meet your grocery shopping needs?<xsl:text> </xsl:text></strong>
					<!-- <xsl:if test="ExpressLane/ContactUs/formdata/meetneeds">
						<xsl:value-of select="ExpressLane/ContactUs/formdata/meetneeds"/>
					</xsl:if> -->
					<xsl:if test="ExpressLane/ContactUs/formdata/rbmeetneedsyes = 'true'">Yes</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/rbmeetneedsmost = 'true'">Most of the Time</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/rbmeetneedsseldom = 'true'">Seldom</xsl:if>
					<xsl:if test="ExpressLane/ContactUs/formdata/rbmeetneedsno = 'true'">No</xsl:if>
				</p>
				<p>
					<strong>Suggestions or comments:</strong>
				</p>
				<xsl:value-of select="ExpressLane/ContactUs/formdata/suggestioncomments"/>
				<br/>
				<h3>
					<i>Thank you for your comments.  We will take great care into looking into this and contact you as soon as possible.</i>
				</h3>
			</div>
		</xsl:if>
		<xsl:if test="ExpressLane/ContactUs/formdata/formtype = 'Loyalty'">
			<div id="LoyaltyCardThanks">
				<h2>Thank you for applying for a Ted's IGA ClubCard!</h2>
				<h3>You will receive a copy of this through email if you provided us with your email address.</h3>

				<ul>
					<li>
						<strong>
							<xsl:text>Name: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardfullname"/>
					</li>
					<li>
						<strong>
							<xsl:text>Address: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardaddress"/>
					</li>
					<li>
						<strong>
							<xsl:text>City: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardcity"/>
					</li>
					<li>
						<strong>
							<xsl:text>State: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardstatetext"/>
					</li>
					<li>
						<strong>
							<xsl:text>Zip Code: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardzipcode"/>
					</li>
					<li>
						<strong>
							<xsl:text>Phone: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardareacode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardcitycode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardhousecode"/>
					</li>
					<li>
						<strong>
							<xsl:text>Birth Date: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardbirthdate"/>
					</li>
					<li>
						<strong>
							<xsl:text>E-mail Address: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemailaddress"/>
					</li>
					<xsl:if test="ExpressLane/ContactUs/formdata/loyaltycardalternateid = not('')">
						<li>
							<strong>
								<xsl:text>Alternate ID: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardalternateid"/>
						</li>
					</xsl:if>
				</ul>
				<xsl:if test="ExpressLane/ContactUs/formdata/loyaltycardemployerfullname = not('')">
					<br/>
					<h3>Employer Information</h3>
					<ul>
						<li>
							<strong>
								<xsl:text>Name: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerfullname"/>
						</li>
						<li>
							<strong>
								<xsl:text>Address: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployeraddress"/>
						</li>
						<li>
							<strong>
								<xsl:text>City: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployercity"/>
						</li>
						<li>
							<strong>
								<xsl:text>State: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerstatetext"/>
						</li>
						<li>
							<strong>
								<xsl:text>Zip Code: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerzipcode"/>
						</li>
						<li>
							<strong>
								<xsl:text>Phone: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerareacode"/>
							<xsl:text>.</xsl:text>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployercitycode"/>
							<xsl:text>.</xsl:text>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/loyaltycardemployerhousecode"/>
						</li>
					</ul>
				</xsl:if>
			</div>
		</xsl:if>
		<xsl:if test="ExpressLane/ContactUs/formdata/formtype = 'Cake'">
			<div id="CakeOrderThanks">
				<h2>Thank you for ordering a cake from Ted's IGA!</h2>
				<h3>You will receive a copy of this through email if you provided us with your email address.</h3>

				<ul>
					<li>
						<strong>
							<xsl:text>Name: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderfullname"/>
					</li>
					<li>
						<strong>
							<xsl:text>Address: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderaddress"/>
					</li>
					<li>
						<strong>
							<xsl:text>City: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeordercity"/>
					</li>
					<li>
						<strong>
							<xsl:text>State: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderstatetext"/>
					</li>
					<li>
						<strong>
							<xsl:text>Zip Code: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderzipcode"/>
					</li>
					<li>
						<strong>
							<xsl:text>Phone: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderareacode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeordercitycode"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorderhousecode"/>
					</li>
				</ul>
				<h3>Cake 1</h3>
				<ul>
					<li>
						<strong>
							<xsl:text>Quantity: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder1qty"/>
					</li>
					<li>
						<strong>
							<xsl:text>Description: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder1descriptionvalue"/>
					</li>
					<li>
						<strong>
							<xsl:text>Base Icing Color: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder1baseicing"/>
					</li>
					<li>
						<strong>
							<xsl:text>Decorative Icing Color: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder1color"/>
					</li>
					<li>
						<strong>
							<xsl:text>Text: </xsl:text>
						</strong>
						<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder1text"/>
					</li>
				</ul>
				<br/>
				<xsl:if test="number(ExpressLane/ContactUs/formdata/cakeorder2qty)">
					<h3>Cake 2</h3>
					<ul>
						<li>
							<strong>
								<xsl:text>Quantity: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder2qty"/>
						</li>
						<li>
							<strong>
								<xsl:text>Description: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder2descriptionvalue"/>
						</li>
						<li>
							<strong>
								<xsl:text>Base Icing Color: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder2baseicing"/>
						</li>
						<li>
							<strong>
								<xsl:text>Decorative Icing Color: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder2color"/>
						</li>
						<li>
							<strong>
								<xsl:text>Text: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder2text"/>
						</li>
					</ul>
					<br/>
				</xsl:if>
				<xsl:if test="number(ExpressLane/ContactUs/formdata/cakeorder3qty)">
					<h3>Cake 3</h3>
					<ul>
						<li>
							<strong>
								<xsl:text>Quantity: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder3qty"/>
						</li>
						<li>
							<strong>
								<xsl:text>Description: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder3descriptionvalue"/>
						</li>
						<li>
							<strong>
								<xsl:text>Base Icing Color: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder3baseicing"/>
						</li>
						<li>
							<strong>
								<xsl:text>Decorative Icing Color: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder3color"/>
						</li>
						<li>
							<strong>
								<xsl:text>Text: </xsl:text>
							</strong>
							<xsl:value-of select="ExpressLane/ContactUs/formdata/cakeorder3text"/>
						</li>
					</ul>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>