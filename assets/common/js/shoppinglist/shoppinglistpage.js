/// <summary>
/// Last Shopping List Id Updated
/// </summary>
var LastShoppingListIdUpdated = 0;
/// <summary>
///  Handle Manage Remove All From Shopping List Response
/// </summary>
function EmailShoppingList()    
{
}
/// <summary>
/// Print Shopping List Items
/// </summary>
function PrintShoppingListItems() 
{
    // Print.
    window.print();  
}
/// <summary>
/// get Avaliable Varieties List
/// </summary>
function getAvaliableVarietiesList()
{
    // Allocate the string
    var AvaliableVarietiesList = new String("");

    // CirculareItem Id
    var circularItemID = $('hfAvailableVarietiesCircularItemID').value;

    // Request
    var requestArgs = GSNContext.RequestArguments;

    // Url
    var url = document.URL;

    // Get the check boxes
    var checkBoxes = $('byitem').getElementsByTagName('input');

    // Loop through the boxes
    for (i = 0; i < checkBoxes.length; i++)
    {
        if (checkBoxes[i].checked)
        {
            // Add the comma
            if (AvaliableVarietiesList.length > 0)
            {
                AvaliableVarietiesList = AvaliableVarietiesList + ",";
            }

            // Add the value.
            AvaliableVarietiesList = AvaliableVarietiesList + checkBoxes[i].value.toString();
        }
    }

    return AvaliableVarietiesList;
}
//********************************************************************************************************************************

/// <summary>
/// Add To Shopping List
/// </summary>
function AddToShoppingList(itemID, itemTypeID) {

    // Generate the arguements.
    var requestArgs = GSNContext.RequestArguments;
    
    // Store the url.
    var url = document.URL;
    
    // Determine if the type is 8.
    if (itemTypeID == 8) 
    {
        DisplayAvailableVarieties(itemID);
        
        if (AvailableVarietiesRequired()) 
        {
            return;
        }
    }
    
    // Generate the message and add the item to the list.
    AddItemToShoppingList(url, requestArgs, itemTypeID, itemID, 1, '', HandleShoppingListResponseWithRefresh, null);
}

/// <summary>
/// Add Weighted To Shopping List
/// </summary>
function AddWeightedToShoppingList(itemID, itemTypeID, weight, quantity) 
{
    var requestArgs = GSNContext.RequestArguments;
    var availableVarietiesRequired = AvailableVarietiesRequired();

    //display available varieties for circular items
    if (itemTypeID == 8) 
    {
        DisplayAvailableVarieties(itemID);
        
        if (AvailableVarietiesRequired()) 
        {
            return;
        }
    }
    
    // Add the weighted item
    AddWeightedItemToShoppingList(document.URL, requestArgs, itemTypeID, itemID, weight, '', quantity, HandleShoppingListResponse, null);
}
/// <summary>
/// Add Weighted To Shopping List
/// </summary>
function AddShoppingListItem(shoppingListItemID) 
{
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;

    // Add the item
    AddShoppingListItemToShoppingList(url, requestArgs, shoppingListItemID, 1, 0, HandleShoppingListResponse, null);
}
/// <summary>
/// Add Shopping List Item Qty
/// </summary>
function AddShoppingListItemQty(shoppingListItemID, quantity, weight) 
{
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    
    // Add the item async.
    AddShoppingListItemToShoppingList(url, requestArgs, shoppingListItemID, quantity, weight, HandleShoppingListResponse, null);
}
/// <summary>
/// Set Shopping List Item Comment
/// </summary>
function SetShoppingListItemComment(itemID, itemTypeID, comment) 
{
    // Get the request arguments.
    var requestArgs = GSNContext.RequestArguments;
    
    // Update the comments.
    UpdateShoppingListItemComment(document.URL, requestArgs, itemID, itemTypeID, comment, HandleShoppingListResponse, null);
}
/// <summary>
/// Set Shopping List Item Quantity
/// </summary>
function SetShoppingListItemQuantity(itemID, itemTypeID, quantity) 
{
    // Update the quantity.
    UpdateShoppingListItemQuantity(document.URL, GSNContext.RequestArguments, itemID, itemTypeID, quantity, HandleShoppingListResponse, null);
}
/// <summary>
/// Set Shopping List Item Weight
/// </summary>
function SetShoppingListItemWeight(itemID, itemTypeID, quantity, weight) 
{
    // Keep track of the last updated.
    LastShoppingListIdUpdated = itemID;

    // Call the method to update the weight
    UpdateShoppingListItemWeight(document.URL, GSNContext.RequestArguments, itemID, itemTypeID, quantity, weight, HandleSetShoppingListItemWeight, null);
}
/// <summary>
/// Handle Set Shopping List Item Weight
/// </summary>
function HandleSetShoppingListItemWeight(response)
{
    // Handle shopping List Response.
    HandleShoppingListResponse(response);
}
/// <summary>
/// Add To Shopping List With Quantity
/// </summary>
function AddToShoppingListWithQuantity(itemID, itemTypeID, quantity) 
{
    // display available varieties for circular items
    if (itemTypeID == 8) 
    {
        DisplayAvailableVarieties(itemID);
    }
    
    // Keep track of the last updated.
    LastShoppingListIdUpdated = itemID;
    
    // Add the item to the shopping list
    AddItemToShoppingList(document.URL, GSNContext.RequestArguments, itemTypeID, LastShoppingListIdUpdated, quantity, '', HandleAddToShoppingListWithQuantity, null);
}
/// <summary>
/// Handle Add To Shopping List With Quantity
/// </summary>
function HandleAddToShoppingListWithQuantity(response)
{
    // Handle the response.
    HandleShoppingListResponse(response);
}
/// <summary>
/// Add Multiple Coupons To List
/// </summary>
function AddMultipleCouponsToList(items) 
{
    // Add the multiple items here.
    AddMultipleItemsToShoppingList(document.URL, GSNContext.RequestArguments, items, HandleShoppingListResponse, null);
}
/// <summary>
/// Add Multiple Product To List
/// </summary>
function AddMultipleProductToList(items) 
{
    // Add the multiple items here.
    AddMultipleItemsToShoppingList(document.URL, GSNContext.RequestArguments, items, HandleShoppingListResponse, null);
}
/// <summary>
/// Remove From Shopping List
/// </summary>
function RemoveFromShoppingList(shoppingListItemID, itemTypeID) 
{
    // Remove the item from the shopping list.
    RemoveItemFromShoppingList(document.URL, GSNContext.RequestArguments, itemTypeID, shoppingListItemID, HandleShoppingListResponse, null);
}
/// <summary>
/// Remove From Shopping List By ID
/// </summary>
function RemoveFromShoppingListByID(itemID, itemTypeID) 
{
    if (itemTypeID == 3) 
    {
        HideProductRemove(itemID);
    }
    // Hide the favorites
    HideMyFavoritesRemove(itemID, itemTypeID);
    
    // Remove the item from the list.
    RemoveItemFromShoppingListByID(document.URL, GSNContext.RequestArguments, itemID, itemTypeID, HandleShoppingListResponse, null);
}
/// <summary>
/// Add Ad To ShoppingList
/// </summary>
function AddAdToShoppingList(queryString) 
{
    // Add the request.
    AddAdPodToShoppingList(document.URL, GSNContext.RequestArguments, queryString, HandleShoppingListResponse, null);
}
/// <summary>
/// Save Current Shopping List
/// </summary>
function SaveCurrentShoppingList() 
{
    // Save the shopping list
    SaveShoppingList(document.URL, GSNContext.RequestArguments, '', HandleShoppingListResponse, null);
}

