<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<style type="text/css">
			#LandingPage{						
				background-image:url('http://upload.gsngrocers.com/elvs/assets/common/promotions/barilla/barilla2013_recipe/images/recipe.jpg');
				background-repeat:no-repeat;
				color:#FFF;
				height:590px;
				float:left;				
				padding:8px;
				position:relative;
				width: 590px;	
			}
			
			#LandingPage #Directions{
				color:#FFF;
				font-size:12px;
				margin:25px 0 0;
			}
			
			#LandingPage #Title{
				color:#FFF;
				font-size:15px;
				line-height:1.45em;
				position:absolute;
				top:190px;
			}
			
			#LandingPage .prep{
				color:#FFF;
				margin-top:250px;
				position:absolute;
			}
			
			#LandingPage .instructions{
				color:#FFF;
				margin-top:360px;
				position:absolute;				
			}
			
			#LandingPage .ingredients{
				color:#FFF;
				float: left;
				font-size: 9px;
				line-height:1.5em;
				list-style:none;
				margin-top:270px;
				padding:0;
				width:300px;
			}			
					
			#LandingPage .measurement{
				color:#FFF;
				float: left;
				font-size: 9px;				
				line-height:1.5em;
				list-style:none;
				margin-top:270px;
				padding:0;
				width:65px;
			}
			
			#LandingPage p{
				color:#FFF;
				font-size:8px;
				line-height:1.3em;				
			}
							
		</style>
		<div id="LandingPage" style="width:590px;">
			<h4 id="Title">Barilla&#xAE; Spaghetti with Shrimp<br/>
				and Barilla&#xAE; Tomato &amp; Basil Sauce</h4>
			<h4 class="prep">Ingredients:</h4>
			<ul class="measurement">
				<li>
					1 box			
				</li>
				<li>
					4 Tbsp.
				</li>
				<li>
					2 cloves
				</li>
				<li>
					1/4 tsp.
				</li>
				<li>
					1 jar
				</li>
				<li>
					4 leaves
				</li>
				<li>
					1 lb.
				</li>
				<li>
					To taste
				</li>
			</ul>
			<ul class="ingredients">
				<li>
					Barilla&#xAE; Spaghetti
				</li>
				<li>
					extra virgin olive oil
				</li>
				<li>
					garlic, divided
				</li>
				<li>
					red pepper flakes, divided
				</li>
				<li>
					Barilla&#xAE; Tomato &amp; Basil Sauce
				</li>
				<li>
					fresh basil, chopped
				</li>
				<li>
					medium raw shrimp
				</li>
				<li>
					salt
				</li>
			</ul>
			<div class="instructions">
				<h4 id="Directions">Directions:</h4>
				<p>BRING a pot of water to a boil.</p>
				<p>SAUT&#201; half the red pepper flakes and half the garlic with<br/>
					1 tablespoon of olive oil.  Just before garlic turns light brown,<br/>
					add the Barrilla&#xAE; Tomato &amp; Basil Sauce and bring to a simmer.<br/>
					In a separate skillet, saut&#233; remaining garlic and pepper<br/>
					flakes with 1 tablespoon of olive oil for one minute.</p>
				<p>ADD shrimp, cook on both ides and season with salt.<br/>
					Set aside.</p>
				<p>COOK spaghetti according to directions, drain and toss<br/>
					with the tomato and basil sauce.</p>
				<p>STIR in fresh basil and remaining olive oil and top with<br/>
					shrimp before serving.</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
