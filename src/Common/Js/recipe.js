var recipeServiceUrl = document.location.protocol + '//' + document.location.host + '/WebService/Recipe.asmx/';
var shoppinglistServiceUrl = document.location.protocol + '//' + document.location.host + '/WebService/ShoppingList.asmx/';
var communicationMethod = 'post';
var contentType = 'application/json; charset=utf-8';
var requestHost = document.location.host;

function CallRecipeWebservice(hosturl, webserviceMethod, postBody, success, failure){
    var request = new Ajax.Request(hosturl + webserviceMethod, {
		method: communicationMethod,
		postBody: postBody,
		contentType: contentType,
		onSuccess: success,
		onFailure: failure
	});
}

function GetRecipeRateRequest(recipeid, rating) {
    var request = "{host:'" + requestHost + "',requestArguments:'" + GSNContext.RequestArguments + "',recipeID:'" + recipeid + "',rating:'" + rating + "'}";

    return request;
}

function RateRecipe(recipeid, rating) {
    if (GSNContext.RequestArguments != null) {
        var postBody = GetRecipeRateRequest(recipeid, rating);
		
		CallRecipeWebservice(recipeServiceUrl, 'RateRecipe', postBody, OnRecipeRatingSuccess, null);
        
/*
        var request = new Ajax.Request(recipeServiceUrl + 'RateRecipe', {
            method: communicationMethod,
            postBody: postBody,
            contentType: contentType,
            onSuccess: OnRecipeRatingSuccess,
            onFailure: onFail
        });
*/
    }
}

function OnRecipeRatingSuccess(ratingvalue) {
    var json = ratingvalue.responseText.evalJSON();
    
    if (document.getElementById('globalRatingControl') != null) {
        SetGlobalRecipeRating(json.d[0], json.d[1]);
    }
}

function RedirectToSaveRecipe(recipeid) {
    var url = '/Recipes/RecipeSaveToRecipeBox.aspx?recipeid=' + recipeid;

    document.location.replace(url);
}