function LastShoppingList() {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    LoadLastShoppingList(url, requestArgs, HandleShoppingListResponse, null);
}
function AddItemsFromOrder(orderID) {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;

    $$('.ProductUpdateDivButtons').each(function(item) { item.hide(); });
    $$('.divRemoveUpdate').each(function(item) { item.show(); });

    LoadItemsFromOrder(url, requestArgs, orderID, HandleShoppingListResponse, null)
}
/// <summary>
/// Handle Shopping List Response
/// </summary>
function HandleShoppingListResponse(response) 
{
    if (response.responseXML.firstChild.textContent) {
        $('ShoppingListItemsDisplay').innerHTML = response.responseXML.firstChild.textContent;
    }
    else {
        $('ShoppingListItemsDisplay').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }
}
/// <summary>
/// Handle Shopping List Response With Refresh
/// </summary>
function HandleShoppingListResponseWithRefresh(response) 
{
    if (response.responseXML.firstChild.textContent) {
        $('ShoppingListItemsDisplay').innerHTML = response.responseXML.firstChild.textContent;
    }
    else {
        $('ShoppingListItemsDisplay').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }

	refreshAdPods();
}

function UpdateSecondaryShoppingListDisplay(){
	if (typeof (GSNElements) == 'undefined' || GSNElements == null) {
		var GSNElements = new Object();
	}
	
	GSNElements.ShoppingListNotification = {
		DataSource : {
			Count: 'gsnShoppingListItemCount',
			Subtotal: 'gsnShoppingListItemSubtotal'
		},
		
		Display: {
			MainContent: 'shoppinglist-notification',
			OGSDisplay: 'shoppinglist-notification-content-cart',
			ListDisplay: 'shoppinglist-notification-content-list',
			ItemAddedDisplay: 'shoppinglist-notification-item',
			Subtotal: 'secondaryshoppinglistsubtotal'
		},
		
		Klass: {
			CountDisplay: 'secondaryshoppinglistitemdisplay',
			Count: 'secondaryshoppinglistcount'
		}
	};
	
	//not supported by IE
	try {
		console.group('Secondary Shopping List Display');
	}catch(e) { 
		//do nothing
	}
	
	var topLevelDisplayDiv = '#shoppinglist-notification-content';
	
	//this should catch any "standard" GSN clients
	//kevin - obj GSNPageItems 
	if(typeof(GSNPageItems) == undefined || !GSNPageItems.ShoppingListNotification.Enabled){
		console.error('Shopping list notifications disabled');
		return;
	}
	else{
		console.info(GSNPageItems.ShoppingListNotification);
		console.info(GSNElements.ShoppingListNotification);
		console.info('Shopping list notifications enabled');
	}
	
	//determine the type we are working with
	var shoppingListType = $('gsnShoppingListItemType').value;
	console.info('Shopping list notification type: ' + shoppingListType);
	
	//determine the div that should be visible
	var display = shoppingListType == 'list' ? GSNElements.ShoppingListNotification.Display.ListDisplay : GSNElements.ShoppingListNotification.Display.OGSDisplay;
	console.info('Display div: ' + display);

	var displayDiv = $(display);

	var countSource = $(GSNElements.ShoppingListNotification.DataSource.Count);
	var subtotalSource = $(GSNElements.ShoppingListNotification.DataSource.Subtotal);
	
	var countDestination = $$('#' + GSNElements.ShoppingListNotification.Display.MainContent + ' .' + GSNElements.ShoppingListNotification.Klass.Count);
	var countDisplayDestination = $$('#' + GSNElements.ShoppingListNotification.Display.MainContent + ' .' + GSNElements.ShoppingListNotification.Klass.CountDisplay);
	var subtotalDestination = $(GSNElements.ShoppingListNotification.Display.Subtotal);
	
	if(countDestination == undefined && subtotalDestination == undefined && typeDestination == undefined){
		console.error('No shopping list destination divs present on the page');
		return;
	}
	
	if(countSource != undefined && subtotalSource != undefined){
		if(countSource <= 0){
			console.error('No shopping list notification source items present on the page');
			return;
		}
		
		//update count display
		if(countDestination != undefined){
			console.log('Item Count: ' + countSource.value);
			
			countDestination.each(function(item){  
				item.innerHTML = countSource.value.toString();
			});
		}
		
		if(countDisplayDestination != undefined && countDisplayDestination != null){
			countDisplayDestination.each(function(item){  
				item.innerHTML = countSource.value == '1' ? ' item' : ' items';
			});
		}
		
		//update subtitle display
		if(subtotalDestination != undefined){ 
			var num = new Number(subtotalSource.value);
			console.log('Subtotal: ' + num.toFixed(2));
			
			subtotalDestination.innerHTML = '$' + num.toFixed(2).toString();
		}
		
		//ensure the proper display is visible
		if(shoppingListType == 'list'){
			var x = $(GSNElements.ShoppingListNotification.Display.ListDisplay);
			if(typeof(x) != undefined && x != null){
				x.show();
			}
			
			var y = $(GSNElements.ShoppingListNotification.Display.OGSDisplay);
			if(typeof(y) != undefined && y != null){
				y.hide();
			}
		}
		else{
			var x = $(GSNElements.ShoppingListNotification.Display.OGSDisplay);
			if(typeof(x) != undefined && x != null){
				x.show();
			}
			
			var y = $(GSNElements.ShoppingListNotification.Display.ListDisplay);
			if(typeof(y) != undefined && y != null){
				y.hide();
			}
		}
		
		//show notification item
		var notificationDiv = $(GSNElements.ShoppingListNotification.Display.MainContent);
		if(typeof(notificationDiv) != undefined && !notificationDiv.visible()){
			Effect.BlindDown(notificationDiv);
		}
		
		var notificationItem = $(GSNElements.ShoppingListNotification.Display.ItemAddedDisplay);
		var shoppingListItem = $$('#ShoppingListItemsDisplay .newItem').first();
		//console.info(shoppingListItem);
		
		Effect.Queues.get('shoppinglist').invoke('cancel');
		//Effect.Queues.get('shoppinglist').interval = 2000;
		
		if(!notificationItem.visible()){
			Effect.Appear(notificationItem, {queue: 'shoppinglist', duration: 1.0, limit: 4} );	
		}
		else{
			//new Effect.Highlight(notificationItem, {queue: 'shoppinglist'} );
		}
		
		//http://madrobby.github.com/scriptaculous/effect-highlight/
		var effects = [ new Effect.Highlight(notificationItem, {sync: true, queue: 'shoppinglist', limit: 4} ), 
						new Effect.Highlight(shoppingListItem, {sync: true, queue: 'shoppinglist', limit: 4} ) 
					  ];
		
		new Effect.Parallel(effects, {delay: 1.2, position: 'end'});
		
		new Effect.Fade(notificationItem, {queue: 'shoppinglist', delay: 2.4, duration: 1.0, limit: 4} );
	}
	
	//not supported by IE
	try {
		console.groupEnd();
	}catch(e) { 
		//do nothing
	}
}

