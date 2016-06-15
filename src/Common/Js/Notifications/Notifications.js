var notificationServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/notification.asmx/';
var notificationServiceCommunicationMethod = 'post';
var notificationServiceContentType = 'application/x-www-form-urlencoded';

function GetLogNotificationRequest(url, requestArguments, notificationID) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&notificationID=' + notificationID;

    return request;
}

function LogNotification(url, requestArguments, notificationID, onSuccess, onFail) {

    var postBody = GetLogNotificationRequest(url, requestArguments, notificationID);

    var request = new Ajax.Request(notificationServiceURL + 'LogNotification', {
        method: notificationServiceCommunicationMethod,
        postBody: postBody,
        contentType: notificationServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function LogNotificationDisplay(notificationID) {

    var url = document.URL;
    var requestArgs = GSNContext.RequestArguments;

    LogNotification(url, requestArgs, notificationID, null, null);
}

function DisplayPopUp(title, sourceID) {

    if (typeof (myLightWindow) != 'object') {
        var myLightWindow = new lightwindow();
    }
    $('lightwindow_contents').style.backgroundColor = 'transparent';
    $('lightwindow_contents').style.borderColor = 'transparent';
    myLightWindow.deactivate();
    myLightWindow.activateWindow({
        href: '#' + sourceID,
        title: title,
        type: 'inline'
    });
}

function closeNotificationPopup() {
    if (typeof (Effect) == 'object') {
        Effect.toggle('Notification_Popup', 'appear', { duration: 0.5 });
    }
    else {
        $('Notification_Popup').style.display = 'none';
    }
    $('lightwindow_registration').style.display = 'none';
}

function openNotificationPopup(){
	//get height of window and concat 'px' for lightwindow overlay height 
	var windowHeight = (getDocHeight()+'px');
	$('lightwindow_registration').style.height=(windowHeight);
	$('lightwindow_registration').style.display='block';
	Event.observe($('lightwindow_registration'), 'click', closeNotificationPopup);
	if (typeof (GSNPageItems) == 'object' && GSNPageItems.Notification.clickBgToClose == false){
		Event.stopObserving($('lightwindow_registration'), 'click', closeNotificationPopup);
	}
	
	var popUpDiv = document.createElement('div');
	var popUpContent = $('Notification_PopupOrig');
	
	while (popUpContent.childNodes.length > 0){
		popUpDiv.appendChild(popUpContent.firstChild);
    }

    $(popUpDiv).writeAttribute('id', 'Notification_Popup');
    
    if (typeof (Effect) == 'object') {
        $(popUpDiv).style.display = 'none';
        $('container-outer').appendChild(popUpDiv);

        Effect.toggle('Notification_Popup', 'appear', { duration: 0.5 });
    }
    else {
        $('container-outer').appendChild(popUpDiv);
    }
}

function getDocHeight() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
        Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
        Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
}