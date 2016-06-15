<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" />

	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				<![CDATA[
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
		<style>
			div.departmentPage table td {text-align:left;}
		</style>
		<div id="Meat" class="departmentPage">
			<div class="leftnav">
				<a href="#" onclick="javascript:showOne('div2');">Trig's Own Signature Items</a>
				<a href="#" onclick="javascript:showOne('div3');">Trig's Smoke House</a>
			</div>
			<div id="div1"  class="contentDiv">
				<h4>Service Makes Us Different</h4>
				<p>In Trig's Meat Department, we like to think of ourselves as your personal butcher. We prepare a wide variety of fresh and smoked meats and fresh and frozen seafood. Certified Angus Beef, and Gerber&#169; All Natural Amish Country Chicken provide quality options you'll be proud to serve. We also make our own fresh sausage, bratwurst, and breakfast sausage, and offer signature items you won't find anywhere else.</p>
				<p>Our favorites? Well, that's a tough question! In the running are our marinated chicken breasts in a variety of flavors (lemon pepper, teriyaki, BBQ, and herb and garlic, to name a few), our beef burgundy pepper spoon roasts, our marinated sirloin sizzler steaks, and our BBQ ribs on a stick.</p>
				<p>Trig's Meat Departments also offer the freshest, leanest ground beef available. Choose from 96% Lean Fresh Ground Round, 85% Lean Fresh Ground Chuck, 81% Lean Fresh Certified Ground Beef, and our customers’ favorite, Certified Angus Beef Fresh Ground Chuck. Our ground products are ground numerous times every day to ensure freshness.</p>
				<p>Our Meat Experts will help you find your favorites by greeting you with a smile and providing the cuts you want, plus expert advice on what to serve, quantities needed, and preparation tips. You will find our service to be second to none in the industry!</p>
				<p>If you’re looking for a special order, no job is too big or too small.</p>
			</div>
			<div id="div2"  class="contentDiv" style="display:none">
				<table style="width:600px;">
					<tr>
						<td valign="top" width="473">
							<h2><img alt="" align="right" border="0" height="215" width="275"><xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/roast.gif</xsl:attribute></img>Trig's Own Signature Items</h2>
							<p>Don't pass up these specially prepared meats: Trig's signature items from our meat department are a great anchor for a memorable meal. We've collected preparation instructions here for your convenience.</p>
							<p><b>Beef Burgundy Pepper Roast</b></p>
							<p><b>To bake:</b> Put small amount of water in casserole dish. Place roast in dish, cover, and place into 325-degree oven. Bake 25 minutes per pound.</p>
							<p><b>To grill:</b> Place roast on grill over medium heat for 25 to 30 minutes per side.</p>
							<p><i>Cellar 70 Recommendation: A bottle of Merlot or Cabernet Sauvignon would be a great addition to this satisfying meal.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Trig's Own Meatloaf</b></p>
							<p><b>To bake:</b> Preheat oven to 350 degrees. Bake approximately 1 hour.</p>
							<p><b>To microwave:</b> Place meatloaf (1 lb.) in microwave-safe pan. Cover with waxed paper. Cook on high 8-10 minutes until done (165 degrees). If your microwave does not have an automatic turntable, turn the pan 1⁄4 turn every 3 minutes.</p>
							<p><i>Time and temperature of microwave recipe may vary, depending on wattage of your oven.</i></p>
							<p><i>See Trig's Deli for delicious salads, and our Bakery for fresh pies and pastries, to round out this great meal.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>BBQ Ribs on a Stick</b></p>
							<p><b>To bake:</b> Place in baking pan with 1⁄4 cup water covering bottom of pan. Cover and bake at 325 degrees for 1 1⁄2 - 2 hours or until tender. Meat thermometer should read a minimum of 150 degrees.</p>
							<p><b>To grill:</b> Grill over indirect heat for 1 to 1-1/4 hours, turning once. Brush frequently with barbecue sauce. Cook until juices run clear and meat thermometer registers 150 degrees.</p>
							<p><i>Cellar 70 Recommendation: Try serving our Ribs on a Stick with a bottle of Red Zinfandel</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Chicken Stir Fry</b></p>
							<p><b>To pan fry:</b> Heat 2 tbsp. oil in skillet or wok. Add chicken, cook 5 minutes, stir. Add vegetables. Cook and stir 5-8 minutes. Add soy sauce and pepper to taste.</p>
							<p><b>To microwave:</b> Heat 2 tbsp. oil in microwave-safe dish. Cook high 2-1/2 to 3 minutes. Add 1 lb. chicken, cook covered on high 3-4 minutes, stirring twice. Add vegetables, and cook covered on high 3-5 minutes. Let stand 3 minutes, covered.</p>
							<p><i>Time and temperature of microwave may vary, depending on wattage of your oven.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Trig's Own Bratwurst</b></p>
							<p>Grill bratwurst over medium heat, turning occasionally, for about 20 minutes. Combine 1 cup beer, 1-1/2 cup water, and 1 cup ketchup in large saucepan. Simmer the grilled brats in beer mixture for 15-30 minutes.</p>
							<p><i>This method of cooking adds flavor while it tenderizes the bratwurst skins.</i></p>
							<p><i>Stop by Trig's Deli and Bakery for delicious salads, fresh brat buns, and desserts for this special meal. Don't forget the charcoal!</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Sweet Bourbon Pork Roast</b></p>
							<p><b>To bake:</b> Place in baking pan and put small amount of water in pan. Place roast into pan, cover, and place in 325-degree oven for 25 minutes per pound. Meat thermometer should read a minimum of 160 degrees.</p>
							<p><b>To grill:</b> Place roast on grill over medium heat for 25 to 30 minutes per side. Cook until juices run clear and meat thermometer registers 160 degrees.</p>
							<p><i>Cellar 70 recommendation: Serve this roast with one of these delicious wines: a Dry Riesling, a Gewürztraminer, or a Pinot Noir.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Trig's Own Chicken Breasts</b></p>
							<p><b>To grill:</b> Plain – Coat breasts with oil, sprinkle with salt and pepper or other seasonings to taste. Marinated and plain – Place chicken on surface of grill 6 to 8 inches from medium heat. Grill 18-25 minutes or until cooked through, turning occasionally.</p>
							<p><b>In oven:</b> Preheat oven to 350 degrees. Sprinkle plain breasts with salt and pepper or other seasonings to taste. Heat large nonstick skillet to medium-high heat. Add 1 tbsp. olive or vegetable oil. Brown chicken about 4 minutes per side. Transfer to large baking dish. Bake 8 to 10 minutes until cooked through.</p>
							<p><i>When chicken breasts are cooked to juicy, tender perfection…pierce with fork: juices should run clear. When cut with a knife, the meat should be opaque. </i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Samurai Stir Fry</b></p>
							<p><b>Instructions for beef, pork, and chicken stir fry:</b> Heat frying pan to medium high. Spread 1 tbsp. of low cholesterol cooking oil on pan. Add meat; stir fry until brown. Stir in vegetables. Cook vegetables to desired crispness. Add soy sauce and pepper to taste; add garlic if desired.</p>
							<p><b>Instructions for crab stir fry:</b> Heat frying pan to medium high. Spread 1 tbsp. of low cholesterol cooking oil on pan. Add vegetables. Cook vegetables to taste. Stir in Louis Kemp® Imitation Crab meat. Add soy sauce and pepper to taste and garlic if desired.</p>
							<p><i>If you're using an electric skillet, heat to 375-400 degrees.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Stuffed Pork Chops / Steaks</b></p>
							<p><b>To bake:</b> Place a single layer of pork in baking dish. Rub lightly with oil. Bake in 350-degree preheated oven, 1 hour 20 minutes, or until tender.</p>
							<p><b>To microwave:</b> Preheat microwave browning dish on high for 5 minutes. Coat with oil. Add 2 chops/steaks (1-1/2 pounds). Cook, covered, on high 4 minutes, turning over once. Cook, covered, 50% power (medium) 9-11 minutes or until tender.</p>
							<p><i>Time and temperature of microwave recipe may vary, depending on wattage of your oven, and with additional chops or steaks.</i></p>
							<p><i>Cellar 70 Recommendation: Our wine experts suggest a Pinot Noir or a Riesling Kabinett to accompany this delicious meal.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Glazes for Baked Ham</b></p>
							<p><i>During the final minutes of baking a ham, a glaze can enhance the tastiness of the final product. Here are four of Trig's most popular recipes. </i></p>
							<p><b>Honey Mustard Glaze:</b> Combine in sauce pan: 1 cup pineapple juice, ½ cup brown sugar, 1 tsp. lemon juice, 2 tsp. prepared mustard, and ¼ cup honey. Bring to boil and simmer for 10 minutes. Spread glaze over ham for final 20 minutes.</p>
							<p><b>Brown Sugar Glaze:</b> Combine ¾ cup brown sugar, ¼ cup honey, ¼ tsp dry mustard, and 1 tbsp. vinegar. No heating required. Spread glaze over ham for final 15 minutes.</p>
							<p><b>Pineapple Glaze:</b> Heat 1 cup brown sugar, 1 tbsp cornstarch, 1 (8 oz.) can of crushed pineapple <i>with syrup</i>, 2 tbsp lemon juice, and 1 tbsp. prepared mustard. Heat and stir until mixture thickens and boils. Spread glaze over ham for final 20 minutes.</p>
							<p><b>Basic Juice Glaze:</b> Mix ¼ cup brown sugar, 3 tbsp. pineapple juice, and 1 tbsp. mustard. No heating required. Spread glaze over ham for final 15 minutes.</p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Stuffed Pork Roast</b></p>
							<p><b>To roast:</b> Roast, uncovered, fat side up on rack in shallow roasting pan at 325 degrees, 3-1/2 hours or until well done (internal temperature 165 degrees).</p>
							<p><b>To microwave:</b> Place roast fat side down on microwave roasting rack in microwave-safe dish. Cook at medium/low for 12 to 13 1⁄2 minutes per pound. Brush with melted margarine. Let stand 10 minutes before serving.</p>
							<p><i>Time and temperature of microwave recipe may vary, depending on wattage of your oven.</i></p>
							<p><i>Complement Trig's Stuffed Pork Roast with a Dry Riesling or a Pinot Noir. </i></p>
							<!-- <p><a href="#">Print this recipe</a></p> -->
							<hr/>
							<p><b>Half Prime Rib (6-7 lbs)</b></p>
							<p><b>Rub recipe:</b> Combine 1⁄4 cup Lawry's&#174; Seasoned Salt, 1⁄4 cup Cajun seasoning, and 1 tbsp. black pepper.</p>
							<p><b>To bake:</b> Place meat, fat side up, in a large roasting pan. Insert oven-safe meat thermometer into center of cut. Bake 2-1/2 hours at 300 degrees, then 3 hours at 175 degrees for medium to medium rare. For well done, bake for 3 hours at 300 degrees, then 3 hours at 175 degrees. See meat thermometer guide.* Transfer to cutting board, cover with foil, and let stand for 15 minutes before carving. Temperature will rise about five degrees while resting.</p>
							<p><b>*Meat thermometer guide: </b>140 degrees = rare. 160 degrees = medium. 170 degrees = well done.</p>
							<p><i>Cellar 70 Recommendation: We suggest a Merlot, a Cabernet Sauvignon, or an Australian Shiraz to complement this meal.</i></p>
							<!-- <p><a href="#">Print this recipe</a></p> --> <br />
						</td>
					</tr>
				</table>
			</div>
			<div id="div3"  class="contentDiv" style="display:none">
				<h4>Trig's Smoke House</h4>
				<p>Located in Rhinelander, Trig's own smokemaster, Jamie Cline, is an expert with 13 years of experience. Jamie prepares a wide variety of smoked meats in our very own natural wood smokehouse. Our smokehouse supplies all our stores with lean smoked bacon, summer sausage, beef sticks, black forest ham, and many other smoked delicacies prepared with fresh, specially-selected lean meats. Jamie can also process your boneless venison to make the finest available sausage.</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
