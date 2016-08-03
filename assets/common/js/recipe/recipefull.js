function RunSearch() {
	var queryString = BuildQueryString();
    var location = '/Recipes/Search.aspx';
    location = location + '?' + queryString;

    document.location = location;
}

function AddRecipeCheckedItemsToShoppingList() {
	var form = $('aspnetForm');
	
	var checkboxes = form.getInputs('checkbox', 'chkbxRecipeIngredients');
	var productPlacementCheckboxes = form.getInputs('checkbox', 'chkbxRecipeProductPlacements');
	
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

	CheckAllIngredients(true);

	if (document.getElementById('ctl00_hfRequestVars') != null) {
		AddRecipeCheckedItemsToShoppingList();
	}
}

function RemoveAllIngredients() {
	var form = $('aspnetForm');
	var checkboxes = form.getInputs('checkbox', 'chkbxRecipeIngredients');
	
	checkboxes.each(function(e) { if(e.checked)RemoveFromShoppingListByID(e.value,5) });
	
	CheckAllIngredients(false);	
}

function CheckAllIngredients(checkOn) {
	var form = $('aspnetForm');
	var checkboxes = form.getInputs('checkbox', 'chkbxRecipeIngredients');
	checkboxes.each(function(e) { e.checked = checkOn; });
	
	var productPlacementCheckboxes = form.getInputs('checkbox', 'chkbxRecipeProductPlacements');
	productPlacementCheckboxes.each(function(e) { e.checked = checkOn; });
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

