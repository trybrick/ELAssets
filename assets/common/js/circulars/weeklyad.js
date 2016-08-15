/* This file calls functions defined in Circulars.js */

var WeeklyAdPageIsInitialized = true;
var WeekyAdPageTransitionType = '';
var WeeklyAdPageTransitionOptions = '';
var CircularPageID = '';

function DisplayAdPage(){
    var requestArgs = GSNContext.RequestArguments;
	
	//UpdatePagers(CircularPageID);
	GetCircularPage(document.URL, requestArgs, CircularPageID, HandleDisplayCircularAdPageResponse, null);
}

function DisplayCircularAdPage(circularPageID)
{
    // Store the id
	CircularPageID = circularPageID;
	
	// Display the ad page.
	DisplayAdPage();
}

function DisplayCircularAdPage(circularPageID, transitiontype, transitionoptions) {
	WeekyAdPageTransitionType = transitiontype;
	WeeklyAdPageTransitionOptions = transitionoptions;
	CircularPageID = circularPageID;
	
	var div = 'AdContent';
	var div1 = $(div);

	if (typeof (div1) != 'undefined' && typeof (WeekyAdPageTransitionType) != 'undefined') {
	
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

function getCategoryID()
{
    $('ddlBrand').value = '-1';

    // Get the category id.
    var categoryID = $('ddlDepartment').value;

    return categoryID;
}

function getBrandName() {
    $('ddlDepartment').value = '-1';
    var brandName = $('ddlBrand').value;

    return brandName;
}

function getKeyWord() {
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

    
    var circularPageID = $('hfCircularPageID').value;

    MarkDisplayedPager(circularPageID)
    ShowAdPagePagers();

    if (WeeklyAdPageIsInitialized) {
        refreshAdPods();
    }

    WeeklyAdPageIsInitialized = true;
	
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
    
	UnTip();

	if (response.responseXML.firstChild.textContent) {
	    ReplaceCircularAdPageContent(response.responseXML.firstChild.textContent);
	}
	else if (response.responseXML.documentElement.firstChild.nodeValue) {
	    ReplaceCircularAdPageContent(response.responseXML.documentElement.firstChild.nodeValue);
	}
	else {
		ReplaceCircularAdPageContent(response.responseJSON.d);
	}

	HideAdPagePagers();

	if (WeeklyAdPageIsInitialized) {
	    refreshAdPods();
	}

	WeeklyAdPageIsInitialized = true;
}

function ShowAdPagePagers() {
	$('CircularPagerTop').style.display = 'block';
	$('CircularPagerTop').style.visibility = 'visible';
	$('CircularPagerBottom').style.display = 'block';
	$('CircularPagerBottom').style.visibility = 'visible';
}

function HideAdPagePagers() {
	$('CircularPagerTop').style.display = 'none';
	$('CircularPagerTop').style.visibility = 'hidden';
	$('CircularPagerBottom').style.display = 'none';
	$('CircularPagerBottom').style.visibility = 'hidden';
}

function MarkDisplayedPager(circularPageID) {

    var topListItems = $('CircularPagerTop').getElementsByTagName('li');

    for (i = 0; i < topListItems.length; i++) {

        if (topListItems[i].id == 'PageListTop' + circularPageID) {
            topListItems[i].className = 'activePage';
        }
        else {
            topListItems[i].className = '';
        }
    }

    var bottomListItems = $('CircularPagerBottom').getElementsByTagName('li');

    for (i = 0; i < bottomListItems.length; i++) {

        if (bottomListItems[i].id == 'PageListBottom' + circularPageID) {
            bottomListItems[i].className = 'activePage';
        }
        else {
            bottomListItems[i].className = '';
        }
    }
}

function ReplaceCircularAdPageContent(htmlContent) {

	$('AdContent').innerHTML = htmlContent;
}

