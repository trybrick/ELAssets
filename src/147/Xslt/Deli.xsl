<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>


	<xsl:template match="/">


		    <style>
		      img			{text-align:center; margin:0 auto;}
		      #staticimg	{margin-top: 10px; font-size:110%; width:180px; height:auto; text-align:left;}
		      #Image  		{margin-top: 10px;}
		    </style>

		    <script id="jsImage" type="text/javascript" language="javascript">

		      <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
		        <xsl:if test="position()=last()">
		          <![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
		        </xsl:if>
		      </xsl:for-each>
		      <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
		        	<![CDATA[images[]]><xsl:value-of select="SortBy"/><![CDATA[-1] = ']]><xsl:value-of select="Image"/><![CDATA[';]]>
		      </xsl:for-each>
		      <xsl:comment>
				<![CDATA[

					function changeDIV(hide, show)
					{
						var d = new Object();
						d = document.getElementById(hide);
						d.style.display = "none";

						d = document.getElementById(show);
						d.style.display = "";
					}

					var pages = 21;
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

				]]>
		      </xsl:comment>

		    </script>
			<div style="clear:both; float:left;">
		    <table width="900">
			<tr><td colspan="2">
			<h2 style="font:22px Georgia bold;">Party Trays make any get-together special!</h2>          
			<p style="font:16px Georgia;">Choose from these popular combinations or let us make a tray with all your favorites! Quality fresh ingredients let you entertain with confidence.</p>
			<br/>
			</td>
			</tr>
			<tr>
		      <td width="500">
		        <div id="staticimg" style="margin-top:0px; width:500px; ">
		          <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			      <xsl:sort select="SortBy"/>
					<xsl:if test="not(SortBy = '0')">
						<a class="leftnavbutton">
							<xsl:attribute name="onclick">javascript:showOne('div_<xsl:value-of select="SortBy"/>');</xsl:attribute>
							<xsl:value-of select="Title"/>
						</a>
					</xsl:if>
		          </xsl:for-each>
		        </div>
		      </td>
		      <td width="400">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<div class="item">
						<xsl:if test="position() &gt; 1">
							<xsl:attribute name="style">display:none</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="id">div_<xsl:value-of select="SortBy"/></xsl:attribute>
						<div class="item_image" style="width:400px; float:left; text-align:center;">
								<img alt="" border="0">
									<xsl:attribute name="src"><xsl:value-of select="Image"/></xsl:attribute>
								</img>
						</div>
						<div class="item_description" style="clear:both; float:left; margin-top:0; font:16px Georgia; width:400px; text-align:center;">
							<!--<h3><xsl:value-of select="Title"/></h3>-->
							<p><xsl:value-of select="Description" disable-output-escaping="yes"/></p>
						</div>
					</div>
				</xsl:for-each>

			</td>
		</tr>
		    </table>
			</div>
	
		
		
		
		
	</xsl:template>
</xsl:stylesheet>
