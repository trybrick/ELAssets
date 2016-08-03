var myPantryServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/MyPantry.asmx/';
var myPantryServiceCommunicationMethod = 'post';
var myPantryServiceContentType = 'application/x-www-form-urlencoded';

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


function GetRemoveHouseholdProductRequest(url, requestArguments, productID)
{
	var request = 	'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArguments)
			+ '&productID=' + productID;

	return request;
}


function RemoveHouseholdProduct(url, requestArguments, productID, onSuccess, onFail)
{
	
    var postBody = GetRemoveHouseholdProductRequest(url, requestArguments, productID);

    var request = new Ajax.Request(myPantryServiceURL + 'RemoveHouseholdProduct', {
        method: myPantryServiceCommunicationMethod,
        postBody: postBody,
        contentType: myPantryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetProductsByCategoryRequest(url, requestArguments, categoryID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&categoryID=' + categoryID;

    return request;
}

function GetProductsByCategory(url, requestArguments, categoryID, onSuccess, onFail) {

    var postBody = GetGetProductsByCategoryRequest(url, requestArguments, categoryID);

    var request = new Ajax.Request(myPantryServiceURL + 'GetProductsByCategory', {
        method: myPantryServiceCommunicationMethod,
        postBody: postBody,
        contentType: myPantryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}