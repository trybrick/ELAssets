/* Contains references to functions defined in the Circulars.js file 
----------------------------------------------------------------*/

var WeekyAdPageTransitionType = '';
var WeeklyAdPageTransitionOptions = '';
var CircularPageID = '';

function DisplayAdPage(){
    var requestArgs = GSNContext.RequestArguments;
	
	UpdatePagers(CircularPageID);
	GetCircularPage(document.URL, requestArgs, CircularPageID, HandleDisplayCircularAdPageResponse, null);
}

function DisplayCircularAdPage(circularPageID, transitiontype, transitionoptions) 
{
	WeekyAdPageTransitionType = transitiontype;
	WeeklyAdPageTransitionOptions = transitionoptions;
	CircularPageID = circularPageID;
	
	var div = 'AdContent';
	var div1 = $(div);

	if (typeof(div1) != 'undefined' && typeof(WeekyAdPageTransitionType) != 'undefined') {
	
		if(typeof(WeeklyAdPageTransitionOptions) != 'object'){
			WeeklyAdPageTransitionOptions = { afterFinish:function(){ DisplayAdPage(); } };
		}
		else{	
			WeeklyAdPageTransitionOptions.afterFinish = function(){ DisplayAdPage(); };
		}
		
		switch(WeekyAdPageTransitionType){
			case 'appear':
				Effect.Fade('AdContent', WeeklyAdPageTransitionOptions);
				break;
			case 'blind':
				Effect.BlindUp('AdContent', WeeklyAdPageTransitionOptions);
				break;
			case 'leftright':
				Effect.BlindLeft('AdContent', WeeklyAdPageTransitionOptions);
				break;
			default:
				DisplayAdPage();
				break;				
		}
	}
	else{
		DisplayAdPage();
	}
	
	
}

function getCategoryID() {

    // Initailize this
    $('ddlBrand').value = '-1';

    // Get the category id.
    var categoryID = $('ddlDepartment').value;

    return categoryID;
}

function getBrandName() {

    // Initailize this
    $('ddlDepartment').value = '-1';

    // Get the brand name
    var brandName = $('ddlBrand').value;

    return brandName;
}

function getKeyWord() {

    // get the key word.
    var keyWord = $('txtSearch').value;

    return keyWord;
}

function DisplayCircularItemsByCategoryID() 
{
    $('ddlBrand').value='-1';
	
	// Get the category
	var categoryID = $('ddlDepartment').value;
	
	// Get the request.
	var requestArgs = GSNContext.RequestArguments;

    // if the category is not -1, then we proceed.
	if (categoryID != '-1') 
	{
	    // Add the category.
		GetCircularItemsByCategory(document.URL, requestArgs, categoryID, HandleDisplayCircularItemsResponse, null);
	}
}

function DisplayCircularItemsByBrand() 
{
    // Set the department value.
    $('ddlDepartment').value='-1';
    
    // Get the brand name
	var brandName = $('ddlBrand').value;
	
	// Get the request args
	var requestArgs = GSNContext.RequestArguments;

    // If the brand name is not -1, then proceed.
	if (brandName != '-1') 
	{
	    // Display the circular.
		GetCircularItemsByBrand(document.URL, requestArgs, brandName, HandleDisplayCircularItemsResponse, null);
	}
}

function SelectCategory(categoryID) {
    var requestArgs = GSNContext.RequestArguments;

	if (categoryID != '-1') {
		GetCircularItemsByCategory(document.URL, requestArgs, categoryID, HandleDisplayCircularItemsResponse, null);
	}
}

function SearchByKeyWord() 
{
    // Get the key word
	var keyWord = $('txtSearch').value;
	var requestArgs = GSNContext.RequestArguments;

    // Run the query
	GetCircularItemsByKeyWord(document.URL, requestArgs, keyWord, HandleDisplayCircularItemsResponse, null);
}

function HandleDisplayCircularAdPageResponse(response) {

    if (response.responseXML.firstChild.textContent) {
        ReplaceCircularAdPageContent(response.responseXML.firstChild.textContent);
    }
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        ReplaceCircularAdPageContent(response.responseXML.documentElement.firstChild.nodeValue);
    }
    else {
        ReplaceCircularAdPageContent(response.responseJSON.d);
    }

    HidePageList();
    ShowAdPagePagers();
	
	refreshAdPods();
	
	WeeklyAdPageTransitionOptions.afterFinish = undefined;
	
	var div = 'AdContent';
	var div1 = $(div);
	
	if(typeof(div1) != 'undefined'){
		switch(WeekyAdPageTransitionType){
			case 'appear':
				Effect.Appear('AdContent');
				break;
			case 'blind':
				Effect.BlindDown('AdContent');
				break;	
			case 'leftright':
				Effect.BlindRight('AdContent');		
				break;
			default:
				break;
		}
	}
}

function HandleDisplayCircularItemsResponse(response) {

	if (response.responseXML.firstChild.textContent) {
	    ReplaceCircularAdPageContent(response.responseXML.firstChild.textContent);
	}
	else if (response.responseXML.documentElement.firstChild.nodeValue) {
	    ReplaceCircularAdPageContent(response.responseXML.documentElement.firstChild.nodeValue);
	}
	else {
		ReplaceCircularAdPageContent(response.responseJSON.d);
    }

    if (typeof (UnTip) == 'function') {
        UnTip();
    }

	HidePageList();
	HideAdPagePagers();
	refreshAdPods();
}

function ReplaceCircularAdPageContent(htmlContent) {

	$('AdContent').innerHTML = htmlContent;
	//$('AdContent').style.display = 'block';
}

function ShowPageList() {

    $('PageIndex').show();
    $('PageDisplay').hide();

    refreshAdPods();
}


function HidePageList() {

    $('PageIndex').hide();
    $('PageDisplay').show();
}

function UpdatePagers(circularPageID) {

    var pagerLists = document.getElementsByClassName('CircularPager');
    var circularTypeKey = '';

    for (var i = 0; i < pagerLists.length; i++) {

        var items = pagerLists[i].getElementsByTagName('li');
        
        for (var j = 0; j < items.length; j++) {

            var listItem = $(items[j].id);

            if (typeof (listItem) == 'object') {

                if (listItem.id.indexOf('CircularPage:' + circularPageID) >= 0) {
                    listItem.className = 'activePage';

                    if (circularTypeKey.length == 0) {

                        circularTypeKey = listItem.id;
                    }
                }
                else {

                    listItem.className = '';
                }
            }
        }
    }

    ShowActivePagerItems(circularTypeKey);
}

function ShowActivePagerItems(keyValues) {

    if (typeof (keyValues) == 'string') {
        var values = keyValues.split('_');
        var key;
        
        for (var i = 0; i < values.length; i++) {

            if (values[i].indexOf('CircularType:') >= 0) {

                key = values[i];
                break;
            }
        }

        var pagerLists = document.getElementsByClassName('CircularPager');

        for (var i = 0; i < pagerLists.length; i++) {
        
            var items = pagerLists[i].getElementsByTagName('li');

            for (var j = 0; j < items.length; j++) {

                var listItem = $(items[j].id);

                if (typeof (listItem) == 'object') {

                    if (listItem.id.endsWith(key)) {
                        listItem.show();
                    }
                    else {
                        listItem.hide();
                    }
                }
            }
        }
    }
}

function ShowAdPagePagers() {
    $('PagerTop').show();
    $('PagerBottom').show();
}

function HideAdPagePagers() {
    $('PagerTop').hide();
    $('PagerBottom').hide();
}