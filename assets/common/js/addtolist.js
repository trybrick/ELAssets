
function AddToShoppingList(itemID, itemTypeID)
{
    if (document.getElementById('ctl00_hfRequestVars') != null)
    {
        var requestVariables = document.getElementById('ctl00_hfRequestVars').value;
        var requestHost = document.URL;
        
        GSN.ExpressLane.Web.WebService.ShoppingList.AddItemToShoppingList(requestHost, requestVariables, itemTypeID, itemID, 1, '', OnSuccess, OnFailure);
    }
}

function AddAdToShoppingList(queryString)
{
    if (document.getElementById('ctl00_hfRequestVars') != null)
    {
        var requestVariables = document.getElementById('ctl00_hfRequestVars').value;
        var requestHost = document.URL;
        if(typeof (AddAdPodToShoppingList) == 'undefined') {
        	GSN.ExpressLane.Web.WebService.ShoppingList.AddAdPodToShoppingList(requestHost, requestVariables, queryString, OnSuccess, OnFailure);
        }
        else {
        	AddAdPodToShoppingList(requestHost, requestVariables, queryString, OnSuccess, OnFailure)
        }
        
        
    }
}

function AddAllRecipeIngredientsToShoppingList(recipeid) {
    
    var form = $('aspnetForm');
    var checkboxes = form.getInputs('checkbox', 'chkbxRecipeIngredients');

    checkboxes.each(function(e) { e.checked = true; });
    
	if (document.getElementById('ctl00_hfRequestVars') != null)
	{
		var requestVariables = document.getElementById('ctl00_hfRequestVars').value;
		var requestHost = document.URL;

		if (typeof (AddAllRecipeIngredientsToShoppingList) == 'undefined') {
		    GSN.ExpressLane.Web.WebService.ShoppingList.AddAllRecipeIngredientsToShoppingList(requestHost, requestVariables, recipeid, OnSuccess, OnFailure);
		}
		else {
		    AddAllRecipeIngredientsToShoppingList(requestHost, requestVariables, recipeid, OnSuccess, OnFailure);
		}
	}
}

function AddRecipeCheckedItemsToShoppingList()
{
    var form = $('aspnetForm');

    var checkboxes = form.getInputs('checkbox', 'chkbxRecipeIngredients');

	var items = [];

	var id = 0;
	var counter = 0;

	for (var i=0; i < checkboxes.length; i++)
	{
		if(checkboxes[i].checked == true) {
			id = checkboxes[i].value;
			items[counter] = id;
			counter++;
		}
	}

	if (document.getElementById('ctl00_hfRequestVars') != null)
	{
		var requestVariables = document.getElementById('ctl00_hfRequestVars').value;
		var requestHost = document.URL;

		if (typeof (AddRecipeIngredientArrayToShoppingList) == 'undefined') {
		    GSN.ExpressLane.Web.WebService.ShoppingList.AddRecipeIngredientArrayToShoppingList(requestHost, requestVariables, items, OnSuccess, OnFailure);
		}
		else {
		    AddRecipeIngredientArrayToShoppingList(requestHost, requestVariables, items, OnSuccess, OnFailure);
		}
	}
}

function OnSuccess(response) {

    if (typeof(HandleShoppingListResponse) != 'undefined') {

        HandleShoppingListResponse(response);
    }
    else {
    
        if (document.getElementsByName('ctl00$ContentPlaceHolder1$ShoppingListItems1$btnRefreshList') != null) {
            __doPostBack('ctl00$ContentPlaceHolder1$ShoppingListItems1$btnRefreshList', '');
        }
    }
}

function OnFailure()
{
}
