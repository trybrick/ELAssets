function SetUserRatingByType(ratingValue, ratingType, ratingContainerID) {
	var ratingContainer = $(ratingContainerID);
	
	if(ratingValue > 0) {
		if(ratingContainer != null) {
			var ratingControl = new Control.Rating(ratingContainer, { value: ratingValue });	
		}
	}	
	else {
	  if (ratingContainer != null) {
		  var ratingControl = new Control.Rating(ratingContainer, { rated: false });
		  
	  }
  	}
}

function OnRecipeRated(userdata, average, total){

	SetGlobalRating('Recipe', average, total);
}

function SetRating(inputid, ratevalue) {
	var ratingInput = $(inputid);

	var data = $$('input[title=' + inputid + ']');
	
	if(data != undefined && data.length > 0){
		var dataItem = data.first();
		
		var type = ratingInput.hasAttribute('item') ? ratingInput.readAttribute('item') : '';
		if(type.length > 0){
			type = type.toLowerCase();
			RateItem(ratevalue, type, dataItem.value);
			SetUserRatingByType(ratevalue, type, inputid);
		}
	}
	$('pleaseRateText').innerHTML = "Your rating";
}

function SetRecipeRating(ratevalue){
	var inputid = $$('input[title="RecipeRatingContainer"]');
	SetRating(inputid, ratevalue);
}

function SetGlobalRating(type, averageRating, totalNumOfRatings){
	var globalRatingInput = $(type + 'GlobalRatingContainer');
	
	if(globalRatingInput != undefined && globalRatingInput != null){
		SetGlobalRatingValue(globalRatingInput.id, averageRating, totalNumOfRatings);
	}
}

function SetGlobalRatingValue(globalRatingControlID, averageRating, totalNumOfRatings){
	var textItems = $$('span[class=ratedText]');
	
	var globalRating = new Control.Rating(globalRatingControlID, { value: averageRating, rated: true });
	
	if(textItems != undefined && textItems.length > 0){
		//we need the second item in the display
		var textItem = textItems[0];
		textItem.innerHTML = 'Rated ';

		textItem = textItems[1];
		textItem.innerHTML = ' by ' + totalNumOfRatings + ' users';
	}
}

function SetUserRating(ratingControlID, ratevalue) {
  var userRating = document.getElementById('userrating');
  var userRatingControl = document.getElementById(ratingControlID);

  var UserRecipeRating = document.getElementById('UserRecipeRating');

  if (UserRecipeRating != null) {
	  UserRecipeRating.style.display = 'block';
	  UserRecipeRating.style.visibility = 'visible';
  }

  if (ratevalue > 0) {
	  if (userRating != null) {
		  userRating.innerHTML = 'You have rated this recipe.';
	  }

	  if (userRatingControl != null) {
		  var rating = new Control.Rating(ratingControlID, { value: ratevalue, rated: false });
	  }
  }
  else {
	  if (userRating != null) {
		  userRating.innerHTML = 'Please rate this recipe.';
		  var rating = new Control.Rating(ratingControlID);
	  }
  }
}

function RateItem(ratingValue, ratingType, itemID) {	
	//var service = new GSNServices.RatingsService();
	
	switch(ratingType) {
		case 'wine':
			RateWine(itemID,ratingValue);	
			break;
		case 'video':
			RateVideo(itemID,ratingValue);	
			break;
		case 'recipe':
			GSNServices.RatingsService.RateRecipe(itemID,ratingValue);	
			//RateRecipe(itemID,ratingValue);	
			break;
		default:
			return;
	}
}

/** 
* Attach to 'onkeyup' event to update characters left for user input field.
* adds 'error' class when chars left is below 10.
* 
* @param 	textElement: input control id
* @param	counterElement: element that contains char count value (int)
* @return	NULL
**/
function UpdateCharCount(textElement, counterElement) {
	var maxChars = 150;
	var txt = $(textElement).value;
	var charCount = txt.length;
	var charCountElement = $(counterElement);
	if(charCount <= maxChars) {
		var charLeft = maxChars - charCount;
		charCountElement.innerHTML = charLeft + ' ';
		if(charLeft <= 10) {
			if($(charCountElement).up()) {
				$(charCountElement).up().addClassName('error');
			}
		} else {
			if($(charCountElement).up()) {
				$(charCountElement).up().removeClassName('error');
			}
		}
	} else {
		txt = txt.substring(0,maxChars);
		$(textElement).value = txt;
	}
}