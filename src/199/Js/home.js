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

				RunSearch(searchParameters);
			}

			function RunCategorySearch() {

				var course = $('PanelHoliday_drpCourse').value;
				var holiday = $('PanelHoliday_drpHoliday').value;

				var searchParameters = '';
				var attributeList = '';

				if (course != '') {
					attributeList += '|' + course;
				}

				if (holiday != '') {
					attributeList += '|' + holiday;
				}
				
				if(attributeList != ''){
					searchParameters = 'AttributeList:' + attributeList + '|;';
				}

				RunSearch(searchParameters);
			}

			function RunQuickSearch() {

				var recipeTitle = $('txtQuickSearch').value;
				var searchParameters = '';

				if (recipeTitle != '') {
					searchParameters += 'SearchTerm:' + recipeTitle + ';';
				}

				RunSearch(searchParameters);
			}

			function RunSearch(searchParameters) {

				if (searchParameters != '') {
					//alert(searchParameters);

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
			    Element.toggleClassName('toggler', 'accordion_toggle');
			    Element.toggleClassName('toggler', 'accordion_toggle_active');
			    Effect.toggle('PanelSearch','blind', {duration: 1.0});
			}

			  function toggleQuickSearch(){
			    Element.toggleClassName('toggler2', 'accordion_toggle');
			    Element.toggleClassName('toggler2', 'accordion_toggle_active');
			    Effect.toggle('PanelQuick','blind', {duration: 1.0});
			}

			  function toggleEasySearch(){
			    Element.toggleClassName('toggler3', 'accordion_toggle');
			    Element.toggleClassName('toggler3', 'accordion_toggle_active');
			    Effect.toggle('PanelEasy','blind', {duration: 1.0});
			}
			  function toggleHolidaySearch(){
			    Element.toggleClassName('toggler4', 'accordion_toggle');
			    Element.toggleClassName('toggler4', 'accordion_toggle_active');
			    Effect.toggle('PanelHoliday','blind', {duration: 1.0});
			}