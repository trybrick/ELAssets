function hideError() {
	var errorDiv = $('CtrlDivNotRegisteredError');
	if(errorDiv) {
		errorDiv.hide();
	}
}

function LogIn() 
{
	if (ValidateForm()) 
	{
	     // Get the user id.
        var txtUserName = $('txtUserName');
    
        // Submit.
		document.forms[0].submit();
	}
}

function ValidateForm() {
	
	var isValid = true;
	var txtUserName = $('txtUserName');
	var txtPassword = $('txtPassword');

	if (txtUserName.value == '') {
		isValid = false;
		$('rfvUserName').show();
	}
	else {
		$('rfvUserName').hide();
	}

	if (txtPassword.value == '') {
		isValid = false;
		$('rfvPassword').show();
	}
	else {
		$('rfvPassword').hide();
	}

	return isValid;
}