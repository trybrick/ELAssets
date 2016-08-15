
function SendShoppingListEmail() {
    
    if (ValidateForm()) {
           var emailFrom = $('txtEmailFrom').value;
           var emailTo = $('txtEmailTo').value;
           var subject = $('txtSuject').value;
           var body = $('txtEmailBody').value;
           var name = $('txtName').value;
           var messageHeader = $('hfMessageHeader').value;
           var requestArgs = GSNContext.RequestArguments;

           messageHeader = messageHeader.replace('#Name#', name);
           messageHeader = messageHeader.replace('#EmailFrom#', emailFrom);
           
           body = messageHeader + '\n' + body;
           
           SendEmailFromChain(document.URL, requestArgs, emailTo, name, subject, body, HandleSendShoppingListEmailSuccess, null);
    }
}

function HandleSendShoppingListEmailSuccess(response) {
    
    if (response.responseXML.firstChild.textContent) {
		$('ResponseTarget').innerHTML = response.responseXML.firstChild.textContent;
	}
	else {
		$('ResponseTarget').innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
    }

    $('EmailForm').hide();
    $('ResponseMessage').show();

	refreshAdPods();
}

function ValidateForm() {

    var isValid = true;
    var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
    
    var emailFrom = $('txtEmailFrom');

    if (emailFrom != null && emailValidator.test(emailFrom.value)) {

        emailFrom.className = '';
    }
    else {

        if (emailFrom != null) {
            emailFrom.className = 'Invalid';
        }

        isValid = false;
        
        alert('Please enter a valid email address.');
    }

    var emailTo = $('txtEmailTo');

    if (emailTo != null && emailValidator.test(emailTo.value)) {

        emailTo.className = '';
    }
    else {
        if (emailTo != null) {
            emailTo.className = 'Invalid';
        }

        isValid = false;

        alert('Please enter a valid email address.');
    }

    var subject = $('txtSuject');

    if (subject != null && subject.value != '') {
        subject.className = '';
    }
    else {
        if (subject != null) {
            subject.className = 'Invalid';
        }

        isValid = false;

        alert('Please enter a subject.');
    }

    var body = $('txtEmailBody');
    
    if (body != null && body.value != '') {
        body.className = '';
    }
    else {
        if (body != null) {
            body.className = 'Invalid';
        }
        
        isValid = false;
        
        alert('Please enter an email body.');
    }

    return isValid;
}