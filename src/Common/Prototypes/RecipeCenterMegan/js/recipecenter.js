	function toggleMyDiv() {
		Effect.toggle('advancedSearch','slide',{ duration: 0.2 });
		return false;
		}


		function setSliders() {
		
	
		
		// Sliders for Advanced Search Drop Down
		var handles = ['trackcals_handle_min', 'trackcals_handle_max'];
		var trackcals = new Control.Slider(handles, 'trackcals', {
  			range: $R(0, 2000),
   			values: $R(0, 2000),
   			sliderValue: [300, 1700],
    		spans: ["trackcals_slider_span"],
    		restricted: true,
    		onSlide: function(v) {
               	$('slidecals').innerHTML = 'Calorie Range: '+v[0]+'-'+v[1];
          		}
			});
	
       	var handles = ['trackchol_handle_min', 'trackchol_handle_max'];
		var trackchol = new Control.Slider(handles, 'trackchol', {
  		range: $R(0, 2000),
   		values: $R(0, 2000),
   		sliderValue: [300, 1700],
    	spans: ["trackchol_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slidechol').innerHTML = 'Cholesterol (mg): '+v[0]+'-'+v[1];
          		}
		});
       	
       	var handles = ['tracktime_handle_min', 'tracktime_handle_max'];
		var tracktime = new Control.Slider(handles, 'tracktime', {
  		range: $R(0, 180),
   		values: $R(0, 180),
   		sliderValue: [0, 180],
    	spans: ["tracktime_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slidetime').innerHTML = 'Minutes: '+v[0]+'-'+v[1];
          		}
		});
       	
       	var handles = ['trackskill_handle_min', 'trackskill_handle_max'];
		var trackskill = new Control.Slider(handles, 'trackskill', {
   		range: $R(0, 5),
   		values: [0,1,2,3,4, 5],
   		sliderValue: [0, 5],
    	spans: ["trackskill_slider_span"],
    	onSlide: function(v) {
               	$('slideskill').innerHTML = 'Skill Level: '+v[0]+'-'+v[1];
          		}
		});
	
      	var handles = ['trackfat_handle_min', 'trackfat_handle_max'];
		var trackfat = new Control.Slider(handles, 'trackfat', {
  		range: $R(0, 180),
   		values: $R(0, 180),
   		sliderValue: [0, 180],
    	spans: ["trackfat_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slidefat').innerHTML = 'Total Fat(g): '+v[0]+'-'+v[1];
          		}
		});
       
       
       
       	var handles = ['trackcarbs_handle_min', 'trackcarbs_handle_max'];
		var trackcarbs = new Control.Slider(handles, 'trackcarbs', {
  		range: $R(0, 180),
   		values: $R(0, 180),
   		sliderValue: [0, 180],
    	spans: ["trackcarbs_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slidecarbs').innerHTML = 'Carbs(g): '+v[0]+'-'+v[1];
          		}
		});
       	
       	var handles = ['trackprot_handle_min', 'trackprot_handle_max'];
		var trackprot = new Control.Slider(handles, 'trackprot', {
  		range: $R(0, 180),
   		values: $R(0, 180),
   		sliderValue: [0, 180],
    	spans: ["trackprot_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slideprot').innerHTML = 'Protein(g): '+v[0]+'-'+v[1];
          		}
		});
       	
       	var handles = ['tracksalt_handle_min', 'tracksalt_handle_max'];
		var tracksalt = new Control.Slider(handles, 'tracksalt', {
  		range: $R(0, 2500),
   		values: $R(0, 2500),
   		sliderValue: [0, 2500],
    	spans: ["tracksalt_slider_span"],
    	restricted: true,
    	onSlide: function(v) {
               	$('slidesalt').innerHTML = 'Sodium(mg): '+v[0]+'-'+v[1];
          		}
		});	

		$('advancedSearch').style.display = "none";
       	
		}