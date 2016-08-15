//Advanced Search Sliders

$(function() {
	$( "#calorie-range" ).slider({
		range: true,
		min: 0,
		max: 500,
		values: [ 75, 300 ],
		slide: function( event, ui ) {
			$( "#calorie-amt" ).val( ui.values[ 0 ]+ "calories" + " - " + ui.values[ 1 ] + "calories" );
		}
	});
	$( "#calorie-amt" ).val( $( "#calorie-range" ).slider( "values", 0 ) +  "calories" + 
		" - " + $( "#slider-range" ).slider( "values", 1 ) + "calories"  );
});


$(function() {
	$( "#cholesterol-range" ).slider({
		range: true,
		min: 0,
		max: 500,
		values: [ 0, 300 ],
		slide: function( event, ui ) {
			$( "#cholesterol-amt" ).val( ui.values[ 0 ]+ "mg" + " - " + ui.values[ 1 ] + "mg" );
		}
	});
	$( "#cholesterol-amt" ).val( $( "#cholesterol-range" ).slider( "values", 0 ) + "mg" +
		" - " + $( "#slider-range" ).slider( "values", 1 )   + "mg");
});

$(function() {
	$( "#cooktime-range" ).slider({
		range: true,
		min: 0,
		max: 300,
		values: [ 15, 60 ],
		slide: function( event, ui ) {
			$( "#cooktime-amt" ).val( ui.values[ 0 ]+ "minutes" + " - " + ui.values[ 1 ] + "minutes" );
		}
	});
	$( "#cooktime-amt" ).val( $( "#cooktime-range" ).slider( "values", 0 ) + "minutes" +
		" - " + $( "#slider-range" ).slider( "values", 1 ) + "minutes");
});

$(function() {
/*	var lookup = {
		1: 'Child',
		2: 'Beginner',
		3: 'Intermediate',
		4: 'Amateur Chef',
		5: 'Professional Chef'
	}*/
	
	$( "#skill-range" ).slider({
		range: true,
		min: 1,
		max: 5,
		values: [ 2, 4 ],
		slide: function( event, ui ) {
			$( "#skill-amt" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
		}
	});
	$( "#skill-amt" ).val( $( "#skill-range" ).slider( "values", 0 ) +
		" - " + $( "#slider-range" ).slider( "values", 1 ) );
});

/* $(function() { 
	var lookup = { 1: 'PLAY', 2: 'HEAL', 3: 'RELAX' } 
	$("#slider_style").slider( { 
		value:1, 
		min: 1, 
		max: 3, 
		step: 1, 
		slide: function(event, ui) { 
			$('#style_type').val(lookup[ui.value]); } }); 
			$("#style_type").val( $("#slider_style").slider("value") ); 
});*/



$(function() {
	$( "#fat-range" ).slider({
		range: true,
		min: 0,
		max: 300,
		values: [ 15, 60 ],
		slide: function( event, ui ) {
			$( "#fat-amt" ).val( ui.values[ 0 ]+ "grams" + " - " + ui.values[ 1 ] + "grams" );
		}
	});
	$( "#fat-amt" ).val( $( "#fat-range" ).slider( "values", 0 ) + "grams" +
		" - " + $( "#slider-range" ).slider( "values", 1 ) + "grams");
});

$(function() {
	$( "#carb-range" ).slider({
		range: true,
		min: 0,
		max: 300,
		values: [ 15, 60 ],
		slide: function( event, ui ) {
			$( "#carb-amt" ).val( ui.values[ 0 ]+ "grams" + " - " + ui.values[ 1 ] + "grams" );
		}
	});
	$( "#carb-amt" ).val( $( "#carb-range" ).slider( "values", 0 ) + "grams" +
		" - " + $( "#slider-range" ).slider( "values", 1 ) + "grams");
});

