if (typeof (GSNServices) == 'undefined' || GSNServices == null) {
    var GSNServices = new Object();
}

if (typeof(GSNServices.UnwrapResponse) != 'function') {
	GSNServices.UnwrapResponse = function (response) { 
		var responseValue = null;
		
		if (response.responseText) {
			responseValue = response.responseText;
		}
		else if (response.responseXML.firstChild.textContent) {
			responseValue = response.responseXML.firstChild.textContent;
		}
		else if (response.responseXML.documentElement.firstChild.nodeValue) {
			responseValue = response.responseXML.documentElement.firstChild.nodeValue;
		}
		
		return responseValue;
	};
}

GSNServices.ContentService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/Content.ashx',
    CommunicationMethod: 'get',
    ContentType: 'application/x-www-form-urlencoded',
	GetRequestBody: function(requestArguments, staticPageTypeID, parameters) {
		var request = 'requestArguments=' + encodeURIComponent(requestArguments) 
			+ '&staticPageTypeID=' + staticPageTypeID 
			+ '&' + parameters;
			
		return request;
	},
	GetContent: function(requestArguments, staticPageTypeID, parameters, onSuccess, onFail) {
		var postBody = this.GetRequestBody(requestArguments, staticPageTypeID, parameters);
		
		var request = new Ajax.Request(this.ServiceURL + '?' + postBody, {
            method: this.CommunicationMethod,
            contentType: this.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
	},
	LoadContent: function (destination) {
		if (destination == null) {
			return;
		}
		
		var staticPageTypeID = null;
		var parameters = null;
		var requestArguments = GSNContext.RequestArguments;
		
		if (typeof(destination.attributes['staticPageTypeID']) == 'object') {
			staticPageTypeID = new Number(destination.attributes['staticPageTypeID'].value);
		}
		
		if (staticPageTypeID == null || staticPageTypeID.toString() == 'NaN') {
			return;
		}
		
		if (typeof(destination.attributes['parameters']) == 'object') {
			parameters = destination.attributes['parameters'].value;
		}
		
		GSNServices.ContentService.GetContent(requestArguments, 
			staticPageTypeID, 
			parameters, 
			function (response) { 
				var responseContent = GSNServices.UnwrapResponse(response);
				
				if (responseContent != null && responseContent != '') {
					destination.innerHTML = responseContent;
				}
			}, 
			null
		);
	},
	LoadPageContent: function() {
		$$('.loadasync').each(GSNServices.ContentService.LoadContent);
	}	
};

Event.observe(window, 'load', GSNServices.ContentService.LoadPageContent);