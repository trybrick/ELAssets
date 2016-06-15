document.observe('dom:loaded', function() {
	if(typeof GSNServices != 'object' || GSNServices == null) {
		return;
	}

	GSNServices.YouTechService.ValidateCardNumber('card-validation-message');
	GSNServices.YouTechService.LoadYouTechCoupons('card-coupons');

	var showDescriptionLink = $('show-description');
	if(showDescriptionLink != null) {
		showDescriptionLink.observe('mouseover', showCouponHeaderDescription);
		showDescriptionLink.observe('mouseout', hideCouponHeaderDescription);
		showDescriptionLink.style.display = 'block';
	}
});


function showCouponHeaderDescription(e) {
	// unregister hover event
	var element = e.element();
	if(element != null) {
		element.stopObserving('mouseover',showCouponHeaderDescription);
	}

	// display the tooltip
	var descriptionDiv = getCouponHeadingElement();
	if(descriptionDiv != null) {
		descriptionDiv.style.display = 'block';
	}
}

function hideCouponHeaderDescription(e) {
	//re-register hover event
	var element = e.element();
	if(element != null) {
		element.observe('mouseover',showCouponHeaderDescription);
	}

	var descriptionDiv = getCouponHeadingElement();
	if(descriptionDiv != null) {
		descriptionDiv.style.display = 'none';
	}
}

function getCouponHeadingElement() {
	try {
		var headingList = $$('#cardCouponsHeading h3');
		var descriptionDiv = headingList[0];
	} catch(e) {
		// IE 9 can't handle prototype $$ function
		var couponHeadingDiv = document.getElementById('cardCouponsHeading');
		if(couponHeadingDiv) {
			headingList = couponHeadingDiv.getElementsByTagName('h3');
			descriptionDiv = headings[0];
		}
	}

	return descriptionDiv;
}
