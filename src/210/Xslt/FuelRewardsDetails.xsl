<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/" name="AwardsInfo">

    <div id="wrapper">
      <div id="tabContainer">
        <div id="tabsTitle">Gordy’s Express Pump Perks® balance</div>
        <div id="tabs">
          <ul>
            <li id="tabHeader_1">Current Pump Perks®</li>
            <li id="tabHeader_2">Expired Pump Perks®</li>
            <li id="tabHeader_3">Redeemed Pump Perks®</li>
          </ul>
        </div>
        <div id="tabscontent">
          <div class="tabpage" id="tabpage_1">
            <xsl:choose>
              <xsl:when test="ExpressLane/RewardsResponse/RewardDetails/RewardDetail[TotalRewardAmount!=0]">
                <div class="balance">
                  <div class="text">
                    <p>
                      <strong>Your current Pump Perks®</strong>
                    </p>
                    Total of valid discounts in the last 21 days.
                  </div>
                  <div class="amount off">
                    off<br/>per<br/>gallon
                  </div>
                  <div class="amount number">

                    $<span id="current1">
                      <xsl:choose>
                        <xsl:when test="string-length(ExpressLane/RewardsResponse/RewardBalances/RewardBalance/RetailerRewards)=3">
                          <xsl:value-of select="ExpressLane/RewardsResponse/RewardBalances/RewardBalance/RetailerRewards"/>0
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="ExpressLane/RewardsResponse/RewardBalances/RewardBalance/RetailerRewards"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </div>
                </div>
                <div class="date">
                  <div class="left">
                    <span id="current2">
                      <xsl:call-template name="GetDate">
                        
                      </xsl:call-template>
                      
                    </span>
                  </div>
                  <div class="right">
                    expires in <span id="current3">
                      <xsl:value-of select="ExpressLane/RewardsResponse/RewardDetails/RewardDetail/ExpirationDaysLeft"/>

                    </span> days <span id="current4">
                      <xsl:value-of select="substring(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/RewardExpirationDate,6,5)"/>

                    </span> $<span id="current5">
                      <xsl:value-of select="ExpressLane/RewardsResponse/RewardDetails/RewardDetail/RewardExpirationAmount"/>
					  <xsl:choose>
                        <xsl:when test="string-length(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/RewardExpirationAmount)=3">0
                        </xsl:when>                       
                      </xsl:choose>
                    </span>
                  </div>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="balance">
                  <div class="text">
                    <p>
                      <strong>Your current Pump Perks®</strong>
                    </p>
                    Total of valid discounts in the last 21 days.
                  </div>
                  <div class="amount off">
                    off<br/>per<br/>gallon
                  </div>
                  <div class="amount number">

                    $<span id="current1">
                      0.00
                    </span>
                  </div>
                </div>
                <div class="date">
                  We’re sorry, you currently do not have any Gordy’s Express Pump Perks to redeem. Thank you for shopping Gordy’s County Market.
                </div>
              </xsl:otherwise>
            </xsl:choose>


            <p>Purchases in the last 21 days count toward your Gordy’s Express Pump Perks® balance. If they are not used in 21 days, they are removed from your Pump Perks® total. Pump Perks® must be used by 11:59 p.m. on the day they expire or they will be removed from your Pump Perks ® balance.</p>
          </div>
          <div class="tabpage" id="tabpage_2">
            <div class="dataWrapper">
              <xsl:choose>
                <xsl:when test="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[Transaction/IsExpired='true' and Transaction/TransactionType='Adjustment']">
                  <xsl:for-each select="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[Transaction/IsExpired='true' and Transaction/TransactionType='Adjustment']">
                    <div class="date">
                      <div class="left">
                        <span id="expired1_1">
                          <xsl:call-template name="GetFormattedPurchasedDate">
                            <xsl:with-param name="withYear" select="1"></xsl:with-param>
                            <xsl:with-param name="context" select="Transaction"></xsl:with-param>
                          </xsl:call-template>
                        </span>
                      </div>
                      <div class="right">
                        expired on  <span id="expired1_2">
                          <xsl:call-template name="GetFormattedExpirationDate">
                            
                          </xsl:call-template>
                        </span> $<span id="expired1_3">
                          <xsl:value-of select="Transaction/RewardEarned"/>
                        </span>
                      </div>
                    </div>
                  </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                  <div class="date">
                    No rewards have expired
                  </div>
                </xsl:otherwise>
              </xsl:choose>
            </div>



            <p>Gordy’s Express Pump Perks® that were not redeemed within the 21 day period expire and do not count towards your Gordy’s Express Pump Perks total.</p>
          </div>
          <div class="tabpage" id="tabpage_3">
            <div class="dataWrapper">
              <xsl:choose>
                <xsl:when test="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[Transaction/TransactionType='Redemption']">
                  <xsl:for-each select="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[Transaction/TransactionType='Redemption']">
                    <div class="date">
                      <div class="left">
                        <span id="used1_1">
                          <xsl:call-template name="GetFormattedPurchasedDate">
                            <xsl:with-param name="withYear" select="1"></xsl:with-param>
                            <xsl:with-param name="context" select="Transaction"></xsl:with-param>
                          </xsl:call-template>
                        </span> -per gallon, you saved a total of
                      </div>
                      <div class="right">
                        $<span id="used1_2">
                          <xsl:value-of select="Transaction/RewardRedeemed"/>
                        </span>
                      </div>
                    </div>
                  </xsl:for-each>

                </xsl:when>
                <xsl:otherwise>
                  <div class="date">
                    No rewards have been used
                  </div>
                </xsl:otherwise>
              </xsl:choose>
            </div>

            <p>
              When you redeem your Gordy’s Express Pump Perks® the total you saved per gallon is the
              total of all valid discounts within the last 21 days that have not already been redeemed.
            </p>
          </div>
        </div>
      </div>
    </div>

  </xsl:template>

  <xsl:template match="/" name ="GetDate">
    <xsl:variable name="ExpirationMonth" select="substring(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/RewardExpirationDate,6,2)"> </xsl:variable>
    <xsl:variable name="ExpirationDay" select="substring(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/RewardExpirationDate,9,2)"> </xsl:variable>
    <xsl:variable name="ExpirationAmount" select="concat(substring(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/TotalRewardAmount,3,2),'0')"> </xsl:variable>
    <xsl:variable name="ExpirationAmountDef" select="substring(ExpressLane/RewardsResponse/RewardDetails/RewardDetail/TotalRewardAmount,3,2)"> </xsl:variable>
    <xsl:choose>
      <xsl:when test="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[substring(Transaction/ExpirationDate,6,2)=$ExpirationMonth and substring(Transaction/ExpirationDate,9,2)=$ExpirationDay and substring(Transaction/RewardEarned,3,2)=$ExpirationAmount and Transaction/TransactionType='Adjustment']">
        <xsl:call-template name="GetFormattedPurchasedDate">
          <xsl:with-param name="withYear" select="1"></xsl:with-param>
          <xsl:with-param name="context" select="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[substring(Transaction/ExpirationDate,6,2)=$ExpirationMonth and substring(Transaction/ExpirationDate,9,2)=$ExpirationDay and substring(Transaction/RewardEarned,3,2)=$ExpirationAmount and Transaction/TransactionType='Adjustment']/Transaction"></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[substring(Transaction/ExpirationDate,6,2)=$ExpirationMonth and substring(Transaction/ExpirationDate,9,2)=$ExpirationDay and substring(Transaction/RewardEarned,3,2)=$ExpirationAmountDef and Transaction/TransactionType='Adjustment']">
        <xsl:call-template name="GetFormattedPurchasedDate">
          <xsl:with-param name="withYear" select="1"></xsl:with-param>
          <xsl:with-param name="context" select="ExpressLane/RewardsResponse/TransaktionHistory/TransactionKv[substring(Transaction/ExpirationDate,6,2)=$ExpirationMonth and substring(Transaction/ExpirationDate,9,2)=$ExpirationDay and substring(Transaction/RewardEarned,3,2)=$ExpirationAmountDef and Transaction/TransactionType='Adjustment']/Transaction"> </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>

  </xsl:template>

  <xsl:template  name="GetFormattedPurchasedDate">
    <xsl:param name="withYear"></xsl:param>
    <xsl:param name="context"></xsl:param>
    <xsl:value-of select="substring($context/TransactionDateTime,6,2)"/>/<xsl:value-of select="substring($context/TransactionDateTime,9,2)"/><xsl:choose>
      <xsl:when test="$withYear=1">/<xsl:value-of select="substring($context/TransactionDateTime,1,4)"/>
      </xsl:when>
    </xsl:choose>
    
  </xsl:template>
  <xsl:template match="Transaction" name="GetFormattedExpirationDate">
    <xsl:value-of select="substring(Transaction/ExpirationDate,6,2)"/>/<xsl:value-of select="substring(Transaction/ExpirationDate,9,2)"/>
  </xsl:template>


</xsl:stylesheet>
