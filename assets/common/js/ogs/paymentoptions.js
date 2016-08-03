var paymentOptionsServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/OGS/PaymentOption.asmx/';
var paymentOptionsServiceCommunicationMethod = 'post';
var paymentOptionsContentType = 'application/x-www-form-urlencoded';

function GetPaymentOptionDisplayRequest(url, requestArgs, paymentoptionid){
	var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs)
			+ '&paymentoptionid=' + paymentoptionid;

    return request;
}

function SavePaymentOptionRequest(url, requestArgs, orderid, paymentoptionid, xml){
	var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs)
			+ '&orderid=' + orderid
			+ '&paymentoptionid=' + paymentoptionid
			+ '&xml=' + xml;

    return request;
}

function GetPreviousCheckOutStepRequest(url, requestArgs){
	var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs);

    return request;
}

function GetCancelCheckOutStepRequest(url, requestArgs){
	var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs);

    return request;
}

function GetPaymentOptionDisplayService(url, requestArgs, paymentoptionid, onSuccess, onFail){

	var postBody = GetPaymentOptionDisplayRequest(url, requestArgs, paymentoptionid);
	
	var request = new Ajax.Request(paymentOptionsServiceURL + 'GetPaymentOptionDisplay', {
        method: paymentOptionsServiceCommunicationMethod,
        postBody: postBody,
        contentType: paymentOptionsContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });	
}

function SavePaymentsOptionDisplayService(url, requestArgs, orderid, paymentoptionid, xml, onSuccess, onFail){
	var postBody = SavePaymentOptionRequest(url, requestArgs, orderid, paymentoptionid, xml);
	
	var request = new Ajax.Request(paymentOptionsServiceURL + 'SavePaymentOption', {
        method: paymentOptionsServiceCommunicationMethod,
        postBody: postBody,
        contentType: paymentOptionsContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });	
}

function GetPreviousCheckOutStepService(url, requestArgs, onSuccess, onFail){
	var postBody = GetPreviousCheckOutStepRequest(url, requestArgs);
	
	var request = new Ajax.Request(paymentOptionsServiceURL + 'GetPreviousCheckOutStep', {
        method: paymentOptionsServiceCommunicationMethod,
        postBody: postBody,
        contentType: paymentOptionsContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });	
}

function GetCancelCheckOutStepService(url, requestArgs, onSuccess, onFail){
	var postBody = GetCancelCheckOutStepRequest(url, requestArgs);
	
	var request = new Ajax.Request(paymentOptionsServiceURL + 'CancelOrder', {
        method: paymentOptionsServiceCommunicationMethod,
        postBody: postBody,
        contentType: paymentOptionsContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });	
}

function PaymentOptionDisplay(paymentoptionid){
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;

	GetPaymentOptionDisplayService(url, requestArgs, paymentoptionid, onSuccessPaymentOptionDisplay, null);
}

function GetPreviousCheckOutStep(){
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;
	
	GetPreviousCheckOutStepService(url, requestArgs, onSuccessPreviousCheckOutStep, null);
}

function GetCancelCheckOut(){
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;
	
	GetCancelCheckOutStepService(url, requestArgs, onSuccessPreviousCheckOutStep, null);
}

function onSuccessPreviousCheckOutStep(response){
	var message = '';
	
	if (response.responseXML.firstChild.textContent) {
		message = response.responseXML.firstChild.textContent;
	}
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        message = response.responseXML.documentElement.firstChild.nodeValue;
    }
    else {
        message = response.responseJSON.d;
    }
	
	if(!message.blank()){
		window.location.replace(message);
	}	
}

function SavePaymentOption(orderid, paymentoptionid, xml){
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;

	SavePaymentsOptionDisplayService(url, requestArgs, orderid, paymentoptionid, xml, onSuccessSavePaymentOption, null);
}

function onSuccessPaymentOptionDisplay(response){
	var message = '';
	
	if (response.responseXML.firstChild.textContent) {
		message = response.responseXML.firstChild.textContent;
	}
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        message = response.responseXML.documentElement.firstChild.nodeValue;
    }
    else {
        message = response.responseJSON.d;
    }
	
	var div = $('PaymentOptionsDisplay');
	div.innerHTML = message;
}

function onSuccessSavePaymentOption(response){
	var message = '';
	
	if (response.responseXML.firstChild.textContent) {
		message = response.responseXML.firstChild.textContent;
	}
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        message = response.responseXML.documentElement.firstChild.nodeValue;
    }
    else {
        message = response.responseJSON.d;
    }
	
	//validate the response is a valid url
	// var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
	
	// var valid = regexp.test(message);
	
	// if(valid)
	// {
		// window.location.replace(message);
	// }
	// else
	// {
		// alert('There was an error saving your Payment Option.  Please try again.');
	// }
	
	if(!message.blank()){
		window.location.replace(message);
	}

	
}