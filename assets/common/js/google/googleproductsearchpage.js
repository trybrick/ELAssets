if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
	var GSNPageItems = new Object();
}

GSNPageItems.GoogleProductSearch = {
	
	checkQuerystring: function(){
		var currentUrl = document.location.href;

		if(currentUrl.include('?')){
			var obj = currentUrl.toQueryParams();

			if(typeof(obj) == 'object'){
				$('txtSearchInput').value = obj.Keyword;
				GSNPageItems.GoogleProductSearch.RunSearch();
			}
		}
	},
	
	RunSearch: function(){
		try{
			$('SearchResults').style.display = 'none';
			$('UpdateProgress1').style.display = 'block';
			$('SearchTipsHelp').style.display = 'none';
		}
		catch(e){}
		
		var requestArgs = GSNContext.RequestArguments;
		var searchText = $('txtSearchInput').value;
		
		GSNServices.GoogleProductSearch.SearchProductInLucene(document.URL, requestArgs, searchText, GSNPageItems.GoogleProductSearch.HandlSearchSuccess, GSNPageItems.GoogleProductSearch.HandleSearchFailure);
	},

	FilterSearchResults: function(categoryid) {
		try{
			$('Products').style.display = 'none';
			$('UpdateProgress2').style.display = 'block';
			$('SearchTipsHelp').style.display = 'none';
		}
		catch(e){}
		
		var requestArgs = GSNContext.RequestArguments;
		var searchText = $('txtSearchInput').value;
		
		GSNServices.GoogleProductSearch.FilterProductSearch(document.URL, requestArgs, searchText, categoryid, GSNPageItems.GoogleProductSearch.HandlSearchSuccess, GSNPageItems.GoogleProductSearch.HandleSearchFailure);
	},

	HandlSearchSuccess: function(response) {
		$('UpdateProgress1').style.display = 'none';
		$('SearchResults').style.display = 'block';

		var htmlContent = GSNPageItems.GoogleProductSearch.UnwrapResponse(response);

		$('SearchResults').innerHTML = htmlContent;
		
		GSNPageItems.GoogleProductSearch.LoadRatings();
	},
	
	HandleSearchFailure: function() {
		$('UpdateProgress1').style.display = 'none';
		$('SearchResults').style.display = 'block';
		$('SearchTipsHelp').style.display = 'block';
		//Alert('Search Failed');
	},
	
	UnwrapResponse: function(response){
		var responseValue = '';

		if (response.responseXML && response.responseXML.firstChild.textContent) {
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
	
	LoadRatings: function(){
		var inputs = document.getElementsByClassName('productrelevance');
		var hash = new Hash();
		var max = 5;
		
		for(var i=0; i < inputs.length; i++){
			var input = inputs[i];
			
			if(!input.value.include(':')){
				continue;
			}
			
			var data = input.value.split(':');
			hash.set(data[0], data[1]);
		}
		
		var values = hash.values().sort();
		values.reverse();
		
		var valueHigh = values.first();
		
		hash.each(function(pair){
			var productid = pair.key;
			var relevance = pair.value;
			var elementid = 'ProductRating' + productid;
			
			var element = $(elementid);
			
			if(typeof(element) != 'object'){
				return;
			}
			
			var num = new Number(relevance);
			var adjustedNum;
			
			if(num.toString() == 'NaN'){
				return;
			}
			
			var weight = num / valueHigh;
			
			adjustedNum = (max * weight);
			
			var control = new Control.Rating(elementid, {value: adjustedNum, rated: true, max: max});
			
		});
	}
	
	
}










