var articleServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Article.asmx/';
var articleServiceCommunicationMethod = 'post';
var articleServiceContentType = 'application/x-www-form-urlencoded';

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

function GetRateArticleRequest(url, requestArguments, articleID, rating, comment) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&articleID=' + articleID
                + '&rating=' + rating
                + '&comment=' + encodeURIComponent(comment);

    return request;
}

function RateArticle(url, requestArguments, articleID, rating, comment, onSuccess, onFail) {

    var postBody = GetRateArticleRequest(url, requestArguments, articleID, rating, comment);

    var request = new Ajax.Request(articleServiceURL + 'RateArticle', {
        method: articleServiceCommunicationMethod,
        postBody: postBody,
        contentType: articleServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}