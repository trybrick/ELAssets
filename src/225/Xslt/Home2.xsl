<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">

		<script src="/Assets/Common/Js/livepipe.js" type="text/javascript"></script>
		<script src="/Assets/Common/Js/tabs.js" type="text/javascript"></script>

		<script type="text/javascript">
			document.observe('dom:loaded',function(){
				var staticContentTabs = new Control.Tabs('staticContentTabs',{setClassOnContainer: true,activeClassName: 'active'});
				var pageNum = getQueryVariable('page');
				staticContentTabs.setActiveTab('staticContentDiv_'+pageNum);
			});
			
			<![CDATA[
			function getQueryVariable(variable){
				var query = window.location.search.substring(1);
				var vars = query.split("&");
				for (var i=0;i<vars.length;i++) {
					var pair = vars[i].split("=");
					if (pair[0] == variable) {
 							return pair[1];
					}
				}
					return 1; 
				}		
			]]>
		</script>		
				
		<xsl:if test="count(//ArrayOfStaticContent/StaticContent) &gt; 1">
			<div id="mainContentHeader">
	            <ul id="staticContentTabs" class="group">
					<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<xsl:variable name="subStringA" select="substring-after(Image,'.')" />
					<xsl:variable name="subStringB" select="substring-after($subStringA,'.')" />
					 <xsl:variable name="fileExtension" select="substring-after($subStringB,'.')" />
						<li class="tab">
							<xsl:attribute name="id">staticcontent-nav<xsl:value-of select="position()"/></xsl:attribute>
		                    <a class="button">
								<xsl:attribute name="href">
									<xsl:choose>
										<xsl:when test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" ><xsl:value-of select="Image" /></xsl:when>
										<xsl:otherwise>#staticContentDiv_<xsl:value-of select="position()"/></xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:if test="($fileExtension = 'pdf' or $fileExtension = 'doc') and Description = ''" >
									<xsl:attribute name="target">_blank</xsl:attribute>
								</xsl:if>
								<xsl:if test="position() = last()">
									<xsl:attribute name="style">margin-right:0;</xsl:attribute>
								</xsl:if>
								<span><xsl:value-of select="Title" disable-output-escaping="yes"/></span>
							</a>
						</li>
					</xsl:for-each>
	            </ul>
			</div>
		</xsl:if>

		<div id="mainContent" class="group">
			<xsl:for-each select="//ArrayOfStaticContent/StaticContent">
			<xsl:sort select="SortBy" data-type="number" />
				<div>
					<xsl:attribute name="id">staticContentDiv_<xsl:value-of select="position()"/></xsl:attribute>
					<xsl:attribute name="class">staticContentEntry</xsl:attribute>
					<xsl:if test="position() != 1">
						<xsl:attribute name="style">display: none</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</div>
			</xsl:for-each>
		</div>
		
	</xsl:template>
</xsl:stylesheet>