<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:output method="html" />
	<xsl:template match="/">


		<script type="text/javascript">  
			//<![CDATA[

			var pages = ]]><xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent"><xsl:sort select="SortBy" data-type="number" /><xsl:if test="position() = last()"><xsl:value-of select="SortBy" /></xsl:if></xsl:for-each><![CDATA[;
			function elemOn(elem_id){
				if(document.getElementById(elem_id))
					document.getElementById(elem_id).style.display = "block";
			}
			function elemOff(elem_id){
				if(document.getElementById(elem_id))
					document.getElementById(elem_id).style.display = "none";
			}
			function hideAll(){
				for( var i = 1; i <= pages; i++ )
					elemOff( 'div_'+i );
			}
			function showAll(){
				for( var i = 1; i <= pages; i++ )
					elemOn( 'div_'+i );
			}
			function showOne(elem_id){
				hideAll( );
				elemOn( elem_id );
			}

			//]]>
	    </script>

		
		<div id="News">
			<div class="leftnav">
				<h2>In The Community</h2>
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<a href="#" class="leftnavbutton">
						<xsl:attribute name="onclick">showOne('div_<xsl:value-of select="SortBy" />');</xsl:attribute>
						<xsl:value-of select="Title" />
					</a>
				</xsl:for-each>
			</div>
			<div id="maincontent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<div class="contentDiv">
						<xsl:if test="SortBy != 1">
							<xsl:attribute name="style">display:none;</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="id">div_<xsl:value-of select="SortBy" /></xsl:attribute>
						<xsl:if test="Image!=''">
							<img alt=""><xsl:attribute name="src"><xsl:value-of select="Image" /></xsl:attribute></img>
						</xsl:if>
						<h2><xsl:value-of select="Title" /></h2>
						<p><xsl:value-of select="Description" disable-output-escaping="yes"/></p>
					</div>
				</xsl:for-each>
			</div>
		</div>
		
		<a href="##root##" class="button" style="clear:both; width:100px; "><span>Back to Home</span></a>
		
	</xsl:template>
</xsl:stylesheet>