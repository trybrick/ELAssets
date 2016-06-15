<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script id="jsCommon" type="text/javascript" language="javascript">
				<![CDATA[
				var pages = 2;
				
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

		</script>
		<div id="AboutUsDiv">
			<h3 class="pageHeading">About Us</h3>
			<div id="navigation">
				<a href="javascript:showOne('div_2');">About Us</a>
				<a href="##root##/StoreLocator.aspx?hold=1">Map &amp; Hours</a>
			</div>
			<div id="div_2">
				<img id="familyOwned" name="familyOwned" style="margin-left:40px;float:left;" width="700px" src="##root##/Assets/##chainid##/Images/garys_progress_best_p01.jpg" />
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>