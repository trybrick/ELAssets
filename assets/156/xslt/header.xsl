<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fb="http://www.facebook.com/2008/fbml">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<script src="/Assets/Common/Js/ActiveContent.js" type="text/javascript"/>
		<script type="text/javascript">
		<![CDATA[
			function RunAdvancedSearch() {

				var course = $('drpCourse').value;
				var region = $('drpRegion').value;
				var cookTime = $('drpPreparationTime').value;
				var holiday = $('drpHoliday').value;
				var skillLevel = $('drpSkillLevel').value;
				var equipment = $('drpEquipment').value;
				var searchTerm = $('txtSearch').value;
				
				var searchParameters = '';
				var attributelist = '';
				
				if (searchTerm != '') {
					searchParameters += 'SearchTerm:' + searchTerm + ';';
				}

				if (cookTime != '') {
					searchParameters += 'Time:' + cookTime + ';';
				}

				if (skillLevel != '') {
					
					searchParameters += 'SkillLevelList:' +'|' + skillLevel + '|;';
				}

				if (course != '') {
					attributelist += '|' + course;
				}

				if (region != '') {
					attributelist += '|' + region;
				}

				if (holiday != '') {
					attributelist += '|' + holiday;
				}

				if (equipment != '') {
					attributelist += '|' + equipment;
				}
				
				if(attributelist != ''){
					searchParameters += 'AttributeList:' + attributelist + '|;';
				}

				if (searchParameters != '') {
					//alert(searchParameters);
					
					
					RunSearch(searchParameters);
					
					//var currentLocation = document.location;
					//var redirectPath = '/Recipes/RecipeSearchResults.aspx?AdvancedSearch=' + encodeURIComponent(searchParameters);
					//window.location = redirectPath;
				}
				else {
					alert('Please specify search parameters!');
				}
			}

		function RunCategorySearch() {
			
			var course = $('PanelHoliday_drpCourse').value;
			var holiday = $('PanelHoliday_drpHoliday').value;

			var searchParameters = '';
			var attributelist = '';

			if (course != '') {
				attributelist += '|' + course;
			}

			if (holiday != '') {
				attributelist += '|' + holiday;
			}
			
			if(attributelist != ''){
				searchParameters = 'AttributeList:' + attributelist + '|';
				RunSearch(searchParameters);
			}
		}

		function RunQuickSearch() {

			var recipeTitle = $('txtQuickSearch').value;
			var searchParameters = '';

			if (recipeTitle != '') {
				searchParameters += 'SearchTerm:' + recipeTitle + ';';
			}

			RunSearch(searchParameters);
		}

		function RunSearch(searchParameters) {

			if (searchParameters != '') {
				//alert(searchParameters);
				
				var currentLocation = document.location;
				var redirectPath = '/Recipes/RecipeSearchResults.aspx?AdvancedSearch=' + encodeURIComponent(searchParameters);
				
				
				window.location = redirectPath;
			}
			else {
				alert('Please specify search parameters!');
			}
		}

		var isOpen = new Boolean(false);

		  function togglePanelSearch(){
		    Element.toggleClassName('toggler1', 'accordion_toggle');
		    Element.toggleClassName('toggler1', 'accordion_toggle_active');
		    Effect.toggle('PanelSearch','blind', {duration: 1.0});
		}
		
		  function toggleQuickSearch(){
		    Element.toggleClassName('toggler2', 'accordion_toggle');
		    Element.toggleClassName('toggler2', 'accordion_toggle_active');
		    Effect.toggle('PanelQuick','blind', {duration: 1.0});
		}

		  function toggleEasySearch(){
		    Element.toggleClassName('toggler3', 'accordion_toggle');
		    Element.toggleClassName('toggler3', 'accordion_toggle_active');
		    Effect.toggle('PanelEasy','blind', {duration: 1.0});
		}
		  function toggleHolidaySearch(){
		    Element.toggleClassName('toggler4', 'accordion_toggle');
		    Element.toggleClassName('toggler4', 'accordion_toggle_active');
		    Effect.toggle('PanelHoliday','blind', {duration: 1.0});
		}
		]]>
		</script>
		<div id="StoreHeader">
			<div id="StoreHeaderLogo">
				<a href="/Recipes/RecipeCenter.aspx">
					<img src="/Assets/156/Images/ucook_logo.gif" border="0"/>
				</a>
			</div>
			<div id="StoreHeaderRight">
				<div id="StoreHeaderRightTop">
					<div id="LoginBox">
						<xsl:choose>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
								<div id="LoginProfileLinkDiv">
									<p>Welcome,
										<xsl:choose>
											<xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
												<xsl:value-of select="//GenericConsumer/FirstName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="//GenericConsumer/LastName"/>
											</xsl:when>
											<xsl:when test="//GenericConsumer/UserName = not('')">
												<xsl:value-of select="//GenericConsumer/UserName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="//GenericConsumer/Email"/>
											</xsl:otherwise>
										</xsl:choose>
									</p>
									<p>
										<xsl:text> | </xsl:text>
									</p>
									<a id="A2" runat="server" href="/Profile/Signup.aspx">My Preferences</a>
									<p>
										<xsl:text> | </xsl:text>
									</p>
									<a id="A3" runat="server" href="/Profile/SignOut.aspx">
										<xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
											<xsl:attribute name="onclick">FB.logout()</xsl:attribute>
										</xsl:if>
										<xsl:text>Log Out</xsl:text>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="//GenericConsumer/IsLoggedIn = 'false'">
								<div id="LoginButtonDiv">
									<div id="fb-button-wrap">
										<a id="fb-login-button" class="fb_button fb_button_medium" onclick="fbButtonClick()">
											<span class="fb_button_text">Login with Facebook</span>
										</a>
									</div>
									<a id="A4" href="/Profile/SignIn.aspx" runat="server">Member Login</a>
									<p>
										<xsl:text> | New User? </xsl:text>
									</p>
									<a id="A4" href="/Profile/SignUp.aspx" runat="server">Register.</a>
								</div>
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div id="nav-wrap">
				<div id="nav-in">
					<div id="StoreMenu">
						<ul>
							<xsl:for-each select="ExpressLane/header/TopLevelNavigation/MenuItem">
								<li>
									<span>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="Link"/>
											</xsl:attribute>
											<xsl:value-of select="Title"/>
										</a>
									</span>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="leftsearchbar">
			<div id="EasySearch">
				<div class="SidebarHeader">
					<a href="javascript:;" style="text-decoration:none;">
						<h2 onclick="toggleEasySearch();">Quick Recipe Search</h2>
					</a>
					<a href="javascript:;">
						<h1 id="toggler3" class="accordion_toggle_active" onclick="toggleEasySearch();" style=""></h1>
					</a>
				</div>
				<div id="PanelEasy" class="accordion_content" style="display:inline">
					<div id="CtrlDivTextSearch">
						<p>Looking for recipes? You’ve come to the right place. Ucook has more than 60,000 free recipes - all created, tested, reviewed by our experienced staff.</p>
						<input id="txtQuickSearch" runat="server" type="text" style="width:100px; margin:5px 5px 12px 0; float:left">
							<xsl:attribute name="onkeypress">if (event.keyCode==13) RunQuickSearch(); return event.keyCode!=13;</xsl:attribute>
						</input>
						<a>
							<xsl:attribute name="href">javascript:RunQuickSearch();</xsl:attribute>Search</a>
					</div>
				</div>
			</div>
			<div id="HolidaySearch">
				<div class="SidebarHeader">
					<a href="javascript:;" style="text-decoration:none;">
						<h2 onclick="toggleHolidaySearch();">Search by occasion</h2>
					</a>
					<a href="javascript:;">
						<h1 id="toggler4" class="accordion_toggle_active" onclick="toggleHolidaySearch();"></h1>
					</a>
				</div>
				<div id="PanelHoliday" class="accordion_content" style="display:inline">
					<div id="CtrlDivSubTitle">
						<p>Search by meal occasion</p>
					</div>
					<div id="CtrlDivHolidaySelection">
						<select id="PanelHoliday_drpHoliday" style="float:left;">
							<option value="">Holiday</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Holiday/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivSubTitle" style="clear:both">
						<p>and by course</p>
					</div>
					<div id="CtrlDivCourseSelection" style="float: left; width: 91px; margin-bottom:12px;">
						<select id="PanelHoliday_drpCourse">
							<option value="">Course</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Course/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivTextSearch">
						<a>
							<xsl:attribute name="href">javascript:RunCategorySearch();</xsl:attribute>
							<xsl:text>Search</xsl:text>
						</a>
					</div>
				</div>
			</div>
			<div id="AdvancedSearch">
				<div class="SidebarHeader">
					<a href="javascript:;" style="text-decoration:none;">
						<h2 onclick="togglePanelSearch();">Advanced Search</h2>
					</a>
					<a href="javascript:;">
						<h1 id="toggler1" class="accordion_toggle" onclick="togglePanelSearch();"></h1>
					</a>
				</div>
				<div id="PanelSearch" class="accordion_content" style="display: none;">
					<div id="CtrlDivSubTitle">
						<p>You can combine more than one attribute.</p>
					</div>
					<div id="CtrlDivCourseSelection">
						<select id="drpCourse">
							<option value="">Course</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Course/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivRegionSelection">
						<select id="drpRegion">
							<option value="">Region</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Region/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivPreparationTimeSelection">
						<select id="drpPreparationTime">
							<option value="">Total Prep Time</option>
							<option value="20">20 minutes or less</option>
							<option value="45">45 minutes or less</option>
							<option value="60">60 minutes or less</option>
							<option value="90">90 minutes or less</option>
						</select>
					</div>
					<div id="CtrlDivHolidaySelection">
						<select id="drpHoliday">
							<option value="">Holiday</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Holiday/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivSkillLevelSelection">
						<select id="drpSkillLevel">
							<option value="">Skill Level</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/SkillLevel/RecipeSkillLevel">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="SkillLevel" disable-output-escaping="yes"/>
									</xsl:attribute>
									<xsl:value-of select="SkillLevelDescription" disable-output-escaping="yes"/>
								</option>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivEquipmentSelection">
						<select id="drpEquipment">
							<option value="">Equipment</option>
							<xsl:for-each select="//RecipeAdvancedSearchCategories/Equipment/RecipeCategory">
								<xsl:call-template name="AdvancedSearchCategory"/>
							</xsl:for-each>
						</select>
					</div>
					<div id="CtrlDivTextSearch">
						<p>Search by keywords or ingredients</p>
						<input id="txtSearch" runat="server" type="text" style="float:left; width: 100px; margin-right: 5px; margin-top:5px; ">
							<xsl:attribute name="onkeypress">if (event.keyCode==13) RunAdvancedSearch(); return event.keyCode!=13;</xsl:attribute>
						</input>
						<a>
							<xsl:attribute name="href">javascript:RunAdvancedSearch();</xsl:attribute>Search</a>
					</div>
					<div id="SearchTips">
						<a href="/Recipes/RecipeSearchTips.aspx">Search Tips</a>
					</div>
				</div>
			</div>
			<div id="FollowUs">
				<xsl:variable name="FacebookUrl" select="//GenericChain/ChainSettings/Setting[SettingID=266]/Value"/>
				<xsl:variable name="FacebookIcon" select="//GenericChain/ChainSettings/Setting[SettingID=267]/Value"/>
				<xsl:variable name="TwitterUrl" select="//GenericChain/ChainSettings/Setting[SettingID=268]/Value"/>
				<xsl:variable name="TwitterIcon" select="//GenericChain/ChainSettings/Setting[SettingID=269]/Value"/>
    				<h2>Follow us Online:</h2>
    			<xsl:if test="(string-length($FacebookUrl) &gt; 0) and (string-length($FacebookIcon) &gt; 0)">
					<a id="headerFBIcon" href="{$FacebookUrl}" target="_blank">
						<img alt="Find us on Facebook" class="headerSocialIcons" src="{$FacebookIcon}"/>
					</a>
				</xsl:if>
				<xsl:if test="(string-length($TwitterUrl) &gt; 0) and (string-length($TwitterIcon) &gt; 0)">
					<a id="headerTWIcon" href="{$TwitterUrl}" target="_blank">
						<img alt="Follow us on Twitter" class="headerSocialIcons" src="{$TwitterIcon}"/>
					</a>
				</xsl:if>
			</div>
			<div id="RecipeEmail">
				<h3>daily<br/>recipe-mail</h3>
				<p>Get great tasting recipes delivered daily to your inbox.</p>
				<p>Sign up to subscribe to our<br/>recipe-mail</p>
				<a href="/Profile/SignUp.aspx">Subscribe</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="AdvancedSearchCategory" match="RecipeCategory">
		<xsl:if test="IsActive = 'true'">
			<option>
				<xsl:attribute name="value">
					<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
				</xsl:attribute>
				<xsl:value-of select="RecipeCategoryDescription" disable-output-escaping="yes"/>
			</option>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>