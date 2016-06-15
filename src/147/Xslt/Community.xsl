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
				<xsl:sort select="SortBy" data-type="number" />
		        <xsl:if test="position()=last()">
		          <![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
		        </xsl:if>
		      </xsl:for-each>
		      <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			  <xsl:sort select="SortBy" data-type="number" />
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

					var pages = 12;
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
			<tr>
		      <td width="200">
		        <div id="staticimg">
		          <xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
			      <xsl:sort select="SortBy" data-type="number"/>
					<xsl:if test="not(SortBy = '0')">
						<strong><a>
							<xsl:attribute name="style">cursor:pointer</xsl:attribute>
							<xsl:attribute name="onclick">javascript:showOne('div_<xsl:value-of select="SortBy"/>');</xsl:attribute>
							<xsl:value-of select="Title"/>
						</a></strong>
		            	<xsl:if test="position()!=last()">
		              		<br /><br/>
		            	</xsl:if>
					</xsl:if>
		          </xsl:for-each>
		        </div>
		      </td>
		      <td width="700">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number" />
					<div class="item" width="700px;">
						<xsl:if test="position() &gt; 1">
							<xsl:attribute name="style">
								display:none
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="id">div_<xsl:value-of select="SortBy"/></xsl:attribute>
						<div class="item_description">
							<h2><xsl:value-of select="Title"/></h2>
							<p><xsl:value-of select="Description" disable-output-escaping="yes"/></p>
						</div>
						<br/>
						<div class="item_image" style="float:left; clear:both; width:auto;">
								<img alt="" border="0">
									<xsl:attribute name="src"><xsl:value-of select="Image"/></xsl:attribute>
								</img>
						</div>
					</div>
				</xsl:for-each>

			</td>
		</tr>
		    </table>
			</div>
	
		
		
		
		
	</xsl:template>
</xsl:stylesheet>
