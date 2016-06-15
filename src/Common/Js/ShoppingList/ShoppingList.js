var shoppingListServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/ShoppingList.asmx/';
var shoppingListServiceCommunicationMethod = 'post';
var shoppingListServiceContentType = 'application/x-www-form-urlencoded';

function GetAddItemToShoppingListRequest(url, requestArguments, itemTypeID, itemID, quantity, name) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemTypeID=' + itemTypeID
                + '&itemID=' + itemID
                + '&quantity=' + quantity
                + '&name=' + name;

    return request;
}

function AddItemToShoppingList(url, requestArguments, itemTypeID, itemID, quantity, name, onSuccess, onFail) {

    var postBody = GetAddItemToShoppingListRequest(url, requestArguments, itemTypeID, itemID, quantity, name);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddItemToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddWeightedItemToShoppingListRequest(url, requestArguments, itemTypeID, itemID, weight, name, quantity) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemTypeID=' + itemTypeID
                + '&itemID=' + itemID
                + '&weight=' + weight
                + '&name=' + encodeURIComponent(name)
				+ '&quantity=' + quantity;

    return request;
}

function AddWeightedItemToShoppingList(url, requestArguments, itemTypeID, itemID, weight, name, quantity, onSuccess, onFail) {

    var postBody = GetAddWeightedItemToShoppingListRequest(url, requestArguments, itemTypeID, itemID, weight, name, quantity);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddWeightedItemToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddShoppingListItemToShoppingListRequest(url, requestArguments, shoppingListItemID, quantity, weight) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListItemID=' + shoppingListItemID
                + '&quantity=' + quantity
                + '&weight=' + weight;

    return request;
}

function AddShoppingListItemToShoppingList(url, requestArguments, shoppingListItemID, quantity, weight, onSuccess, onFail) {

    var postBody = GetAddShoppingListItemToShoppingListRequest(url, requestArguments, shoppingListItemID, quantity, weight);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddShoppingListItemToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddAvailableVarietiesToShoppingListRequest(url, requestArguments, circularItemID, items) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&circularItemID=' + circularItemID
                + '&items=' + encodeURIComponent(items);
    
    return request;
}

