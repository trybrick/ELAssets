<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="header">
			<div id="logo">
				<a href="http://www.gerritys.com">
					<img src="http://gerritys.com/wp-content/themes/gerritys/images/logo.png" alt="logo" width="371" height="145"/>
				</a>
			</div>
			<div id="goldcardSavings">
				<p>
					<a class="signupLink" href="http://gerritys.com/apply-today.php">Click Here To Sign Up.</a>
				</p>
				<!--Weekly Savings Amount-->
				<!--<span class="savings">$9,079,877</span>
				<p>Gold Card Customer Savings To Date</p>-->
			</div>
			<div id="social">
				<a href="https://twitter.com/#!/GerritysMarket" target="_blank">
					<img src="http://gerritys.com/wp-content/themes/gerritys/images/twitter-bird2.png" alt="twitter-bird2" width="56" height="56"/>
				</a>
				<a href="https://www.facebook.com/GerritysSupermarket" target="_blank">
					<img src="http://gerritys.com/wp-content/themes/gerritys/images/facebook-logo.png" alt="facebook-logo" width="56" height="56"/>
				</a>
			</div>
			<div class="clearfix"/>
			<div class="container">
				<ul id="topnav">
					<div>
						<ul id="menu-main-menu">
							<li id="menu-item-20">
								<a href="http://www.gerritys.com">Home</a>
							</li>
							<li id="menu-item-4">
								<a href="#">Stores<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<!--<a href="#">#</a>-->
										<ul class="sub-menu subStore1">
											<li>
												<a href="http://gerritys.com/menus.php">Menus</a>
											</li>
											<li>
												<a href="http://gerritys.com/dinner-of-the-day.php">Dinner of the Day</a>
											</li>
											<li>
												<a href="http://gerritys.com/soup-of-the-week.php">Soup of the Week</a>
											</li>
                                            <li>
												<a href="http://gerritys.com/refill-prescriptions.php">Refill Prescriptions</a>
											</li>
                                            <li>
												<a href="http://gerritys.com/programs.php">Programs</a>
											</li>
                                            <li>
												<a href="http://gerritys.com/manufacturer-recalls.php">Manufacturer Recall</a>
											</li>
										</ul>
									</li>
									<li>
										<!--<a href="#">#</a>-->
										<ul class="sub-menu subStore2">
											<li>
												<a href="http://gerritys.com/store-hours.php">Store Hours</a>
											</li>
											<li>
												<a href="http://shop.gerritys.com/StoreLocator.aspx">Store Locator</a>
											</li>
											<li>
												<a href="http://gerritys.com/kids-corner.php">Kids Club</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li id="menu-item-5">
								<a href="#">Gold Card<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/ecoupons.php">eCoupons</a>
									</li>
                                    <li>
										<a href="http://shop.gerritys.com/Shop/WeeklyAd.aspx">Weekly Specials</a>
									</li>
                                    <li>
										<a href="http://shop.gerritys.com/Shop/Coupons.aspx">Printable Coupons</a>
									</li>
									<li>
										<a href="http://gerritys.com/programs.php">Programs</a>
									</li>
									<li>
										<a href="http://gerritys.com/apply-today.php">Apply Today</a>
									</li>
									<li>
										<a href="http://gerritys.com/update-your-card.php">Update Your Card</a>
									</li>
								</ul>
							</li>
							<li id="menu-item-6">
								<a href="#">Online Shopping<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<ul class="sub-menu sub1">
											<li>
												<a href="http://shop.gerritys.com/Shop/Product.aspx">My Shopping List</a>
											</li>
											<li>
												<a href="http://shop.gerritys.com/Shop/Product.aspx">Shop Your Order</a>
											</li>
											<li>
												<a href="http://gerritys.com/planning-a-party.php">Planning a Party?</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/gergifcer.html">Gift Card</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/gift-giving.html">Gift Giving</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/catering.html">Catering</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="sub-menu sub2">
											<li>
												<a href="http://www.gerritygifts.com/cakes.html">Custom Cakes</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/floral-gifts.html">Floral</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/wedding.html">Your Wedding</a>
											</li>
											<li>
												<a href="http://www.gerritygifts.com/college-gift-ideas.html">College Care Packages</a>
											</li>
											<li>
												<a href="http://gerritys.com/online-order-help.php">Online Order Help</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li id="menu-item-7">
								<a href="#">Careers<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/apply-online.php">Apply Online</a>
									</li>
									<li>
										<a href="http://mlbclientreview.com/gerritys/wordpress/wp-content/uploads/2011/07/application.pdf">Print Application</a>
									</li>
									<li>
										<a href="http://gerritys.com/contact-hr.php">Contact HR</a>
									</li>
								</ul>
							</li>
							<li id="menu-item-8">
								<a href="#">Recipes<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/ category/chef-dougs-recipes">Chef Dougs Recipes</a>
									</li>
                                    <li>
										<a href="http://shop.gerritys.com/Recipes/MyRecipes.aspx">My Recipe Box</a>
									</li>
                                    <li>
										<a href="http://shop.gerritys.com/Recipes/RecipeCenter.aspx">Recipe Center</a>
									</li>
									<li>
										<a href="http://shop.gerritys.com/Recipes/RecipeVideos.aspx ">Cooking Videos</a>
									</li>
									<li>
										<a href="http://shursave.mywebgrocer.com/RecipeDetails.aspx?ROD=1&amp;RecipeID=2219&amp;s=156574843&amp;g=797c7656-133f-4aab-9b8e-8c527893d24d&amp;uc=8329C112">Shuresave’s Recipes</a>
									</li>
								</ul>
							</li>
							<li id="menu-item-9">
								<a href="#">Fund Raising<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/ category/mom-gives-back">Mom Gives Back</a>
									</li>
									<li>
										<a href="http://gerritys.com/bagging-for-charity.php">Bagging for Charity</a>
									</li>
									<li>
										<a href="http://gerritys.com/coupon-fundraising.php">Coupon Fundraising</a>
									</li>
									<li>
										<a href="http://www.escrip.com/merchants/identity/shursave/index.jsp">E-Script</a>
									</li>
									<li>
										<a href="http://gerritys.com/community-rewards.php">Community Rewards</a>
									</li>
									<li>
										<a href="http://gerritys.com/donation-request.php">Donation Request</a>
									</li>
								</ul>
							</li>
							<li id="menu-item-10">
								<a href="#">About Us<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/who-is-mom-2.php">Who is Mom?</a>
									</li>
									<li>
										<a href="http://gerritys.com/our-history.php">Our History</a>
									</li>
									<li>
										<a href="http://gerritys.com/ category/news-room">News Room</a>
									</li>
									<li>
										<a href="http://gerritys.com/policies.php">Policies</a>
									</li>
								</ul>
							</li>
							<li id="menu-item-11">
								<a href="#">Contact Us<span class="dc-mega-icon"></span></a>
								<ul class="sub-menu">
									<li>
										<a href="http://gerritys.com/customer-feedback.php">Customer Feedback</a>
									</li>
									<li>
										<a href="http://gerritys.com/contact-mom.php">Contact Mom</a>
									</li>
									<li>
										<a href="http://gerritys.com/online-order-help-2.php">Online Order Help</a>
									</li>
									<li>
										<a href="http://gerritys.com/company-directory.php">Company Directory</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</ul>
				<ul id="subNav" class="menu">
					<li>
						<a href="http://shop.gerritys.com/Shop/WeeklyAd.aspx">Weekly Specials</a>
					</li>
					<li>
						<a href="http://gerritys.com/gerritys-corner-drugstore.php">Refill Prescriptions</a>
					</li>
					<li>
						<a href="http://gerritys.com/programs.php">Programs &amp; Promotions</a>
					</li>
					<li>
						<a href="http://gerritys.com/menus.php">Menus</a>
					</li>
					<li>
						<a href="http://gerritys.com/apply-today.php">Sign Up &amp; Save More!</a>
					</li>
					<li>
						<a target="_blank" href="http://www.palottery.state.pa.us/">PA Lottery</a>
					</li>
				</ul>
			</div>
		</div>
		<!--/#header-->
	</xsl:template>
</xsl:stylesheet>
