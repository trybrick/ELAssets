if (typeof (GSNServices) != 'object' || GSNContext == null) {

    var GSNServices = new Object();
}

GSNServices.ProfileService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/Profile.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/x-www-form-urlencoded',

    GetSavePreferencesRequest: function(url, requestArguments, preferences) {
        var request = 'url=' + url
                    + '&requestArguments=' + encodeURIComponent(requestArguments)
                    + '&preferences=' + encodeURIComponent(preferences);

        return request;
    },

    SavePreferences: function(url, requestArguments, preferences, onSuccess, onFail) {

        var postBody = GSNServices.ProfileService.GetSavePreferencesRequest(url, requestArguments, preferences);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SavePreferences', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    GetRecoverPasswordRequest: function(url, requestArguments, userName) {

        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&userName=' + encodeURIComponent(userName);

        return request;
    },

    RecoverPassword: function(url, requestArguments, userName, onSuccess, onFail) {

        var postBody = GSNServices.ProfileService.GetRecoverPasswordRequest(url, requestArguments, userName);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'RecoverPassword', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    GetRecoverUsernameRequest: function(url, requestArguments, email) {

        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&email=' + encodeURIComponent(email);

        return request;
    },

    RecoverUsername: function(url, requestArguments, email, onSuccess, onFail) {

        var postBody = GSNServices.ProfileService.GetRecoverUsernameRequest(url, requestArguments, email);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'RecoverUsername', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    SaveReferAFriend: function(url, requestArguments, firstname, lastname, email, onSuccess, onFail) {
        var postBody = GSNServices.ProfileService.GetSaveReferAFriendRequest(url, requestArguments, firstname, lastname, email);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SaveReferAFriend', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    GetSaveReferAFriendRequest: function(url, requestArguments, firstname, lastname, email) {

        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&firstname=' + encodeURIComponent(firstname)
                + '&lastname=' + encodeURIComponent(lastname)
                + '&email=' + encodeURIComponent(email);

        return request;
    },

    GetReferAFriendList: function(url, requestArguments, onSuccess, onFail) {

        var postBody = GSNServices.ProfileService.GetReferAFriendListRequest(url, requestArguments);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'GetReferAFriendList', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    GetReferAFriendListRequest: function(url, requestArguments) {
        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

        return request;
    },

    GetSignInConsumerRequest: function(url, requestArguments, userName, password) {

        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&userName=' + encodeURIComponent(userName)
                + '&password=' + encodeURIComponent(password);

        return request;
    },

    SignInConsumer: function(url, requestArguments, userName, password, onSuccess, onFail) {
        var postBody = GSNServices.ProfileService.GetSignInConsumerRequest(url, requestArguments, userName, password);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SignInConsumer', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    GetSignOutConsumerRequest: function(url, requestArguments) {
        var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

        return request;
    },

    SignOutConsumer: function(url, requestArguments, onSuccess, onFail) {
        var postBody = GSNServices.ProfileService.GetSignOutConsumerRequest(url, requestArguments);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SignOutConsumer', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    AsyncSignIn: function(userName, password) {
        var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;
        if (userName != '' && password != '') {
            GSNServices.ProfileService.SignInConsumer(url, requestArgs, userName, password, GSNServices.ProfileService.HandleSignInResponse, GSNServices.ProfileService.HandleSignInError);
        }
    },

    AsyncSignOut: function() {
		try {
			FB.logout();
		} catch(e) {}
        var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;
        GSNServices.ProfileService.SignOutConsumer(url, requestArgs, GSNServices.ProfileService.HandleSignInResponse, null);
    },

    HandleSignInResponse: function(response) {
        var currentPath = window.location.pathname;
        var responseText = GSNServices.ProfileService.UnwrapResponse(response);
        if (responseText != '') {
            $('StoreHeaderLoginContainer').innerHTML = responseText;
            GSNServices.ProfileService.SetConsumerGuid($('ConsumerGuid'));
        }
		/* Forced page refresh on every page except Home. Yeah this is stupid and defeats the purpose of Async sign in, 
		but the shopping list needs to be updated to know when a consumer logs in/out. If you can 
		make it better, go for it. */		
		if (currentPath != '/') {
			window.location.reload();
		}
    },

    HandleSignInError: function(response) {
        var responseText = GSNServices.ProfileService.UnwrapResponse(response);
        if (responseText != '') {
            $('StoreHeaderLoginContainer').innerHTML = responseText;
        }
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
    },

    SetConsumerGuid: function(guidWrapper) {
        if (guidWrapper == null) {
            return;
        }

        var guid = guidWrapper.innerHTML;

        if (guid == '') {
            return;
        }

        document.cookie = 'GSN.Cookies.Consumer=guid=' + guid + '&isAuthenticated=True;'
    },

    GetSavePreferencesV2Request: function(url, requestArguments, preferences) {
        var request = 'url=' + url
                    + '&requestArguments=' + encodeURIComponent(requestArguments)
                    + '&preferences=' + encodeURIComponent(preferences);

        return request;
    },

    SavePreferencesV2: function(url, requestArguments, preferences, onSuccess, onFail) {
        var postBody = GSNServices.ProfileService.GetSavePreferencesV2Request(url, requestArguments, preferences);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SavePreferencesV2', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    SerializeFormElements: function(parentID) {
        var inputs = $$('#' + parentID + ' input, #' + parentID + ' select, #' + parentID + ' textarea');
        var inputsSerialized = '';

        for (var i = 0; i < inputs.length; i++) {

            var inputState;

            if (inputsSerialized != '') {
                inputState = $(inputs[i]).serialize();

                if (inputState != '') {
                    inputState = '&' + inputState;
                }
            }
            else {
                inputState = $(inputs[i]).serialize();
            }

            inputsSerialized += inputState;
        }

        return inputsSerialized;
    },

    SavePreferencesAsync: function(parentID) {
        var preferences = GSNServices.ProfileService.SerializeFormElements(parentID);
        var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;

        GSNServices.ProfileService.SavePreferencesV2(url, requestArgs, preferences,
            GSNServices.ProfileService.HandleSavePreferencesAsyncResponse,
            GSNServices.ProfileService.HandleSavePreferencesAsyncFail);
    },

    HandleSavePreferencesAsyncResponse: function(response) {
        var responseText = GSNServices.ProfileService.UnwrapResponse(response);

        if (typeof (DisplaySavePreferencesResponse) == 'function') {
            DisplaySavePreferencesResponse(responseText);
        }
    },

    HandleSavePreferencesAsyncFail: function(response) {
        var responseText = GSNServices.ProfileService.UnwrapResponse(response);

        if (typeof (DisplaySavePreferencesError) == 'function') {
            DisplaySavePreferencesError(responseText);
        }
    },
	
	GetValidateUserEmailAddressRequest: function(url, requestArguments, emailAddress) {
		
		var request = 'url=' + url
					+ '&emailaddress=' + encodeURIComponent(emailAddress)
					+ '&requestArguments=' + encodeURIComponent(requestArguments);
					
		return request;                
	},
	
	ValidateUserEmailAddress : function(url, requestArguments, email, onSuccess, onFail){
		var postBody = GSNServices.ProfileService.GetValidateUserEmailAddressRequest(url, requestArguments, email);
		
		// yes, we actually want this one to be synchronous
		// asynchronous causes more issues than it solves on this one
		var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'ValidateEmailAddress', {
			method: GSNServices.ProfileService.CommunicationMethod,
			postBody: postBody,
			contentType:  GSNServices.ProfileService.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail,
			asynchronous:false
		});
	},
	
	GetValidateUsernameRequest: function(url, requestArguments, username) {
		
		var request = 'url=' + url
					+ '&username=' + encodeURIComponent(username)
					+ '&requestArguments=' + encodeURIComponent(requestArguments);
					
		return request;                
	},
	
	ValidateUsername : function(url, requestArguments, username, onSuccess, onFail){
		var postBody = GSNServices.ProfileService.GetValidateUsernameRequest(url, requestArguments, username);
		
		// yes, we actually want this one to be synchronous
		// asynchronous causes more issues than it solves on this one
		var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'ValidateUsername', {
			method: GSNServices.ProfileService.CommunicationMethod,
			postBody: postBody,
			contentType:  GSNServices.ProfileService.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail,
			asynchronous:false
		});
	},
	
	//temporary solution for Gaint/Martin's
	AsyncGiantSignIn : function(username){
	var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;
        if (username != '') {
           
			
			 
			   var postBody = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArgs)
                + '&userName=' + encodeURIComponent(username);

        var request = new Ajax.Request(GSNServices.ProfileService.ServiceURL + 'SignInGiantConsumer', {
            method: GSNServices.ProfileService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.ProfileService.ContentType,
            onSuccess: function(){GSNServices.ProfileService.SetConsumerGuid($('ConsumerGuid'));window.location.reload();},
            onFailure: function(){window.alert('This Email or User Name does not exist');}
        });
        }
	},
	
	AsyncGiantSignOut : function(){
	try {
			FB.logout();
		} catch(e) {}
        var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;
		debugger;
		var handler = function(){GSNServices.ProfileService.SetConsumerGuid($('ConsumerGuid'));window.location.reload();}
        GSNServices.ProfileService.SignOutConsumer(url, requestArgs, handler, null);
	}
};