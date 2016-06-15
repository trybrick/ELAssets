<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">
	<style>
		@import url("http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/landingPageStyles.css");
	</style>
	<!-- [if lte IE 6]>
	<script type="text/javascript" src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/DD_belatedPNG_0.0.8a-min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		$(document).observe('dom:loaded', function() {
			if(typeof DD_belatedPNG != 'undefined') { // PNG transparency fix for IE 6
				DD_belatedPNG.fix('.cta, img');
			}
			displayRecipeOfTheMonth();
		});

		function displayRecipeOfTheMonth() {
			var date = new Date();
			var month = date.getMonth()+1;
			if(month &lt; 6) { // to ensure recipe always displays regardless of month.
				month = 6;
			}
			var element = document.getElementById('featuredRecipe'+month);
			if(element) {
				element.style.display = "block";
			}
		}
	</script>
	<xsl:comment>Last updated 06/16 13:33</xsl:comment>
	<iframe height="1" frameborder="0" width="1" scrolling="no" src="http://ucook.com/Assets/Common/Images/pixel.gif" id="pixel"></iframe>
	<div id="conAgra-content" class="group">

	<div id="conAgra-header"> 
		<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888654;50621646;p?</xsl:variable>
		<a href="{$Click}http://www.luckysupermarkets.com/tomatotips"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/header.jpg" alt="Imagine the Possibilities | The best meals are made with tomatoes. Click to get the recipes." width="692" height="221" /></a>
    </div>
    
    <div id="conAgra-sideBar"> 
    <a href="javascript:brickRedirect('http://ad.doubleclick.net/clk;241888741;50621646;m?', '87380', 'CA')" target="_top"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/sideAd.jpg" alt="Add flavor to every recipe.  Click to get coupon." width="173" height="524" /></a>
    </div>
    
    <div id="textLeft">
		<h2>Find Recipes Where Delicious Meets Easy</h2>
		<p>There are so many different types of canned tomatoes,<br />
			and so many ways to make them a part of your menu.<br />
			Unlock a huge variety of cooking possibilities by keeping<br />
			diced or stewed tomatoes on hand.</p>
    </div>
	<xsl:for-each select="//ConAgraTomato/ArrayOfFeaturedRecipes/FeaturedRecipe">
		<xsl:variable name="RecipeURL" select="concat('http://ad.doubleclick.net/clk;241888749;50621646;u?','http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=',RecipeID,'&amp;Source=promotion&amp;adcode=conagratomatoes')" />
		<div id="featuredRecipe{Month}" class="featuredRecipe" style="display: none">
			<h2>
				<a href="{$RecipeURL}">
					<xsl:text>Featured Recipe</xsl:text>
				</a>
			</h2>
			<h3>Try the flavor of the month!</h3>
			<a href="{$RecipeURL}">
				<img src="{Image}" alt="Featured Recipe" width="132" class="fr_img" />
			</a>
			<p class="fr_title">
				<a href="{$RecipeURL}"><xsl:value-of select="Title" /></a>
			</p>
		</div>
	</xsl:for-each> 
	<div id="recipeBar">
		<div id="conAgra-meat">
			<p class="ca_header"><a href="javascript:void(0);" onclick="$('meatRecipes').show(); $('sandwichRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide')">Meat &amp; Seafood</a></p>
			<a title="Click to view meat and seafood recipes" href="javascript:void(0);" onclick="$('meatRecipes').show(); $('sandwichRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide')"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/meat.png" height="95" alt="Meat and Seafood" class="m_img" /></a>
			<p class="cta"><a href="javascript:void(0);" onclick="$('meatRecipes').show(); $('sandwichRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide')">Get the recipes </a></p>
        </div>
        
        <div id="divider1">
			<img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/divider.png" width="3" height="132" alt="Divider" />
        </div>
        
        <div id="conAgra-sandwich">
			<p class="ca_header"><a href="javascript:void(0);" onclick="$('sandwichRecipes').show(); $('meatRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide');">Sandwiches,<br />Salads &amp; Pizza</a></p>
			<a title="Click to view sandwich, salads, and pizza recipes" href="javascript:void(0);" onclick="$('sandwichRecipes').show(); $('meatRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide');"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/sandwich.jpg" width="127" height="95" alt="Sandwiches, Salads and Pizza" class="sa_img"/></a>
			<p class="cta"><a href="javascript:void(0);" onclick="$('sandwichRecipes').show(); $('meatRecipes','sauceRecipes','pastaRecipes','soupRecipes').invoke('hide');">Get the recipes </a></p>
        </div>
        
        <div id="divider2">
			<img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/divider.png" width="3" height="132" alt="Divider" />
        </div>
        
        <div id="conAgra-sauce">
			<p class="ca_header"><a href="javascript:void(0);" onclick="$('sauceRecipes').show(); $('meatRecipes','sandwichRecipes','pastaRecipes','soupRecipes').invoke('hide');">Sauce &amp; Marinade</a></p>
			<a title="Click to view sauce and marinade recipes" href="javascript:void(0);" onclick="$('sauceRecipes').show(); $('meatRecipes','sandwichRecipes','pastaRecipes','soupRecipes').invoke('hide');"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/sauce.jpg" width="127" height="95" alt="Sauce and Marinade" class="sm_img"/></a>
			<p class="cta"><a href="javascript:void(0);" onclick="$('sauceRecipes').show(); $('meatRecipes','sandwichRecipes','pastaRecipes','soupRecipes').invoke('hide');">Get the recipes </a></p>
        </div>
        
        <div id="divider3">
			<img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/divider.png" width="3" height="132" alt="Divider" />
        </div>
        
        <div id="conAgra-pasta">
			<p class="ca_header"><a href="javascript:void(0);" onclick="$('pastaRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','soupRecipes').invoke('hide');">Pasta &amp; Rice</a></p>
			<a title="Click to view pasta and rice recipes" href="javascript:void(0);" onclick="$('pastaRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','soupRecipes').invoke('hide');"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/pasta.jpg" width="127" height="95" alt="Pasta and Rice" class="p_img" /></a>
			<p class="cta"><a href="javascript:void(0);" onclick="$('pastaRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','soupRecipes').invoke('hide');">Get the recipes </a></p>
        </div>
        
        <div id="divider4">
			<img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/divider.png" width="3" height="132" alt="Divider" />
        </div>
        
        <div id="conAgra-soup">
			<p class="ca_header"><a href="javascript:void(0);" onclick="$('soupRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','pastaRecipes').invoke('hide');">Soup &amp; Chili</a></p>
			<a title="Click to view soup and chili recipes" href="javascript:void(0);" onclick="$('soupRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','pastaRecipes').invoke('hide');"><img src="http://upload.gsngrocers.com/elvs/Promotions/ConAgra/ConAgraTomatoProject/images/soup.png" width="127" height="95" alt="Soup and Chili" class="so_img" /></a>        
			<p class="cta"><a href="javascript:void(0);" onclick="$('soupRecipes').show(); $('meatRecipes','sandwichRecipes','sauceRecipes','pastaRecipes').invoke('hide');">Get the recipes </a></p>
        </div>
	</div><!-- #recipeBar -->
	
	<div class="recipeContentWrapper group">
		<div id="meatRecipes" class="recipeList" style="display: none;">
			<h3>Meat &amp; Seafood Recipes</h3>
			<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888748;50621646;t?</xsl:variable>
			<p class="hideText"><a href="{$Click}" onclick="$('meatRecipes').hide();">Hide Recipes</a></p>
			<ul>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=10739&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecued Pork Sandwiches</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=10026&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecued Pot Roast</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5321&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecue-Style Ribs</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=35617&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecue-Style Sandwiches</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=13282&amp;Source=promotion&amp;adcode=conagratomatoes">Chicken Fingers Parmesan</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=34328&amp;Source=promotion&amp;adcode=conagratomatoes">Chicken With Orzo</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67835&amp;Source=promotion&amp;adcode=conagratomatoes">Chili Lime Shrimp</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67939&amp;Source=promotion&amp;adcode=conagratomatoes">Italian Chicken Packets</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=13352&amp;Source=promotion&amp;adcode=conagratomatoes">Italian-Style Hamburger Steaks</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=36072&amp;Source=promotion&amp;adcode=conagratomatoes">Mediterranean Shrimp With Feta</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=55462&amp;Source=promotion&amp;adcode=conagratomatoes">My Favorite Meatloaf</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=39571&amp;Source=promotion&amp;adcode=conagratomatoes">Parmesan Burger</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=2117&amp;Source=promotion&amp;adcode=conagratomatoes">Pot Roast</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=8382&amp;Source=promotion&amp;adcode=conagratomatoes">Quick Jambalaya</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=6939&amp;Source=promotion&amp;adcode=conagratomatoes">Shepherd's Pie with Mixed Vegetables</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=3420&amp;Source=promotion&amp;adcode=conagratomatoes">Shrimp Jambalaya</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48571&amp;Source=promotion&amp;adcode=conagratomatoes">Shrimp and Feta Pasta</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=35617&amp;Source=promotion&amp;adcode=conagratomatoes">Tuscan Lamb Chop Skillet</a></li>

			</ul>
		</div><!-- #meatRecipes -->

		<div id="sandwichRecipes" class="recipeList" style="display: none;">
			<h3>Sandwiches, Salads &amp; Pizza Recipes</h3>
			<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888745;50621646;q?</xsl:variable>
			 <p class="hideText"><a href="{$Click}" onclick="$('sandwichRecipes').hide();">Hide Recipes</a></p>
			<ul>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67840&amp;Source=promotion&amp;adcode=conagratomatoes">Beany Mini Pizza</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67839&amp;Source=promotion&amp;adcode=conagratomatoes">Country Side Italian Salad</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67837&amp;Source=promotion&amp;adcode=conagratomatoes">Easy Personal Pizza</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=40683&amp;Source=promotion&amp;adcode=conagratomatoes">Farmhouse Pizza</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67838&amp;Source=promotion&amp;adcode=conagratomatoes">Mediterranean Salad</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=18643&amp;Source=promotion&amp;adcode=conagratomatoes">Quick &amp; Easy Sloppy Joes</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48621&amp;Source=promotion&amp;adcode=conagratomatoes">Really Sloppy- Sloppy Joes</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5356&amp;Source=promotion&amp;adcode=conagratomatoes">Sloppy Joes</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=36405&amp;Source=promotion&amp;adcode=conagratomatoes">Tex-Mex Hot n' Spicy Sloppy Joes</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67836&amp;Source=promotion&amp;adcode=conagratomatoes">White Bean and Tomato Salad</a></li>
			</ul>
		</div><!-- #sandwichRecipes -->

		<div id="sauceRecipes" class="recipeList" style="display: none;">
			<h3>Sauce &amp; Marinade Recipes</h3>
			<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888744;50621646;p?</xsl:variable>
			<p class="hideText"><a href="{$Click}" onclick="$('sauceRecipes').hide();">Hide Recipes</a></p>
			<ul>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=20104&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecue Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=12051&amp;Source=promotion&amp;adcode=conagratomatoes">Barbecue Sauce For Spareribs</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=11976&amp;Source=promotion&amp;adcode=conagratomatoes">Basic Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=4034&amp;Source=promotion&amp;adcode=conagratomatoes">Chunky  Microwave Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=19990&amp;Source=promotion&amp;adcode=conagratomatoes">Chunky Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5349&amp;Source=promotion&amp;adcode=conagratomatoes">Classic Spaghetti Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5381&amp;Source=promotion&amp;adcode=conagratomatoes">Fettuccine with Marinara Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=34826&amp;Source=promotion&amp;adcode=conagratomatoes">Fresh Tomato Sauce with Capers &amp; Olives</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=21112&amp;Source=promotion&amp;adcode=conagratomatoes">Homestyle Barbecue Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=8297&amp;Source=promotion&amp;adcode=conagratomatoes">Italian Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=21111&amp;Source=promotion&amp;adcode=conagratomatoes">Low Fat Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=38038&amp;Source=promotion&amp;adcode=conagratomatoes">Ratatouille Pasta Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=9065&amp;Source=promotion&amp;adcode=conagratomatoes">Smoky Barbecue Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=10430&amp;Source=promotion&amp;adcode=conagratomatoes">Spaghetti Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67843&amp;Source=promotion&amp;adcode=conagratomatoes">Surprisingly Simple Meat Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=1102&amp;Source=promotion&amp;adcode=conagratomatoes">Tomato-Basil Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=3696&amp;Source=promotion&amp;adcode=conagratomatoes">Tomato Sauce</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=19991&amp;Source=promotion&amp;adcode=conagratomatoes">Tomato Sauce With Basil</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=8820&amp;Source=promotion&amp;adcode=conagratomatoes">Tomato Sauce with Vegetables</a></li>
			</ul>
		</div> <!-- sauceRecipes -->

		<div id="pastaRecipes" class="recipeList" style="display: none;">
			<h3>Pasta &amp; Rice Recipes</h3>
			<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888743;50621646;o?</xsl:variable>
			<p class="hideText"><a href="{$Click}" onclick="$('pastaRecipes').hide();">Hide Recipes</a></p>
			<ul>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=45235&amp;Source=promotion&amp;adcode=conagratomatoes">Baked Ziti with Sausage</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=46674&amp;Source=promotion&amp;adcode=conagratomatoes">Beef Bake</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=11409&amp;Source=promotion&amp;adcode=conagratomatoes">Budapest Beef Goulash</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=38725&amp;Source=promotion&amp;adcode=conagratomatoes">Cavatappi Amatriciana </a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=45252&amp;Source=promotion&amp;adcode=conagratomatoes">Cavatappi with Barbecued Chicken</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5363&amp;Source=promotion&amp;adcode=conagratomatoes">Chili-Mac Skillet</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=1546&amp;Source=promotion&amp;adcode=conagratomatoes">Confetti Macaroni Bake</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5780&amp;Source=promotion&amp;adcode=conagratomatoes">Eggplant and Ziti Parmesan</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=13277&amp;Source=promotion&amp;adcode=conagratomatoes">Jamaican Macaroni</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48620&amp;Source=promotion&amp;adcode=conagratomatoes">Mexican Lasagna</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=37884&amp;Source=promotion&amp;adcode=conagratomatoes">Moroccan Macaroni Pie</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=49226&amp;Source=promotion&amp;adcode=conagratomatoes">Spanish Rice with Green Chilies</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48055&amp;Source=promotion&amp;adcode=conagratomatoes">Skillet Chicken, Rice, and Red Bean Cumin Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48752&amp;Source=promotion&amp;adcode=conagratomatoes">Zucchini Lasagna</a></li>
			</ul>
		</div><!-- pastaRecipes -->

		<div id="soupRecipes" class="recipeList" style="display: none;">
			<h3>Soup &amp; Chili Recipes</h3>
			<xsl:variable name="Click">http://ad.doubleclick.net/clk;241888742;50621646;n?</xsl:variable>
			<p class="hideText"><a href="{$Click}" onclick="$('soupRecipes').hide();">Hide Recipes</a></p>
			<ul>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=5609&amp;Source=promotion&amp;adcode=conagratomatoes">Beefy Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=1556&amp;Source=promotion&amp;adcode=conagratomatoes">Can Opener Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=45101&amp;Source=promotion&amp;adcode=conagratomatoes">Chicken Gumbo</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=21763&amp;Source=promotion&amp;adcode=conagratomatoes">Chili with Italian Sausage</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48948&amp;Source=promotion&amp;adcode=conagratomatoes">College Football Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=15098&amp;Source=promotion&amp;adcode=conagratomatoes">Cream of Tomato Soup</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=37918&amp;Source=promotion&amp;adcode=conagratomatoes">Creole Gumbo Pot</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=67844&amp;Source=promotion&amp;adcode=conagratomatoes">Easy Beefy Chili Skillet</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=8410&amp;Source=promotion&amp;adcode=conagratomatoes">Hamburger Minestrone</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=19724&amp;Source=promotion&amp;adcode=conagratomatoes">Manhattan Clam Chowder</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=8407&amp;Source=promotion&amp;adcode=conagratomatoes">Manhattan Style Clam Chowder</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=35533&amp;Source=promotion&amp;adcode=conagratomatoes">Meatball Soup</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=1488&amp;Source=promotion&amp;adcode=conagratomatoes">Pasta E Fagioli</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=35626&amp;Source=promotion&amp;adcode=conagratomatoes">Shiitake Mushroom Tomato Bisque</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=18646&amp;Source=promotion&amp;adcode=conagratomatoes">Sirloin Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=21755&amp;Source=promotion&amp;adcode=conagratomatoes">Texas Chili</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=48526&amp;Source=promotion&amp;adcode=conagratomatoes">Tomato &amp; Bean Soup</a></li>
				<li><a href="http://luckysupermarkets.gsnrecipes.com/Recipes/RecipeFull.aspx?recipeid=13198&amp;Source=promotion&amp;adcode=conagratomatoes">Vegetable Veal Stew</a></li>
			</ul>
		</div><!-- #soupRecipes -->
	</div><!-- .recipeContentWrapper -->
</div>
	</xsl:template>
</xsl:stylesheet>