function FinishBlinkAction(notificationitem){
	console.info('Begin FinishBlinkAction');
	new Effect.BlindUp(notificationitem, {queue: 'shoppinglist'}); 
	console.info('Blind Up: ' + notificationitem.identify());
}

function BlinkShoppingListNewItemUI(notificationid, newitemid){
	console.info('Highlighting ID: ' + notificationid);
	console.info('Highlighting ID: ' + newitemid);
	
	new  Effect.Highlight(notificationid, {queue: 'shoppinglist'});
	
	if(newitemid != null){
		new Effect.Highlight(newitemid, {queue: 'shoppinglist'});
	}
	
	console.info('End Blink');
}

function HandleSaveShoppingListResponse(response) {
    alert('Your Shopping List has been saved.');
}
/// <summary>
/// Print List
/// </summary>
function printList() 
{
	var win = window.open('/Shop/PrintList.aspx', '_blank');
	win.focus();
}
//Available Varieties
function showImage(url) {
    window.open('/Shop/ShowImage.aspx?url=' + url, 'ShowLargeImage', 'width=500,height=500,scrollbars=no,menubar=no,top=10,left=10');
}
function DisplayAvailableVarieties(circularItemID) {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    if (typeof (GetAvailableVarieties) == 'function') {
        GetAvailableVarieties(url, requestArgs, circularItemID, HandleAvailableVarietiesResponse, null);
    }
}
function HandleAvailableVarietiesResponse(response) {
    if (response.responseXML.firstChild.textContent) {
        $('availablevarieties').innerHTML = response.responseXML.firstChild.textContent;
    }
    else {
        $('availablevarieties').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }
	
	// trigger cirPlusSlot refresh, this is in adMasterFunctions.js
	try {
		if (refreshCirPlusSlot) {
			refreshCirPlusSlot();
		}
	} catch(e) {}
	
    ExpandAvailableVarieties();
    
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    var itemID = $('varietiesCircularItemID').value;
    var itemTypeID = 8;
    if ($('availablevarieties').innerHTML.include('OGSRequiredVarietiesDiv')) {
        $('availablevarieties').style.display = 'none';
        $('availablevarieties').style.visibility = 'hidden';
        var varieties = $$('#tblAvaliableVarieites tr');
        var numOfVarieties = varieties.length;
        try {
            if (numOfVarieties > 2) {
                ShowRequiredVarieties();
            } else {
                var itemname = document.getElementsByClassName('availproductname', $('availproductinfo'));
                var itemdescription = document.getElementsByClassName('availableproductdescription', $('availproductinfo'));
                var itemsize = document.getElementsByClassName('availprice', $('availproductinfo'));
                var itemweights = $('availrandomweights') != null ? $('availrandomweights').select('.availweights') : null;
                var name = (itemname[0].textContent == undefined) ? itemname[0].innerText : itemname[0].textContent;
                var desc = (itemdescription[0].textContent == undefined) ? itemdescription[0].innerText : itemdescription[0].textContent;
                var size = (itemsize[0].textContent == undefined) ? itemsize[0].innerText : itemsize[0].textContent;
                var weights = [];
                if ((itemweights) != 'undefined' && itemweights != null && itemweights.length > 0) {
                    weights = itemweights[0].options;
                }
                var options = new Hash();
                options.set('name', name);
                options.set('desc', desc);
                options.set('size', size);
                options.set('weights', weights);
                if (numOfVarieties == 2) {
                    if (weights.length > 0) {
                        ShowRequiredVarieties();
                    }
                    else if (AvailableVarietiesRequired()) {
                        AddItemToShoppingList(url, requestArgs, itemTypeID, itemID, 1, '', HandleShoppingListResponse, null);
                    }
                }
                else {
                    ShowAddOwnItem('lightwindow_contents', options);
                }
            }
        }
        catch (e) {
            //var error;
            return;
        }
    }
}

