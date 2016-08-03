// requires ConsumerSettings.js
function highlightCoupon(couponID){
	var showcoupon = $(couponID); 
	$('couponsFrame' + showcoupon).addClassName('activeCoupon');
	$('addbutton' + showcoupon).style.display = "none"; 
	$('removebutton' + showcoupon).style.display = "block"; 
}

function unhighlightCoupon(couponID){
	var showcoupon = $(couponID); 
	$('couponsFrame' + showcoupon).removeClassName('activeCoupon');
	$('addbutton' + showcoupon).style.display = "block"; 
	$('removebutton' + showcoupon).style.display = "none"; 
}

function swapGridStyles(gridID) {
	var showGridStyle = $(gridID); 
	for (i = 1; i<4; i++){
		$('gridLayout').removeClassName('GridMode' + i);
		$('swapGrid' + i).removeClassName('active');
	}
	$('gridLayout').addClassName('GridMode' + showGridStyle);
	$('swapGrid' + showGridStyle).addClassName('active');

	if(typeof SetConsumerSetting == 'function') {
		SetConsumerSetting(6, gridID);
	}
}
function highlightCategory(showit) { 
	var showcat = $(showit); 
		
	for (var i = 1; i < states.length; i++){
		$(states[i]).removeClassName('active');
	}  
	$('leftCategory' + showcat).addClassName('active');
}			


//event methods
function SetSelectedCategory(item, dealTypeListID, categoryID) {
	if(item == null || item == undefined){
		return;
	}
	
	var test = $(item);
	if($(item).className == 'activeCategory')
	{
		return;
	}
	
	if(dealTypeListID == undefined){
		dealTypeListID = 0;
	}
	
	DeselectAll();
	$(item).addClassName('activeCategory');

	var url = document.URL;
	var requestArgs = GSNContext.RequestArguments;
	//selectedCategoryID = dealTypeListID;
	
	//clear the current HTML
	$('DealTypeProducts').innerHTML = ''; //I stop hwere.
	$('UpdateProgress1').toggle();
	
	GSNServices.FeaturedProductService.GetFeaturedProductsByCategoryID(url, requestArgs, dealTypeListID, categoryID, HandleCategoryResponse, HandleCategoryResponse);
}

function HandleCategoryResponse(response){
	var responseText = GSNServices.FeaturedProductService.UnwrapResponse(response);

	$('UpdateProgress1').toggle();
	$('DealTypeProducts').innerHTML = responseText;
}

function HideAllCategories() {
	try {
		var categoryDivs = $$('.FeaturedProductCategory');
		
		if(categoryDivs.length > 1) {
			for(var i = 0; i < categoryDivs.length; i++) {
				$(categoryDivs[i]).addClassName('hidden');
			}
		}
	}
	catch(err) {
		//if(window.console != "undefined") {
		//	console.log(err);
		//} 
		return;
	}
}

function DeselectAll() {
/*
Had to re-write this method without '$$' to make it ie9 friendly

	var source = $$('.dealTypeSubCategories');
	var categoryLinks = $$('.CategoryDisplayContainer a');

	for (var i = 0; i < categoryLinks.length; i++) {
		$(categoryLinks[i]).removeClassName('activeCategory');
	}
*/	
	var source = $('dealTypeSubCategories');

	for(var i = 0; i < source.children.length; i++){
		var x = source.children[i];
		
		if(x.tagName == 'LI'){
			for(var j = 0; j < x.children.length; j++){
				var y = x.children[j];
				$(y).removeClassName('activeCategory');
			}
		}			
	}
}

//end

//Webservices for DealTypes
if (typeof (GSNServices) != 'object' || GSNContext == null) {

    var GSNServices = new Object();
}

GSNServices.FeaturedProductService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/DealTypes.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/x-www-form-urlencoded',
	
	GetFeaturedProductsByCategoryIDRequest: function(url, requestArguments, dealTypeListID, categoryID) {
        var request = 'url=' + url
                    + '&requestArguments=' + encodeURIComponent(requestArguments)
                    + '&dealTypeListID=' + encodeURIComponent(dealTypeListID)
					+ '&categoryID=' + encodeURIComponent(categoryID);

        return request;
    },

    GetFeaturedProductsByCategoryID: function(url, requestArguments, dealTypeListID, categoryID, onSuccess, onFail) {

        var postBody = GSNServices.FeaturedProductService.GetFeaturedProductsByCategoryIDRequest(url, requestArguments, dealTypeListID, categoryID);

        var request = new Ajax.Request(GSNServices.FeaturedProductService.ServiceURL + 'GetDealTypeProductsByDealTypeListID', {
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
