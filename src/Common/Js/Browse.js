// this file requires Categories.js to be included on the same page.

var BrowseTheAislesIsInitialized = false;

function GetCategoryGrid(categoryID)
{
	GetCategoryDisplay(categoryID, SetGrid, UpdateFailed);
}

function UpdateDepartment()
{
	GetCategorySelect(0, SetDepartment, UpdateFailed);
}

function UpdateAisles()
{
	$('UpdateProgress1').style.display = 'block';

	var categoryID = $('lstDepartments').value;
	$('lstDepartments').options[$('lstDepartments').selectedIndex].attributes.getNamedItem('exportkeyid').value;


	
	GetCategorySelect(categoryID, SetAisles, UpdateFailed);
}

function UpdateCategories()
{
	$('UpdateProgress1').style.display = 'block';

	var categoryID = $('lstAisles').value;
	
	GetCategorySelect(categoryID, SetCategory, UpdateFailed);
}

function UpdateGrid()
{
	$('UpdateProgress1').style.display = 'block';

	var categoryID = $('lstCategory').value;
	
	var staticContentElement = $('browseStaticContent');
	
	if (staticContentElement != null){
	    staticContentElement.hide();
	}

	GetCategoryGrid(categoryID);
}

function SetDepartment(departmentsHTML)
{
	SetList($('lstDepartments'), departmentsHTML.responseJSON.d);
	
	$('UpdateProgress1').style.display = 'none';
	$('lstAisles').innerHTML = '';
	$('lstCategory').innerHTML = '';

	if ($('lstDepartments').length == 1)
	{
		$('lstDepartments').selectedIndex = 0;

		UpdateAisles();
	}
}

function SetAisles(departmentsHTML)
{
	SetList($('lstAisles'), departmentsHTML.responseJSON.d);

	$('UpdateProgress1').style.display = 'none';
	$('lstCategory').innerHTML = '';

	if ($('lstAisles').length == 1)
	{
		$('lstAisles').selectedIndex = 0;

		UpdateCategories();
	}

	try {
		if (BrowseTheAislesIsInitialized) refreshAdPods();
	} 
	catch (e) {}

	BrowseTheAislesIsInitialized = true;
}

function SetCategory(departmentsHTML)
{
	SetList($('lstCategory'), departmentsHTML.responseJSON.d);

	$('UpdateProgress1').style.display = 'none';

	if ($('lstCategory').length == 1)
	{
		$('lstCategory').selectedIndex = 0;

		UpdateGrid();
	}

	try {
		if (BrowseTheAislesIsInitialized) refreshAdPods();
	} 
	catch (e) {}

	BrowseTheAislesIsInitialized = true;
}

function SetGrid(gridHTML)
{
	$('LineItem').innerHTML = gridHTML.responseJSON.d;
	$('UpdateProgress1').style.display = 'none';

	try {
		if (BrowseTheAislesIsInitialized) refreshAdPods();
	} 
	catch (e) {}

	BrowseTheAislesIsInitialized = true;
}

function SetList(list, newItems) {
	list.update(newItems);
	list.selectedIndex = -1;
}

function UpdateFailed()
{
	$('UpdateProgress1').style.display = 'none';
}

function InitializeBrowse()
{
	UpdateDepartment();
	GetCategoryGrid(0);
}

InitializeBrowse();