function ShowAvailableVarieties() {
    $$('#ShoppingListDisplay.ListItems').each(function(e) { e.hide(); });
    $$('#availablevarieties.AvailableVarieties').each(function(e) { e.show(); });
    $$('li.AvailableVarieties').each(function(e) { e.className = 'AvailableVarieties Selected'; });
    $$('li.ListItems').each(function(e) { e.className = 'ListItems'; });
}

function ShowShoppingListItems() {
    $$('#availablevarieties.AvailableVarieties').each(function(e) { e.hide(); });
    $$('#ShoppingListDisplay.ListItems').each(function(e) { e.show(); });
    $$('li.AvailableVarieties').each(function(e) { e.className = 'AvailableVarieties'; });
    $$('li.ListItems').each(function(e) { e.className = 'ListItems Selected'; });
}

function ExpandAvailableVarieties() {
    $$('#HideAll').each(function(e) { e.show(); });
    $$('#Varieties').each(function(e) { e.show(); });
    $$('#ShoppingList').each(function(e) { e.show(); });
    $$('#ShoppingListDisplay.ListItems').each(function(e) { e.hide(); });
    $$('#availablevarieties.AvailableVarieties').each(function(e) { e.show(); });
    $$('li.AvailableVarieties').each(function(e) { e.className = 'AvailableVarieties Selected'; });
    $$('li.ListItems').each(function(e) { e.className = 'ListItems'; });
}

