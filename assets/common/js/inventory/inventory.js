var inventoryServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Inventory.asmx/';
var inventoryServiceCommunicationMethod = 'post';
var inventoryServiceContentType = 'application/x-www-form-urlencoded';

function UnwrapResponse(response) {

    var responseValue = '';

    if (response.responseXML.firstChild.textContent) {
        responseValue = response.responseXML.firstChild.textContent;
    }
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        responseValue = response.responseXML.documentElement.firstChild.nodeValue;
    }
    else {
        responseValue = response.responseJSON.d;
    }

    return responseValue;
}

function GetGetCategoriesByParentIDRequest(url, requestArguments, categoryID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&categoryID=' + categoryID;

    return request;
}

function GetCategoriesByParentID(url, requestArguments, categoryID, onSuccess, onFail) {

    var postBody = GetGetCategoriesByParentIDRequest(url, requestArguments, categoryID);

    var request = new Ajax.Request(inventoryServiceURL + 'GetCategoriesByParentID', {
        method: inventoryServiceCommunicationMethod,
        postBody: postBody,
        contentType: inventoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetGenericProductsByCategoryIDRequest(url, requestArguments, categoryID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&categoryID=' + categoryID;

    return request;
}

function GetGenericProductsByCategoryID(url, requestArguments, categoryID, onSuccess, onFail) {

    var postBody = GetGetGenericProductsByCategoryIDRequest(url, requestArguments, categoryID);

    var request = new Ajax.Request(inventoryServiceURL + 'GetGenericProductsByCategoryID', {
        method: inventoryServiceCommunicationMethod,
        postBody: postBody,
        contentType: inventoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetMostPopularGenericProductsRequest(url, requestArguments) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

    return request;
}

function GetMostPopularGenericProducts(url, requestArguments, onSuccess, onFail) {

    var postBody = GetGetMostPopularGenericProductsRequest(url, requestArguments);

    var request = new Ajax.Request(inventoryServiceURL + 'GetMostPopularGenericProducts', {
        method: inventoryServiceCommunicationMethod,
        postBody: postBody,
        contentType: inventoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}