var registrationIncentivesServiceURL = document.location.protocol + '//' + document.location.host + '/Webservice/Registration/Incentives.asmx/';
var registrationIncentivesServiceCommunicationMethod = 'post';
var registrationIncentivesServiceContentType = 'application/x-www-form-urlencoded';

function GetRegistrationIncentivesRequest(url, requestArguments, code) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&code=' + encodeURIComponent(code);
				
    return request;
}

function CallRegistrationIncentivesService(methodName, code, onSuccess){

	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;
	var postBody = GetRegistrationIncentivesRequest (url, requestArgs, code);
	
    var request = new Ajax.Request(registrationIncentivesServiceURL + methodName, {
        method: registrationIncentivesServiceCommunicationMethod,
        postBody: postBody,
        contentType: registrationIncentivesServiceContentType,
        onSuccess: onSuccess,
        onFailure: null
    });
	
	var x = 'test';
}