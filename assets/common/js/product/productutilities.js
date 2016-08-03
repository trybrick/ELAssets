function AddProductLineItemToList(productID, quantitySelect, showDiv, hideDiv) {

    var quantity = 1;

    if ($(quantitySelect) != null) {
        quantity = $(quantitySelect).value;
    }

	AddToShoppingListWithQuantity(productID, 3, quantity);

	$(hideDiv).hide();
	$(showDiv).show();

	HighlightLineItem(productID, true)
}

function AddProductLineItemToListWithWeight(productID, weightSelect, quantitySelect, showDiv, hideDiv) {

	var quantity = 1;
	var weight = 1;

	if ($(quantitySelect) != null) {
	    quantity = $(quantitySelect).value;
	}

	if ($(weightSelect) != null) {
	    weight = $(weightSelect).value;
	}
	
	AddWeightedToShoppingList(productID, 3, weight, quantity);

	$(hideDiv).hide();
	$(showDiv).show();
}

function changeQuantity(quantitySelect, increment, maxValue) {

	if ($(quantitySelect) != null) {

		var minValue = 0;
		var value = Math.abs($(quantitySelect).value);
		var newValue = increment + value;

		if ((0 < newValue) && (newValue <= maxValue)) {
			
			$(quantitySelect).value = increment + value;
		}
		else if (newValue > maxValue) {

			$(quantitySelect).value = maxValue;
		}
		else {
			
			$(quantitySelect).value = minValue;
		}
	}
}

function UpdateQuantityInShoppingList(shoppingListItemID, quantitySelect) {
	
	var quantity = $(quantitySelect).value;

	SetShoppingListItemQuantity(shoppingListItemID, 3, quantity);
}

function UpdateWeightInShoppingList(itemID, weightSelect, quantitySelect) {

    var weight = $(weightSelect).value;
    var quantity = $(quantitySelect).value;

	SetShoppingListItemWeight(itemID, 3, quantity, weight);
}

function RemoveProductFromShoppingList(productID, showDiv, hideDiv) {

	RemoveFromShoppingListByID(productID, 3);

	$(hideDiv).hide();
	$(showDiv).show();

	HighlightLineItem(productID, false)
}

function AddSearchProductToList(productID, quantitySelect, showDiv, hideDiv) {

    var quantity = $(quantitySelect).value;

    AddToShoppingListWithQuantity(productID, 3, quantity);

    $(hideDiv).hide();
    $(showDiv).show();

    HighlightLineItem(productID, true)
}

function AddSearchProductToListWithWeight(productID, quantitySelect, showDiv, hideDiv) {

    var weight = $(quantitySelect).value;

    AddWeightedToShoppingList(productID, 3, weight);

    $(hideDiv).hide();
    $(showDiv).show();

    HighlightLineItem(productID, true)
}

function HighlightLineItem(productID,highlight) {

    if (highlight == true) {
        $('product' + productID).addClassName('activeProduct');
    }

    else {
        $('product' + productID).removeClassName('activeProduct'); 
    }
}
