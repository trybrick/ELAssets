var savedShoppingListServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/SavedShoppingLists.asmx/';
var savedShoppingListServiceCommunicationMethod = 'post';
var savedShoppingListServiceContentType = 'application/x-www-form-urlencoded';

function GetGetSavedShoppingListsRequest(url, requestArguments, shoppingListID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListID=' + shoppingListID;

    return request;
}

function GetSavedShoppingLists(url, requestArguments, shoppingListID, onSuccess, onFail) {

    var postBody = GetGetSavedShoppingListsRequest(url, requestArguments, shoppingListID);

    var request = new Ajax.Request(savedShoppingListServiceURL + 'GetSavedShoppingLists', {
        method: savedShoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: savedShoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetDeleteSavedShoppingListRequest(url, requestArguments, shoppingListID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListID=' + shoppingListID;

    return request;
}

function DeleteSavedShoppingList(url, requestArguments, shoppingListID, onSuccess, onFail) {

    var postBody = GetDeleteSavedShoppingListRequest(url, requestArguments, shoppingListID);

    var request = new Ajax.Request(savedShoppingListServiceURL + 'DeleteSavedShoppingList', {
        method: savedShoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: savedShoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetDeleteShoppingListItemRequest(url, requestArguments, shoppingListItemID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&shoppingListItemID=' + shoppingListItemID;

    return request;
}

function DeleteShoppingListItem(url, requestArguments, shoppingListItemID, onSuccess, onFail) {

    var postBody = GetDeleteShoppingListItemRequest(url, requestArguments, shoppingListItemID);

    var request = new Ajax.Request(savedShoppingListServiceURL + 'DeleteShoppingListItem', {
        method: savedShoppingListServiceCommunicationMethod,
        postBody: postBody,
        contentType: savedShoppingListServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}