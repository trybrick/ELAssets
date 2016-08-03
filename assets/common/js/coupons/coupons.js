// requires ConsumerSettings.js
function highlightCoupon(couponID){
	var showcoupon = $(couponID); 
	$('couponsFrame' + showcoupon).addClassName('activeCoupon');
	$('addbutton' + showcoupon).style.display = "none"; 
	$('removebutton' + showcoupon).style.display = "block"; 
}

function unhighlightCoupon(couponID){
	var showcoupon = $(couponID); 
	$('couponsFrame' + showcoupon).removeClassName('activeCoupon');
	$('addbutton' + showcoupon).style.display = "block"; 
	$('removebutton' + showcoupon).style.display = "none"; 
}

function swapGridStyles(gridID) {
	var showGridStyle = $(gridID); 
	var gridWrappers = $$('.gridLayout');
	for (i = 1; i<4; i++){
		for(var j = 0; j < gridWrappers.length; j++)
		{
			gridWrappers[j].removeClassName('GridMode' + i);
		}
		$('swapGrid' + i).removeClassName('active');
	}
	for(var j = 0; j < gridWrappers.length; j++)
	{
		gridWrappers[j].addClassName('GridMode' + showGridStyle);
	}
	$('swapGrid' + showGridStyle).addClassName('active');

	if(typeof SetConsumerSetting == 'function') {
		SetConsumerSetting(6, gridID);
	}
}
function highlightCategory(showit) { 
	var showcat = $(showit); 
		
	for (var i = 1; i < states.length; i++){
		$(states[i]).removeClassName('active');
	}  
	$('leftCategory' + showcat).addClassName('active');
}
function sortPrintableCoupons(className) 
{
	document.getElementById('couponsGridWrapper').style.display='block';
	sortItemsByClassName(className);
	document.getElementById('cardCouponsGridWrapper').style.display='none';
}		
function sortDigitalCoupons(className) {
	document.getElementById('cardCouponsGridWrapper').style.display='block';
	sortItemsByClassName(className);	
}