function HideDrawer() {
    $$('#HideAll').each(function(e) { e.hide(); });
    $$('#Varieties').each(function(e) { e.hide(); });
    $$('#ShoppingList').each(function(e) { e.hide(); });
}
	
function ExpandShoppingListItems() {
    $$('#HideAll').each(function(e) { e.show(); });
    $$('#Varieties').each(function(e) { e.show(); });
    $$('#ShoppingList').each(function(e) { e.show(); });
    $$('#availablevarieties.AvailableVarieties').each(function(e) { e.hide(); });
    $$('#ShoppingListDisplay.ListItems').each(function(e) { e.show(); });
    $$('li.AvailableVarieties').each(function(e) { e.className = 'AvailableVarieties'; });
    $$('li.ListItems').each(function(e) { e.className = 'ListItems Selected'; });
}


function ShowRequiredVarieties() {
    myLightWindow.deactivate();
    myLightWindow.activateWindow({
        href: '#availablevarieties',
        title: 'Available Varieties',
        width: 600,
        type: 'inline'
    });
    $('availablevarieties').innerHTML = '';
}
function ShowHideAddToListControls() {
    if (typeof ($('availablevarietiesadditemlink')) == 'object') {
        var checkBoxes = $('byitem').getElementsByTagName('input');
        var hasItemsChecked = false;
        for (i = 0; i < checkBoxes.length; i++) {
            if (checkBoxes[i].checked) {
                hasItemsChecked = true;
                break;
            }
        }
        if (hasItemsChecked) {
            $('availablevarietiesadditemlink').style.display = 'block';
            $('availablevarietiesadditemlink').style.visibility = 'visible';
        }
        else {
            $('availablevarietiesadditemlink').style.display = 'none';
            $('availablevarietiesadditemlink').style.visibility = 'hidden';
        }
    }
}

