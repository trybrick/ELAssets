if (typeof (GSNContext) == 'undefined' || GSNContext == null) {
    var GSNServices = new Object();
}

GSNServices.RatingsService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/Ratings.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/json; charset=utf-8',

    GetRateArticleRequest: function(url, requestArguments, articleID, rating) {

        var request = "{ url:\'" + url
                    + "',requestArguments:\'" + requestArguments
                    + "',articleID:\'" + articleID
                    + "',rating:\'" + rating + "' }";

        return request;
    },
    GetRateRecipeRequest: function(url, requestArguments, recipeID, rating) {

        var request = "{ url:\'" + url
                    + "',requestArguments:\'" + requestArguments
                    + "',recipeID:\'" + recipeID
                    + "',rating:\'" + rating + "' }";

        return request;
    },
    GetRateVideoRequest: function(url, requestArguments, videoID, rating) {
        var request = "{ url:\'" + url
                    + "',requestArguments:\'" + requestArguments
                    + "',videoID:\'" + videoID
                    + "',rating:\'" + rating + "' }";

        return request;
    },
    GetRateWineRequest: function(url, requestArguments, wineID, rating) {
        var request = "{ url:\'" + url
                    + "',requestArguments:\'" + requestArguments
                    + "',wineID:\'" + wineID
                    + "',rating:\'" + rating + "' }";

        return request;
    },
    HandleRateArticleSuccess: function(response) {

        var ratingData = response.responseJSON.d;

        if (typeof (OnArticleRated) == 'function') {
            OnArticleRated(ratingData.UserRating, ratingData.Average, ratingData.NumberOfRatings);
        }
    },
    HandleRateArticleFail: function(response) {
        if (typeof (OnRateArticleFailed) == 'function') {
            OnRateArticleFailed(response);
        }
    },
    HandleRateRecipeSuccess: function(response) {

        var ratingData = response.responseJSON.d;

        if (typeof (OnRecipeRated) == 'function') {
            OnRecipeRated(ratingData.UserRating, ratingData.Average, ratingData.NumberOfRatings);
        }
    },
    HandleRateRecipeFail: function(response) {
        if (typeof (OnRateRecipeFailed) == 'function') {
            OnRateRecipeFailed(response);
        }
    },
    HandleRateVideoSuccess: function(response) {

        var ratingData = response.responseJSON.d;

        if (typeof (OnVideoRated) == 'function') {
            OnVideoRated(ratingData.UserRating, ratingData.Average, ratingData.NumberOfRatings);
        }
    },
    HandleRateVideoFail: function(response) {
        if (typeof (OnRateVideoFailed) == 'function') {
            OnRateVideoFailed(response);
        }
    },
    HandleRateWineSuccess: function(response) {

        var ratingData = response.responseJSON.d;

        if (typeof (OnWineRated) == 'function') {
            OnWineRated(ratingData.UserRating, ratingData.Average, ratingData.NumberOfRatings);
        }
    },
    HandleRateWineFail: function(response) {
        if (typeof (OnRateWineFailed) == 'function') {
            OnRateWineFailed(response);
        }
    },
    RateArticle: function(articleID, rating) {

        var requestArguments = null;

        if (typeof (GSNContext) == 'object' && GSNContext != null) {
            requestArguments = GSNContext.RequestArguments;
        }

        if (requestArguments == null) {
            this.HandleRateArticleFail(null);
            return;
        }

        var postBody = this.GetRateArticleRequest(document.URL, GSNContext.RequestArguments, articleID, rating);

        var request = new Ajax.Request(this.ServiceURL + 'RateArticle', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: this.HandleRateArticleSuccess,
            onFailure: this.HandleRateArticleFail
        });
    },
    RateRecipe: function(recipeID, rating) {

        var requestArguments = null;

        if (typeof (GSNContext) == 'object' && GSNContext != null) {
            requestArguments = GSNContext.RequestArguments;
        }

        if (requestArguments == null) {
            this.HandleRateRecipeFail(null);
            return;
        }

        var postBody = this.GetRateRecipeRequest(document.URL, requestArguments, recipeID, rating);

        var request = new Ajax.Request(this.ServiceURL + 'RateRecipe', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: this.HandleRateRecipeSuccess,
            onFailure: this.HandleRateRecipeFail
        });
    },
    RateVideo: function(videoID, rating) {

        var requestArguments = null;

        if (typeof (GSNContext) == 'object' && GSNContext != null) {
            requestArguments = GSNContext.RequestArguments;
        }

        if (requestArguments == null) {
            this.HandleRateVideoFail(null);
            return;
        }

        var postBody = this.GetRateVideoRequest(document.URL, requestArguments, videoID, rating);

        var request = new Ajax.Request(this.ServiceURL + 'RateVideo', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: this.HandleRateVideoSuccess,
            onFailure: this.HandleRateVideoFail
        });
    },
    RateWine: function(wineID, rating) {

        var requestArguments = null;

        if (typeof (GSNContext) == 'object' && GSNContext != null) {
            requestArguments = GSNContext.RequestArguments;
        }

        if (requestArguments == null) {
            this.HandleRateWineFail(null);
            return;
        }

        var postBody = this.GetRateWineRequest(document.URL, requestArguments, wineID, rating);

        var request = new Ajax.Request(this.ServiceURL + 'RateWine', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: this.HandleRateWineSuccess,
            onFailure: this.HandleRateWineFail
        });
    }
}