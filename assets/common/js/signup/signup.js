var isEmailValid = false;
var isUsernameValid = false;

function navigate(direction){
	//var activeStep = $$('#SignUpV2 div.activeStep').first();
	var activeStep = getActiveStepDiv();
	try {
		if(typeof activeStep != 'object' || activeStep == null){
			throw "activeStep div is undefined";
		}
		
		var pageid = activeStep.id.toArray().last();

		if(direction == "forward"){
			pageid++;
		}
		else if(direction == "backward"){
			pageid --;
		}
		else {
			return;
		}

		var nextStepID = "step" + pageid;
		navigateToPage(nextStepID);

	} catch(e) {
		traceOutput(e);
	}
}

function navigateToPage(pageid){
	/* Prototype Selector is not forward compatible and breaks in IE9 */
	/*
	var activeStep = $$('#SignUpV2 div.activeStep').first();
	var allSteps = $$('#SignUpV2 div.signUpStep');
	*/
	var activeStep = getActiveStepDiv();
	var allSteps = getAllSteps();
	if(activeStep == null) {
		throw "null activeStep";
	}
	if(allSteps == null) {
		throw "null allSteps";
	}
	var nextStep = allSteps.find(function(s){
		return s.id == pageid;
	});

	for(var i = 0; i < allSteps.length; i++) {
		var id = $(allSteps[i]).readAttribute('id');
		if(id != pageid) {
			$(allSteps[i]).hide();
		}
	}

	$(activeStep).removeClassName('activeStep');
	$(nextStep).removeClassName('deactiveStep');
	$(nextStep).addClassName('activeStep');
	$(nextStep).show();
}

function getActiveStepDiv() {
	var parentDiv = document.getElementById('SignUpV2');
	if(typeof parentDiv != 'object' || parentDiv == null)
	{
		return;
	}
	var divs = parentDiv.getElementsByTagName('div');
	var activeStepDiv = null; 
	var pattern = /activeStep/;
	var patternExclude = /deactiveStep/;
	for(var i = 0; i < divs.length; i++) {
		if((pattern.test(divs[i].className)) && !patternExclude.test(divs[i].className)) { 
			activeStepDiv = divs[i];
			break;
		}
	}
	return activeStepDiv;
}

function getAllSteps() {
	var parentDiv = document.getElementById('SignUpV2'); 
	var childDivs = parentDiv.getElementsByTagName('div'); 
	var stepDivs = []; 
	var pattern = /signUpStep/; 
	for(var i = 0; i < childDivs.length; i++) { 
		if(pattern.test(childDivs[i].className)) { 
			stepDivs.push(childDivs[i]); 
		} 
	}

	return stepDivs;
}

function displayNextStep(){
	var isValid = validateStep();

	if(isValid){
		navigate("forward");
	}
}

function displayPreviousStep(){
	navigate("backward");
}

function validateStep(){
	var activeStep = $$('#SignUpV2 div.activeStep').first();

	var inputsFilter = '#' + activeStep.id + ' input';
	var selectsFilter = '#' + activeStep.id + ' select';

	var inputs = $$(inputsFilter);
	var selects = $$(selectsFilter);

	var validatedFields = new Array();
	
	inputs.each(function(i){
		var v = validateInput(i);
		validatedFields.push(v);
	});

	selects.each(function(s){
		var v = validateInput(s);
		validatedFields.push(v);
	});

	if(validatedFields.indexOf(false) > -1){
		return false;
	}

	return true;
}

