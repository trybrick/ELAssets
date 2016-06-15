var userInformationServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/OGS/UserInformation.asmx/';
var userInformationServiceCommunicationMethod = 'post';
var userInformationContentType = 'application/x-www-form-urlencoded';

function GetRequestArgs(){
	return GSNContext.RequestArguments;
}

function GetDeliveryDatesRequest(url, requestArgs, deliverytypeid) {
    var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs)
			+ '&deliverytypeid=' + deliverytypeid;

    return request;
}

function GetDeliveryDatesService(url, requestArgs, deliverytypeid, onSuccess, onFail) {
    var postBody = GetDeliveryDatesRequest(url, requestArgs, deliverytypeid);

    var request = new Ajax.Request(userInformationServiceURL + 'GetDeliveryTimeDates', {
        method: userInformationServiceCommunicationMethod,
        postBody: postBody,
        contentType: userInformationContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetDeliverySlotsRequest(url, requestArgs, deliverytypeid, deliveryDate, deliverytimeid) {
    var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs)
			+ '&deliverytypeid=' + deliverytypeid
			+ '&deliveryDate=' + deliveryDate
			+ '&deliverytimeid=' + deliverytimeid;

    return request;
}

function GetDeliverySlotsService(url, requestArgs, deliverytypeid, deliverydate, deliverytimeid, onSuccess, onFail) {
    var postBody = GetDeliverySlotsRequest(url, requestArgs, deliverytypeid, deliverydate, deliverytimeid);

    var request = new Ajax.Request(userInformationServiceURL + 'GetDeliverySlots', {
        method: userInformationServiceCommunicationMethod,
        postBody: postBody,
        contentType: userInformationContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetSaveUserInformationRequest(url, requestArgs, consumer, options) {
    var request = '{' + 'url:' + url.toJSON()
			+ ',requestArguments:' + '\'' + requestArgs + '\''
			+ ',ogsConsumer:' + consumer
			+ ',options:' + options
			+ '}';

    return request;
}

function GetSaveUserInformationService(url, requestArgs, consumer, options, onSuccess, onFail) {
    var postBody = GetSaveUserInformationRequest(url, requestArgs, consumer, options);

    var request = new Ajax.Request(userInformationServiceURL + 'SaveUserInformation', {
        method: userInformationServiceCommunicationMethod,
        postBody: postBody,
        contentType: 'application/json; charset=utf-8',
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function SaveNextStepRequest(url, requestArgs, orderid) {
    var request = 'url=' + url
			+ '&requestArguments=' + encodeURIComponent(requestArgs)
			+ '&orderid=' + orderid;

    return request;
}

function SaveNextStepService(url, requestArgs, orderid, onSuccess, onFail) {
    var postBody = SaveNextStepRequest(url, requestArgs, orderid);

    var request = new Ajax.Request(userInformationServiceURL + 'UpdateRedirectNext', {
        method: userInformationServiceCommunicationMethod,
        postBody: postBody,
        contentType: userInformationContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function onSuccessNextStep(response) {
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

    if (message.indexOf('error') == -1) {
        window.location.href = window.location.href;
    }
    else {
        alert('There was a problem setting the next page of your order.  Please try again');
    }
}

function onErrorNextStep(response) {
    alert('There was an error redirecting to the next page.');
}

function UpdateNextStep(orderid) {
    var requestArgs = GetRequestArgs();
    var url = document.URL;

    SaveNextStepService(url, requestArgs, orderid, onSuccessNextStep, onErrorNextStep);
}

function SaveUserInformation(consumer, options) {
    var requestArgs = GetRequestArgs();
    var url = document.URL;

    GetSaveUserInformationService(url, requestArgs, consumer, options, onSuccessSaveUserInformation, null);
}

function GetDeliveryDates(deliverytypeid) {
    var requestArgs = GetRequestArgs();
    var url = document.URL;

    GetDeliveryDatesService(url, requestArgs, deliverytypeid, onSuccessGetDeliveryDates, null);
}

function onSuccessSaveUserInformation(response) {
    var destination = $('CheckOutUserInformationError');
    var responseContent = '';

    if (response.responseJSON) {
        responseContent = response.responseJSON.d;
    }
    else if (response.responseXML) {
        responseContent = response.responseXML.firstChild.textContent;
    }
    else {
        responseContent = response.responseXML.documentElement.firstChild.nodeValue;
    }

    destination.innerHTML = responseContent;

    if (responseContent == '' && typeof (userInformation_NextPage) == 'function') {

        userInformation_NextPage();

        userInformation_NextPage = null;
    }
}

function GetDeliverySlots(deliverytypeid, deliverydate, deliverytimeid) {
    var requestArgs = GetRequestArgs();
    var url = document.URL;

    GetDeliverySlotsService(url, requestArgs, deliverytypeid, deliverydate, deliverytimeid, onSuccessGetDeliverySlots, null);
}

function onSuccessGetDeliveryDates(response) {
    if (response.responseXML.firstChild.textContent) {
        $('deliverytimeselection').innerHTML = response.responseXML.firstChild.textContent;

        //for event validation
        loadAction();

        //on the UserInformation Page 
        LoadExistingDeliveryTime();
    }
    else {
        $('deliverytimeselection').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;

        //for event validation
        loadAction();
    }

    if (typeof (ShowHideUpdateProgress) == 'function') {
        ShowHideUpdateProgress();
    }
}

function onSuccessGetDeliverySlots(response) {
    if (response.responseXML.firstChild.textContent) {
        $('deliveryslotselection').innerHTML = response.responseXML.firstChild.textContent;

        //for event validation	
        loadAction()
    }
    else {
        $('deliveryslotselection').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;

        //for event validation
        loadAction()
    }

    if (typeof (ShowHideUpdateProgress) == 'function') {
        ShowHideUpdateProgress();
    }
}