function AddAvaliableVarieties() {
    var circularItemID = $('hfAvailableVarietiesCircularItemID').value;
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    var items = [];
    var checkBoxes = $('byitem').getElementsByTagName('input');
    for (i = 0; i < checkBoxes.length; i++) {
        if (checkBoxes[i].checked) {
            items.push(checkBoxes[i].value);

        }
    }
    AddAvailableVarietiesToShoppingList(url, requestArgs, circularItemID, items, HandleShoppingListResponse, null);
    ShowShoppingListItems();
}
function ShowAddOwnItem(containerDiv, options) {
    myLightWindow.activateWindow({
        href: '#OwnItems',
        title: '',
        width: 600,
        height: 420,
        type: 'inline'
    });
    var parentDiv = $(containerDiv);
    var inputs = parentDiv.getElementsByTagName('input');
    var textAreas = parentDiv.getElementsByTagName('textarea');
    var isManageList = (containerDiv == 'legend');
    var inputsArray = new Array();
    for (var i = 0; i < inputs.length; i++) {
        inputsArray.push(inputs[i]);
    }
    for (var i = 0; i < textAreas.length; i++) {
        inputsArray.push(textAreas[i]);
    }
    var name = '';
    var size = '';
    var quantity = 1;
    var description = '';
    var categoryID = -1;
    var isValid = true;
    var quantityInput;
    if (Object.isHash(options)) {
        for (var i = 0; i < inputsArray.length; i++) {
            var input = inputsArray[i];
            switch (input.title) {
                case 'name':
                    var name = options.get('name');
                    if (name != undefined) {
                        input.value = name
                    }
                    break;
                case 'size':
                    var size = options.get('size');
                    if (size != undefined) {
                        input.value = size;
                    }
                case 'quantity':
                    input.value = 1;
                    quantityInput = input;
                    break;
                case 'description':
                    var desc = options.get('desc');
                    if (desc != undefined) {
                        input.value = size;
                    }
                    input.value = desc;
                    break;
            }
        }
    }
    var selectsInParentDiv = parentDiv.getElementsByTagName('select');
    for (var i = 0; i < selectsInParentDiv.length; i++) {
        var select = selectsInParentDiv[i];
        switch (select.title) {
            case 'randomweight':
                var weights = options.get('weights');
                while (weights.length > 0) {
                    select.appendChild(weights[0]);
                }
                // for (var j = 0; j < weights.length; j++) {
                // var weight = weights[j];
                // select.appendChild(weight);
                // }
                if (select.options.length > 0) {
                    select.style.display = 'block';
                    select.style.visibility = 'visible';
                    select.options[0].selected = true;
                    var measuredisplay = parentDiv.getElementsByClassName('quantitymeasure');
                    measuredisplay[0].style.display = 'block';
                    measuredisplay[0].style.visibility = 'visible';
                    var quantityhelp = parentDiv.getElementsByClassName('quantityhelp');
                    quantityhelp[0].innerHTML = '<p>How many/no. of pounds of this item would you like to purchase?</p>';
                    if (quantityInput) {
                        quantityInput.hide();
                        parentDiv.getElementsBySelector('#ProductPlusMinusButtons').each(function(e) { e.hide(); });
                        parentDiv.getElementsBySelector('.quantityOr').each(function(e) { e.hide(); });
                        parentDiv.getElementsBySelector('.quantitymeasure').each(function(e) { e.show(); });
                    }
                }
                else {
                    select.style.display = 'none';
                    select.style.visibility = 'hidden';
                    if (quantityInput) {
                        quantityInput.show();
                        parentDiv.getElementsBySelector('#ProductPlusMinusButtons').each(function(e) { e.show(); });
                        parentDiv.getElementsBySelector('.quantityOr').each(function(e) { e.hide(); });
                        parentDiv.getElementsBySelector('.quantitymeasure').each(function(e) { e.hide(); });
                    }
                }
                break;
        }
    }
}
/// <summary>
/// Add Own Item
/// </summary>
function AddOwnItem(containerDiv, keepLightWindow) {
    var parentDiv = $(containerDiv);
    var inputs = parentDiv.getElementsByTagName('input');
    var textAreas = parentDiv.getElementsByTagName('textarea');
    var isManageList = containerDiv == 'legend';
    var inputsArray = new Array();
    for (var i = 0; i < inputs.length; i++) {
        inputsArray.push(inputs[i]);
    }
    for (var i = 0; i < textAreas.length; i++) {
        inputsArray.push(textAreas[i]);
    }
    var name = '';
    var size = '';
    var quantity = 1;
    var description = '';
    var categoryID = -1;
    var isValid = true;
    var weight = -1;
    for (var i = 0; i < inputsArray.length; i++) {
        var input = inputsArray[i];
        switch (input.title) {
            case 'name':
                isValid = isValid && ValidateRequiredField(input);
                name = input.value;
                input.value = '';
                break;
            case 'size':
                size = input.value;
                input.value = '';
                break;
            case 'quantity':
                isValid = isValid && ValidateNumber(input);
                if (isValid) {
                    quantity = new Number(input.value);
                    if (quantity < 1) {
                        quantity = 1;
                    }
                }
                input.value = 1;
                break;
            case 'description':
                description = input.value;
                input.value = '';
                break;
        }
    }
    var selectsInParentDiv = parentDiv.getElementsByTagName('select');
    for (var i = 0; i < selectsInParentDiv.length; i++) {
        var select = selectsInParentDiv[i];
        switch (select.title) {
            case 'category':
                var num = new Number(select.value);
                if (num.toString() != 'NaN') {
                    categoryID = num;
                }
                break;
            case 'randomweight':
                var num = new Number(select.value);
                if (num.toString() != 'NaN') {
                    weight = num;
                }
                if (select.style.display != 'none' && weight < 1) {
                    weight = 1;
                }
                break;
        }
        select.selectedIndex = 0;
    }
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    if (isValid) {
        if (isManageList) 
        {
            // Add our own item
            ManageListAddOwnItem(url, requestArgs, name, size, description, categoryID, quantity, weight, HandleShoppingListResponse, null);
        }
        else 
        {
            if (keepLightWindow) 
            {
                // Add our own item
                AddOwnItemToShoppingList(url, requestArgs, name, size, description, categoryID, quantity, weight, HandleShoppingListResponse, null);
            }
            else 
            {
                // Add our own item
                AddOwnItemToShoppingList(url, requestArgs, name, size, description, categoryID, quantity, weight, HandleOwnItemShoppingListResponse, null);
            }
        }
    }
}
function ChangeOwnItemQuantity(containerdiv, increment, max) {
    var div = $(containerdiv);
    if (div != null) {
        var inputs = div.getElementsByTagName('input');
        var txtQuantity = null;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].title == 'quantity') {
                txtQuantity = inputs[i];
                break;
            }
        }
        if (txtQuantity == null) {
            return;
        }
        var quantity = new Number(txtQuantity.value);
        if (quantity.valueOf() == 'NaN') {
            quantity = new Number(1);
        }
        quantity = quantity + increment;
        if (quantity < 1) {
            quantity = 1;
        }
        else if (quantity > max) {
            quantity = max;
        }
        txtQuantity.value = quantity;
    }
}
function AddAllItemsFromOtherList(i) {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    var shoppingListID = new Number(i);
    if (shoppingListID.toString() != 'NaN') {
        LoadItemsFromOtherList(url, requestArgs, shoppingListID, HandleShoppingListResponse, null);
    }
}

