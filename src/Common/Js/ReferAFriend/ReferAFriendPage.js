if (typeof (GSNPages) == 'undefined' || GSNPages == null) {
    var GSNPages = new Object();
}

if (typeof (GSNElements) == 'undefined' || GSNElements == null) {
    var GSNElements = new Object();
}

if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
    var GSNPageItems = new Object();
}

GSNElements.ReferAFriend = {
	Divs: {
		Header : 'ReferAFriendHeader',
		SuccessMessage: 'SuccessMessage',
		Main: 'ReferAFriendMain',
		Buttons: 'ReferAFriendButtons',
		ErrorMessage: 'ReferAFriendError',
		PreviousReferralsList: 'ReferAFriendList'
	},
	
	DivTemplates: {
		FirstName: 'txtFirstName',
		LastName: 'txtLastName',
		Email: 'txtEmail',
		FriendContainer: 'Friend',
		FriendControls: 'FriendControls'
	}
}

GSNPages.ReferAFriend = {
	NumberOfFriends: 1,
	
	Save: function(){
		var isvalid = false;
		$(GSNElements.ReferAFriend.Divs.SuccessMessage).hide();
		for(var i=1; i<=this.NumberOfFriends ;i++){
			var friendControl = $(GSNElements.ReferAFriend.DivTemplates.FriendControls + i);
			
			if(friendControl == null){
				continue;
			}
			
			if(friendControl.visible()){	
				var firstname = $(GSNElements.ReferAFriend.DivTemplates.FirstName + i).value.strip();
				var lastname = $(GSNElements.ReferAFriend.DivTemplates.LastName + i).value.strip();
				var email = $(GSNElements.ReferAFriend.DivTemplates.Email + i).value.strip();
				
				isvalid = this.Validate(firstname,lastname,email,i);
				
				if(isvalid == true){
					var friendDiv = $(GSNElements.ReferAFriend.DivTemplates.FriendContainer + i);
					
					if(Element.hasClassName(friendDiv,'Error')){
						friendDiv.removeClassName('Error');
					}
					
					$(GSNElements.ReferAFriend.Divs.ErrorMessage).update();
					$(GSNElements.ReferAFriend.Divs.ErrorMessage).hide();
					
					SaveReferAFriend(document.URL, GSNContext.RequestArguments, firstname, lastname, email, GSNPageItems.ReferAFriend.IsPromotional, this.HandleSaveSuccess, this.HandleSaveFailure);
				}
				
				else {
					//Removed because this text was overriding the individual field validation
					//this.HandleInputError('You must enter a name & email address.', i);
					break;
				}
			}
		}
	},
	
	Validate: function(firstname, lastname, email, index){
		if(firstname.length < 1 || lastname.length < 1){
			this.HandleInputError('All fields are required',index);
			return false;
		}

		if(email.length < 1){
			this.HandleInputError('Email address is required',index);
			return false;
		}
		
		if(email.toLowerCase() == GSNPageItems.ReferAFriend.ConsumerEmail.toLowerCase()){
			this.HandleInputError('You may not refer yourself',index);
			return false;
		}
		
		var emailValidator = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
		var emailIsValid = emailValidator.test(email); 

		if(!emailIsValid)
		{
			this.HandleInputError('Invalid Email format. (<em>ex: customer@example.com</em>)',index);
			return false;
		}

		return true;
	},
	
	HandleSaveSuccess: function(result){
		if(result.responseXML.firstChild.textContent.blank()){
			GSNPages.ReferAFriend.HandleInputError('You may not refer a friend more than once.',1);
			return;
		}
		var response = UnwrapResponse(result);

		if(response == null || response.blank())
		{
			GSNPages.ReferAFriend.HandleInputError('You may not refer a friend more than once.',1);
			return;
		}
		
		$(GSNElements.ReferAFriend.Divs.PreviousReferralsList).update(response);
		GSNPages.ReferAFriend.ResetDisplay();
		
		GSNPages.ReferAFriend.DisplayMessage();
	},
	
	HandleSaveFailure: function(){
		alert("An Error occurred and your Refer A Friend email could not be sent. Please try again later.");
	},
	
	HandleInputError: function(message,index){
		if(index != null){
			var errorControl = $('Friend'+index);
			errorControl.addClassName('Error');
		}

		$(GSNElements.ReferAFriend.Divs.ErrorMessage).innerHTML = '<span class="Error">'+message+'</span>';
		$(GSNElements.ReferAFriend.Divs.ErrorMessage).show();
	},
	
	DisplayMessage: function(){
		//$(GSNElements.ReferAFriend.Divs.Header).hide();
		//$(GSNElements.ReferAFriend.Divs.Buttons).hide();		
		$(GSNElements.ReferAFriend.Divs.SuccessMessage).show();
	},
	
	ResetDisplay: function(){
		var x = '';
	
		for(var i = 1; i <= this.NumberOfFriends; i++){
			var friendControl = $(GSNElements.ReferAFriend.DivTemplates.FriendControls + i);
			
			if(friendControl == null){
				continue;
			}
			
			$(GSNElements.ReferAFriend.DivTemplates.FirstName + i).value = '';
			$(GSNElements.ReferAFriend.DivTemplates.LastName + i).value = '';
			$(GSNElements.ReferAFriend.DivTemplates.Email + i).value = '';
		}
	}
};