function AddAvailableVarietiesToShoppingList(url, requestArguments, circularItemID, items, onSuccess, onFail) {

    var postBody = GetAddAvailableVarietiesToShoppingListRequest(url, requestArguments, circularItemID, items);
    
    var request = new Ajax.Request(shoppingListServiceURL + 'AddAvailableVarietiesToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetRemoveItemFromShoppingListRequest(url, requestArguments, itemTypeID, shoppingListItemID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemTypeID=' + itemTypeID
                + '&shoppingListItemID=' + shoppingListItemID;

    return request;
}

function RemoveItemFromShoppingList(url, requestArguements, itemTypeID, shoppingListItemID, onSuccess, onFail) {

    var postBody = GetRemoveItemFromShoppingListRequest(url, requestArguements, itemTypeID, shoppingListItemID);

    var request = new Ajax.Request(shoppingListServiceURL + 'RemoveItemFromShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetRemoveItemFromShoppingListByIDRequest(url, requestArguments, itemID, itemTypeID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemID=' + itemID
                + '&itemTypeID=' + itemTypeID;

    return request;
}

function RemoveItemFromShoppingListByID(url, requestArguments, itemID, itemTypeID, onSuccess, onFail) {

    var postBody = GetRemoveItemFromShoppingListByIDRequest(url, requestArguments, itemID, itemTypeID);

    var request = new Ajax.Request(shoppingListServiceURL + 'RemoveItemFromShoppingListByID', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddAdPodToShoppingListRequest(url, requestArguements, querystring) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguements)
                + '&querystring=' + encodeURIComponent(querystring);

    return request;
}

function AddAdPodToShoppingList(url, requestArguements, querystring, onSuccess, onFail) {

    var postBody = GetAddAdPodToShoppingListRequest(url, requestArguements, querystring);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddAdPodToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddAllRecipeIngredientsToShoppingListRequest(url, requestArguments, recipeID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&recipeID=' + recipeID;

    return request;
}

function AddAllRecipeIngredientsToShoppingList(url, requestArguments, recipeID, onSuccess, onFail) {

    var postBody = GetAddAllRecipeIngredientsToShoppingListRequest(url, requestArguments, recipeID);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddAllRecipeIngredientsToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddRecipeIngredientArrayToShoppingListRequest(url, requestArguments, items) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemsInput=' + encodeURIComponent(items);

    return request;
}
/// <summary>
/// Add Recipe Ingredient Array To Shopping List
/// </summary>
////
function AddRecipeIngredientArrayToShoppingList(url, requestArguments, items, onSuccess, onFail) 
{
    // Get the post body
    var postBody = GetAddRecipeIngredientArrayToShoppingListRequest(url, requestArguments, items);

    // Get the request.
    var request = new Ajax.Request(shoppingListServiceURL + 'AddRecipeIngredientArrayToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
   });
}

function GetAddRecipeProductPlacementArrayToShoppingListRequest(url, requestArguments, items) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemsInput=' + encodeURIComponent(items);

    return request;
}

function GetAddRecipeProductPlacementArrayToShoppingList(url, requestArguments, items, onSuccess, onFail) {

    var postBody = GetAddRecipeProductPlacementArrayToShoppingListRequest(url, requestArguments, items);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddRecipeProductPlacementArrayToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetLoadLastShoppingListRequest(url, requestArguments) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

    return request;
}

function LoadLastShoppingList(url, requestArguments, onSuccess, onFail) {

    var postBody = GetLoadLastShoppingListRequest(url, requestArguments);

    var request = new Ajax.Request(shoppingListServiceURL + 'LoadLastShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetSaveShoppingListRequest(url, requestArguments, saveAs) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&saveAs=' + encodeURIComponent(saveAs);

    return request;
}

function SaveShoppingList(url, requestArguments, saveAs, onSuccess, onFail) {

    var postBody = GetSaveShoppingListRequest(url, requestArguments, saveAs);

    var request = new Ajax.Request(shoppingListServiceURL + 'SaveShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddMultipleItemsToShoppingListRequest(url, requestArguments, items) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&items=' + encodeURIComponent(items);

    return request;
}

function AddMultipleItemsToShoppingList(url, requestArguments, items, onSuccess, onFail) {

    var postBody = GetAddMultipleItemsToShoppingListRequest(url, requestArguments, items);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddMultipleItemsToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetUpdateShoppingListItemCommentRequest(url, requestArguments, itemID, itemTypeID, comment) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemID=' + itemID
                + '&itemTypeID=' + itemTypeID
                + '&comment=' + encodeURIComponent(comment);

    return request;
}

function UpdateShoppingListItemComment(url, requestArguments, itemID, itemTypeID, comment, onSuccess, onFail) {

    var postBody = GetUpdateShoppingListItemCommentRequest(url, requestArguments, itemID, itemTypeID, comment);

    var request = new Ajax.Request(shoppingListServiceURL + 'UpdateShoppingListItemComment', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetUpdateShoppingListItemQuantityRequest(url, requestArguments, itemID, itemTypeID, quantity) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemID=' + itemID
                + '&itemTypeID=' + itemTypeID
                + '&quantity=' + quantity;

    return request;
}

function UpdateShoppingListItemQuantity(url, requestArguments, itemID, itemTypeID, quantity, onSuccess, onFail) {

    var postBody = GetUpdateShoppingListItemQuantityRequest(url, requestArguments, itemID, itemTypeID, quantity);
    
    var request = new Ajax.Request(shoppingListServiceURL + 'UpdateShoppingListItemQuantity', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetUpdateShoppingListItemWeightRequest(url, requestArguments, itemID, itemTypeID, quantity, weight) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&itemID=' + itemID
                + '&itemTypeID=' + itemTypeID
                + '&quantity=' + quantity
                + '&weight=' + weight;

    return request;
}

function UpdateShoppingListItemWeight(url, requestArguments, itemID, itemTypeID, quantity, weight, onSuccess, onFail) {

    var postBody = GetUpdateShoppingListItemWeightRequest(url, requestArguments, itemID, itemTypeID, quantity, weight);

    var request = new Ajax.Request(shoppingListServiceURL + 'UpdateShoppingListItemWeight', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetAddOwnItemToShoppingListRequest(url, requestArguments, name, size, description, categoryID, quantity, weight) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&name=' + encodeURIComponent(name)
                + '&size=' + encodeURIComponent(size)
                + '&description=' + encodeURIComponent(description)
                + '&categoryID=' + categoryID
                + '&quantity=' + quantity
				+ '&weight=' + weight;

    return request;
}

function AddOwnItemToShoppingList(url, requestArguments, name, size, description, categoryID, quantity, weight, onSuccess, onFail) {

    var postBody = GetAddOwnItemToShoppingListRequest(url, requestArguments, name, size, description, categoryID, quantity, weight);

    var request = new Ajax.Request(shoppingListServiceURL + 'AddOwnItemToShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetLoadItemsFromOtherListRequest(url, requestArguments, shoppingListID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListID=' + shoppingListID;

    return request;
}

function LoadItemsFromOtherList(url, requestArguments, shoppingListID, onSuccess, onFail) {

    var postBody = GetLoadItemsFromOtherListRequest(url, requestArguments, shoppingListID);

    var request = new Ajax.Request(shoppingListServiceURL + 'LoadItemsFromOtherList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function ManageListAddOwnItem(url, requestArguments, name, size, description, categoryID, quantity, weight, onSuccess, onFail) {

    var postBody = GetAddOwnItemToShoppingListRequest(url, requestArguments, name, size, description, categoryID, quantity, weight);

    var request = new Ajax.Request(shoppingListServiceURL + 'ManageListAddOwnItem', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetManageListUpdateItemRequest(url, requestArguments, shoppingListItemID, quantity, weight) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListItemID=' + shoppingListItemID
                + '&quantity=' + quantity
                + '&weight=' + weight;

    return request;
}

function ManageListUpdateItem(url, requestArguments, shoppingListItemID, quantity, weight, onSuccess, onFail) {

    var postBody = GetManageListUpdateItemRequest(url, requestArguments, shoppingListItemID, quantity, weight);

    var request = new Ajax.Request(shoppingListServiceURL + 'ManageListUpdateItem', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetManageListRemoveItemRequest(url, requestArguments, shoppingListItemID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListItemID=' + shoppingListItemID;

    return request;
}

function ManageListRemoveItem(url, requestArguments, shoppingListItemID, onSuccess, onFail) {

    var postBody = GetManageListRemoveItemRequest(url, requestArguments, shoppingListItemID);

    var request = new Ajax.Request(shoppingListServiceURL + 'ManageListRemoveItem', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetManageListRemoveAllItemsRequest(url, requestArguments) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

    return request;
}

function ManageListRemoveAllItems(url, requestArguments, onSuccess, onFail) {

    var postBody = GetManageListRemoveAllItemsRequest(url, requestArguments);

    var request = new Ajax.Request(shoppingListServiceURL + 'ManageListRemoveAllItems', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetManageListSaveShoppingListRequest(url, requestArguments, saveAs) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&saveAs=' + encodeURIComponent(saveAs);

    return request;
}

function ManageListSaveShoppingList(url, requestArguments, saveAs, onSuccess, onFail) {

    var postBody = GetManageListSaveShoppingListRequest(url, requestArguments, saveAs);

    var request = new Ajax.Request(shoppingListServiceURL + 'ManageListSaveShoppingList', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetLoadItemsFromOrderRequest(url, requestArguments, orderID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&orderID=' + orderID;

    return request;
}

function LoadItemsFromOrder(url, requestArguments, orderID, onSuccess, onFail) {

    var postBody = GetLoadItemsFromOrderRequest(url, requestArguments, orderID);

    var request = new Ajax.Request(shoppingListServiceURL + 'LoadItemsFromOrder', {
        method: shoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: shoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}