function ManageUpdateRow(shoppingListItemID, rowID) 
{
    var tableRow = $(rowID);
    var quantity = 1;
    var weight = -1;
    var inputs = tableRow.getElementsByTagName('input');
    var isValid = true;
    for (var i = 0; i < inputs.length; i++) {
        var input = inputs[i];
        switch (input.title) {
            case 'quantity':
                isValid = isValid && ValidateNumber(input);
                if (isValid) {
                    quantity = new Number(input.value);
                }
                break;
            case 'weight':
                isValid = isValid && ValidateNumber(input);
                if (isValid) {
                    weight = new Number(input.value);
                }
                break;
        }
    }
    var selects = tableRow.getElementsByTagName('select');
    if (typeof (selects.length) == 'number') {
        for (var i = 0; i < selects.length; i++) {
            var select = selects[0];
            switch (select.title) {
                case 'weight':
                    weight = select.value;
                    break;
            }
        }
    }
    if (isValid) 
    {
        // Set the last item updated.
        LastShoppingListIdUpdated = shoppingListItemID;
        
        // Manage the update of the item 
        ManageListUpdateItem(document.URL, GSNContext.RequestArguments, LastShoppingListIdUpdated, quantity, weight, HandleManageUpdateRowResponse, null);
    }
}
/// <summary>
/// HandleManageUpdateRowResponse
/// </summary>
function HandleManageUpdateRowResponse(response)
{
    // Handle the shopping List Response.
    HandleShoppingListResponse(response);
}
/// <summary>
/// ManageRemoveFromShoppingList
/// </summary>
function ManageRemoveFromShoppingList(i) 
{
    var shoppingListItemID = new Number(i);
    if (shoppingListItemID.toString() != 'NaN') 
    {
        // Remove the item.
        ManageListRemoveItem(document.URL, GSNContext.RequestArguments, shoppingListItemID, HandleShoppingListResponse, null);
    }
}
/// <summary>
/// Manage Remove All From Shopping List
/// </summary>
function ManageRemoveAllFromShoppingList() 
{
    // Remove all items from the shopping list.
    ManageListRemoveAllItems(document.URL, GSNContext.RequestArguments, HandleShoppingListResponse, null);
}
function HandleOwnItemShoppingListResponse(response) {
    HandleShoppingListResponse(response);
    if (typeof (myLightWindow.deactivate) == 'function') {
        myLightWindow.deactivate();
    }
}
function ManageSaveList(txtSaveAsID) {
    var txtSaveAs = $(txtSaveAsID);
    if (typeof (txtSaveAs.value) == 'string') {
        var isValid = ValidateRequiredField(txtSaveAs);
        if (isValid) {
            var saveAs = txtSaveAs.value;
            var requestArgs = GSNContext.RequestArguments;
            var url = document.URL;
            ManageListSaveShoppingList(url, requestArgs, saveAs, HandleManageListMenuResponse, null);
        }
    }
}
function HandleManageListMenuResponse(response) {
    if (response.responseXML.firstChild.textContent) {
        $('ManageListMenu').innerHTML = response.responseXML.firstChild.textContent;
    }
    else {
        $('ManageListMenu').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }
    refreshAdPods();
}
function ValidateRequiredField(input) {
    var isValid = false;
    if (typeof (input.value) == 'string') {
        isValid = input.value.length > 0;
    }
    if (!isValid) {
        input.className = 'Invalid';
    }
    return isValid;
}
function ValidateNumber(input) {
    var isValid = false;
    if (typeof (input.value) == 'string') {
        var inputValue = new Number(input.value);
        isValid = inputValue.toString() != 'NaN';
    }
    if (!isValid) {
        input.className = 'Invalid';
    }
    return isValid;
}
function ShowHide(divID) {
    if ($(divID).visible()) {
        $(divID).hide();
    }
    else {
        $(divID).show();
    }
}
function RemoveShoppingListCookie() {
    document.cookie = 'GSN.Cookies.ShoppingList=; path=/;';

    Redirect();
}
function Redirect() {

    var tabLinks = $$('#secondary-navigation a');
    var redirect = '/';

    var link = $$('#secondary-navigation a').find(function(e) { return e.href.toLowerCase().indexOf('/shop/weeklyad.aspx') >= 0; });

    if (link != null) {
        redirect = '/Shop/WeeklyAd.aspx';
    }
    else {
        link = $$('#secondary-navigation a').find(function(e) { return e.href.toLowerCase().indexOf('/shop/product.aspx') >= 0; });

        if (link != null) {
            redirect = '/Shop/Product.aspx';
        }
    }

    document.location = redirect;
}
function NewShoppingList() {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;
    var checkBox = $('cbSaveCurrent');
    var saveCurrent = true;
    SaveShoppingList(url, requestArgs, '', RemoveShoppingListCookie, null);
}
function ChangeListQuantity(elementID, inc) {
    var parentElement = $(elementID);
    var increment = new Number(inc);
    if (increment.toString() == 'NaN') {
        increment = new Number(1);
    }
    var inputs = parentElement.getElementsByTagName('input');
    var itemID;
    var itemTypeID;
    var quantity;
    for (var i = 0; i < inputs.length; i++) {
        var input = inputs[i];
        switch (input.title) {
            case 'quantity':
                quantity = new Number(input.value);
                break;
            case 'ItemID':
                itemID = new Number(input.value);
                break;
            case 'ItemTypeID':
                itemTypeID = new Number(input.value);
                break;
        }
    }
    if (itemID.toString() == 'NaN' || itemTypeID.toString() == 'NaN') {
        return;
    }
    if (quantity.toString() == 'NaN') {
        quantity = new Number(0);
    }
    var newQuantity = quantity + increment;
    if (newQuantity < 1) {
        newQuantity = 1;
    }
    SetShoppingListItemQuantity(itemID, itemTypeID, newQuantity);
}
function SetListQuantity(elementID, update) {
    var parentElement = $(elementID);
    var shoppingListItemID = NaN;
    var itemID = NaN;
    var itemTypeID = NaN;
    var quantity = NaN;
    var weight = new Number(0.0);
    var inputs = parentElement.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        var input = inputs[i];
        switch (input.title) {
            case 'quantity':
                quantity = new Number(input.value);
                break;
            case 'ItemID':
                itemID = new Number(input.value);
                break;
            case 'ItemTypeID':
                itemTypeID = new Number(input.value);
                break;
            case 'ShoppingListItemID':
                shoppingListItemID = new Number(input.value);
                break;
        }
    }
    var selects = parentElement.getElementsByTagName('select');
    if (selects != null && typeof (selects.length) == 'number') {
        for (var i = 0; i < selects.length; i++) {
            var select = selects[0];
            switch (select.title) {
                case 'weight':
                    weight = new Number(select.value);
                    break;
            }
        }
    }
    if (itemID.toString() == 'NaN' || itemTypeID.toString() == 'NaN') {
        if (shoppingListItemID.toString() == 'NaN') {
            return;
        }
    }
    if (quantity.toString() == 'NaN' || quantity < 1) {
        quantity = new Number(1);
    }
    if (weight.toString() == 'NaN') {
        weight = new Number(0.0);
    }

    if (shoppingListItemID && !update) {
        AddShoppingListItemQty(shoppingListItemID, quantity, weight);
    }
    else {
        if (weight > 0) {
            SetShoppingListItemWeight(itemID, itemTypeID, quantity, weight);
        }
        else {
            SetShoppingListItemQuantity(itemID, itemTypeID, quantity);
        }
    }
}
function RemoveListItem(elementID) {
    var parentElement = $(elementID);
    var itemID;
    var itemTypeID;
    var inputs = parentElement.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        var input = inputs[i];
        switch (input.title) {
            case 'ItemID':
                itemID = new Number(input.value);
                break;
            case 'ItemTypeID':
                itemTypeID = new Number(input.value);
                break;
        }
    }
    if (itemID.toString() == 'NaN' || itemTypeID.toString() == 'NaN') {
        return;
    }
    RemoveFromShoppingListByID(itemID, itemTypeID);
}
function SetListComment(elementID) {
    var parentElement = $(elementID);
    var itemID;
    var itemTypeID;
    var comment;
    var productID;
    var productInput;
    var inputs = parentElement.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        var input = inputs[i];
        switch (input.title) {
            case 'comment':
                comment = input.value;
                productInput = input;
                break;
            case 'ItemID':
                itemID = new Number(input.value);
                break;
            case 'ItemTypeID':
                itemTypeID = new Number(input.value);
                break;
            case 'ProductID':
                productID = new Number(input.value);
                break;
        }
    }
    if (itemID > 0 && itemTypeID > 0) {
        SetShoppingListItemComment(itemID, itemTypeID, comment);
        if (productID > 0 && typeof (productInput) == 'object') {
            try {
                SaveComment(productID, productInput.id);
            }
            catch (e) { }
        }
    }
}
function AvailableVarietiesRequired() {
    var hiddenField = $('hfOGSRequiresVarieties');
    var reqired = false;
    if (hiddenField != null) {
        reqired = hiddenField.value == 'true';
    }
    return reqired;
}
function OGSNewShoppingList(url) {
    var requestArgs = GSNContext.RequestArguments;
    var url = document.location = url;
    var checkBox = $('cbSaveCurrent');
    var saveCurrent = true;
    SaveShoppingList(url, requestArgs, '', RemoveShoppingListCookie, null);
}

