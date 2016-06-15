<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
        <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<xsl:call-template name="FacebookLoginButtonApi"/>
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
		<xsl:variable name="URLStoreName" select="translate(translate(//GenericStore/StoreName, $uppercase, $smallcase), ' -', '')" />
        
        <div class="dfmHeader">
            <div class="dfmHeaderLeft">
                    <span>Welcome</span>&#160;<a class="store-info ui-link" href="#"><xsl:value-of select="//GenericStore/StoreName"/></a>&#160;<a href="#" class="dfm-open ui-link">(change store)</a>
            </div>
            <div class="dfmHeaderRight">
                <xsl:choose>
                    <xsl:when test="//GenericConsumer/IsLoggedIn = 'true'">
                        Welcome back,
                        <xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
                            <div id="fb-image">
                                <img class="profile">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat('http://graph.facebook.com/', //ConsumerSettings/Setting[Name = 'FacebookUserID']/Value, '/picture?type=small')"/>
                                    </xsl:attribute>
                                </img>
                            </div>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="(//GenericConsumer/FirstName = not('')) and (//GenericConsumer/LastName = not(''))">
                                <xsl:value-of select="//GenericConsumer/FirstName"/>&#xA0;<xsl:value-of select="//GenericConsumer/LastName"/></xsl:when>
                            <xsl:when test="//GenericConsumer/UserName = not('')">
                                <xsl:value-of select="//GenericConsumer/UserName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="//GenericConsumer/Email"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <span class="spacer">|</span>
                        <xsl:choose>
                            <xsl:when test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
                                <a  id="preferences-link" runat="server" href="/Social/FaceBookSignup.aspx">My Account</a></xsl:when>
                            <xsl:otherwise>
                                <a id="preferences-link" runat="server" href="/Profile/SignUp.aspx">My Account</a></xsl:otherwise>
                        </xsl:choose>
                        <span class="spacer">|</span>
                        <a id="signout-link" runat="server" href="/Profile/SignOut.aspx">
                            <xsl:if test="string-length(//ConsumerSettings/Setting[Name = 'FacebookUserID']/Value) &gt; 0">
                                <xsl:attribute name="onclick">FB.logout()</xsl:attribute>
                            </xsl:if>
                            <xsl:text>Sign out</xsl:text>
                        </a>
                    </xsl:when>
                    <xsl:when test="false() and (ExpressLane/FacebookSettings/IsActive = 'true') and (ExpressLane/GenericConsumer/IsLoggedIn != 'true')">
                        <!-- we can NOT be here because of when test statement-->
                        <a href="/">Dick’s Fresh Market</a>
                        <span class="spacer">|</span>
                        <div id="fb-button-wrap">
                            <a id="fb-login-button" class="fb_button fb_button_medium" onclick="fbButtonClick()">
                                <span class="fb_button_text">Login with Facebook</span>
                            </a>
                        </div>
                        <span class="spacer">|</span>
                        <a class="non-member" href="/Profile/SignUp.aspx" runat="server">Create My Account</a>
                        <span class="spacer">|</span>
                        <a href="/Profile/SignIn.aspx" runat="server">Sign in</a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="/">Dick’s Fresh Market</a>
                        <span class="spacer">|</span>
                        <a href="/Profile/SignUp.aspx">Create My Account</a>
                        <span class="spacer">|</span>
                        <a href="/Profile/SignIn.aspx"  runat="server">Sign In</a>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
		<div id="StoreHeader">
			<xsl:if test="string-length(//HeaderLogo) &gt; 0">
			<div id="StoreHeaderLogo">
				<a href="http://www.dicksfreshmarket.com/" title="Dick's Fresh Market: A Hometown Proud Grocery Store">
					<img src="{//HeaderLogo}" alt="Logo" />
				</a>
			</div>
			</xsl:if>
            <div id="StoreHeaderTopRightOuter">
                <div id="StoreHeaderTopRight">
                </div>
                <div id="sociallinksOuter">
                    <ul class="sociallinks">
                        <li><a href="https://www.facebook.com/pages/Dicks-Fresh-Market/279824515316?ref=ts&amp;fref=ts" class="facebook ui-link" title="Facebook" target="_blank">Facebook</a></li>
                        <li><a href="https://twitter.com/dfmarket" class="twitter ui-link" title="Twitter" target="_blank">Twitter</a></li>
                        <li><a href="https://plus.google.com/b/101953032155192569599/101953032155192569599/about/p/pub" class="googleplus ui-link" title="Googleplus" target="_blank">Googleplus</a></li>
                        <li><a href="http://pinterest.com/dicksmarket/" class="pinterest ui-link" title="Pinterest" target="_blank">Pinterest</a></li>
                    </ul>
                    <div class="sociallinksText">Connect with Us: </div>
                </div>
            </div>
			<div class="clear-div" style="clear: both;"/>
			<xsl:choose>
				<xsl:when test="//GenericConsumer/PrimaryStoreID &gt; 0">
					<xsl:variable name="StoreID">
						<xsl:value-of select="//GenericConsumer/PrimaryStoreID"/>
					</xsl:variable>
					<div id="StoreHeaderMiddle">
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="StoreHeaderMiddle">
						<xsl:if test="count(//ArrayOfGenericStore/GenericStore) = 1">
							<div id="StoreInfoDiv" class="StoreInfoDiv">
								<div id="StoreAddress1Div">
									<xsl:value-of select="//GenericStore/PrimaryAddress"/>
								</div>
								<xsl:if test="//GenericStore/SecondaryAddress != ''">
									<div id="StoreAddress2Div">
										<xsl:value-of select="//GenericStore/SecondaryAddress"/>
									</div>
								</xsl:if>
								<div id="StoreCityStateZipDiv">
									<xsl:if test="//GenericStore/City != ''">
										<xsl:value-of select="//GenericStore/City"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore/State != ''">
										<xsl:value-of select="//GenericStore/State"/>
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:if test="//GenericStore/PostalCode != ''">
										<xsl:value-of select="//GenericStore/PostalCode"/>
									</xsl:if>
								</div>
								<div id="StoreTelDiv">
									<xsl:if test="//GenericStore/Phone != ''">
										<xsl:value-of select="//GenericStore/Phone"/>
									</xsl:if>
								</div>
								<xsl:if test="//GenericStore/OpenHours != ''">
									<div id="StoreOpenHours">
										<xsl:value-of select="//GenericStore/OpenHours" />
									</div>
								</xsl:if>
							</div>
						</xsl:if>
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:comment><![CDATA[[if lt IE 7]>
			<script id="dropdowns" type="text/javascript" language="javascript">
				sfHover = function() {
					var sfEls = document.getElementById("nav").getElementsByTagName("LI");
					for (var i=0; i<sfEls.length; i++) {
						sfEls[i].onmouseover=function() {
							this.className+=" sfhover";
						}
						sfEls[i].onmouseout=function() {
							this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
						}
					}
				}
				if (window.attachEvent) window.attachEvent("onload", sfHover);
			</script>					
			<![endif]]]></xsl:comment>
            <script src="/Assets/118/Js/jquery-1.10.2.min.js"></script>
            <script>
                jQuery.noConflict();
            </script>
            <script src="/Assets/118/Js/hoverIntent.js"></script>
            <script src="/Assets/118/Js/superfish.js"></script>
            <script>
                (function($){ //create closure so we can safely use $ as alias for jQuery
                    $(document).ready(function(){

                        // initialise plugin
                        var mainMenu = $('#menu-main-menu').superfish({
                            //add options here if required
                            cssArrows:     true,

                        });

                        // buttons to demonstrate Superfish's public methods
                        $('.destroy').on('click', function(){
                            mainMenu.superfish('destroy');
                        });

                        $('.init').on('click', function(){
                            mainMenu.superfish();
                        });

                        $('.open').on('click', function(){
                            mainMenu.children('li:first').superfish('show');
                        });

                        $('.close').on('click', function(){
                            mainMenu.children('li:first').superfish('hide');
                        });					
						
                    });
                })(jQuery);
            </script>
			<div id="nav-wrap">
                <ul class="sf-menu" id="menu-main-menu">
                    <li>
                        <a href="http://www.dicksfreshmarket.com">Homepage</a>
                    </li>
                    <li class="current">
                        <a href="http://www.dicksfreshmarket.com/our-story">About Us</a>
                        <ul>
                            <li>
                                <a href="http://www.dicksfreshmarket.com/our-story">Our Story</a>
                            </li>
                            <li class="current">
                                <a href="http://www.dicksfreshmarket.com/our-store-brands">Our Store Brands</a>
                            </li>
                            <li>
                                <a href="http://www.dicksfreshmarket.com/{$URLStoreName}-connect-with-us">Connect with Us</a>
                            </li>
                            <li>
                                <a href="http://www.dicksfreshmarket.com/{$URLStoreName}">Departments</a>
                                <ul>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-bakery">Bakery</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-deli">Deli</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-dairy">Dairy</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-frozen">Frozen</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-grocery">Grocery</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-meat">Meat</a></li>
                                    <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-produce">Produce</a></li>
                                    <xsl:if test="$URLStoreName = 'amery'">
                                        <li><a href="http://www.dicksfreshmarket.com/{$URLStoreName}-express-hometown"><xsl:value-of select="//GenericStore/StoreName"/> Express &amp; Hometown Liquor</a></li>
                                    </xsl:if>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.dicksfreshmarket.com/locations">Locations</a>
                        <ul>
                            <xsl:for-each select="//ArrayOfGenericStore/GenericStore">
                                <xsl:if test="IsActive = 'true'">
                                <xsl:variable name="URLStoreNameCurr" select="translate(translate(StoreName, $uppercase, $smallcase), ' -', '')"/>
                                    <li>
                                        <a href="http://www.dicksfreshmarket.com/{$URLStoreNameCurr}"><xsl:value-of select="StoreName" /></a>
                                    </li>
                                </xsl:if>
                            </xsl:for-each>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.dicksfreshmarket.com/{$URLStoreName}-events-promotions">News + Events</a>
                        <ul>
                            <xsl:for-each select="//ArrayOfGenericStore/GenericStore">
                                <xsl:if test="IsActive = 'true'">
                                    <xsl:variable name="URLStoreNameCurr" select="translate(translate(StoreName, $uppercase, $smallcase), ' -', '')"/>
                                        <li>
                                            <a href="http://www.dicksfreshmarket.com/{$URLStoreNameCurr}-events-promotions"><xsl:value-of select="StoreName" /> Events &amp; Promos</a>
                                        </li>
                                    </xsl:if>
                            </xsl:for-each>
                        </ul>
                    </li>
                    <li id="WeeklyAdTab">
                        <a href="http://www.dicksfreshmarket.com/weekly-ad">Weekly Ad + Coupons</a>
                    </li>
                    <li id="RecipeTab">
                        <a href="http://gsn.dicksfreshmarket.com/Recipes/RecipeCenter.aspx">Recipes</a>
                    </li>
                    <li id="CareersTab">
                        <a href="http://gsn.dicksfreshmarket.com/Employment">Careers</a>
                    </li>
                    <li>
                        <a href="http://www.dicksfreshmarket.com/contact-us">Contact Us</a>
                    </li>
                </ul>
                <div id="searchBoxOuter">
                    <div class="searchbutton"></div>
                    <input type="text" value="Search..." onblur="if(this.value==&#39;&#39;)this.value=&#39;Search...&#39;;" onfocus="if(this.value==&#39;Search...&#39;)this.value=&#39;&#39;;" id="searchBox" />                        
                </div>
                <script>
                    (function($){
					
						//set active tab
						var url=window.location.pathname;
						if(url.indexOf("Recipe") >= 0)
						
						$('#RecipeTab').addClass("active");
						else{
						
						if(url.indexOf("mployment") >= 0)
						
						$('#CareersTab').addClass("active");
						else{$('#WeeklyAdTab').addClass("active");}					
						
						}
                        $(document).ready(function(){
                            function reduceWidth() {
                                if (parseInt($("#searchBoxOuter").css('width'))>40){
                                    $('#searchBoxOuter').css('width', '40px');                                                            
                                }
                            }
                            $('.searchbutton').on('click',function(){
                                $('#searchBox').toggleClass('extended');
                                if (parseInt($("#searchBoxOuter").css('width'))>40){
                                    if (jQuery("#searchBox").val()!="Search..."){
                                        window.location.href = "/Shop/ProductSearch.aspx?Keyword="+jQuery("#searchBox").val();
                                    } else {
                                        setTimeout(reduceWidth, 400);
                                    }
                                    
                                } else {
                                    $('#searchBoxOuter').css('width', '160px');
                                }
                            });
                        });
						
                    })(jQuery);
                </script>
			</div>
		</div>
        <div class="dfm-location-selection-wrap">
        <div class="dfm-location-selection">
        <div class="dfm-location-selection-inner">
        	<div class="dfm-close"><a href="#" title="close">X</a></div>
            <div class="title-wrap clearfix">
                <h3 class="home-title"><span>Select a location</span></h3>
            </div>
            <div class="dfm-locations cf">
                <xsl:for-each select="//ArrayOfGenericStore/GenericStore">
                    <xsl:if test="IsActive = 'true'">
                        <xsl:variable name="URLStoreNameCurr" select="translate(translate(StoreName, $uppercase, $smallcase), ' -', '')"/>
                        <div class="dfm-location">
                            <img src="http://www.qcsrfserver1.net/dicksfreshmarket/wp-content/uploads/2013/09/store-image.jpg" />
                            <div>
                                <div class="cf red-box-wrap">
                                    <a href="/StoreLocator.aspx?StoreID={StoreID}" class="red-box set-location" data-dfm-location="1">Make this my store</a>
                                </div>
                                
                                <div class="cf location-name-wrap">
                                    <span class="location-name"><a href="/StoreLocator.aspx?StoreID={StoreID}"><xsl:value-of select="StoreName" /></a></span>
                                </div>
                                
                                <div class="cf address-wrap">
                                    <span class="address-line1"><xsl:value-of select="PrimaryAddress" /></span><br/>
                                    <span class="address-line2"><xsl:value-of select="City" />, <xsl:value-of select="StateAbbreviation" />&#160;<xsl:value-of select="PostalCode" /></span>
                                </div>
                                
                                <div class="contact-wrap">
                                    Phone: <span class="phone"><xsl:value-of select="Phone" /></span><br/>
                                    Hours: <span class="hours"><xsl:value-of select="OpenHoursDisplay" /></span>
                                </div>
                            </div>
                            
                            <div class="map-directions-wrap">
                                <span class="map-directions">
                                <a href="http://www.dicksfreshmarket.com/{$URLStoreNameCurr}" class="map-directions-link">Maps &amp; Direction</a></span>
                            </div>
                            
                            <div class="more-info-wrap">
                                <span class="more-info">
                                <a href="http://www.dicksfreshmarket.com/{$URLStoreNameCurr}" class="more-info-link">More Information about this Store</a></span>
                            </div>
                            <div style="display:none;"><a href="http://www.dicksfreshmarket.com/{$URLStoreNameCurr}" class="more-info-link">More Information about this Store</a></div>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        </div>
        </div>
        <script type="text/javascript">
            var setLocationID = 0; 
            var ajaxurl = "/wp-admin/admin-ajax.php";
        </script>
        <script>
            (function($){
                $(document).ready(function(){
                    var windowWidth = $(window).width();
                    var containerWidth = $('#container').width() || 1000;
                    $('.dfm-location-selection-wrap').css("width", windowWidth+"px");//1901
                    $('.dfm-location-selection-wrap').css({left: ((containerWidth-windowWidth)/2)});

                    var lj = {
                        "open" : function(){
                            $(".dfm-location-selection-wrap").show();
                            $(".dfm-location-selection-wrap").height($(document).height());
                        },
                        "close" : function(){
                            $(".dfm-location-selection-wrap").hide();
                        },
                        "update" : function(id){
                            if(setLocationID !== id){
                                setLocationID = id;
                                var location = locations[id].location;
                                var oldNameLowerCaseNoSpaces = $(".store-info").text().toLowerCase().replace(/\s+/g, '');
                                var newNameLowerCaseNoSpaces = location.name.toLowerCase().replace(/\s+/g, '');

                                $(".store-info").attr("href", location.nameLink).html(location.name);
                                $(".header-phone, .lambda-phone").html(location.phone);
                                $(".lambda-email a").html(location.email).attr("href", "mailto:" + location.email);
                                $(".lambda-address").html(location.addressLine1 + "<br/>" + location.addressLine2);
                                $(".lambda-internet a").html(location.homeWebsiteText).attr("href", location.homeWebsiteText);
                                $(".lambda_widget_hours_dfm .textwidget").html(location.hours);
                                
                                /*change the proper links in the menu, but not in the Locations(third) column*/
                                $('#nav-wrap > ul > li:not(:nth-child(3)) a[href*="'+oldNameLowerCaseNoSpaces+'"]').each(function() {
                                    $(this).attr('href', this.href.replace(oldNameLowerCaseNoSpaces, newNameLowerCaseNoSpaces));
                                });
                                /*amery-express-hometown case*/
                                if (newNameLowerCaseNoSpaces == "amery"){
                                    $('#nav-wrap > ul > li:nth-child(2) ul li:last').show();
                                } else {
                                    $('#nav-wrap > ul > li:nth-child(2) ul li:last').hide();
                                }
                                
                                $.post(
                                    ajaxurl, 
                                    {
                                        'action': 'add_location_id',
                                        'location-id':   id
                                    }, 
                                    function(response){
                                    }
                                );
                            }
                        }
                    };
                    $(".dfm-location-selection .dfm-close").click(function(event){
                        event.preventDefault();
                        lj.close();
                    });
                    $(".dfm-open").click(function(event){
                        event.preventDefault();
                        lj.open();
                    });
                    $(".set-location").click(function(event){
                        //event.preventDefault();
                        lj.close();
                        //lj.update($(this).data("dfm-location"));
                    });
                });
            })(jQuery);
		</script>
	</xsl:template>
</xsl:stylesheet>