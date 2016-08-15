<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/" name="GoogleSiteSearch">
		<xsl:if test="string-length(ExpressLane/GenericChain/ChainSettings/Setting[SettingID = 319]/Value) &gt; 0">
			<script type="text/javascript">
				function GoogleSiteSearch() {
					var search = $('txtSearchTerm').value.strip();
					var location = '/Search.aspx';

					if(search == ''){
						alert('Please enter a search term');
						return;
					}				

					if (search != '') {
						location += '?search=' + search;
					}

					document.location.replace(location);
				}
			</script> 
			<div id="google-site-search">
				<input type="text" id="txtSearchTerm" name="search" onkeypress="if (event.keyCode==13) GoogleSiteSearch(); return event.keyCode!=13;"/>
				<a href="#" class="button" onclick="GoogleSiteSearch();">
					<span>Search Site</span>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>