function CheckSideColumnPosition() {

    var scrollY = document.body.parentNode.scrollTop;
    var scrollX = document.body.parentNode.scrollWidth;
    var sideBar = $('sidebar');
    var headerHeight = $('StoreHeader').clientHeight;
    var sideColumnHeight = sideBar.clientHeight;
    var pageHeight = document.body.parentNode.clientHeight;
    var pageWidth = document.body.parentNode.clientWidth;
    if (scrollY >= headerHeight && pageHeight > sideColumnHeight && pageWidth == scrollX) {
        sideBar.addClassName('Float');
    }
    else {
        sideBar.removeClassName('Float');
    }
}

function HideProductRemove(productID) {
    $$('#product' + productID + ' .divRemoveUpdate').each(function(e) { e.hide(); });
    $$('#product' + productID + ' .ProductUpdateDivButtons').each(function(e) { e.show(); });
}

function HideMyFavoritesRemove(itemID, itemTypeID) {

    var updateDiv = $('ShoppingListItemUpdateDiv:' + itemID + ':' + itemTypeID);
    var addDiv = $('ShoppingListItemAddDiv:' + itemID + ':' + itemTypeID);

    if (updateDiv != null) {
        updateDiv.hide();
    }

    if (addDiv) {
        addDiv.show();
    }
}
