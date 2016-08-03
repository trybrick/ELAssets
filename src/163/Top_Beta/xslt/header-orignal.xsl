<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<style type="text/css">
			@import url(http://209.134.150.36/Haggen/creative-assets/Top_Beta/Styles/haggen-overrides_BETA.css);
		</style>
		<div id="wrapper">
			<div id="menu2">
				<div id="toplogo"></div>
				<ul>
					<li id="navLogo">
						<a href="https://www.top-foods.com/TopWeb/Default.aspx">
							<img src="##root##/Assets/149/Images/TOPlogo.jpg" border="0"/>
							<span>Top Food &amp; Drug</span>
						</a>
					</li>
					<li id="connection">
						<a href="https://www.top-foods.com/TopWeb/TopConnection.aspx">
							<img src="##root##/Assets/149/Images/TOPconnection.jpg" border="0" alt="TOP Connection"/>
							<span>Top Connection</span>
						</a>
					</li>
					<li id="wallet">
						<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=TopWallet">
							<img src="##root##/Assets/149/Images/TOPwallets.jpg" alt="Personal Wallet" border="10"/>
						</a>
					</li>
					<li id="history">
						<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=TopHistory">
							<img src="##root##/Assets/149/Images/TOPhistory.jpg" alt="Personal History" border="0"/>
						</a>
					</li>
					<li id="shoppinglist">
						<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=TopShoppingList">
							<img src="##root##/Assets/149/Images/TOPshoppingList.jpg" alt="Personal Shopping List" border="0"/>
						</a>
					</li>
					<li id="recipes">
						<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=TopRecipes">
							<img src="##root##/Assets/149/Images/TOPrecipes.jpg" alt="Personal Recipes" border="0"/>
						</a>
					</li>
					<li id="interests">
						<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=TopInterests">
							<img src="##root##/Assets/149/Images/TOPinterests.jpg" alt="Personal Interests" border="0"/>
						</a>
					</li>
				</ul>
			</div>
			<div id="topHeader">
				<div id="search">
					<fieldset>
						<label for="searchinput">Search For:</label>
						<input id="searchinput" type="text" name="searchinput" value="search" class="searchinput" onblur="if(this.value=='') this.value='search';" onfocus="if(this.value=='search') this.value='';"
						       onClick="location.href='http://www.top-foods.com/TopWeb/SearchPage.aspx'"/>
						<img src="##root##/Assets/149/Images/searchGO.jpg" alt="Search" onClick="location.href='http://www.top-foods.com/TopWeb/SearchPage.aspx'"/>
					</fieldset>
				</div>
			</div>
			<div id="page">
				<div id="topSidebar">
					<xsl:if test="//GenericConsumer/IsLoggedIn = 'false'">
						<div id="loginForm">
							<h5>member login</h5>
							<fieldset>
								<label for="username">Login</label>
								<input name="username" id="username" type="text" style="size:15" value="user name" size="15" class="zipcode" onblur="if(this.value=='') this.value='user name';" onfocus="if(this.value=='user name') this.value='';"
								       onClick="location.href='http://www.top-foods.com/TopWeb/Login.aspx'"/>
								<label for="password">Password</label>
								<input name="password" id="password" type="password" style="size:15" size="15" class="zipcode" onClick="location.href='https://www.top-foods.com/TopWeb/Login.aspx'"/>
								<img src="##root##/Assets/149/Images/GO-purple.gif" class="imageSubmit" alt="Find A Store" onClick="location.href='https://www.top-foods.com/TopWeb/Login.aspx'"/>
							</fieldset>
							<div id="memberdetails" style="margin-bottom:12px">
								<a href="https://www.top-foods.com/TopWeb/GuestEnrollment/StoreSelector.aspx">How to become a member</a>
							</div>
							<div id="memberdetails">
								<a href="https://www.top-foods.com/TopWeb/LoginAccount/ForgotPassword.aspx">Forgot Password</a>
							</div>
							<div id="memberdetails" style="margin-bottom:12px">
								<a href="https://www.top-foods.com/TopWeb/LoginAccount/LostLogin.aspx">Lost Login?</a>
							</div>
						</div>
					</xsl:if>
					<div id="storeLocator">
						<h5>store locator</h5>
						<fieldset>
							<label for="zipcode">ZIP Code</label>
							<input name="zipcode" id="zipcode" type="text" style="size:15" value="your zip code" size="15" class="zipcode" onblur="if(this.value=='') this.value='your zip code';" onfocus="if(this.value=='your zip code') this.value='';"
							       onClick="location.href='https://www.top-foods.com/TopWeb/StoreLocator.aspx'"/>
							<img src="##root##/Assets/149/Images/GO-purple.gif" class="imageSubmit" alt="Find A Store" onClick="location.href='https://www.top-foods.com/TopWeb/StoreLocator.aspx'"/>
						</fieldset>
					</div>
					<div id="leftNavigation">
						<ul class="list" id="leftnav">
							<li>
								<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=LeftWeeklyAdd">Weekly Ad</a>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=LeftCoupons">Coupons</a>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=LeftRecipeCenter">Easy Recipes</a>
								<ul>
									<li>
										<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=LeftRecipeCenter">Recipe Center</a>
									</li>
									<li>
										<a href="https://www.top-foods.com/TopWeb/Gateway.aspx?who=LeftRecipeVideos">Recipe Videos</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/TOPProducts.aspx">Top Departments</a>
								<ul>
									<li>
										<a href="https://www.top-foods.com/TopWeb/brands.aspx">Our Brands</a>
									</li>
									<li>
										<a href="https://www.top-foods.com/TopWeb/Departments.aspx">Departments</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/AboutTOP.aspx">Top Stories</a>
								<ul>
									<li>
										<a href="https://www.top-foods.com/TopWeb/AboutTOP.aspx">About Top</a>
									</li>
									<li>
										<a href="https://www.top-foods.com/TopWeb/CompanyHistory.aspx">Company History</a>
									</li>
									<li>
										<a href="https://www.top-foods.com/TopWeb/CrewHappenings.aspx">Crew Happenings</a>
									</li>
									<li>
										<a href="https://www.top-foods.com/TopWeb/PressReleases.aspx">Press Releases</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/Default.aspx">Online Ordering</a>
								<ul>
									<li>
										<a href="https://store.haggen.com/PartyPlatters/TOP/" target="_blank">Party Platters</a>
									</li>
									<li>
										<a href="http://www.florists.ftd.com/topfoods/" target="_blank">Florist Online</a>
									</li>
									<li>
										<a href="https://store.haggen.com/GiftCards/top/" target="_blank">Gift Cards</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/Events.aspx">Contests &amp; Events</a>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/Pharmacy.aspx">Pharmacy</a>
							</li>
							<li>
								<a href="https://www.top-foods.com/TopWeb/JoinOurCrew.aspx">Join Our Crew</a>
							</li>
							<li class="last">
								<a href="https://www.top-foods.com/TopWeb/BeFoodSafe.aspx">Food Safety</a>
								<ul>
									<li>
										<a href="https://www.top-foods.com/TopWeb/Recalls.aspx">Recalls</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="topContent">


				<xsl:choose>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
						<div id="messagebar">
							<a href="https://www.top-foods.com/TopWeb/GuestEnrollment/StoreSelector.aspx">REGISTER here!</a>| <a href="https://www.top-foods.com/TopWeb/TopConnection.aspx">What is TOP Connection?</a></div>
					</xsl:when>
					<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
						<div id="messagebar">Welcome <xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/>  | <a href="https://www.top-foods.com/TopWeb/MemberEdit.aspx">Edit My Profile</a>  | <a href="##root##/Profile/signout.aspx">Logout</a></div>
					</xsl:when>
				</xsl:choose>
			</div>


			<xsl:choose>
				<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
					<xsl:variable name="StoreID">
						<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
					</xsl:variable>
					<div id="StoreHeaderMiddle">
						<div id="StoreInfoDiv" class="StoreInfoDiv">
							<div id="StoreAddress1Div">
								<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PrimaryAddress"/>
							</div>
							<xsl:if test="//GenericStore[StoreID = $StoreID]/SecondaryAddress != ''">
								<div id="StoreAddress2Div">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/SecondaryAddress"/>
								</div>
							</xsl:if>
							<div id="StoreCityStateZipDiv">
								<xsl:if test="//GenericStore[StoreID = $StoreID]/City != ''">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/City"/>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:if test="//GenericStore[StoreID = $StoreID]//State != ''">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]//State"/>
									<xsl:text> </xsl:text>
								</xsl:if>
								<xsl:if test="//GenericStore[StoreID = $StoreID]/PostalCode != ''">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/PostalCode"/>
								</xsl:if>
							</div>
							<div id="StoreTelDiv">
								<xsl:if test="//GenericStore[StoreID = $StoreID]/Phone != ''">
									<xsl:value-of select="//GenericStore[StoreID = $StoreID]/Phone"/>
								</xsl:if>
							</div>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="StoreHeaderMiddle">
						<div id="StoreInfoDiv" class="StoreInfoDiv">
							<div id="StoreAddress1Div">
								<xsl:if test="count(//GenericStore)=1">
									<xsl:value-of select="//GenericStore/PrimaryAddress"/>
								</xsl:if>
							</div>
							<xsl:if test="//GenericStore/SecondaryAddress != ''">
								<div id="StoreAddress2Div">
									<xsl:if test="count(//GenericStore)=1">
										<xsl:value-of select="//GenericStore/SecondaryAddress"/>
									</xsl:if>
								</div>
							</xsl:if>
							<div id="StoreCityStateZipDiv">
								<xsl:if test="count(//GenericStore)=1">
									<xsl:if test="//GenericStore/City != ''">
										<xsl:value-of select="//GenericStore/City"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore//State != ''">
										<xsl:value-of select="//GenericStore//State"/>
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore/PostalCode != ''">
										<xsl:value-of select="//GenericStore/PostalCode"/>
									</xsl:if>
								</xsl:if>
							</div>
							<div id="StoreTelDiv">
								<xsl:if test="count(//GenericStore)=1">
									<xsl:if test="//GenericStore/Phone != ''">
										<xsl:value-of select="//GenericStore/Phone"/>
									</xsl:if>
								</xsl:if>
							</div>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>