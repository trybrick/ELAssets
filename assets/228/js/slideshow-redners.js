/* 
Global variables 
	- number of slides,delay time, and css selectors must be defined in XSL containing slideshow.
*/
var orderingInterval; // Interval for animation
var orderingIsPlaying = false;
var orderingCurrentIndex = 0;
var orderingInTransition = false;

document.observe("dom:loaded", function(){
	//only play slideshow if there are multiple entries
	if(ordering_totalSlides > 1){
		orderingInterval = setInterval('orderingNext()',ordering_delay*1000);
		orderingIsPlaying = true;
	}
	Next();
});


function orderingTransition(element1,element2){
			
	var orderingDuration = 1;
	
	new Effect.Fade(element1,{duration:orderingDuration, queue: { scope: 'orderingSlideShow' }});
	new Effect.Appear(element2,{duration:orderingDuration, queue: { scope: 'orderingSlideShow' }});
	
	setTimeout(function(){}, orderingDuration * 1000);
	
	
}

// Sets current index to next slide
function orderingNext(){
	
	if(orderingInTransition == false){

	orderingInTransition = true;
		
	var orderingQueue = Effect.Queues.get( 'slide_show' );
	orderingQueue.each( function( effect ) { effect.cancel(); } );	
	
	orderingGoToSlide(orderingCurrentIndex + 1);
	clearInterval(orderingInterval);
	orderingInterval = setInterval('orderingNext()', 6000);
	
	var delayClickTime = setTimeout("orderingInTransition = false;", 1000);
	
	}
	
}

// Sets current index to selected slide
function orderingGoToSlide(orderingChosenIndex){
	
	if(orderingChosenIndex == orderingCurrentIndex){
		return;
	}
	
	var orderingNextIndex = orderingChosenIndex;
	if(orderingNextIndex >= ordering_totalSlides){
		orderingNextIndex = 0;
	}
	
	if(orderingNextIndex < 0){
		orderingNextIndex = ordering_totalSlides -1;
	}
		
	var orderingOueue = Effect.Queues.get( 'orderingSlideShow' );
	orderingOueue.each( function( effect ) { effect.cancel(); } );
	
	orderingTransition(ordering_slideIDPrefix+orderingCurrentIndex,ordering_slideIDPrefix+orderingNextIndex);
	orderingCurrentIndex = orderingNextIndex; 
	
}