<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
		<div id="Floral" class="departmentPage">
			<!-- <h3 class="pageHeading">Floral</h3> -->
			<div class="leftnav">
				<a href="#" onclick="javascript:showOne('div1');">Hours and Locations</a>
				<a href="#" onclick="javascript:showOne('div2');">Shopping, Ordering, and Delivery</a>
				<a href="#" onclick="javascript:showOne('div3');">Fresh Flowers and Arrangements</a>
				<a href="#" onclick="javascript:showOne('div4');">Green and Blooming Plants</a>
				<a href="#" onclick="javascript:showOne('div5');">Bouncy Balloon Bouquets</a>
				<a href="#" onclick="javascript:showOne('div6');">Permanent Florals</a>
				<a href="#" onclick="javascript:showOne('div7');">Give a Gift Basket</a>
				<a href="#" onclick="javascript:showOne('div8');">Design and Decor</a>
				<a href="#" onclick="javascript:showOne('div9');">Weddings. Parties and Events</a>
				<a href="#" onclick="javascript:showOne('div10');">Help Getting Your Home Ready...</a>
				<a href="#" onclick="javascript:showOne('div11');">Business Environments</a>
				<a href="#" onclick="javascript:showOne('div12');">Corporate Gift Giving</a>
				<a href="/Assets/148/Images/weddingfloral.pdf">Wedding Floral</a>
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:if test="Title != ''">
						<a>
							<xsl:attribute name="href"><xsl:value-of select="Image" /></xsl:attribute>
							<xsl:value-of select="Title" />
						</a>
					</xsl:if>
				</xsl:for-each>
			</div>
			<div id="div1"  class="contentDiv">
				<h4>Full Service Floral and Gifts</h4>
				<p>We're passionate about flowers! …And we're not your average grocery store florists. We just happen to be located in a supermarket where it's extremely convenient for you to stop by our store. Our florists are dedicated designers with years of experience and the know-how to turn your visions into reality with fresh, beautiful flowers and arrangements, healthy green and blooming plants, balloons, cards, plush animals, unique home décor, and more.</p>
				<p>If you're planning an event or party, make Trig's your one-stop shop: We can work closely with Trig's deli, bakery, and meat departments – as well as Cellar 70 – to help you create a memorable occasion.</p>
				<h4>Five Fragrant Locations:</h4>
				<table>
					<tr class="tableHeading">
						<td>Location</td><td>Address</td><td>Phone</td><td>Toll Free</td><td>E-mail</td>
					</tr>
					<xsl:for-each select="ExpressLane/FloralContent/ArrayOfGenericStore/Store">
						<tr>
							<td><xsl:value-of select="StoreName" /></td><td><xsl:value-of select="PrimaryAddress" /></td><td><xsl:value-of select="Phone" /></td><td><xsl:value-of select="TollFree" /></td><td><xsl:value-of select="Email" /></td>
						</tr>
					</xsl:for-each>
					<tr>
						<td colspan="5">Delivery service available Monday-Saturday
						with funeral delivery on Sunday</td>
					</tr>
				</table>
			</div>
			<div id="div2"  class="contentDiv" style="display:none">
				<h4>Shopping, Ordering, and Delivery</h4>
				<p>Call or fax your order anytime, or click on the FTD link to order flowers now. Stop in for inspiraton and ideas.. Our display area is always brimming with great home décor items, gifts, and permanent florals. The service is great and you’ll enjoy an overall wonderful shopping experience. We’re open 7 days a week, 364 days a year with the most extensive hours in the area.</p>
				<h4>Cash and Carry</h4>
				<p>Because Trig's is open 24 hours a day, much of our selection is also available anytime, day or night. Our coolers always offer a great selection of cash and carry fresh arrangements. Call ahead if you’d like us to make a custom arrangement for pick-up or delivery.</p>
				<h4>Local and FTD Worldwide Delivery</h4>
				<p>Local delivery service is available Monday-Saturday with funeral delivery on Sunday. You can send flowers and gifts worldwide via Trig's FTD wire service. Take a look on the FTD link or stop by the shop for ideas of what to send</p>
				<a>
					<xsl:attribute name="href">http://www.trigsfloral.com</xsl:attribute>
					<img>
						<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/FTDLogo.jpg</xsl:attribute>
					</img>
				</a>
			</div>
			<div id="div3"  class="contentDiv" style="display:none">
				<h4>Fresh Flowers and Arrangements</h4>
				<div class="floralParagraph">
					<img class="leftImage">
						<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/flowers1.jpg</xsl:attribute>
					</img>
					<h5>Bouquets</h5>
					<p>We offer a fresh selection of cash and carry bouquets every day! Favorites include roses, mixed flowers, and mix and match market bouquets. Watch for seasonal bouquets, too. Prices are kept low so you can have fresh flowers in your home or office every week!</p>
				</div>
				<div class="floralParagraph">
					<img class="rightImage">
						<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/flowers2.jpg</xsl:attribute>
					</img>
					<h5>Loose-Stem Flowers</h5>
					<p>Trig's Floral and Gifts is much more than a typical supermarket florist! Our walk-in coolers are well-stocked with loose-stem flowers. Inside, you can look over our full flower selection.</p>
					<p>Choose from well-known roses, carnations, and daisies, or pick out a more unique assortment. Other flower varieties may include iris, gerber daisies, sunflowers, godetia, delphinium, liatris, snapdragons, wax flower, solidago, as well as many seasonal choices!</p>
					<p>We'll arrange your selections as you like or help you gather flowers and materials to make your own floral arrangements at home. We have all the greens and supplies you need!</p>
				</div>
				<div class="floralParagraph">
					<img class="leftImage">
						<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/flowers3.jpg</xsl:attribute>
					</img>
					<h5>Arrangements for Every Occasion</h5>
					<p>Sometimes words alone aren’t enough. Whether you want to celebrate Valentine's Day, mark an anniversary, express feelings of sympathy, say thanks to mom, or say &quot;I'm sorry&quot; to someone close, Trig's Floral and Gifts has arrangements that can express your true feelings wordlessly.</p>
					<p>See a sampling of our arrangements.</p>
				</div>
			</div>
			<div id="div4" class="contentDiv"  style="display:none;">
				<h4>Green and Blooming Plants</h4>
				<p>Green and blooming plants bring cheer to your surroundings at home or at work. Trig's Floral and Gifts has an everyday selection in all price ranges as well as seasonal choices such as tulips, daffodils, Easter Lilies, outdoor hanging baskets, hardy garden mums, and poinsettias. Growing plants also make great gifts!</p>
				<p>See a sampling of our arrangements</p>
				<img class="leftImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/green_bloom.jpg</xsl:attribute>
				</img>
			</div>
			<div id="div5"  class="contentDiv" style="display:none;">
				<h4>Bouncy Balloon Bouquets</h4>
				<p>Feeling a bit more whimsical than flowers? Try a balloon bouquet! Available singly or in groups, balloons come in designs that are great for adding a light touch to a message. They make great decorations at birthdays, graduations, garage sales, and many other occasions. Attach a card for a special get well soon gift or to celebrate a baby’s birth. We can tie one to a gift basket to give someone you know a truly festive surprise!</p>
				<p><em>Mylar* balloons last for days while latex last approximately 8-10 hours.</em></p>
				<p><em>*Most hospitals do not accept latex balloons due to latex allergies.</em></p>
				<img class="leftImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/green_balloon.jpg</xsl:attribute>
				</img>
			</div>
			<div id="div6"  class="contentDiv" style="display:none;">
				<h4>Permanent Florals</h4>
				<p>If you're looking for something more permanent in a floral arrangement, you will find a stunning selection of realistic silk flowers at Trig's Floral and Gifts. Choose from our vases of single stem flowers, seasonal bushes, or pre-made arrangements. We also make custom arrangements to perfectly fit your space, style, and color scheme. We will be happy to come to your home and take measurements and make sure everything matches beautifully.</p>
				<img class="leftImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/green_perman.jpg</xsl:attribute>
				</img>
			</div>
			<div id="div7"  class="contentDiv" style="display:none;">
				<h4>Give a Gift Basket</h4>
				<p>At Trig's Floral and Gifts, our gift baskets are available in almost endless variety. That's because, in addition to all the flowers, gifts, and accessories we have in our department, all the resources of Trig's are at hand to make your gift basket truly special. We can develop any theme you want with wines from Cellar 70, treats from Trig's bakery, fresh fruit from the produce section, snacks from Trig's deli, hams, turkeys, or steaks from Trig's meat counter, and even bath and beauty products from the grocery aisle. Access to any combination of spirits, foods, flowers, and gifts allows you to express your creativity.</p>
			</div>
			<div id="div8"  class="contentDiv" style="display:none;">
				<img class="rightImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/green_design_decor.gif</xsl:attribute>
				</img>
				<h4>Design and Décor</h4>
				<p>Decorate your home, office, or cottage with accents, seasonal decorations, and stylish containers.</p>
				<p>Our home décor section includes tabletop items, linens, rugs, furniture, lamps, and a large selection of matching accessories. You’ll find we stock items reflecting both traditional styles and current trends. New merchandise arrives weekly so there is always something new to see!</p>
				<p>We carry current styles and classic items from:</p>
				<ul>
				    <li>Root Candles</li>
				    <li>Signature Housewares Table Top</li>
				    <li>C&amp;F Enterprises linens</li>
				    <li>Tag</li>
				    <li>Hillhouse Naturals potpourri</li>
				    <li>Boston International napkins</li>
				    <li>Cody Road furniture</li>
				    <li>Punch Studio gift cards</li>
				    <li>Chandler 4 Corners original hook and braid rugs</li>
				    <li>Earth rugs</li>
				    <li>Lang primitives</li>
				    <li>Vintage verandah lamps</li>
				    <li>Raz Imports</li>
				    <li>Midwest of Cannon Falls</li>
				    <li>The Salem Collection</li>
				    <li>Timeworks clocks</li>
				    <li>Russ Berrie<br />…and many more!</li> 
				</ul>
				<p>Our staff puts together unique displays that change seasonally. We can also special order or custom design items to match your home and personal style.</p>
			</div>
			<div id="div9"  class="contentDiv" style="display:none">
				<img class="leftImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/wedding_flowers.jpg</xsl:attribute>
				</img>
				<h4>Weddings, Parties, and Special Events</h4>
				<h5>Wedding Flowers</h5>
				<ul id="StepList">
					<li>Step 1: Say yes!</li>
					<li>Step 2: Set a date.</li>
					<li>Step 3: Call Trig's.</li>
				</ul>
				<p>We can help make your big day a dream come true! You can trust us to help make everything perfect with beautiful flowers. When you set a consultation appointment with a Trig's Floral and Gift designer, you can start to relax because we'll take care of all the floral details.</p>
				<p>With experience putting together floral packages for all kinds of wedding ceremonies, our designers are a great help with options and suggestions for every part of your big day. You'll get flowers that express your unique style and decorations that complement your wedding, whether it's a small affair or grand gala.</p>
				<p>Of course, the bride's bouquet will be exquisite!</p>
				<p><em>A $25 deposit is required at the time of consultation to hold your date. This deposit is 100% applied to your wedding flowers.</em></p>
				<h5>Party Decorations</h5>
				<p>Make your next event a success! Flowers enhance every occasion, be it a baby shower, anniversary, engagement party, or corporate event. Flowers always make your guests feel special. Centerpieces, corsages, boutonnieres, balloons, and cake flowers are all a part of our repertoire!</p>
				<h5>Prom Flowers</h5>
				<p>Start your date with impressive style – Trig's Floral and Gifts wristlets, pin-on corsages, and boutonnieres are all custom-made by hand. Order with your prom date for a corsage and boutonniere that match. Our experts select flowers and designs that coordinate well with the color and style of your formal wear, your jewelry, and your own personal flair.</p>
			</div>
			<div id="div10"  class="contentDiv" style="display:none">
				<img class="rightImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/floral_helphome.gif</xsl:attribute>
				</img>
				<h4>Help Getting Your Home Ready For…</h4>
				<p>Trig's Floral and Gifts offers expert home decorating consulting services. We will come to you and suggest, plan, order, and set up your decorations for the holidays, a party, or special event. We can even assist with your permanent accessories and floral arrangements. Call for an appointment with one of our designers.</p>
				<p>We also offer subscription programs that can put fresh flowers on your dinner table as often as you like!</p>
			</div>
			<div id="div11"  class="contentDiv" style="display:none">
				<img class="rightImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/floral_business.jpg</xsl:attribute>
				</img>
				<h4>Business Environments</h4>
				<p>Trig's Floral and Gifts has subscription programs that keep your lobby, reception area, desk, and conference room freshly decorated with flowers, plants, and accessories. All standing orders receive special pricing.</p>
				<p>Be sure to call us when it’s time to decorate the office for the holidays!</p>
			</div>
			<div id="div12"  class="contentDiv" style="display:none;">
				<h4>Corporate Gift Giving</h4>
				<p>Trig's Floral and Gifts is the easy answer to holiday gift giving, employee thank you gifts, sales incentive programs, customer rewards, and annual customer gifts! We can take care of the design, arrangements, and shipping. Gourmet baskets, plants, fresh arrangements, wines, and a wide variety of other gifts are available. Call us for options that fit your message. Trig's can help make your gifts both memorable and meaningful.</p>
				<img class="leftImage">
					<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/floral_corpgift.jpg</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>