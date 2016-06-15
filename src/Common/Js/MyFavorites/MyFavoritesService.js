var myFavoritesServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/MyFavorites.asmx/';
var myFavoritesServiceCommunicationMethod = 'post';
var myFavoritesServiceContentType = 'application/x-www-form-urlencoded';

function GetGetMyFavoritesRequest(url, requestArgs) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArgs);

    return request;
}

function GetMyFavorites(url, requestArgs, onSuccess, onFail) {

    var postBody = GetGetMyFavoritesRequest(url, requestArgs);

    var request = new Ajax.Request(myFavoritesServiceURL + 'GetMyFavorites', {
        method: myFavoritesServiceCommunicationMethod,
        postBody: postBody,
        contentType: myFavoritesServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetMyFavoritesItemsByCategoryIDRequest(url, requestArgs, categoryID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArgs)
                + '&categoryID=' + categoryID;
    
    return request;
}

function GetMyFavoritesItemsByCategoryID(url, requestArgs, categoryID, onSuccess, onFail) {

    var postBody = GetGetMyFavoritesItemsByCategoryIDRequest(url, requestArgs, categoryID);

    var request = new Ajax.Request(myFavoritesServiceURL + 'GetMyFavoritesItemsByCategoryID', {
        method: myFavoritesServiceCommunicationMethod,
        postBody: postBody,
        contentType: myFavoritesServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}