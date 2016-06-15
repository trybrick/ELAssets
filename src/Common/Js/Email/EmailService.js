var emailServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Email.asmx/';
var emailServiceCommunicationMethod = 'post';
var emailServiceContentType = 'application/x-www-form-urlencoded';

function GetSendEmailRequest(url, requestArguments, emailFrom, emailTo, name, subject, body) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&emailFrom=' + encodeURIComponent(emailFrom)
                + '&emailTo=' + encodeURIComponent(emailTo)
                + '&name=' + encodeURIComponent(name)
                + '&subject=' + encodeURIComponent(subject)
                + '&body=' + encodeURIComponent(body);

    return request;
}

function SendEmail(url, requestArguments, emailFrom, emailTo, name, subject, body, onSuccess, onFail) {

    var postBody = GetSendEmailRequest(url, requestArguments, emailFrom, emailTo, name, subject, body);

    var request = new Ajax.Request(emailServiceURL + 'SendEmail', {
        method: emailServiceCommunicationMethod,
        postBody: postBody,
        contentType: emailServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetSendEmailFromChainRequest(url, requestArguments, emailTo, name, subject, body) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&emailTo=' + encodeURIComponent(emailTo)
                + '&name=' + encodeURIComponent(name)
                + '&subject=' + encodeURIComponent(subject)
                + '&body=' + encodeURIComponent(body);

    return request;
}

function SendEmailFromChain(url, requestArguments, emailTo, name, subject, body, onSuccess, onFail) {

    var postBody = GetSendEmailFromChainRequest(url, requestArguments, emailTo, name, subject, body);

    var request = new Ajax.Request(emailServiceURL + 'SendEmailFromChain', {
        method: emailServiceCommunicationMethod,
        postBody: postBody,
        contentType: emailServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}