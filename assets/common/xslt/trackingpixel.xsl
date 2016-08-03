<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template name="string-replace-all">
	  <xsl:param name="text" />
	  <xsl:param name="replace" />
	  <xsl:param name="by" />
	  <xsl:choose>
		<xsl:when test="contains($text, $replace)">
		  <xsl:value-of select="substring-before($text,$replace)" />
		  <xsl:value-of select="$by" />
		  <xsl:call-template name="string-replace-all">
			<xsl:with-param name="text" select="substring-after($text,$replace)" />
			<xsl:with-param name="replace" select="$replace" />
			<xsl:with-param name="by" select="$by" />
		  </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="$text" />
		</xsl:otherwise>
	  </xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:variable name="smallcase" select="'/.abcdefghijklmnopqrstuvwxyz'"></xsl:variable>
		<xsl:variable name="uppercase" select="'/.ABCDEFGHIJKLMNOPQRSTUVWXYZ'"></xsl:variable>
		<xsl:variable name="absolutePath" select="translate(/ExpressLane/Uri/AbsolutePath, $uppercase, $smallcase)"></xsl:variable>
		
		<xsl:if test="string-length(//GenericConsumer) &gt; 0">
			<xsl:variable name="trackingHtml">
			  <xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="//GenericChain/ChainSettings/Setting[Name='TrackingHtml']/Value" />
				<xsl:with-param name="replace" select="'{1}'" />
				<xsl:with-param name="by" select="//GenericChain/ChainID" />
			  </xsl:call-template>
			</xsl:variable>
			<xsl:variable name="trackingHtml2">
			 <xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="$trackingHtml" />
				<xsl:with-param name="replace" select="'{0}'" />
				<xsl:with-param name="by" select="//GenericConsumer/ConsumerID" />
			  </xsl:call-template>
			</xsl:variable>
     		<xsl:value-of select="$trackingHtml2"  disable-output-escaping="yes" />
		</xsl:if>
		
		<script type="text/javascript">	
			var chainId = <xsl:value-of select="//GenericChain/ChainID" />;
			window.StoreID = <xsl:value-of select="//GenericConsumer/PrimaryStoreID" />;
			function refreshAdPods() {
				bricktag.refresh();
			}
			
			function RefreshAdPods(response) {
		        bricktag.minSecondBetweenRefresh = 1;
		        bricktag.refresh();
			}
		    
			var $win = window;
			if (typeof($win.googletag) === 'undefined') 
			{
				var _defineSlot, i, k, len, v;
				_defineSlot = function(name, dimensions, id, oop) {
				  $win.googletag.ads.push(id);
				  $win.googletag.ads[id] = {
				    renderEnded: function() {},
				    addService: function() {
				      return this;
				    }
				  };
				  return $win.googletag.ads[id];
				};

				$win.googletag = {
				  cmd: {
				    push: function(callback) {
				      callback.call(self);
				      return this;
				    }
				  },
				  ads: [],
				  pubads: function() {
				    return this;
				  },
				  noFetch: function() {
				    return this;
				  },
				  disableInitialLoad: function() {
				    return this;
				  },
				  disablePublisherConsole: function() {
				    return this;
				  },
				  enableSingleRequest: function() {
				    return this;
				  },
				  setTargeting: function() {
				    return this;
				  },
				  collapseEmptyDivs: function() {
				    return this;
				  },
				  enableServices: function() {
				    return this;
				  },
				  defineSlot: function(name, dimensions, id) {
				    return _defineSlot(name, dimensions, id, false);
				  },
				  defineOutOfPageSlot: function(name, id) {
				    return _defineSlot(name, [], id, true);
				  },
				  display: function(id) {
				    $win.googletag.ads[id].renderEnded.call(self);
				    return this;
				  }
				};
			}
		</script>
		<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-PD8GN6"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&amp;l='+l:'';j.async=true;j.src=
		'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-PD8GN6');</script>
		<script src="/Assets/Common/js/ShoppingList/ShoppingListPage.js" type="text/javascript"></script>
		<script src="//js.searchlinks.com/adtags/JV9N.js"></script>

	</xsl:template>
</xsl:stylesheet>

