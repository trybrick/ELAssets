var profileServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Profile.asmx/';
var profileServiceCommunicationMethod = 'post';
var profileServiceContentType = 'application/x-www-form-urlencoded';

function GetSavePreferencesRequest(url, requestArguments, preferences) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&preferences=' + encodeURIComponent(preferences);

    return request;
}

function SavePreferences(url, requestArguments, preferences, onSuccess, onFail) {

    var postBody = GetSavePreferencesRequest(url, requestArguments, preferences);

    var request = new Ajax.Request(profileServiceURL + 'SavePreferences', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetRecoverPasswordRequest(url, requestArguments, userName) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&userName=' + encodeURIComponent(userName);

    return request;                
}

function RecoverPassword(url, requestArguments, userName, onSuccess, onFail) {

    var postBody = GetRecoverPasswordRequest(url, requestArguments, userName);

    var request = new Ajax.Request(profileServiceURL + 'RecoverPassword', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetRecoverUsernameRequest(url, requestArguments, email) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&email=' + encodeURIComponent(email);

    return request;
}

function RecoverUsername(url, requestArguments, email, onSuccess, onFail) {

    var postBody = GetRecoverUsernameRequest(url, requestArguments, email);

    var request = new Ajax.Request(profileServiceURL + 'RecoverUsername', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function SaveReferAFriend(url, requestArguments, firstname, lastname, email, isPromotional, onSuccess, onFail) {
    var postBody = GetSaveReferAFriendRequest(url, requestArguments, firstname, lastname, email, isPromotional);
    
    var request = new Ajax.Request(profileServiceURL + 'SaveReferAFriend', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
    
}

function GetSaveReferAFriendRequest(url, requestArguments, firstname, lastname, email, isPromotional) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&firstname=' + encodeURIComponent(firstname)
                + '&lastname=' + encodeURIComponent(lastname)
                + '&email=' + encodeURIComponent(email)
				+ '&isPromotional=' + encodeURIComponent(isPromotional);

    return request;
}

function GetReferAFriendList(url, requestArguments, onSuccess, onFail) {

    var postBody = GetReferAFriendListRequest(url, requestArguments);

    var request = new Ajax.Request(profileServiceURL + 'GetReferAFriendList', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail    
    });
}

function GetReferAFriendListRequest(url, requestArguments) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);

    return request;
}

function GetSignInConsumerRequest(url, requestArguments, userName, password) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&userName=' + encodeURIComponent(userName)
                + '&password=' + encodeURIComponent(password);

    return request;
}

function SignInConumer(url, requestArguments, userName, password, onSuccess, onFail) {

    var postBody = GetSignInConsumerRequest(url, requestArguments, userName, password);

    var request = new Ajax.Request(profileServiceURL + 'SignInConsumer', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetSignOutConsumerRequest(url, requestArguments) {
    
    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments);
                
    return request;                
}

function SignOutConsumer(url, requestArguments, onSucess, onFail) {

    var postBody = GetSignOutConsumerRequest(url, requestArguments);
    
    var request = new Ajax.Request(profileServiceURL + 'SignOutConsumer', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function AsyncSignIn(userName, password) {

    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;
	// pass the following as value parameters rather than referencing elements
    // var userName = $('txtUserName').value;
    // var password = $('txtPassword').value;

    SignInConumer(url, requestArgs, userName, password, HandleSignInResponse, null);
}

function AsyncSignInWithHandlers(userName, password, onSuccessHandler, onFailHandler) {
	var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;
	SignInConumer(url, requestArgs, userName, password, onSuccessHandler, onFailHandler);
}

function AsyncSignOut() {
    
    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

    SignOutConsumer(url, requestArgs, HandleSignInResponse, null);
}

function HandleSignInResponse(response) {

    var responseText = UnwrapResponse(response);

    if (responseText != '') {
        $('LoginBox').innerHTML = responseText;

        SetConsumerGuid($('ConsumerGuid'));
    }
	/* Forced page refresh. Yeah this is stupid and defeats the purpose of Async sign in, 
	but the shopping list needs to be updated to know when a consumer logs in. If you can 
	make it better, go for it. */
	window.location.reload();
}

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

function SetConsumerGuid(guidWrapper) {

    if (guidWrapper == null) {
        return;
    }

    var guid = guidWrapper.innerHTML;

    if (guid == '') {
        return;
    }
    
    document.cookie = 'GSN.Cookies.Consumer=guid=' + guid  + '&isAuthenticated=True;'
}

function GetValidateUserEmailAddressRequest(url, requestArguments, emailAddress) {
    
    var request = 'url=' + url
				+ '&emailaddress=' + encodeURIComponent(emailAddress)
                + '&requestArguments=' + encodeURIComponent(requestArguments);
                
    return request;                
}

function ValidateUserEmailAddress(url, requestArguments, emailAddress, onSuccess, onFail){
	var postBody = GetValidateUserEmailAddressRequest(url, requestArguments, emailAddress);
	
	// yes, I actually want this one to be synchronous
	// asynchronous causes more issues than it solves on this one
	var request = new Ajax.Request(profileServiceURL + 'ValidateEmailAddress', {
        method: profileServiceCommunicationMethod,
        postBody: postBody,
        contentType: profileServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail,
		asynchronous:false
    });
}