if (typeof (GSNServices) == 'undefined' || GSNServices == null) {
    var GSNServices = new Object();
}

GSNServices.ConsumerFavorites = {
	ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/ConsumerFavorites.asmx/',
	ServiceCommunicationMethod: 'post',
	ContentType: 'application/json; charset=utf-8',
	
	Types: {
		Product: 1
	},
	
	Klasses: {
		IsFavorite: 'favorite-added',
		IsNotFavorite: 'not-favorite',
		IsFavoriteInderterminate: 'favorite-added-loading',
		IsNotFavoriteInderterminate: 'not-favorite-loading',
		IsAddAll: 'add-all-favorites',
		IsAddAllInderterminate: 'add-all-favorites-loading'
	},
	
	Titles: {
		IsFavoriteTitle: 'This item is a favorite. Click to remove from your favorites.',
		IsNotFavoriteTitle: 'This item is not a favorite. Click to add this item to your favorites.'
	},

	//the request body for both requests is the same
	GetRequestBody: function(requestArgs, itemID, typeID) {
		var request = '{ requestArgs:' + '\'' + requestArgs + '\''
			+ ',itemid:' + itemID
			+ ',itemtypeid:' + typeID
			+ '}';
			
		return request;
	},
	
	GetAddAllRequestBody: function(requestArgs, items, categoryID){
		var request = '{ requestArgs:' + '\'' + requestArgs + '\''
			+ ',items:' + Object.toJSON(items)
			+ ', categoryid:' + categoryID
			+ '}';
			
		return request;
	},
	
	Add: function(itemID, typeID){
	
		var postBody = this.GetRequestBody(GSNContext.RequestArguments, itemID, typeID);
		
		var request = new Ajax.Request(this.ServiceURL + 'SaveConsumerFavorite', {
			method: this.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: this.OnSuccess,
			onFailure: this.OnFail
		});
	},
	
	AddAll: function(items, categoryID){
		var postBody = this.GetAddAllRequestBody(GSNContext.RequestArguments, items, categoryID);
		
		var request = new Ajax.Request(this.ServiceURL + 'AddToShoppingList', {
			method: this.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: this.OnSuccessAddToList,
			onFailure: this.OnFail,
			evalJSON: true
		});

	},
	
	Remove: function(itemID, typeID){
		var postBody = this.GetRequestBody(GSNContext.RequestArguments, itemID, typeID);
		
		var request = new Ajax.Request(this.ServiceURL + 'RemoveConsumerFavorite', {
			method: this.ServiceCommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: this.OnSuccess,
			onFailure: this.OnFail
		});
	},
	
	Toggle: function(sourceID, itemID, typeID){
		var source = $(sourceID);
		
		if(source != undefined && source != null){
		
			//pull the original state
			var hasKlass = source.hasClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavorite);

			// change the display
			if(hasKlass){
				source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavorite);
				source.addClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavoriteInderterminate);
				
				GSNServices.ConsumerFavorites.Add(itemID, typeID);
			}
			else{
				source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsFavorite);
				source.addClassName(GSNServices.ConsumerFavorites.Klasses.IsFavoriteInderterminate);
				
				GSNServices.ConsumerFavorites.Remove(itemID, typeID);
			}
		}
	},
	
	OnSuccess: function(response){
		var responseValue = null;

		if (response.responseJSON.d) {
			responseValue = response.responseJSON.d;
		}
		else if (response.responseText) {
			responseValue = response.responseText;
		}
		
		if(responseValue == null){
			alert('Save failed.  Please refresh this page.');
		}
		
		var responseItems = responseValue.split('_');
		var sourceID = 'favorite_' + responseItems[0] + '_' + responseItems[1];
		var source = $(sourceID);
		
		if(responseItems[2] == 'False'){
			//remove any classes and just add in the not favorite - save failed
			source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsFavoriteInderterminate);
			source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavoriteInderterminate);
			source.addClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavorite);
			
			alert('Save failed.  Please try again.');
			return;
		}

		
		if(source != undefined && source != null){
		
			//toggle based upon the indertimnate "loading" class
			var hasKlass = source.hasClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavoriteInderterminate);
			
			if(hasKlass){
				source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavoriteInderterminate);
				source.addClassName(GSNServices.ConsumerFavorites.Klasses.IsFavorite);
				source.writeAttribute('title', GSNServices.ConsumerFavorites.Titles.IsFavoriteTitle);
			}
			else{
				source.removeClassName(GSNServices.ConsumerFavorites.Klasses.IsFavoriteInderterminate);
				source.addClassName(GSNServices.ConsumerFavorites.Klasses.IsNotFavorite);
				source.writeAttribute('title', GSNServices.ConsumerFavorites.Titles.IsNotFavoriteTitle);
			}
			
			//don't process anything else
			if(hasKlass){
				return;
			}
		}
		
		try{
			//if we are on the Favorites Page
			if(typeof (GSNPageItems) != 'undefined' || GSNPageItems != null)
			{
				if(GSNPageItems.ConsumerFavorites.IsFavoritesPage == true)
				{
					GSNPageItems.ConsumerFavorites.HideDisplay(source);
				}
			}
		}
		catch(err){ 
			//alert(err);	
		}
	},
	
	OnSuccessAddToList: function(response){
		if(response== null){
			alert('Save failed.  Please refresh this page.');
		}

		try{

			var obj = response.responseJSON.d;
					
			if(obj .Success == true){
				$('ShoppingListItemsDisplay').innerHTML = obj .ShoppingListDisplay;

				var categoryID = $(GSNPageItems.ConsumerFavorites.IDs.SelectControl).value;
				
				GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments = (categoryID == 0);
				
				if(GSNPageItems.ConsumerFavorites.IsDisplayingAllDepartments){
					$('favorites-wrapper').innerHTML = obj .FavoritesDisplay;
				}
				else{
					$('category' + categoryID + '-wrapper').innerHTML = obj .FavoritesDisplay;
				}
				
				//pull the current state
				var hasKlass = $(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).hasClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAllInderterminate);

				// change the display
				if(hasKlass){
					$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).removeClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAllInderterminate);
					$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).addClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAll);
				}
				else{
					$(GSNPageItems.ConsumerFavorites.IDs.AddAllControl).addClassName(GSNServices.ConsumerFavorites.Klasses.IsAddAll);
				}
				
				//don't process anything else
				if(hasKlass){
					return;
				}
			}
		}
		catch(err) {
			//alert(err);
		}		
	},
	
	OnFail: function(response){
		if(response.status== 500){
			window.location.reload();
			return;
		}

		alert('Save failed.  Please refresh this page.');
	}
}