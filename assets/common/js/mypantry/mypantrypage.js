function TogglePantryGrid() {

	var categoryID = $('ddlDepartment').value;
	var categoryDivID = 'ProductsGrid:' + categoryID;

	var productGrids = document.getElementsByClassName('LineItem');

	if (typeof(productGrids) == 'object') {
				
		for ( var i = 0; i < productGrids.length; i++) {
						
			var productsDiv = productGrids[i];
			if (categoryID != 0) {
				if (productsDiv.id == categoryDivID) {
					productsDiv.show();
				}
				else {
					productsDiv.hide();
				}
			}
			else {
				productsDiv.show();
			}
		}
	}

	refreshAdPods();
}

function RemoveProduct(productID) {
	var requestArgs = GSNContext.RequestArguments;
	RemoveHouseholdProduct(document.URL, requestArgs, productID, HandleSuccess, HandleFailure);
}

function HandleSuccess() {
	window.location.replace(document.URL);
}

function HandleFailure() {
	alert("Item can not be removed from purchase history."); 
}