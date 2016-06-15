
function DisplaySavedList(shoppingListID) {

    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

    GetSavedShoppingLists(url, requestArgs, shoppingListID, HandleSavedShoppingListsResponse, null);
}

function DeleteSavedListItem(shoppingListItemID) {

    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

    DeleteShoppingListItem(url, requestArgs, shoppingListItemID, HandleSavedShoppingListsResponse, null);
}

function DeleteSavedList(shoppingListID) {

    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

    DeleteSavedShoppingList(url, requestArgs, shoppingListID, HandleSavedShoppingListsResponse, null);
}

function HandleSavedShoppingListsResponse(response) {

    if (response.responseXML.firstChild.textContent) {
        $('SavedShoppingListsDisplay').innerHTML = response.responseXML.firstChild.textContent;
    }
    else {
        $('SavedShoppingListsDisplay').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }

    refreshAdPods();
}