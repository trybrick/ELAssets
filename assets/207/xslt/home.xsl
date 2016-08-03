<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="/Assets/Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<div id="SplashContainer">
			<xsl:call-template name="SlideShow">
				<xsl:with-param name="Delay" select = "12" />
			</xsl:call-template>
			<script>
				var timeout = 12000;
			</script>
			<div id="AdPromo">
				<div class="AdPromoSep">
					<a href="Shop/WeeklyAd.aspx">
						<xsl:choose>
							<xsl:when test="string-length(//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl) &gt; 0">
								<img alt="Check Out Our Weekly Ads!" width="90" style="margin:40px 0 0 25px;">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:when test="string-length(//CircularPageSummary/SmallImageUrl) &gt; 0">
								<img alt="Check Out Our Weekly Ads!" width="90" style="margin:40px 0 0 25px;">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<div id="circularThumbnail">
									<img alt="Check Out Our Weekly Ads!" width="120" style="margin:60px 0 0 15px;" src="/Assets/Common/Images/CircularThumb.png"/>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</div>
				<div class="AdPromoSep">
					<a href="/Shop/Coupons.aspx">
						<img src="/Assets/207/Images/weeklyCoupons.jpg" alt="Weekly Coupons"/>
					</a>
				</div>
			</div>
			<div id="splashblocks">
				<div>
					<img src="/Assets/207/Images/giftHeader.jpg"/>
					<!--REMOVED UNTIL CLIENT REQUESTS GIFT CARD STATIC CONTENT PAGE
						<a href="/GiftCards.aspx">-->
					<div id="giftCard" class="blockBorder">
						<p class="bodyp">We offer Gift Certificates in all our locations to make getting the perfect gift for anyone and any occasion! See our stores for details!</p>
						<!--<img src="/Assets/207/Images/giftcard.jpg" class="blockBorder" alt="The Perfect Gift"/>-->
					</div>
					<!--REMOVED UNTIL CLIENT REQUESTS GIFT CARD STATIC CONTENT PAGE
						</a>-->
				</div>
				<div>
					<img src="/Assets/207/Images/departmentsHeader.jpg"/>
					<img src="/Assets/207/Images/specialtyDepartments.jpg" class="blockBorder" alt="Specialty Departments" usemap="#sullivans_departments"/>
					<map id="sullivans_departments" name="sullivans_departments">
						<area href="/Bakery.aspx" coords="0,0,150,160" shape="rect"/>
						<area href="/Produce.aspx" coords="150,0,300,160" shape="rect"/>
						<area href="/Deli.aspx" coords="0,160,150,300" shape="rect"/>
						<area href="/Meat.aspx" coords="150,160,300,300" shape="rect"/>
					</map>
				</div>
				<div>
					<img src="/Assets/207/Images/cateringHeader.jpg"/>
					<a href="/Catering.aspx">
						<img src="/Assets/207/Images/catering.jpg" class="blockBorder" alt="Catering Meals to Go"/>
					</a>
				</div>
				<div style="display:none;"></div>
			</div>
		</div>
		<div id="GoingGreen">
			<div id="GoingGreenText">
				<h1>Going Green</h1>
				<p class="bodyp">Sullivan's is proud to introduce its new "Going Green" Grocery bags for only 99 cents a bag.  Purchase one bag and receive 5 cents off your grocery order.  Then each time you shop with the bag you will get 5 cents off for each bag used!</p>
			</div>
			<div id="GoingGreenImg">
				<img src="/Assets/207/Images/greenbag.jpg" alt=""/>
			</div>
		</div>
		<div id="StoreFooter">
			<img>
				<xsl:attribute name="src">/Assets/207/Images/footer-savanna-station.jpg</xsl:attribute>
				<xsl:attribute name="border">0</xsl:attribute>
				<xsl:attribute name="usemap">#m_sullivans_footer</xsl:attribute>
			</img>
			<img>
				<xsl:attribute name="src">/Assets/207/Images/footer-condo-rentals.jpg</xsl:attribute>
				<xsl:attribute name="border">0</xsl:attribute>
				<xsl:attribute name="usemap">#m_sullivans_footer</xsl:attribute>
			</img>
			<img>
				<xsl:attribute name="src">/Assets/207/Images/footer-savannaInnLogo.jpg</xsl:attribute>
				<xsl:attribute name="border">0</xsl:attribute>
				<xsl:attribute name="usemap">#m_sullivans_footer</xsl:attribute>
			</img>
			<img>
				<xsl:attribute name="src">/Assets/207/Images/footer-ace-hardware.jpg</xsl:attribute>
				<xsl:attribute name="border">0</xsl:attribute>
				<xsl:attribute name="usemap">#m_sullivans_footer</xsl:attribute>
			</img>
			<!-- No links, so image map not used
				<map>
					<xsl:attribute name="name">m_sullivans_footer</xsl:attribute>
					<xsl:attribute name="id">m_sullivans_footer</xsl:attribute>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">749,0,803,63</xsl:attribute>
						<xsl:attribute name="href">/Page.aspx?Display=66</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">646,0,724,63</xsl:attribute>
						<xsl:attribute name="href">/Page.aspx?Display=67</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">547,0,624,63</xsl:attribute>
						<xsl:attribute name="href">http://www.cashwise.com</xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">424,0,531,63</xsl:attribute>
						<xsl:attribute name="href"></xsl:attribute>
					</area>
					<area>
						<xsl:attribute name="shape">rect</xsl:attribute>
						<xsl:attribute name="coords">821,0,910,63</xsl:attribute>
						<xsl:attribute name="href">/Page.aspx?Display=48</xsl:attribute>
					</area>
				</map>
				-->
				<p>
					For further information regarding any of the above amenities please contact Sullivan’s Foods Corporate office.<br/>Kathy Christensen  1-815-273-4511
				</p>
		</div>
	</xsl:template>
</xsl:stylesheet>
