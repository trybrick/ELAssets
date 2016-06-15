if (typeof (GSNServices) != 'object' || GSNContext == null){
	var GSNServices = new Object();
}

GSNServices.FacebookDealService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/FacebookDeals.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/x-www-form-urlencoded',

	GetFacebookStoreItems: function(requestArguments, storeID, onSuccess, onFail){
	
		var postBody = GSNServices.FacebookDealService.GetFacebookStoreItemsRequest(requestArguments, storeID);
		
		var request = new Ajax.Request(GSNServices.FacebookDealService.ServiceURL + 'GetFacebookDealItems', {
            method: GSNServices.FacebookDealService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.FacebookDealService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
	},
	
	GetFacebookStoreItemsRequest: function(requestArguments, storeID) {
        var request = 'requestArguments=' + encodeURIComponent(requestArguments)
                    + '&storeID=' + encodeURIComponent(storeID);

        return request;
    },
	
	HandleGetFacebookStoreItemsOnSuccess: function(response) {
        var responseText = GSNServices.FacebookDealService.UnwrapResponse(response);

        var element = document.getElementById("MainContent");
		element.innerHTML = responseText;
    },
	
    UnwrapResponse: function(response) {
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
}

GSNServices.FacebookDeal = {
	
	AddToShoppingList: function(itemID, itemTypeID){
	
		var store = document.getElementById('myStoreID');
		var form = GSNServices.Utilities.GetForm();
		var action = form.action.split('?');
		var signedRequestQueryString = GSNServices.FacebookDeal.GetSignedRequestString();
				
		if(signedRequestQueryString && action && store){
			form.action = action[0]
						+ '?' + signedRequestQueryString
						+ '&storeID=' + encodeURIComponent(store.value)
						+ '&itemID=' + encodeURIComponent(itemID)
						+ '&itemTypeID=' + encodeURIComponent(itemTypeID)
						+ '&GSN_fbAppRequest=addToList';
		}
		
		 window.open(form.action);
	},
	
	GetSignedRequestString: function(){
		var SignedRequest = document.getElementById('hfSignedRequest');
		if(SignedRequest && SignedRequest.value){
			return SignedRequest.value;
		}
	}
}

GSNServices.Utilities = {
	GetForm: function () {
		var form = undefined;
		if(document.getElementById('aspnetForm')) {
			form = document.getElementById('aspnetForm');
		}
		if(document.getElementById('form1'))
		{
			form = document.getElementById('form1');
		}
		return form;
	}
}


