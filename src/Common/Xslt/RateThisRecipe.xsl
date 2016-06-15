<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>


<xsl:template match="/" name="RateThisRecipe">
	<script type="text/javascript" src="/Assets/Common/Js/livepipe.js"></script>
	<script type="text/javascript" src="/Assets/Common/Js/recipe.js"></script>
	<script type="text/javascript" src="/Assets/Common/Js/rating.js"></script>
	<script type="text/javascript">
			<xsl:comment>
			<![CDATA[
			location.querystring = (function() {   
			// The return is a collection of key/value pairs   
			var result = {};   

			// Gets the query string with a preceeding '?'   
			var querystring = location.search;   

			// document.location.search is empty if a query string is absent   
			if (!querystring)   
			    return result;   

			// substring(1) to remove the '?'   
			var pairs = querystring.substring(1).split("&");   
			var splitPair;   

			// Load the key/values of the return collection   
			for (var i = 0; i < pairs.length; i++) {   
			    splitPair = pairs[i].split("=");   
			    result[splitPair[0]] = splitPair[1];   
			}   

			return result;   
			})(); 	


				function CheckQueryString() {
					var advancedSearch = getQueryVariable('AdvancedSearch');
					var quickSearch = getQueryVariable('QuickSearch');
					var pageindex = getQueryVariable('PageNumber');
					var topRecipes = getQueryVariable('TopRecipes');
					var keyword = getQueryVariable('KeyWord');
					var chainonlyrecipes = getQueryVariable('ChainOnlyRecipes');
					var source = getQueryVariable('Source');

					var referringUrl = "";

					if (source != undefined)
					{
						referringUrl = "RecipeSearchResults.aspx";
					}

					if(referringUrl.indexOf("RecipeSearchResults.aspx") != -1)
					{
						var url = '/Recipes/RecipeSearchResults.aspx?';
						var urlLen = url.length;

						if(advancedSearch != undefined)
						{
							url = url + 'AdvancedSearch=' + advancedSearch;
						}

						if(quickSearch != undefined)
						{
							url = url + 'QuickSearch=' + quickSearch;
						}

						if(topRecipes != undefined)
						{
							url = url + 'TopRecipes=true'
						}

						if(pageindex != undefined)
						{
							url = url + '&PageIndex=' + pageindex;
						}

						if(keyword != undefined)
						{
							url = url + '&KeyWord=' + keyword;
						}

						if(chainonlyrecipes != undefined)
						{
							url = url + '&ChainOnlyRecipes=' + chainonlyrecipes;
						}

						if(url.length > urlLen)
						{
							var link = document.getElementById('recipeback');
							link.href = url;
							ShowHideBackButtons(link);
						}
					}
					else
					{
						var div = document.getElementById('recipecenterback');
						ShowHideBackButtons(div);
					}
				}

				function ShowHideBackButtons(activediv) {

					var recipeback = document.getElementById('recipeback');
					var recipecenterback = document.getElementById('recipecenterback');

					var divarray = [recipeback, recipecenterback];

					for(i=0; i < divarray.length; i++) {
					    if(divarray[i] == activediv) {
						    divarray[i].style.display = 'block';
						    divarray[i].style.visibility = 'visible';
					    }
					    else {
						    divarray[i].style.display = 'none';
						    divarray[i].style.visibility = 'hidden';
					    }
					}
				}

				function getQueryVariable(variable) {
						var query = window.location.search.substring(1);
						var vars = query.split("&");
						for(var i=0;i<vars.length;i++) {
						var pair = vars[i].split("=");
						if (pair[0] == variable) {
		  					return pair[1];
						}
						}	
				} 

		    function SetRecipeRating(ratevalue) {

			    var recipeid = document.getElementById('recipeid');

			    SetUserRecipeRating(ratevalue);
			    RateRecipe(recipeid.value, ratevalue);
		    }

			  function SetUserRecipeRating(ratevalue) {
				  var userRating = document.getElementById('userrating');
				  var userRatingControl = document.getElementById('userRatingControl');

				  var UserRecipeRating = document.getElementById('UserRecipeRating');

				  if (UserRecipeRating != null) {
					  UserRecipeRating.style.display = 'block';
					  UserRecipeRating.style.visibility = 'visible';
				  }

				  if (ratevalue > 0) {
					  if (userRating != null) {
						  userRating.innerHTML = 'You have rated this recipe';
					  }

					  if (userRatingControl != null) {
						  var rating = new Control.Rating('userRatingControl', { value: ratevalue, rated: false });
					  }
				  }
				  else {
					  if (userRating != null) {
						  userRating.innerHTML = 'Please Rate This Recipe';
						  var rating = new Control.Rating('userRatingControl');
					  }
				  }
			  }

			  function SetGlobalRecipeRating(ratevalue, numofratings) {
		      var recipeRating = document.getElementById('reciperating');
		      var globalRecipeRating = document.getElementById('globalRatingCount');
		      var globalRatingControl = document.getElementById('globalRatingControl');

		      if (recipeRating != null) {
		          if (numofratings == '0') {
		              recipeRating.style.display = 'none';
		              recipeRating.style.visibility = 'hidden';
		          }
		          else {
		              recipeRating.style.display = 'block';
		              recipeRating.style.visibility = 'visible';

		              if (globalRecipeRating != null) {
		                  globalRecipeRating.innerHTML = 'by ' + numofratings + ' user(s)';
		              }

		              if (globalRatingControl != null) {
		                  var reciperating = new Control.Rating('globalRatingControl', { value: ratevalue, rated: true });
		              }
		          }
		      }
		  }		

				

				function ShowHideElementsByClassName(name, show) {
					
					var elements = document.getElementsByClassName(name);

					for (i =0; i < elements.length; i++) {

						if (show) {
							elements[i].show();
						}
						else {
							elements[i].hide();
						}
					}
				}

				
			]]>
		</xsl:comment>
	</script>

	<xsl:for-each select="//FeaturedRecipeList/FeaturedRecipe">

		<h2>Rate our Featured Recipe!</h2>
        
        <a>
        	<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
        	<h3>
           		<xsl:value-of select="RecipeTitle" />
       		</h3>
        </a>
        

		<xsl:if test="RecipeImageURL">
				<a>
            <xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
            <img style="border-width: 0px;">
				<xsl:attribute name="src">
					<xsl:value-of select="RecipeImageURL" />
				</xsl:attribute>
				</img>
            </a>
		</xsl:if>
        
		<div id="reciperating">
			<div class="globalRatingText">Rated </div>
			<div id="globalRatingControl" class="rating_container"> </div> 	
			<div id="globalRatingCount" class="globalRatingText"> </div>	
		</div>

		<div id="UserRecipeRating">
			<div id="userrating">Rate Today's Recipe!</div>
			<div id="userRatingControl" class="rating_container"></div>
		</div>
	
    <!-- redundant, methinks...
        <p style="clear:both;">
            <a>
                <xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
                Click here to view and rate this recipe
            </a>
        </p>
     -->

         
	</xsl:for-each>

	<xsl:element name="INPUT">
		<xsl:attribute name="type">hidden</xsl:attribute>
		<xsl:attribute name="title">recipeid</xsl:attribute>
		<xsl:attribute name="id">recipeid</xsl:attribute>
		<xsl:attribute name="value">
        	<xsl:value-of select="ExpressLane/RecipeData/GenericRecipe/RecipeID"/>
        </xsl:attribute>
	</xsl:element>

<script type="text/javascript">

  document.observe('dom:loaded', function(){
    var rating = new Control.Rating('userRatingControl');

    rating.observe('afterChange', function(ratevalue){
      SetRecipeRating(ratevalue);
    });
    
    var parentUserRating = document.getElementById('UserRecipeRating');
    var parentGlobalRating = document.getElementById('reciperating');

    parentUserRating.style.display = 'none';
    parentUserRating.style.visibility = 'hidden';

    if(parentGlobalRating != null){
    parentGlobalRating.style.display = 'none';
    parentGlobalRating.style.visibility = 'hidden';
    }

    <xsl:if test="/ExpressLane/RecipeData/GlobalRecipeRating/AverageRating &gt;= 0">
		SetGlobalRecipeRating(<xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/AverageRating" />, <xsl:value-of select="ExpressLane/RecipeData/GlobalRecipeRating/TotalNumberOfRatings" />);
	</xsl:if>
  });

</script>

</xsl:template>


</xsl:stylesheet>
