<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript"><![CDATA[
		var counts=5;
		function CountDown(){
			var s = '';   

			for(var i=0;i<=counts; i++){
				s += '.';
			};

			var lbl = document.getElementById('timer');

			if(lbl != null){
				lbl.innerHTML = s;
			}

			counts -= 1;

			if(counts == 0){
				window.clearInterval();
				var redirect = document.location.protocol + '//' + document.location.host + '/Recipes/RecipeCenter.aspx';
				document.location = redirect;
			}
		}
		window.setInterval('CountDown()',1000);
		]]></script>
		<div id="Countdown" style="clear:none">
			<div id="registrationcontainer" style="width:590px; clear:both; float:left">
				<div id="ThankYou">
					<h2>Thank you for signing up with Ucook.com</h2>
					<p>You will now have direct access to our customized recipes, emails and coupons.
		        <br/>Click <a href="##root##"> here</a> to get started today.</p>
				</div>
			</div>
		</div>
		<div id="ButtonBack">
			<p>You are now being logged in <span id="timer"/></p>
			<table>
				<tr>
					<td valign="middle">If your browser does not refresh automatically, please click </td>
					<td valign="middle">
						<a id="ctl00_ContentPlaceHolder1_btnBack" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$btnBack','')">Here</a>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
