<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="html"/>

<!-- ========================================================================================================================================= --> 
    
	<xsl:template name="RatingControl" match="/">
    	<xsl:param name="AverageRating" />
    	<xsl:param name="TotalRatings" />
    	<xsl:param name="UserRating" />
    	<xsl:param name="RatingType" />
        <xsl:param name="ItemID" />
   	 	<xsl:variable name="RatingControlID" select="concat($RatingType,'Rating')" />
    	<script type="text/javascript" src="/Assets/Common/Js/livepipe.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/ratingV2.js"></script>
        <script type="text/javascript" src="/Assets/Common/Js/Ratings/RatingsService.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/Ratings/RatingControl.js"></script>
		<xsl:call-template name="GlobalRating">
			<xsl:with-param name="RatingType" select="$RatingType" />
			<xsl:with-param name="RatingValue" select="$AverageRating" />
			<xsl:with-param name="TotalRatings" select="$TotalRatings" />
		</xsl:call-template>
		<xsl:variable name="ContainerID" select="concat($RatingType,'RatingContainer')" />
		<div id="rating-wrapper">
        	<span id="pleaseRateText">
			<xsl:choose>
			<xsl:when test="$UserRating &gt; 0">Your rating</xsl:when>
			<xsl:otherwise>Please Rate this <xsl:value-of select="$RatingType" /></xsl:otherwise>
			</xsl:choose>
			</span>
        	<div id="rate-review">
            	<div class="ratingControl"> 
         		<xsl:attribute name="id"><xsl:value-of select="$RatingControlID" /></xsl:attribute>
                	<div class="ratingText"></div>
    				<div class="rating_container" item="{$RatingType}">
            		<xsl:attribute name="id">
                		<xsl:value-of select="$ContainerID" />
                	</xsl:attribute>
            		</div>
            	</div>
				<input type="hidden" title="{$ContainerID}" value="{$ItemID}"></input>
            	<!-- Save for later when we want to add user comments -->
            	<!--
            	<div class="commentControl">
                <label for="comments">Comments:</label>
                <p id="reviewWordCountWrapper"><span id="reviewWordCount"></span>&#160;characters left</p>
                <textarea onkeyup="UpdateCharCount(this,'reviewWordCount')" name="comments" id="reviewComments" />
            	</div>
            	<a id="closeRateReview" class="DeleteX" href="javascript:ToggleRateReview();">Close</a>
            	-->
		 	</div>
     	</div>
	 </xsl:template>

<!-- ========================================================================================================================================= -->      

	<xsl:template name="GlobalRating">
		<xsl:param name="RatingType" />
		<xsl:param name="RatingValue" />
		<xsl:param name="TotalRatings" />
		
		<xsl:variable name="ContainerID" select="concat($RatingType,'GlobalRatingContainer')" />
		<xsl:variable name="Identifier" select="concat('Global', $RatingType, 'Rating')" />
		
		<xsl:choose>
			<xsl:when test="$TotalRatings &gt; 0">
				<div class="averageRating">
					<span class="ratedText"><xsl:text>Rated </xsl:text></span>
					<div class="ratingControl">
						<div id="{$ContainerID}" class="rating_container" item="{$RatingType}" itemprop="{$Identifier}" >
						</div>
					</div>
					
					<span class="ratedText">
						<xsl:text> by </xsl:text>
						<xsl:value-of select="$TotalRatings" />
						<xsl:text> user</xsl:text>
						<xsl:if test="$TotalRatings &gt; 1">s</xsl:if>
					</span>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="averageRating">
					<span class="ratedText"></span>
					
					<div class="ratingControl">
						<div id="{$ContainerID}" class="rating_container" item="{$RatingType}" itemprop="{$Identifier}" >
						</div>
					</div>
					
					<span class="ratedText"><xsl:text>Not yet rated </xsl:text></span>
				</div>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

<!-- ========================================================================================================================================= --> 
    
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->