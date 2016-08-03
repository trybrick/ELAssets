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

function RunSearch() {

	try{
		$('SearchResults').style.display = 'none';
		$('UpdateProgress1').style.display = 'block';
		$('SearchTipsHelp').style.display = 'none';
	}
	catch(e){}
	
	var requestArgs = GSNContext.RequestArguments;
	var searchText = $('txtSearchInput').value;
	
	SearchProductInLucene(document.URL, requestArgs, searchText, HandlSearchSuccess, HandleSearchFailure);
}

function FilterSearchResults(categoryid){

	try{
		$('Products').style.display = 'none';
		$('UpdateProgress2').style.display = 'block';
		$('SearchTipsHelp').style.display = 'none';
	}
	catch(e){}
	
	var requestArgs = GSNContext.RequestArguments;
	var searchText = $('txtSearchInput').value;
	
	FilterProductSearch(document.URL, requestArgs, searchText, categoryid, HandlSearchSuccess, HandleSearchFailure);
}

function HandlSearchSuccess(response) {

	$('UpdateProgress1').style.display = 'none';
	$('SearchResults').style.display = 'block';

	var htmlContent = UnwrapResponse(response);

	$('SearchResults').innerHTML = htmlContent;
	
	LoadRatings();
}

function HandleSearchFailure() {
	$('UpdateProgress1').style.display = 'none';
	$('SearchResults').style.display = 'block';
	$('SearchTipsHelp').style.display = 'block';
	//Alert('Search Failed');
}

function checkQuerystring(){
	var currentUrl = document.location.href;

	if(currentUrl.include('?')){
		var obj = currentUrl.toQueryParams();

		if(typeof(obj) == 'object'){
			$('txtSearchInput').value = obj.Keyword;
			RunSearch();
		}
	}
}

function LoadRatings(){
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