if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
	var GSNPageItems = new Object();
}

GSNPageItems.ConsumerFavorites = {
	IsFavoritesPage: true,
	
	IDs: {
		Main: 'ConsumerFavoritesPage',
		FavoritesControls: 'favorites-controls',
		SelectControl: 'ddlDepartment',
		AddAllControl: 'add-all-favorites-control',
		NoFavorites: 'noConsumerFavorites'
	},
	
	Klasses: {
		Group: 'favoriteCategory',
		ProductAddToListControl: 'ProductAddToListControl'
	},
	
	IsDisplayingAllDepartments: true,
	
	OnDepartmentSelect: function(){
		var source = $(GSNPageItems.ConsumerFavorites.IDs.SelectControl);
		var categoryID = source.value;
		
		GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments = (categoryID == 0);
	
		for(var i = 0; i < source.children.length; i++){
			var x = source.children[i];
			
			if(x == null || x.tagName != 'OPTION'){
				continue;
			}
			
			var itemID = x.value;
			var xID = 'category' + itemID + '-wrapper';

			if(GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments || itemID == categoryID){
				if(itemID > 0){
					$(xID).show();
				}
			}
			else{
				if(itemID >  0){
					$(xID).hide();
				}
			}

		}

		/*
		var items = $$('#' + GSNPageItems.ConsumerFavorites.IDs.Main + ' .' + GSNPageItems.ConsumerFavorites.Klasses.Group);
		
		items.each(function(item){
			var itemID = item.identify();
		
			if((itemID == 'category' + categoryID) || categoryID == 0){
				item.show();
			}
			else{
				item.hide();
			}
		});
		*/
	},
	
	OnAddAllToList: function(){
		var items = new Array();
		
		var klassName = '';
		var categoryID = $(GSNPageItems.ConsumerFavorites.IDs.SelectControl).value;
		
		if(GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments == true){
			klassName = GSNPageItems.ConsumerFavorites.IDs.Main;
		}
		else{
			klassName  = 'category' + categoryID;
		}
		
		//find all the table rows within the div
		var rows = $$('#' + klassName + ' table tbody tr');

		rows.each(function(row){
			var rowID = row.identify();
			
			if(!rowID.startsWith('product')){
				return;
			}

			
			/*
			var rowIdentifier = '#' + rowID;
			
			
			var addDiv = $$(rowIdentifier  + ' .ProductUpdateDivButtons').first();
			var updateDiv = $$(rowIdentifier  + ' .divRemoveUpdate').first();
			
			if(typeof(addDiv) != 'undefined' && addDiv != null && addDiv.visible()){
				var addButton = $$(rowIdentifier  + ' .add').first();
				
				if(typeof(addButton) != 'undefined' && addButton != null){
					addButton.simulate('click');
					return;
				}
			}

			if(typeof(updateDiv) != 'undefined' && updateDiv!= null && updateDiv.visible()){
				var updateButton = $$(rowIdentifier  + ' .update').first();
				var updateIncrementButton = $$(rowIdentifier + ' .ProductAddToListPlus').first();
				
				if(typeof(updateIncrementButton) != 'undefined' && updateIncrementButton != null){
					updateIncrementButton.simulate('click');
				}
			
				if(typeof(updateButton) != 'undefined' && updateButton!= null){
					updateButton.simulate('click');
					return;
				}
			}
			*/
			
			var productID = rowID.replace('product', '');

			var quantity = $$('#' + rowID + ' .' + GSNPageItems.ConsumerFavorites.Klasses.ProductAddToListControl + ' input').first();
			var weight = $$('#' + rowID + ' .' + GSNPageItems.ConsumerFavorites.Klasses.ProductAddToListControl + ' select').first();
			
			var rowParam = {
				ItemID: new Number(productID),
				ItemTypeID: 1,
				Quantity: (quantity != 'undefined' && quantity != null && Object.isNumber(quantity.value)) ? new Number(quantity.value) : 1,
				Weight: (weight != 'undefined' && weight != null) ? weight.value : null
			};
			
			items.push(rowParam);

		});
		
		
		//pull the original state
		var hasKlass = $(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).hasClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAll);

		// change the display
		if(hasKlass){
			$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).removeClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAll);
			$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).addClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAllInderterminate);
			
			GSNServices.ConsumerFavorites.AddAll(items, categoryID);
		}
		else{
			$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).addClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAllInderterminate);
			
			GSNServices.ConsumerFavorites.AddAll(items, categoryID);
		}
		
	},
	
	HideDisplay: function(source){
		var names = $w(source.className);
		var categoryID = 0;
		
		//itterate over the class names
		names.each(function(name){
			//find the category
			if(name.startsWith('categoryid:')){
				var data = name.split(':');
				categoryID = data[1];
			}
		});
		
		if(categoryID > 0){
			//define the main parent div
			var parentKlassName = 'category' + categoryID;
			var parent = $(parentKlassName);
			var table;
			
			for(var i = 0; i < parent.childNodes.length; i++){
				var x = parent.childNodes[i];
				
				if(x != null && x.tagName == 'TABLE'){
					table = x;
					break;
				}
			}
			
			//find all the table rows within the div
			//var rows = $$('#' + parentKlassName + ' table tbody tr');
			var rows = $A(table.rows);
			
			if(rows != undefined && rows != null && rows.length > 0)
			{
				var visibleRows = rows.findAll(function(e){ return e.visible(); });
				
				//do > 2 here because there is the header row that is not actually a row we care about
				if(visibleRows.size() > 2){
					//if there are multiple VISIBLE items, hide the one
					var sourceID = source.identify();
					var sourceItems = sourceID.split('_');
					var productID = sourceItems[1];
					
					var productDisplayID = 'product' + productID;
					
					$(productDisplayID).remove();
					
					
					var displayRows = visibleRows.reject(function(r) { 
						return r.identify() == productDisplayID; 
					});
					
					//reset the grid display to account for the missing row
					for(var i = 0; i < displayRows.size(); i++){
						if(i == 0){
							//header row
							continue;
						}
						
						var row = displayRows[i];
						
						if((i % 2) == 0){
							GSNPageItems.ConsumerFavorites.SetRowDispaly(row, 'GridAlternatingItem', 'GridItem');
						}
						else{
							GSNPageItems.ConsumerFavorites.SetRowDispaly(row, 'GridItem', 'GridAlternatingItem');
							
						}
					}
				}else{
					//remove it from the display
					var categoryKlassID = 'category' + categoryID; 
					
					$(categoryKlassID).remove();
					
					var option = $('categoryOption' + categoryID);
					
					if(option != undefined && option != null){
						option.remove();
					}
					
					if(!GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments){
						$(GSNPageItems.ConsumerFavorites.IDs.SelectControl).value = 0;
						GSNPageItems.ConsumerFavorites.OnDepartmentSelect();
					}
					
					var currentOptions = $$('#' + GSNPageItems.ConsumerFavorites.IDs.SelectControl + ' option');
					if(currentOptions != undefined && currentOptions != null && currentOptions.length == 1){
						$(GSNPageItems.ConsumerFavorites.IDs.NoFavorites).removeClassName('hidden');
						$(GSNPageItems.ConsumerFavorites.IDs.FavoritesControls).hide();
						$('NoFavoritesImage').hide();
					}
				}
			}
		}
	},
	
	SetRowDispaly: function(row, oldKlass, newKlass){
		if(row.hasClassName(newKlass)){
			return;
		}
		
		row.removeClassName(oldKlass);
		row.addClassName(newKlass);
	}
};