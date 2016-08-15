var recipeBoxServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/RecipeBox.asmx/';
var recipeBoxServiceCommunicationMethod = 'post';
var recipeBoxServiceContentType = 'application/x-www-form-urlencoded';

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

function GetSaveRecipeRequest(url, requestArguments, recipeID, comments) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&recipeID=' + recipeID
                + '&comments=' + encodeURIComponent(comments);

    return request;
}

function SaveRecipe(url, requestArguments, recipeID, comments, onSuccess, onFail) {

    var postBody = GetSaveRecipeRequest(url, requestArguments, recipeID, comments);

    var request = new Ajax.Request(recipeBoxServiceURL + 'SaveRecipe', {
        method: recipeBoxServiceCommunicationMethod,
        postBody: postBody,
        contentType: recipeBoxServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function SaveRecipeToBox(recipeID) {

    var requestArgs = GSNContext.RequestArguments;
    var comments = $('txtComment').value;

    SaveRecipe(document.URL, requestArgs, recipeID, comments, HandleSaveRecipeResponse, null);
}

function HandleSaveRecipeResponse(response) {

    var responseValue = UnwrapResponse(response);

    if (responseValue != '') {
        $('SaveRecipeResponse').innerHTML = responseValue;
    }
    
    try {
        refreshAdPods();
    } catch (e) { }
}