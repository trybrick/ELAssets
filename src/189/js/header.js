document.observe('dom:loaded',attachEventHandlers);

var animationTime = 0.2;

function attachEventHandlers() {
try {
	if($('cancelStore')){
		$('cancelStore').observe('mouseover',showStoreToolTip);
		$('cancelStore').observe('mouseout',hideStoreToolTip);
	}
	$('searchbox_submit').observe('click', submitLocationSearch);
} catch(error) {
	alert(error);
}
	
}

// Hides consumer store and replaces with store search.
function changeMyStore(){
    $('myStore').slideUp('fast');
    $('searchwrapper').slideDown('slow');
}

function showStoreToolTip() {
	var tooltip = $('cancelStore').next("em");
	tooltip.appear( { duration: animationTime } );
	//tooltip.morph('top:21px');
	new Effect.Morph (tooltip, {
		style:'top:21px',
		duration: animationTime
	});
}

function hideStoreToolTip() {
	var tooltip = $('cancelStore').next("em");
	tooltip.appear( { duration: animationTime, from:1.0, to:0.0 } );
	//tooltip.morph('top:31px');
	new Effect.Morph (tooltip, {
		style:'top:31px',
		duration: animationTime
	});
}

function submitLocationSearch() {
	var zip = $('searchbox').value;
	window.location.replace('http://superonefoods.com/locator/default.aspx?zip='+zip);
}

/* This is the jQuery version of hover effect

$("#myStore a").hover(function() {
        $(this).next("em").stop(true, true).animate({opacity: "show", top: "21"}, "fast");
}, function() {
        $(this).next("em").animate({opacity: "hide", top: "31"}, "fast");
}); 
*/