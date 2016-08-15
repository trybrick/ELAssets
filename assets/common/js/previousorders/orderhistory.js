var orderHistoryServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/OrderHistory.asmx/';
var orderHistoryServiceCommunicationMethod = 'post';
var orderHistoryServiceContentType = 'application/x-www-form-urlencoded';

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

function GetGetOrderRequest(url, requestArguments, orderID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&orderID=' + orderID;

    return request;
}

function GetOrder(url, requestArguments, orderID, onSuccess, onFail) {

    var postBody = GetGetOrderRequest(url, requestArguments, orderID);

    var request = new Ajax.Request(orderHistoryServiceURL + 'GetOrder', {
        method: orderHistoryServiceCommunicationMethod,
        postBody: postBody,
        contentType: orderHistoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function DisplayOrder(element, orderID) {

    var requestArgs = GSNContext.RequestArguments;

    GetOrder(document.URL, requestArgs, orderID, HandleGetOrderResponse, null);

    var items = $$('.Orders ul li');

    $$('.Orders ul li').each.className = '';

    if (element != null && typeof(element.className) == 'string') {
        element.className = 'selected';
    }
}

function HandleGetOrderResponse(response) {
    
    var responseValue = UnwrapResponse(response);

    if (responseValue != '') {

        $('OrderItems').innerHTML = responseValue;
    }

    try {
        refreshAdPods();
    }
    catch (e) { }
}   