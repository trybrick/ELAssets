<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="/Assets/210/Xslt/FuelRewardsDetails.xsl" />
    <xsl:template match="/">		
        <xsl:choose>
            <xsl:when test="not(ExpressLane/RewardsResponse) or (ExpressLane/RewardsResponse/Error)">
                <div id="wrapper">
                    <div id="tabContainerInput">
					<h3>Saving Money on Fuel is as Easy as 1-- 2-- 3--!</h3>
                        <div id="submitCard">
                            <div class="description">
                                <div class="descriptionText">
                                     <div class="descItem"><div class="descItemNum">1</div>
                                        <span class="firstDescItem">Shop at your favorite Gordy's County Market</span></div>
                                    <div class="descItem"><div class="descItemNum">2</div>
									<span>
                                        Earn a discount on Gordy's Pump Perk<sup>®</sup> items purchased.<br/>
										Scan your Gordy's Express Pump Perks<sup>®</sup> card at checkout.
										</span></div>
                                    <div class="descItem"><div class="descItemNum">3</div>
									<span>
                                       Save at Gordy's Gas Pumps when you scan<br/>
									   your Gordy's Express Pump Perks<sup>®</sup> card.</span></div>
                                    
                                </div>
                                <div class="descriptionImage" >
                                    <img src="/assets/210/images/fuel_reward_card.png" align="right" alt="Fuel Cards" />
                                </div>
                            </div>
                            <div class="inputs">
							<div class="InputRule">							
                                <div class="inputsRuleText" >
                                    <strong>Check Your Gordy’s Express Pump Perks<sup>®</sup> Card Balance Online</strong>
                                    Enter the first 11 digits of your Gordy's Pump Perks<sup>®</sup> card number 
									below and click the ‘submit’ button to check your Pump Perks<sup>®</sup> Savings.
                                </div>
								  <div class="descriptionImage" >
                                    <img src="/assets/210/images/card_number_exmple.png" align="right" alt="Fuel Cards" />
                                </div>
								</div>
                               
                                   
                                
                                <div class="inputWrapper">
                                Gordy’s Express Pump Perks<sup>®</sup> Card#:
                                      <input type="text" maxlength="11" id="cardNumber" name="cardNumber" size="11" />
                                    <input type="button" id="btnSubmitCardNumber"  onclick="Validate()" value="Submit" />
                               
                                    <xsl:choose>
                                        <xsl:when test="(ExpressLane/RewardsResponse/Error)">
                                            <div id="wrongCardNumber" style="color: red; padding-top: 10px; font-size: small;">
                                                *Gordy’s Express Pump Perks card number cannot be found. If you continue to experience
                                                problems please contact <a href="mailto:feedback@gordysinc.com" target="_top" style="color: red !important; padding-top: 10px !important; text-align: start !important; display: initial;">feedback@gordysinc.com</a>. Thank you for shopping Gordy’s County
                                                Market!
                                            </div>
                                            </xsl:when>
                                    </xsl:choose>
                                    <div id="notValidCardNumber" style="color: red; padding-top: 10px; display: none;
                                        display: ">
                                    </div>
                                </div>
								
                            </div>
                            <!--<div class="btnWrapper" style="margin-left:50%; margin-right:auto; width:20%;">
            
        </div>-->
								<div class="footerLinks">
									<span><a href="http://www.gordyscountymarket.net/extra1.aspx">Frequently Asked Pump Perk<sup>®</sup> Questions</a></span>
									<span><a href="##root##/Shop/WeeklyAd.aspx">Find Pump Perk® Items In Our Weekly Ad</a></span>
									<span><a href="##root##/Contact/">Contact Us</a></span>
								</div>
                        </div>
                    </div>
					
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="AwardsInfo" />
            </xsl:otherwise>
        </xsl:choose>	
			<script src="/assets/210/JS/reward_tabs.js" type="text/javascript"/> 
    </xsl:template>
</xsl:stylesheet>
