<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" />

	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				<![CDATA[
				var pages = 5;
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
						elemOff( 'div'+i );
				}
				function showAll(){
					for( var i = 1; i <= pages; i++ )
						elemOn( 'div'+i );
				}
				function showOne(elem_id){
					hideAll( );
					elemOn( elem_id );
				}

				]]>
			</xsl:comment>
		</script>
		<div id="Liquor" class="departmentPage">
			<div class="leftnav">
				<a href="#" onclick="javascript:showOne('div2');">What Wine Should I Buy?</a>
				<a href="#" onclick="javascript:showOne('div3');">Talk With a Beverage Specialist</a>
				<a href="#" onclick="javascript:showOne('div4');">Hours and Phone Numbers</a>
				<a>
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image != ''"><xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent[1]/Image" /></xsl:when>
							<xsl:otherwise>javascript:showOne('div5');</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					Cellar 70 Newsletter</a>
			</div>
			<div id="div1"  class="contentDiv">
				<h4>"The Best Advice in Years"</h4>
				<p>With thousands of varieties of wine in stock, each Cellar 70 has an enthusiastic staff of wine aficionados to offer you the best advice in selecting the perfect wine to pair with dinner or to make your special event unique and memorable.</p> 
				<p>Cellar 70 got its name from our first location in Minocqua on Highway 70. Originally a small section within the store, Cellar 70 became an entire department dedicated to wines, craft beers, and spirits. The popularity of Cellar 70 has led to expanded selections at all Trig's stores.</p>
				<p>The Cellar 70 experience is a relaxing, pleasant interlude in a beautiful environment of arched cedar ceilings and subtle lighting. Stop in during one of our wine tasting events (call for schedule), or just stroll around and shop to discover new wines.</p>
				<h4>TV Commercial</h4>
				<div class="Video">
				<object width="425" height="350"> <param name="movie" value="http://www.youtube.com/v/hDZxMmcZLno"> </param> <embed src="http://www.youtube.com/v/hDZxMmcZLno" type="application/x-shockwave-flash" width="425" height="350"> </embed> </object>
				</div>
			</div>
			<div id="div2"  class="contentDiv" style="display:none">
				<table>
					<tbody>
						<tr>
							<td colspan="2" valign="middle">Click <a><xsl:attribute name="href">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/Cellar70Guide.pdf</xsl:attribute>here</a> for a printable pdf version of the Cellar 70 guide for selecting the perfect wine to compliment your meal.</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="middle"><a id="wine_beef" name="wine_beef"></a><b>Beef</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Steaks</td>
							<td valign="top">Merlot (Trig's Favorite Red), Australian Shiraz, Cabernet Franc, Côtes-Du-Rhone, Cabernet Sauvignon</td>
						</tr>
						<tr>
							<td valign="top" width="100">Stew</td>
							<td valign="top">Pinot Noir, Beaujolais, Côtes-Du-Rhone</td>
						</tr>
						<tr>
							<td valign="top" width="100">Corned Beef</td>
							<td valign="top">Red Zinfandel, Riesling Kabinett, Dry Rosé, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Casserole &amp; Stroganoff</td>

							<td valign="top">Beaujolais, Pinot Noir, Red Côtes-Du-Rhone, Syrah</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_chicken" name="wine_chicken"></a><b>Chicken</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Baked</td>

							<td valign="top">Chardonnay, Riesling Spätlese, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Light Dishes</td>
							<td valign="top">Chenin Blanc, Viognier, Riesling Kabinett, Riesling Spätlese</td>
						</tr>
						<tr>

							<td valign="top" width="100">Heavy Dishes</td>
							<td valign="top">Semillon-Chardonnay, Chardonnay, Gewürztraminer</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_pork" name="wine_pork"></a><b>Pork</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Chops</td>
							<td valign="top">Riesling Kabinett, Beaujolais, Pinot Noir, Alsatian or domestic Pinot Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Roast</td>
							<td valign="top">Dry Riesling, Gewürztraminer, Pinot Noir</td>
						</tr>
						<tr>
							<td valign="top" width="100">Spare Ribs&#160;</td>
							<td valign="top">Red Zinfandel, Côtes-Du-Rhone, Shiraz, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Sweet &amp; Sour</td>
							<td valign="top">Riesling Kabinett, Dry Chenin Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Tenderloin</td>
							<td valign="top">Cabernet, Merlot, Pinot Noir, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Ham</td>
							<td valign="top">Dry Rosé, Beaujolais, Gewürztraminer</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="middle"><a id="wine_veal" name="wine_veal"></a><b>Veal</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Roast&#160;</td>
							<td valign="top">Riesling Kabinett, Pinot Gris or Muscat, Beaujolais, Pinot Noir</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_lamb" name="wine_lamb"></a><b>Lamb</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Roast&#160;</td>
							<td valign="top">Pinot Noir, Beaujolais, Red Bordeaux, Cabernet, Merlot, Côtes-Du-Rhone, Shiraz</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_lobster" name="wine_lobster"></a><b>Lobster</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Newburg</td>
							<td valign="top">French Chablis, California Chardonnay, Sauvignon Blanc, Alsatian Pinot Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Stuffed, Baked </td>
							<td valign="top">Riesling, Chenin Blanc, Pinot Gris</td>
						</tr>
						<tr>
							<td valign="top" width="100">Grilled&#160;</td>
							<td valign="top">Chardonnay, Italian Pinot Grigio, Alsatian Pinot Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Thermidor</td>
							<td valign="top">Chardonnay, Sauvignon Blanc, Rheingau Kabinett, Pinot Gris</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_shrimp" name="wine_shrimp"></a><b>Shrimp</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Broiled&#160;</td>
							<td valign="top">Chardonnay, Sauvignon Blanc, Pinot Grigio, Gavi</td>

						</tr>
						<tr>
							<td valign="top" width="100">Fried&#160;&#160;</td>
							<td valign="top">Riesling Spätlese, Chenin Blanc, Sauvignon Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Tempura</td>

							<td valign="top">Riesling Spätlese, Vouvray, &#160;Muscat</td>
						</tr>
						<tr>
							<td valign="top" width="100">Cold&#160;&#160;</td>
							<td valign="top">Champagne, Chardonnay, Soave, Sauvignon Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Hors d'oeuvres&#160;</td>
							<td valign="top">Sauvignon Blanc, Pinot Grigio, Pinot Blanc</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_scallops" name="wine_scallops"></a><b>Scallops</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Fried</td>
							<td valign="top">Sauvignon Blanc, Alsatian Pinot Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Poached</td>
							<td valign="top">Chardonnay, Sauvignon Blanc, Dry Riesling, Pinot Gris</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_oysters" name="wine_oysters"></a><b>Oysters, Clams</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Baked</td>
							<td valign="top">Brut Champagne, Chardonnay, Sauvignon Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Broiled&#160;&#160;</td>
							<td valign="top">Sauvignon Blanc, Chardonnay, Brut Champagne, Pinot Grigio</td>
						</tr>
						<tr>
							<td valign="top" width="100">Creamed</td>
							<td valign="top">French Chablis, Chardonnay, Sauvignon Blanc, Pinot Gris, Pinot Blanc</td>

						</tr>
						<tr>
							<td valign="top" width="100">Hors d'oeuvres</td>
							<td valign="top">Champagne, Italian Pinot Grigio, Pinot Bianco</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_freshfish" name="wine_freshfish"></a><b>Freshwater Fish</b></td>

						</tr>
						<tr>
							<td valign="top" width="100">Baked&#160;&#160;</td>
							<td valign="top">Mosel or Rheingau Kabinett, Chenin Blanc, Alsatian Pinot Blanc</td>
						</tr>
						<tr>
							<td valign="top" width="100">Rich Sauce</td>

							<td valign="top">Chardonnay, Sauvignon Blanc, Dry Gewürztraminer, Pinot Gris</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top">
								<p><a id="wine_pasta" name="wine_pasta"></a><b>Pasta</b></p>
							</td>
						</tr>
						<tr>
							<td valign="top" width="100">Red Sauce</td>
							<td valign="top">Red Zinfandel, Chianti, Valpolicella, or Other Italian Reds</td>
						</tr>
						<tr>
							<td valign="top" width="100">White Sauce&#160;</td>
							<td valign="top">Soave, Frascati, Pinot Grigio, Pinot Bianco, Gavi</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_pizza" name="wine_pizza"></a><b>Pizza</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Your Favorite</td>
							<td valign="top">White Zinfandel, Rosé, Chianti, Red Zinfandel, Chardonnay (believe it or not!)</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_game" name="wine_game"></a><b>Game, Venison, Pheasant, Grouse</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Roast</td>
							<td valign="top">Pinot Noir, Côtes-Du-Rhone, Syrah, Australian Shiraz, Italian Nebbiolo or Amarone</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_turkey" name="wine_turkey"></a><b>Turkey, Goose, Duck</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Roast&#160;</td>
							<td valign="top">Chardonnay, Beaujolais, German Kabinett or Spätlese, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Fruit Glaze&#160;</td>
							<td valign="top">Gewürztraminer, Riesling Spätlese, Beaujolais, Pinot Noir</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#dfedb6" valign="top"><a id="wine_cheese" name="wine_cheese"></a><b>Cheese and Fruit</b></td>
						</tr>
						<tr>
							<td valign="top" width="100">Cheddar, Colby&#160;</td>
							<td valign="top">Riesling Spätlese, Chenin Blanc, Beaujolais</td>
						</tr>
						<tr>
							<td valign="top" width="100">Swiss</td>
							<td valign="top">Chardonnay, Semillon, Gewürztraminer</td>
						</tr>
						<tr>
							<td valign="top" width="100">Brie&#160;</td>
							<td valign="top">Pinot Noir, Cabernet, Merlot</td>
						</tr>
						<tr>
							<td valign="top" width="100">Any Fruit</td>

							<td valign="top">Chenin Blanc, Mosel or Rheingau Spätlese, Moscato D' Asti</td>
						</tr>
					</tbody>
				</table>
				<h4>General Selection Advice</h4>
				<ul>
				    <li>White Zinfandel and White Merlot are popular choices for almost any occasion.</li>
				    <li>Champagne or sparkling wines, while festive, also pair well with most any cuisine.</li>
				    <li>Spices add their own special flavors and aromas to food. Match your wine to the richness and zest of each dish. The spicier the dish, the bolder the wine.</li>
				</ul>
			</div>
			<div id="div3"  class="contentDiv" style="display:none">
				<h4>Talk with a Beverage Specialist</h4>
				<p>Whether you're planning a party, special event, or intimate occasion, our Cellar 70 consultants are available to help you make a beverage selection. Our staff has years of experience from the best wine markets throughout the Midwest. True aficionados of fine wines, each has extensive knowledge of our inventory and can describe the grape varieties, aromas, and flavors of wines from our large collection. If you’re looking for a specific label we don’t stock, we will do our very best to special order it for you.</p>
				<p>Dennis Kohl is the Beverage Consultant for all Cellar 70 locations. He has been in the business since 1979 and has been teaching about wines since 1985. He taught wine appreciation at the Cooking and Hospitality Institute of Chicago (C.H.I.C.) and for the Triton College culinary arts program in River Grove, Illinois. Call Dennis at 715-356-7711 ext. 42.</p>
				<h5>Eagle River</h5>
				<p>In Eagle River, ask for Mark Mason. Mark’s experience comes from both the wholesale and retail sides of the business. He spent 12 years at one of Madison’s busiest retail beverage shops before coming to Cellar 70. He is the beer liaison for all Cellar 70s, having contacts with craft brewers from all over the Midwest. Call Mark at 715-479-6411.</p>
				<h5>Minocqua</h5>
				<p>Jim Moore and Jack Wade are your contacts in Minocqua. Jim is the Beer and Spirits buyer whose experience comes from his time with a large beverage chain in the Chicago area.  Jack, our Wine Consultant, worked at one of the Chicago area’s most prestigious wine retailers. He successfully completed a series of classes and seminars at the highly respected Chicago Wine School (C.W.S.). Jim and Jack can be reached at 715-358-6847.</p>
				<h5>Rhinelander</h5>
				<p>Don Kussman, Cellar 70 Manager and Dennis (Shorty) Carney, Beverage Consultant, are Rhinelander's Beer, Wine, and Spirit Consultants. Shorty has many years in both retail and wholesale beverage sales. He has an extensive wine and spirit knowledge that he shares with all of our Cellar 70 customers. Don is a long time Rhinelander resident who operated his own business prior to starting with Cellar 70. Call Don or Dennis at 715-369-2993.</p>
				<h5>Stevens Point</h5>
				<p>Jeff Tewes is the Cellar 70 Manager in Stevens Point. Jeff has been in the grocery industry for over 28 years.  His experience has lead to various management positions over the years, and brought him to his dream position as Manager of T.A. Solberg Company's newest and largest Cellar 70 location in Stevens Point. Jeff, the Assistant Dotty Mansavage, and our entire staff welcome the opportunity to serve you. Please call 715-254-3920 or e-mail Jeff directly at  <a href="mailto:jtewes@svharbor.com">jtewes@svharbor.com</a></p>
				<h5>Wausau</h5>
				<p>In Wausau, ask for Bruce Conard or Merlin Adams. Bruce was the Beverage Director for the Hyatt Corporation as well as the Mead Inn in Wisconsin Rapids. He is currently conducting a wine appreciation program for the University of Wisconsin at Marathon County. Merlin spent seven years as the on-premise wine and spirits consultant for one of Wisconsin’s largest wholesalers. Merlin is also known as the “Beer Maven” of Wausau! Call Bruce or Merlin at 715-849-9044.</p>
			</div>
			<div id="div4"  class="contentDiv" style="display:none">
				<h4>Hours &amp; Phone Numbers</h4>
				<table style="width:600px">
					<tr class="tableHeading">
						<td>Location</td><td>Phone</td><td>Cellar 70 Hours</td>
					</tr>
					<tr>
						<td>Eagle River</td><td>715-479-6411</td><td rowspan="5" valign="middle">All five of our Cellar 70 locations are open<br />from 8am to 9pm, seven days a week.</td>
					</tr>
					<tr>
						<td>Minocqua</td><td>715-358-6847</td>
					</tr>
					<tr>
						<td>Rhinelander</td><td>715-369-2993</td>
					</tr>
					<tr>
						<td>Stevens Point</td><td>715-254-3920</td>
					</tr>
					<tr>
						<td>Wausau</td><td>715-849-9044</td>
					</tr>

				</table>
			</div>
			<div id="div5"  class="contentDiv" style="display:none">
				<h4>There is no Newsletter to display at this time. Please check again later.</h4>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
