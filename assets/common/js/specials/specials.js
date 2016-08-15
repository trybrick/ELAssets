var specialsServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Specials.asmx/';
var specialsServiceCommunicationMethod = 'post';
var specialsServiceContentType = 'application/x-www-form-urlencoded';

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

    var request = new Ajax.Request(specialsServiceURL + 'GetCategoriesByParentID', {
        method: specialsServiceCommunicationMethod,
        postBody: postBody,
        contentType: specialsServiceContentType,
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

    var request = new Ajax.Request(specialsServiceURL + 'GetGenericProductsByCategoryID', {
        method: specialsServiceCommunicationMethod,
        postBody: postBody,
        contentType: specialsServiceContentType,
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

    var request = new Ajax.Request(specialsServiceURL + 'GetMostPopularGenericProducts', {
        method: specialsServiceCommunicationMethod,
        postBody: postBody,
        contentType: specialsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}