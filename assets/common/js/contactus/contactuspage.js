if (typeof (GSNPages) == 'undefined' || GSNPages == null) {
    var GSNPages = new Object();
}

if (typeof (GSNElements) == 'undefined' || GSNElements == null) {
    var GSNElements = new Object();
}

if (typeof (GSNPageItems) == 'undefined' || GSNPageItems == null) {
    var GSNPageItems = new Object();
}

GSNElements.ContactUs = {
	Inputs: {
		Email: 'txtEmail',	
		FirstName: 'txtFirstName',
		LastName: 'txtLastName',
		Address: 'txtAddresss',
		City: 'txtCity',
		State: 'txtState',
		PostalCode: 'txtZip',
		PhoneNumber: 'txtPhone',
		MainTopic: 'ddlTopicSelect',
		SpecificTopic: 'ddlTopicSubSelect',
		Comment: 'txtMessage',
		Store: 'ddlStore'
	},
	
	Labels: {
		Email: 'txtEmailLabel',	
		FirstName: 'txtFirstNameLabel',
		LastName: 'txtLastNameLabel',
		Address: 'txtAddresssLabel',
		City: 'txtCityLabel',
		State: 'txtStateLabel',
		PostalCode: 'txtZipLabel',
		PhoneNumber: 'txtPhoneLabel',
		MainTopic: 'ddlTopicSelectLabel',
		SpecificTopic: 'ddlTopicSubSelectLabel',
		Comment: 'txtMessageLabel',
		Store: 'ddlStoreLabel',
		RequiredInformation: 'requiredInfoLabel'
	},
	
	Divs: {
		ContactUsContent: 'ContactUs'
	}
}

GSNPages.ContactUs = {
	EmailValidator: new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$"),
	ClassNameInvalidItem: 'contactInvalid',
	
	Fields: [
		{ InputID: GSNElements.ContactUs.Inputs.MainTopic, LabelID: GSNElements.ContactUs.Labels.MainTopic, Type: 'DropDownList' },
		{ InputID: GSNElements.ContactUs.Inputs.SpecificTopic, LabelID: GSNElements.ContactUs.Labels.SpecificTopic, Type: 'DropDownList' },
		{ InputID: GSNElements.ContactUs.Inputs.Store, LabelID: GSNElements.ContactUs.Labels.Store, Type: 'DropDownList' }
	],
	
	Validate: function(){
		var isValid = true;
		
		for(i = 0; i < this.Fields.length; i++){
			var field = this.Fields[i];
			
			if(field == undefined){
				continue;
			}
			
			var itemSource = $(field.InputID);
			var itemLabel =  $(field.LabelID);
			
			var isItemValid = true;
			
			switch(field.Type){
				case 'Email':
					isItemValid = this.EmailValidator.test(itemSource.value);
					break;
				default:
					if(itemSource.value == ''){
						isItemValid = false;
					}
					
					break;
			}
			
			if(isItemValid == true){
				itemLabel.removeClassName(this.ClassNameInvalidItem);
			}
			else{
				itemLabel.addClassName(this.ClassNameInvalidItem);
				isValid = false;
			}
		}
		
        if(isValid){
            var element = $(GSNElements.ContactUs.Inputs.Comment);
            if(element != null)
                isValid = this.SpamValidation(element.value);
        }
        
		if(!isValid){
			var requiredInfoLabel = $(GSNElements.ContactUs.Labels.RequiredInformation);
			requiredInfoLabel.addClassName(this.ClassNameInvalidItem);
		}
		
		return isValid;
	},
	
	Submit: function(){
		var isValid = this.Validate();
		
		if(isValid){
			var requestObjectClass = Class.create();
			requestObjectClass.prototype = {
				EmailAddress: $(GSNElements.ContactUs.Inputs.Email).value,
				StoreID: $(GSNElements.ContactUs.Inputs.Store).value,
				FirstName: $(GSNElements.ContactUs.Inputs.FirstName).value,
				LastName: $(GSNElements.ContactUs.Inputs.LastName).value,
				Address: $(GSNElements.ContactUs.Inputs.Address).value,
				City: $(GSNElements.ContactUs.Inputs.City).value,
				State: $(GSNElements.ContactUs.Inputs.State).value,
				PostalCode: $(GSNElements.ContactUs.Inputs.PostalCode).value,
				PhoneNumber: $(GSNElements.ContactUs.Inputs.PhoneNumber).value,
				MainTopic: $(GSNElements.ContactUs.Inputs.MainTopic).value,
				SpecificTopic: $(GSNElements.ContactUs.Inputs.SpecificTopic).value,
				Comment: $(GSNElements.ContactUs.Inputs.Comment).value,
			
				initialize: function(){ }
			};
			
			if(typeof(GSNServices.ContactUs.Save) == 'function'){
				var requestObject = new requestObjectClass();
				
				GSNServices.ContactUs.Save(GSNContext.RequestArguments, requestObject);
			}
		}
	},
	
	ChangeTopic: function() {
		var topicSelect = $(GSNElements.ContactUs.Inputs.MainTopic);
		var subSelect = $(GSNElements.ContactUs.Inputs.SpecificTopic);

		subSelect.innerHTML = '';
		
		GSNPageItems.ContactUs.SubSelectOptions.each(function (o) {
			if (o.ParentOption == topicSelect.value) {
				var option = document.createElement('option');

				option.innerHTML = o.Text;
				option.value = o.Value;
				option.label = o.Label;

				subSelect.appendChild(option);
			}
		});
	},
    
    SpamValidation: function(valueOf) {
        var linksValidator = new RegExp("(http://|https://|ftp://)([a-zA-Z0-9]+\.[a-zA-Z0-9\-]+|[a-zA-Z0-9\-]+)\.[a-zA-Z\.]{2,6}(/[a-zA-Z0-9\.\?=/#%&\+-]+|/|)");
        var tagsValidator = new RegExp("<\s*?[^>]+\s*?>");
        var specValidator = new RegExp("[%^#*@_+=[{}><]");
        var testLinks = linksValidator.test(valueOf);
        var testTags = tagsValidator.test(valueOf);
        var testSpec = specValidator.test(valueOf);
        if(testLinks || testTags || testSpec) {
            $(txtfield).className = 'Invalid';
            return true;
        }
        $(txtfield).className = '';
        return false;
    },
	
	Reset: function () {
		var contactInvalid = $$('.' + this.ClassNameInvalidItem);
		for (i = 0; i < contactInvalid.length; i++) {
			contactInvalid[i].removeClassName(this.ClassNameInvalidItem);
			}
		for (i = 0; i < document.forms[0].elements.length; i++) {
			var element = document.forms[0].elements[i];
			if (element.tagName == 'SELECT') {
				element.selectedIndex = 0;
			}
			if (element.tagName == 'TEXTAREA') {
				element.value = '';
			}
			else if (element.tagName == 'INPUT') {
				if (element.type == 'text' || element.type == 'password') {
					element.value = '';
				}
				else if (element.type == 'checkbox') {
					element.checked = false;
				}
				else if (element.type == 'radio') {
					element.checked = false;
				}
			}
		}	
	},
	
	Cancel: function(){
		document.location = document.referrer;
	}
};