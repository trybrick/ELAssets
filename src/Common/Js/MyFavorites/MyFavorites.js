

function DisplayDepartmentFavorites() {

    var categoryID = new Number($('ddlDepartment').value);

    if (categoryID.toString() != 'NaN' && categoryID != 0) {
        $$('.LineItem').each(function(item) { item.hide(); });

        $('Items:' + categoryID).show();
    }
    else {
        $$('.LineItem').each(function(item) { item.show(); });
    }

    try {
        refreshAdPods();
    } catch (e) { }
}

function SelectCategory(categoryID) {
    
    var requestArgs = GSNContext.RequestArguments;

    GetMyFavoritesItemsByCategoryID(document.URL, requestArgs, categoryID, HandleMyFavoritesItemsResponse, OnFail);

    $$('#UpdateProgress1').each(function(e) { e.show(); });
}

function HandleMyFavoritesItemsResponse(response) {

    $$('#UpdateProgress1').each(function(e) { e.hide(); });

    if (response.responseXML.firstChild.textContent) {
        ReplaceMyFavoritesContent(response.responseXML.firstChild.textContent);
    }
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        ReplaceMyFavoritesContent(response.responseXML.documentElement.firstChild.nodeValue);
    }
    else {
        ReplaceMyFavoritesContent(response.responseJSON.d);
    }

    try {
        refreshAdPods();
    } catch (e) { }
}

function OnFail() {
    $$('#UpdateProgress1').each(function(e) { e.hide(); });
}


function ReplaceMyFavoritesContent(htmlContent) {

    $('ProductsGrid').innerHTML = htmlContent;
}

function AddShoppingListLineItemToList(elementid, addelementid, updateelementid){
	
	SetListQuantity(elementid);
	
	try{
		$(addelementid).style.display = 'none';
		$(updateelementid).style.display = 'block';
	
	}catch(e){
		return;
	}
}

function UpdateShoppingListLineItemInList(elementid) {

    SetListQuantity(elementid, true);
}

function RemoveShoppingListLineItemFromList(elementid, addelementid, updateelementid){
	
	RemoveListItem(elementid);
	
	try{
		$(addelementid).style.display = 'block';
		$(updateelementid).style.display = 'none';
	
	}catch(e){
		return;
	}
}