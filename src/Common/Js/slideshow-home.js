/* 
Global variables 
	- number of slides,delay time, and css selectors must be defined in XSL containing slideshow.
*/
var interval; // Interval for animation
var isPlaying = false;
var currentIndex = 0;
var inTransition = false;
var timeout = 6000;

document.observe("dom:loaded", function(){
	//only play slideshow if there are multiple entries
	if(totalSlides > 1){
		$(playPauseID).addClassName(playingClass);
		$(playPauseButtonID).addClassName(playingClass);
		interval = setInterval('Next()',delay*1000);
		isPlaying = true;
	} else {
		$('playpause').hide();
	}

	if(totalSlides == 0){
		DisplayBackup();
	}
});


function Transition(element1,element2){
	
	//inTransition = true;
	
			
	var duration = 1;
	
	new Effect.Fade(element1,{duration:duration, queue: { scope: 'slide_show' }});
	new Effect.Appear(element2,{duration:duration, queue: { scope: 'slide_show' }});
	
	setTimeout(function(){}, duration * 1000);
	
	//inTransition = false;
	
}

// Sets current index to previous slide
function Previous(){

	if(inTransition == false){
	
	inTransition = true;
	
	var queue = Effect.Queues.get( 'slide_show' );
	queue.each( function( effect ) { effect.cancel(); } );
	
	GoToSlide(currentIndex - 1);
	clearInterval(interval);
	interval = setInterval('Previous()',timeout);
	
	var delayClickTime = setTimeout("inTransition = false;", 1000);
	}
}


// Sets current index to next slide
function Next(){
	
	if(inTransition == false){

	inTransition = true;
		
	var queue = Effect.Queues.get( 'slide_show' );
	queue.each( function( effect ) { effect.cancel(); } );	
	
	GoToSlide(currentIndex + 1);
	clearInterval(interval);
	interval = setInterval('Next()', timeout);
	
	var delayClickTime = setTimeout("inTransition = false;", 1000);
	
	}
	
}



// Sets current index to selected slide
function GoToSlide(chosenIndex){
	
	if(chosenIndex == currentIndex){
		return;
	}
	
	var nextIndex = chosenIndex;
	if(nextIndex >= totalSlides){
		nextIndex = 0;
	}
	
	if(nextIndex < 0){
		nextIndex = totalSlides -1;
	}
	
	
	var queue = Effect.Queues.get( 'slide_show' );
	queue.each( function( effect ) { effect.cancel(); } );
	
	Transition(slideIDPrefix+currentIndex,slideIDPrefix+nextIndex);
	currentIndex = nextIndex; 
	
}

// Sets Play/Pause button state
function PlayPause(){
	if(isPlaying){
		//pause
		$(playPauseID).removeClassName(playingClass);
		$(playPauseButtonID).removeClassName(playingClass);
		clearInterval(interval);
		isPlaying = false;
	} else {
		//play
		$(playPauseID).addClassName(playingClass);
		$(playPauseButtonID).addClassName(playingClass);
		interval = setInterval('Next()',timeout);
		isPlaying = true;
		Next();
	}
}
// Displays safety backup image in case there's no content loaded
function DisplayBackup() {
	$(failOverID).show();
}