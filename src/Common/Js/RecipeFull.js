
document.observe('dom:loaded', init);

function init() {
    var ratingControl = new Control.Rating('userRatingControl');

    ratingControl.observe('afterChange', function(ratevalue){
      SetRecipeRating(ratevalue);
    });
    
    CheckQueryString();
}



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
	var adCode = getQueryVariable('adcode');

	var referringUrl = "/Shop/WeeklyAd.aspx";
	var linkText = "Back to Weekly Ad";

	if (source != undefined)
	{
		switch(source) {
			case 'search':
				referringUrl = "/Recipes/RecipeSearchResults.aspx";
				linkText = "Back to Search Results";
				break;
			case 'promotion':
				referringUrl = "/Ads/Promotion.aspx";
				linkText = "Back";
				break;
		}

	}

	referringUrl += '?';

	var queryString = new Object;
	queryString = { 
		'AdvancedSearch' : advancedSearch,
		'QuickSearch' : quickSearch,
		'TopRecipes' : topRecipes,
		'PageIndex' : pageindex,
		'KeyWord' : keyword,
		'ChainOnlyRecipes' : chainonlyrecipes,
		'adcode' : adCode
	};

	var count = 1;	
	for(var param in queryString) {
		if(queryString[param] != undefined) {
			referringUrl += param + '=' + queryString[param];
			if(count < queryString.length) {
				referringUrl += '&';
			}
		}
		count++;
	}

	displayBackLink(referringUrl, linkText);
	
}
function displayBackLink(url, linkText) {
	var linkContainer = document.getElementById('recipeback');
	var linkContent = '<a href="http://' + location.host + url + '">' + linkText + '</a>';
	linkContainer.innerHTML = linkContent;
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
		  userRating.innerHTML = 'You have rated this recipe.';
	  }

	  if (userRatingControl != null) {
		  var rating = new Control.Rating('userRatingControl', { value: ratevalue, rated: false });
	  }
  }
  else {
	  if (userRating != null) {
		  userRating.innerHTML = 'Please rate this recipe.';
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

function AddRecipeCheckedItemsToShoppingList() {
	//var form = $('aspnetForm'); //GSN page has different form ID.
	//var elements = $('recipecontent');
	
	var checkboxes = GetRecipeIngredientsByName('chkbxRecipeIngredients');
	//these prototype methods dont work in IE9
	//elements.getElementsBySelector('[name="chkbxRecipeIngredients"]');
	//form.getInputs('checkbox', 'chkbxRecipeIngredients');
	var productPlacementCheckboxes = GetRecipeIngredientsByName('chkbxRecipeProductPlacements');
	//elements.getElementsBySelector('[name="chkbxRecipeProductPlacements"]');
	//form.getInputs('checkbox', 'chkbxRecipeProductPlacements');
	
	var ingredients = [];
	var placementIngredients = [];

	checkboxes.each(function(e) { if (e.checked) ingredients.push(e.value); });
	productPlacementCheckboxes.each(function(e) { if (e.checked) placementIngredients.push(e.value); });

	if (GSNContext.RequestArguments != null) {
		var url = document.location.protocol + '//' + document.location.host;
		AddRecipeIngredientArrayToShoppingList(url, GSNContext.RequestArguments, ingredients, HandleShoppingListResponse, null);
		
		if(placementIngredients.length > 0){
			GetAddRecipeProductPlacementArrayToShoppingList(url, GSNContext.RequestArguments, placementIngredients, HandleShoppingListResponse, null);
		}
	}
}

function AddAllRecipeIngredients() {
	//var form = $('aspnetForm'); //GSN page has different form ID.
	//var elements = $('recipecontent');
	
	var checkboxes = GetRecipeIngredientsByName('chkbxRecipeIngredients');
	//elements.getElementsBySelector('[name="chkbxRecipeIngredients"]'); 
	//form.getInputs('checkbox', 'chkbxRecipeIngredients');
	var productPlacementCheckboxes = GetRecipeIngredientsByName('chkbxRecipeProductPlacements');
	//elements.getElementsBySelector('[name="chkbxRecipeProductPlacements"]');
	//form.getInputs('checkbox', 'chkbxRecipeProductPlacements');
	
	checkboxes.each(function(e) { e.checked = true; });
	productPlacementCheckboxes.each(function(e) { e.checked = true; });

	if (GSNContext.RequestArguments != null) {
		AddRecipeCheckedItemsToShoppingList();
	}
}

function GetRecipeIngredientsByName(name){
	var element = $('recipecontent');
	if(!element){
		return [];
	}
	var nodes = element.getElementsByTagName('input');
	var matchedElement = [];
	var i=0
	for(i=0; i < nodes.length; i++){
		if(nodes[i].name == name){
			matchedElement[i] = nodes[i];
		}
	}
	return matchedElement;
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

function ToggleMetric() {

	var showMetric = $('chkMetric').checked;

	if (showMetric) {
		
		ShowHideElementsByClassName('MetricDescription', true);
		ShowHideElementsByClassName('ImperialDescription', false);
	}
	else {
		
		ShowHideElementsByClassName('MetricDescription', false);
		ShowHideElementsByClassName('ImperialDescription', true);
	}
	
	refreshAdPods();
}
