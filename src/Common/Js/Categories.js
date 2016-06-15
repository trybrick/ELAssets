var categoryServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Categories.asmx/';
var communicationMethod = 'post';
var categoryServiceContentType = 'application/json; charset=utf-8';

function GetCategoryRequest(categoryID) {

    var requestVariables = GSNContext.RequestArguments;
    var requestHost = document.location.host;
    var request = "{host:\'" + requestHost + "\',requestArguments:\'" + requestVariables + "',categoryID:" + categoryID + "}";

    return request;
}

function GetCategorySelect(categoryID, onSuccess, onFail) {

    var postBody = GetCategoryRequest(categoryID);

    var request = new Ajax.Request(categoryServiceURL + 'GetCategorySelectByParentID', {
        method: communicationMethod,
        postBody: postBody,
        contentType: categoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetCategoryDisplay(categoryID, onSuccess, onFail) {

    var postBody = GetCategoryRequest(categoryID);

    var request = new Ajax.Request(categoryServiceURL + 'GetCategoryDisplayByParentID', {
        method: communicationMethod,
        postBody: postBody,
        contentType: categoryServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}