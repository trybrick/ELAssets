if (typeof (GSNServices) == 'undefined' || GSNServices == null) {
    var GSNServices = new Object();
}

if (typeof(GSNServices.UnwrapResponse) != 'function') {
	GSNServices.UnwrapResponse = function (response) { 
		var responseValue = null;
		
		if (response.responseXML.firstChild.textContent) {
			responseValue = response.responseXML.firstChild.textContent;
		}
		else if (response.responseXML.documentElement.firstChild.nodeValue) {
			responseValue = response.responseXML.documentElement.firstChild.nodeValue;
		}
		
		return responseValue;
	};
}

GSNServices.YouTechService = {
	ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/YouTech.asmx/',
	CommunicationMethod: 'post',
	ContentType: 'application/x-www-form-urlencoded',
	
	GetCheckCardNumberRequest: function (requestArguments) {
		var request = 'requestArguments=' + encodeURIComponent(requestArguments);
		return request;
	},
	
	CheckCardNumber: function (requestArguments, onSuccess, onFail) {
		var postBody = this.GetCheckCardNumberRequest(requestArguments);
		
		var request = new Ajax.Request(this.ServiceURL + 'CheckCardNumber', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
	},
	
	ValidateCardNumber: function (displayDivID) {
		if (typeof(GSNContext) != 'object' || typeof(GSNContext.RequestArguments) == 'undefined') {
			return;
		}
		
		// JavaScript does not pass 'this' to inner functions.
		var that = this;

		this.CheckCardNumber(GSNContext.RequestArguments,
			function (response) {
				var responseContent = GSNServices.UnwrapResponse(response);
				var displayDiv = $(displayDivID);
				if(displayDiv && responseContent != '') {
					displayDiv.innerHTML = responseContent;
					displayDiv.style.display = 'block';
				} else {
					if(console) {
						console.log("Element with ID: "+displayDivID+", not found.");
					}
				}
			},
			null);
	},

	AddYouTechCoupon: function (couponID, itemID, display) {
		var element = document.getElementById(display);
		var loadingDiv = document.getElementById("loading"+couponID);
		var that = this; // JavaScript does not pass reference 'this' to inner functions.

		if (couponID == null || typeof(couponID) != 'number') {
			return;
		}

		if (typeof(GSNContext) != 'object' || GSNContext == null) {
			return;
		}

		if(loadingDiv != null)
		{
			var loadingAnimation = new Image();
			loadingAnimation.src = "http://" + window.location.host + "/Assets/Common/Images/ajax-loader.gif";
			loadingDiv.appendChild(loadingAnimation);
			loadingDiv.style.display = "block";
		}

		this.AddCouponToCard(GSNContext.RequestArguments,
			couponID,
			function (response) {
				var responseValue = GSNServices.UnwrapResponse(response);
				if (responseValue != null && responseValue != '') {
					if(element != null)
					var quote = "'";
					{
						element.innerHTML ='<span class="addCouponResponseMessage">Coupon Added to Card</span>';
					}
				}

				if(loadingDiv != null)
				{
					loadingDiv.removeChild(loadingAnimation);
					loadingDiv.style.display = "none";
				}
				if(typeof AddToShoppingList == 'function')
				{
					AddToShoppingList(itemID, 13);
				}
			},
			null);
	},

	AddCouponToCard: function (requestArguments, couponID, onSuccess, onFail) {
		var postBody = this.GetAddCouponToCardRequest(requestArguments, couponID);

		var request = new Ajax.Request(this.ServiceURL + 'AddCouponToCard', {
			method: this.CommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});
	},

	GetAddCouponToCardRequest: function (requestArguments, couponID) {
		var request = 'requestArguments=' + encodeURIComponent(requestArguments)
					+ '&couponID=' + encodeURIComponent(couponID);
		return request;
	},

	RemoveYouTechCoupon: function (couponID, itemID, display) {
		var element = document.getElementById(display);
		var loadingDiv = document.getElementById("loading"+couponID);
		var that = this; // JavaScript does not pass reference 'this' to inner functions.

		if (couponID == null || typeof(couponID) != 'number') {
			return;
		}

		if (typeof(GSNContext) != 'object' || GSNContext == null) {
			return;
		}

		if(loadingDiv != null)
		{
			var loadingAnimation = new Image();
			loadingAnimation.src = "http://" + window.location.host + "/Assets/Common/Images/ajax-loader.gif";
			loadingDiv.appendChild(loadingAnimation);
			loadingDiv.style.display = "block";
		}

		this.RemoveCouponFromCard(GSNContext.RequestArguments,
			couponID,
			function (response) {
				var responseValue = GSNServices.UnwrapResponse(response);
				if (responseValue != null && responseValue != '') {
					if(element != null)
					{
						element.innerHTML ='<a class="button" onclick="GSNServices.YouTechService.AddYouTechCoupon('+ couponID +', '+ itemID +', "'+ display +'");" href="javascript:void(0);"><span class="addCouponResponseMessage" id="couponResult' + couponID + '">Add Coupon to Card</span></a>';
					}
				}

				if(loadingDiv != null)
				{
					loadingDiv.removeChild(loadingAnimation);
					loadingDiv.style.display = "none";
				}
				if(typeof AddToShoppingList == 'function')
				{
					AddToShoppingList(itemID, 13);
				}
			},
			null);
	},

	RemoveCouponFromCard: function (requestArguments, couponID, onSuccess, onFail) {
		var postBody = this.GetAddCouponToCardRequest(requestArguments, couponID);

		var request = new Ajax.Request(this.ServiceURL + 'RemoveCouponFromCard', {
			method: this.CommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});
	},

	GetRemoveCouponFromCardRequest: function (requestArguments, couponID) {
		var request = 'requestArguments=' + encodeURIComponent(requestArguments)
					+ '&couponID=' + encodeURIComponent(couponID);
		return request;
	},

	LoadYouTechCoupons: function (displayDivId) {
		// typeof null evaluates to 'object' in JavaScript
		if(typeof GSNContext != 'object' || GSNContext == null) {
			return;
		}	
		
		var displayDiv = $(displayDivId);
		var categoryDiv = $('categoryDisplayContainer');

		var loadingAnimation = new Image();
		loadingAnimation.src = "http://" + window.location.host + "/Assets/Common/Images/ajax-loader.gif";
		displayDiv.appendChild(loadingAnimation);

		var that = this;
		this.GetYouTechCoupons(GSNContext.RequestArguments, function(response) {
				var responseValue = GSNServices.UnwrapResponse(response);
				displayDiv.innerHTML = responseValue;
				var youtechCategories = $('youtechCategories');
				categoryDiv.insertBefore(youtechCategories,categoryDiv.childNodes[1].nextSibling);
				displayDiv.removeChild(youtechCategories);
		},
		null);
	},

	GetYouTechCoupons: function (requestArguments, onSuccess, onFail) {
		var postBody = this.GetGetYouTechCouponRequest(requestArguments);

		var request = new Ajax.Request(this.ServiceURL + 'GetYouTechCoupons', {
			method: this.CommunicationMethod,
			postBody: postBody,
			contentType: this.ContentType,
			onSuccess: onSuccess,
			onFailure: onFail
		});	
	},

	GetGetYouTechCouponRequest: function (requestArguments) {
		var request = 'requestArguments=' + encodeURIComponent(requestArguments);
		return request;
	}
};
