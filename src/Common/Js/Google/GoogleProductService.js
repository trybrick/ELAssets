if (typeof (GSNServices) == 'undefined' || GSNServices == null) {
    var GSNServices = new Object();
}

GSNServices.GoogleProductSearch = {
	ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/GoogleSearch.asmx/',
	ServiceCommunicationMethod: 'post',
	ContentType: 'application/x-www-form-urlencoded',

	productSearchHistory: undefined,

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

	GetSearchProductInLuceneRequest: function(url, requestArguments, searchString) {

		var request = 'url=' + url
					+ '&requestArguments=' + encodeURIComponent(requestArguments)
					+ '&searchString=' + encodeURIComponent(searchString);
					
		return request;
	},

	GetFilterProductSearchRequest: function(url, requestArguments, searchString, categoryid) {

		var request = 'url=' + url
					+ '&requestArguments=' + encodeURIComponent(requestArguments)
					+ '&searchString=' + encodeURIComponent(searchString)
					+ '&categoryid=' + encodeURIComponent(categoryid);
					
		return request;
	},

	SearchProductInLucene: function(url, requestArguments, searchString, onSuccess, onFail) {

		GSNServices.GoogleProductSearch.AddSearchHistoryItem(searchString);

		var postBody = GSNServices.GoogleProductSearch.GetSearchProductInLuceneRequest(url, requestArguments, searchString);

		var request = new Ajax.Request(GSNServices.GoogleProductSearch.ServiceURL + 'SearchProductInLucene', {
			method: GSNServices.GoogleProductSearch.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: GSNServices.GoogleProductSearch.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});
	},

	FilterProductSearch: function(url, requestArguments, searchString, categoryid, onSuccess, onFail){
		var postBody = GSNServices.GoogleProductSearch.GetFilterProductSearchRequest(url, requestArguments, searchString, categoryid);

		var request = new Ajax.Request(GSNServices.GoogleProductSearch.ServiceURL + 'FilterProductSearch', {
			method: GSNServices.GoogleProductSearch.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: GSNServices.GoogleProductSearch.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});
	},
	
	GetProductDescriptionRequest: function(url, requestArguements, productid){
		var request = 'url=' + url
					+ '&requestArguments=' + encodeURIComponent(requestArguements)
					+ '&productid=' + productid;
		
		return request;
	},
	
	GetProductDescription: function(url, requestArguments, productid, onSuccess, onFail){

		var postBody = GSNServices.GoogleProductSearch.GetProductDescriptionRequest(url, requestArguments, productid);
		
		var request = new Ajax.Request(GSNServices.GoogleProductSearch.ServiceURL + 'GetProductDescription', {
			method: GSNServices.GoogleProductSearch.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: GSNServices.GoogleProductSearch.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});
	},

	AddSearchHistoryItem:function(searchTerm){
		if(GSNServices.GoogleProductSearch.productSearchHistory == undefined){
			GSNServices.GoogleProductSearch.productSearchHistory = new Array(searchTerm);
		}
		else{
		
			if(GSNServices.GoogleProductSearch.productSearchHistory.length == 0){
				GSNServices.GoogleProductSearch.productSearchHistory = new Array(searchTerm);
			}
			if(GSNServices.GoogleProductSearch.productSearchHistory.indexOf(searchTerm) == -1){
				GSNServices.GoogleProductSearch.productSearchHistory.push(searchTerm);
			}
		}
	},

	RunProductDescription: function(productid){
		var requestArgs = GSNContext.RequestArguments;

		GetProductDescription(document.URL, requestArgs, productid, HandleProductDescriptionSuccess, HandleProductDescriptionFail);
	},

	HandleProductDescriptionSuccess: function(response){
		$('productdescription').style.display = 'none';

		var htmlContent = GSNServices.GoogleProductSearch.UnwrapResponse(response);
		$('productdescription').innerHTML = htmlContent;

		myLightWindow.activateWindow({
			href: '#productdescription',
			title: 'Item Information',
			width: 600,
			height: 400,
			type: 'inline'
		});

		$('productdescription').innerHTML = '';
	},

	HandleProductDescriptionFail: function(response){
		$('productdescription').innerHTML = '';
	}


}





