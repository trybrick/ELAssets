function UpdateDepartment()
{
	var requestArgs = GSNContext.RequestArguments;
	var categoryID = 0;

	GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetDepartment, HandleFailure);
}

function UpdateAisles()
{
	$('UpdateProgress1').style.display = 'block';

	var requestArgs = GSNContext.RequestArguments;
	var categoryID = $('lstDepartments').value;

	GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetAisles, HandleFailure);
}

function UpdateCategories()
{
	$('UpdateProgress1').style.display = 'block';

	var requestArgs = GSNContext.RequestArguments;
	var categoryID = $('lstAisles').value;

	GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetCategory, HandleFailure);
}

function UpdateGrid()
{
	var categoryID = $('lstCategory').value;

	SelectCategory(categoryID);
}

function SelectCategory(categoryID) {

    var overLay = $('UpdateProgress1');
    
    if (typeof(overLay) == 'object') {
        overLay.style.display = 'block';
    }
    var requestArgs = GSNContext.RequestArguments;
    
    GetGenericProductsByCategoryID(document.URL, requestArgs, categoryID, SetGrid, HandleFailure);
}

function DisplayMostPopular() {

	$('UpdateProgress1').style.display = 'block';

	var requestArgs = GSNContext.RequestArguments;

	GetMostPopularGenericProducts(document.URL, requestArgs, SetGrid, HandleFailure)
}

function SetDepartment(departmentsHTML)
{
	$('UpdateProgress1').style.display = 'none';

	var responseValue = UnwrapResponse(departmentsHTML);
	SetList($('lstDepartments'), responseValue);

	$('lstAisles').innerHTML = '';
	$('lstCategory').innerHTML = '';

	if ($('lstDepartments').length == 1)
	{
		$('lstDepartments').selectedIndex = 0;
		
		UpdateAisles();
	}
	else {
	/*	try {
			refreshAdPods();
		}
		catch (e) {} */
	}
}

function SetAisles(departmentsHTML)
{
	$('UpdateProgress1').style.display = 'none';

	var responseValue = UnwrapResponse(departmentsHTML);
	SetList($('lstAisles'), responseValue);

	$('lstCategory').innerHTML = '';

	if ($('lstAisles').length == 1)
	{
		$('lstAisles').selectedIndex = 0;

		UpdateCategories();
	}
	else {
		/* try {
			refreshAdPods();
		} 
		catch (e) {
		}*/
	}
}

function SetCategory(departmentsHTML)
{
	$('UpdateProgress1').style.display = 'none';

	var responseValue = UnwrapResponse(departmentsHTML);
	SetList($('lstCategory'), responseValue);

	if ($('lstCategory').length == 1)
	{
		$('lstCategory').selectedIndex = 0;
		UpdateGrid();
	}
	else {
		/*try {
			refreshAdPods();
		} 
		catch (e) {} */
	}
}

function SetGrid(gridHTML) {
	$('UpdateProgress1').style.display = 'none';

	var responseValue = UnwrapResponse(gridHTML);
	$('LineItem').innerHTML = responseValue;
	
	/*try {
		refreshAdPods();
	} 
	catch (e) {} */
}

function SetList(list, newItems) {
	list.update(newItems);
	list.selectedIndex = -1;
}

function HandleFailure() {
	
    $('UpdateProgress1').style.display = 'none'; 
}

function CheckQueryString() {
    var currentUrl = document.location.href;

    if (currentUrl.include('?')) {
        var obj = currentUrl.toQueryParams();

        if (typeof (obj) == 'object' && obj.Department > 0) {
            DisplayDepartment(obj.Department);
        }
    }
}

function DisplayDepartment(categoryID) {

    $('lstDepartments').value = categoryID;
    UpdateAisles();

    var departments = $('Departments');
    var listBoxes = $('ListBoxes');

    if (departments != null) {
        departments.hide();

        if (listBoxes != null) {
            listBoxes.show();
        }
    }
}