if (typeof (GSNServices) != 'object' || GSNContext == null) {

    var GSNServices = new Object();
}

GSNServices.FeaturedProductService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/FeaturedProduct.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/x-www-form-urlencoded',
	
	GetFeaturedProductsByCategoryIDRequest: function(url, requestArguments, categoryid) {
        var request = 'url=' + url
                    + '&requestArguments=' + encodeURIComponent(requestArguments)
                    + '&categoryID=' + encodeURIComponent(categoryid);

        return request;
    },

    GetFeaturedProductsByCategoryID: function(url, requestArguments, categoryid, onSuccess, onFail) {

        var postBody = GSNServices.FeaturedProductService.GetFeaturedProductsByCategoryIDRequest(url, requestArguments, categoryid);

        var request = new Ajax.Request(GSNServices.FeaturedProductService.ServiceURL + 'GetFeaturedProductsByCategoryID', {
            method: GSNServices.FeaturedProductService.CommunicationMethod,
            postBody: postBody,
            contentType: GSNServices.FeaturedProductService.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
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
};