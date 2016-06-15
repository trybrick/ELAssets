function RunAdvancedSearch() {

	var course = $('drpCourse').value;
	var region = $('drpRegion').value;
	var cookTime = $('drpPreparationTime').value;
	var holiday = $('drpHoliday').value;
	var skillLevel = $('drpSkillLevel').value;
	var equipment = $('drpEquipment').value;
	var searchTerm = $('txtSearch').value;
	
	var searchParameters = '';
	var attributelist = '';
	
	if (searchTerm != '') {
		searchParameters += 'SearchTerm:' + searchTerm + ';';
	}

	if (cookTime != '') {
		searchParameters += 'Time:' + cookTime + ';';
	}

	if (skillLevel != '') {
		
		searchParameters += 'SkillLevelList:' +'|' + skillLevel + '|;';
	}

	if (course != '') {
		attributelist += '|' + course;
	}

	if (region != '') {
		attributelist += '|' + region;
	}

	if (holiday != '') {
		attributelist += '|' + holiday;
	}

	if (equipment != '') {
		attributelist += '|' + equipment;
	}
	
	if(attributelist != ''){
		searchParameters += 'AttributeList:' + attributelist + '|;';
	}

	if (searchParameters != '') {					
		var currentLocation = document.location;
		var redirectPath = '/Recipes/RecipeSearchResults.aspx?AdvancedSearch=' + encodeURIComponent(searchParameters);
		
		
		window.location = redirectPath;
	}
	else {
		alert('Please specify search parameters!');
	}
}

var isOpen = new Boolean(false);

function togglePanelSearch(){
	Element.toggleClassName('toggler', 'accordionActive');
    Effect.toggle('PanelSearch','blind', {duration: 1.0});
}

function toggleQuickSearch(){
	Element.toggleClassName('toggler2', 'accordionActive');
    Effect.toggle('PanelQuick','blind', {duration: 1.0});
}

function togglePanelTopRecipes(){
	Element.toggleClassName('toggler3', 'accordionActive');
    Effect.toggle('PanelTopRecipes','blind', {duration: 1.0});
}