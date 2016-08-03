var productServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Product.asmx/';
var productServiceCommunicationMethod = 'post';
var productServiceContentType = 'application/x-www-form-urlencoded';

var productSearchHistory;

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

function GetSearchProductInLuceneRequest(url, requestArguments, searchString) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&searchString=' + encodeURIComponent(searchString);
                
    return request;
}

function GetFilterProductSearchRequest(url, requestArguments, searchString, categoryid) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&searchString=' + encodeURIComponent(searchString)
				+ '&categoryid=' + encodeURIComponent(categoryid);
                
    return request;
}


function SearchProductInLucene(url, requestArguments, searchString, onSuccess, onFail) {

	AddSearchHistoryItem(searchString);

    var postBody = GetSearchProductInLuceneRequest(url, requestArguments, searchString);

    var request = new Ajax.Request(productServiceURL + 'SearchProductInLucene', {
        method: productServiceCommunicationMethod,
        postBody: postBody,
        contentType: productServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function FilterProductSearch(url, requestArguments, searchString, categoryid, onSuccess, onFail){
    var postBody = GetFilterProductSearchRequest(url, requestArguments, searchString, categoryid);

    var request = new Ajax.Request(productServiceURL + 'FilterProductSearch', {
        method: productServiceCommunicationMethod,
        postBody: postBody,
        contentType: productServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function AddSearchHistoryItem(searchTerm){

	if(productSearchHistory == undefined){
		productSearchHistory = new Array(searchTerm);
	}
	else{
	
		if(productSearchHistory.length == 0){
			productSearchHistory = new Array(searchTerm);
		}
		if(productSearchHistory.indexOf(searchTerm) == -1){
			productSearchHistory.push(searchTerm);
		}
	}
}

function RunProductDescription(productid){
	var requestArgs = GSNContext.RequestArguments;

	GetProductDescription(document.URL, requestArgs, productid, HandleProductDescriptionSuccess, HandleProductDescriptionFail);

}

function HandleProductDescriptionSuccess(response){
	$('productdescription').style.display = 'none';

	var htmlContent = UnwrapResponse(response);
	$('productdescription').innerHTML = htmlContent;

	myLightWindow.activateWindow({
		href: '#productdescription',
		title: 'Item Information',
		width: 600,
		height: 400,
		type: 'inline'
	});

	$('productdescription').innerHTML = '';
}

function HandleProductDescriptionFail(response){
	$('productdescription').innerHTML = '';
}

function GetProductDescriptionRequest(url, requestArguements, productid){
	var request = 'url=' + url
				+ '&requestArguments=' + encodeURIComponent(requestArguements)
				+ '&productid=' + productid;
	
	return request;
}

function GetProductDescription(url, requestArguments, productid, onSuccess, onFail){

	var postBody = GetProductDescriptionRequest(url, requestArguments, productid);
	
	var request = new Ajax.Request(productServiceURL + 'GetProductDescription', {
        method: productServiceCommunicationMethod,
        postBody: postBody,
        contentType: productServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

