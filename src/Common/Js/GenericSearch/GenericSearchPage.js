function RunSearch() {
	$('loadingSearch').removeClassName('hidden');
    var form = document.forms[0];
    GSNServices.SearchService.RunSearchFromForm(form, HandleSearchResponse, null);
}

function SetAndRunSearch(newSearchTerm){
	var searchBoxes = $$('input:[name="SearchTerm"]');
	
	if(searchBoxes == undefined){
		return;
	}
	
	searchBoxes[0].value = newSearchTerm;
	
	RunSearch();
}

function HandleSearchResponse(response) {
	$('loadingSearch').addClassName('hidden');
	var responseHtml = UnwrapResponse(response);
    if (responseHtml != '') {
        $('searchResults').innerHTML = responseHtml;
    }
}

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

function SearchRedirect(itemID, searchTypeID) {

    var queryString = BuildQueryString();
    var location = null;

    switch (searchTypeID) {
        case 3:
            location = '/Recipes/RecipeFull.aspx?RecipeID=' + itemID;
            break;
        case 5:
            location = '/Recipes/Article.aspx?ArticleID=' + itemID;
            break;
        case 4:
            location = '/Recipes/RecipeVideos.aspx?VideoID=' + itemID;
            break;
    }

    if (location == null) {
        return;
    }

    location = location + '&' + queryString;

    document.location = location;
}

function ChangePage(pageNumber) {

    $('hdnPageNumber').value = pageNumber;

    RunSearch();
}

function ChangeCategory(searchCategoryID,event) {
	if (searchCategoryID > 0) {
        $('hdnSearchCategoryID').value = searchCategoryID;
    }
    else {
        $('hdnSearchCategoryID').value = '';
    }
    
    $('hdnPageNumber').value = 0;
	SetCurrentSearch(searchCategoryID);
    RunSearch();
	Event.stop(event);
}

function SetCurrentSearch(searchCatID) {
	var text = $('catLink'+searchCatID).innerHTML;
	$('currentSearchText').innerHTML = text;
	if(!$('CurrentSearch').visible()) {
		$('CurrentSearch').show();
	}
}

function Sort() {

    RunSearch();
}

function ChangeSearchType(searchTypeID) {
    $('hdnSearchType').value = searchTypeID;
    $('hdnSearchCategoryID').value = '';
    $('hdnPageNumber').value = 0;

    RunSearch();
}

function ToggleChildren(parent) {

    if ($(parent) != null) {
		var childDiv = null;
        var childDivs = $(parent).select('.childCategories');
		
		
        if (childDivs != null && childDivs.length && childDivs.length > 0) {
			childDiv = childDivs[0];
        }
        if (childDiv != null) {
            if ( $(parent).hasClassName('selected') || childDiv.visible() ) {
				childDiv.hide();
            	$(parent).removeClassName('selected');
            }
            else {
                childDiv.show();
                $(parent).addClassName('selected');
            }
        }
    }
}

function ShowMoreCategories(catID,event) {
	Event.stop(event);
	var childCategories = $$('#category_'+catID+' li');
	for(var i = 0; i < childCategories.length-2; i++) {
		childCategories[i].show();
	}
	
	var moreLink = $$('#category_'+catID+' li .moreLink');
	moreLink[0].hide()
	var lessLink = $$('#category_'+catID+' li .lessLink');
	lessLink[0].show();
}

function ShowLessCategories(catID,event) {
	Event.stop(event);
	var childCategories = $$('#category_'+catID+' li');
	for(var i = 5; i < childCategories.length-2; i++) {
		childCategories[i].hide();
	}
	
	var moreLink = $$('#category_'+catID+' li .moreLink');
	moreLink[0].show()
	var lessLink = $$('#category_'+catID+' li .lessLink');
	lessLink[0].hide();
}