document.observe('dom:loaded',initialize);

function initialize() {
	attachEventListeners();
}

// attach all event listeners for this page
function attachEventListeners() {
	$('txtSearchTerm').observe('keypress',searchOnKeyPress);
}

// set RETURN key to trigger search
function searchOnKeyPress(event) {
	if (event.keyCode == Event.KEY_RETURN) {
    	NewSearch();
        return event.keyCode != Event.KEY_RETURN;
    }
}

function BuildQueryString() {

    var inputs = $$('#searchControls input, #searchControls select');
    var queryString = '';

    for (var i = 0; i < inputs.length; i++) {

        var name = inputs[i].name;
        var value = inputs[i].value;

        if (queryString != '') {
            queryString = queryString + '&';
        }

        queryString = queryString + name + '=' + encodeURIComponent(value);
    }
    
    return queryString;
}

function RunQuickSearch(searchString){
	var searchTerms = searchString.substring(searchString.indexOf(';')+1, searchString.length - 1);
	searchTerms = searchTerms.substring(searchTerms.indexOf(':')+1,searchTerms.length);
	searchTerms = searchTerms.replace(/(\"|^\s+)/g, '');
	$('txtSearchTerm').value = searchTerms;
	
	NewSearch();
	
}

function NewSearch() {
	var searchterm = $('txtSearchTerm').value.trim();

	if(searchterm == ''){
		alert('Please enter a search term');
		return;
	}				

    KillLightWindow();
	ResetCurrentSearch();

	$('hdnPageNumber').value = 0;
    $('hdnSearchCategoryID').value = '';
	
	// this must be implemented on each page that has a search control
	RunSearch();

}

function KillLightWindow() {
	$('lightwindow').hide();
    $('lightwindow_overlay').hide();
}

function ResetCurrentSearch() {
	if($('CurrentSearch')) {
		if($('CurrentSearch').visible()) {
			$('CurrentSearch').hide();	
		}
	}
}

function NewAdvancedSearch() {
	// first set advancedSearch input values to match values in lightbox they are included in form.
	// this is necessary because the light window is generated outside of the asp form.
	var inPageCategorySelects = $$('#advancedSearch .categorySelect');
	var lightBoxCategorySelects = $$('#lightwindow_contents .categorySelect');	
	UpdateInPageElements(lightBoxCategorySelects,inPageCategorySelects);
	
	var inPageFields = $$('#advancedSearch .excludeTitle input');
	var lightBoxFields = $$('#lightwindow_contents .excludeTitle input');	
	UpdateInPageElements(lightBoxFields,inPageFields);
	
	var inPageNutrition = $$('#advancedSearch #Nutrition .rangeField');
	var lightBoxNutrition = $$('#lightwindow_contents #Nutrition .rangeField');
	UpdateInPageElements(lightBoxNutrition, inPageNutrition);
	
    NewSearch();
}

function UpdateInPageElements(lightBoxElements, inPageElements) {
	if(lightBoxElements.length == inPageElements.length){
		for(var i = 0; i < lightBoxElements.length ; i++)
		{
			inPageElements[i].value = lightBoxElements[i].value;
			lightBoxElements[i].value = '';
		}
	}
}

function ToggleAdvancedSearch() {
	$('txtSearchTerm').value = '';

	myLightWindow.activateWindow({
		href: '#advancedSearch',
		title: 'Advanced Search',
		width: 550,
		height: 500,
		type: 'inline'
	});
}

function ToggleSearchTips() {
	myLightWindow.activateWindow({
		href: '#SearchTipsHelp',
		title: 'Search Tips',
		width: 600,
		height: 400,
		type: 'inline'
	});
}

function ToggleQuickSearch() {
	myLightWindow.activateWindow({
		href: '#quickSearch',
		title: 'Quick Search',
		width: 800,
		height: 600,
		type: 'inline'
	});
}