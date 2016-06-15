if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
	var GSNPageItems = new Object();
}

GSNPageItems.FacebookDeals = {
	Navs: [
		{Type: 'Splash', Name: 'SplashContentNav'},
		{Type: 'Main', Name: 'MainContentNav'},
		{Type: 'Map', Name: 'MapContentNav'}
	],

	Divs: [
		{Type: 'Splash', Name: 'SplashContent'},
		{Type: 'Main', Name: 'MainContent'},
		{Type: 'Map', Name: 'MapContent'}
	],
	
	ToggleContent: function(destinationID){
		GSNPageItems.FacebookDeals.Divs.each(function(item){
			$(item.Name).addClassName('hidden');
		});
		$(destinationID).removeClassName('hidden');
	}
}