function validateInput(input){
	if(input.value == undefined){
		setValidation(input.id, false);
		return false;
	}
	
	input.value = input.value.strip();
	
	var isValid = true;
	
	Element.extend(input);
	
	var validationDisplayID = input.id + '_validation';
	var validationSourceFilter = '#' + validationDisplayID + ' input[title=' + input.id + ']';
	
	var validationSources = $$(validationSourceFilter);
	var validators = new Array();
	
	if(validationSources != undefined && validationSources.length > 0){
		validationSources.each(function(v){
			var data = v.value.evalJSON();
			validators.push(data);
		});
	}
	
	validators.push({type:"regex", errormessage:"Html tags not allowed", regex: "^[^<>]+$"});
	
	var tagName = input.tagName.toLowerCase();
	var isRequired = input.hasAttribute('Required') ? true : false;
	
	switch(tagName){
		case 'select':
			//it is not required, so it passes validation
			if(isRequired == false){
				isValid = true;
				setValidation(input.id, true, 'Required');
				return true;
			}
			else{
				removeValidationMessage(input.id, 'Required');
			}

			//nothing has been selected, fail the validation
			if(input.selectedIndex < 1){
				isValid = false;
				setValidation(input.id, false, 'Required');
				return false;						
			}
			else{
				removeValidationMessage(input.id, 'Required');
			}
			break;
		case 'input':
			var inputValue = input.value;
			var hasValue = (inputValue != undefined && !inputValue.empty());
			
			//value is required and it's not defined
			if(isRequired && !hasValue){
					isValid = false;
					setValidation(input.id, false, 'Required');
					return false;
			}else{
				removeValidationMessage(input.id, 'Required');
			}

			for(j = 0; j < validators.length; j++){
				var validator = validators[j];
				
				var errormsg = validator.errormessage;
				
				switch (validator.type){
					case 'regex':
						if(!isRequired && !hasValue){
							break;
						}
						
						var regexTest = new RegExp(validator.regex);
						var regexIsValid = regexTest.test(inputValue);
						
						setValidation(input.id, regexIsValid, errormsg);

						if(!regexIsValid){
							isValid = false;
							return false;
						}
						break;
					case 'field':
						var relatedField = $(validator.validationfield);
						var fieldIsValid = (relatedField != undefined && relatedField.value == inputValue);
						
						setValidation(input.id, fieldIsValid, errormsg);

						if(!fieldIsValid){
							isValid = false;
							return false;
						}

						break;
					case 'uniqueEmail':
						validateEmailAddress(input.id);
						
						setValidation(input.id, isEmailValid, errormsg);
						
						if(isEmailValid == false){
							isValid = false;
							return false;
						}
						
						break;
					case 'uniqueUsername':
					
						var username = $(input.id).value;
						
						if(username.length < 1){
							var emailSelect = $$('input[title="email"]').first();
							
							if(emailSelect != undefined){
								username = emailSelect.value;
							}
						}
						
						validateUsername(username);
						
						if(!isUsernameValid && username.length < 1){
							isUsernameValid = true;
						}
						
						setValidation(input.id, isUsernameValid, errormsg);
						
						if(isUsernameValid == false){
							isValid = false;
							return false;
						}
						
						break;
					default:
						break;
				}
			}
			break;
		default:
			break;
	}

	if(isValid == true){
		setValidation(input.id, true);
		return true;
	}
}

function setValidationMessage(sourceID, isValid, errormsg){
	var filterMsgDisplay = sourceID + '_validationMessage';
	var validationMsgDiv = $(filterMsgDisplay);

	if(validationMsgDiv == undefined){
		return;
	}
	
	var displayObject = { 
		SourceName: sourceID,
		ErrorMessage: errormsg
	};
	
	var displayTemplate = new Template('<p title="#{ErrorMessage}">* #{ErrorMessage}</p>');
	var displayItem = displayTemplate.evaluate(displayObject);

	if(isValid){
		removeValidationMessage(sourceID, displayObject.ErrorMessage);
	}
	else{
		var msg = 0;
		validationMsgDiv.childElements().each(function(e){ if(e.title == displayObject.ErrorMessage) { msg = 1;} });
		
		if(msg < 1){
			validationMsgDiv.insert( {'bottom': displayItem});
			validationMsgDiv.show();
		}
	}
}

function removeValidationMessage(sourceID, errormsg){
	var filterMsgDisplay = sourceID + '_validationMessage';
	var validationMsgDiv = $(filterMsgDisplay);

	if(validationMsgDiv == undefined){
		return;
	}
	
	var displayObject = { 
		SourceName: sourceID,
		ErrorMessage: errormsg
	};
	
	var item = $$('#' + filterMsgDisplay + ' p[title="' + displayObject.ErrorMessage + '"]').first();
		
	if(item != undefined){
		item.remove();
	}
}

function setValidation(sourceID, isValid, errormsg){
	var filter = sourceID + '_validation';

	var validationDiv = $(filter);

	if(validationDiv == undefined){
		return;
	}

	var validClassName = 'valid';
	var invalidClassName = 'invalid';

	if(isValid){
		validationDiv.removeClassName(invalidClassName);
		validationDiv.addClassName(validClassName);
	}
	else{
		validationDiv.removeClassName(validClassName);
		validationDiv.addClassName(invalidClassName);
	}
	
	setValidationMessage(sourceID, isValid, errormsg);
}

function validateEmailAddress(inputid){
	
	var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;
	var emailAddress = $(inputid).value;
	
	GSNServices.ProfileService.ValidateUserEmailAddress(url, requestArgs, emailAddress, handleEmailAddressVerification, handleEmailAddressVerification);
}

function handleEmailAddressVerification(response){
	
	var value = UnwrapResponse(response);
	var json = value.evalJSON();
	
	isEmailValid = json.isValid == 'true' ? true : false;
}

function validateUsername(username){
	var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

	GSNServices.ProfileService.ValidateUsername(url, requestArgs, username, handleUsernameVerification, handleUsernameVerification);
}

function handleUsernameVerification(response){
	
	var value = UnwrapResponse(response);
	var json = value.evalJSON();
	
	isUsernameValid = json.isValid == 'true' ? true : false;
	
	
}

function saveSignUp(){
	//GSNServices.ProfileService.SavePreferencesAsync('SignUpV2');
	
	var stepIsValid = validateStep();
	
	if(stepIsValid == true){
		document.forms[0].submit();
	}
}

function DisplaySavePreferencesResponse(response){
	var step = $$('#SignUpV2 div.signUpStep').last();
	
	if(step != undefined){
		navigateToPage(step.id);
	}
}

function traceOutput(message) {
	if(console != undefined && console.log != undefined) {
		console.log(message);
	}
}
