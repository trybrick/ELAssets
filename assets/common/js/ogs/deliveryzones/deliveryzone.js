var deliveryZoneServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/OGS/DeliveryZone.asmx/';
var deliveryZoneServiceCommunicationMethod = 'post';
var deliveryZoneServiceContentType = 'application/x-www-form-urlencoded';

function GetGetDeliveryZoneAddDeliveryFeeRequest(url, requestArguments, orderid, deliveryfee) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&orderid=' + orderid
				+ '&deliveryfee=' + deliveryfee;

    return request;
}

function GetGetDeliveryZoneDisplayRequest(url, requestArguments, orderid) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&orderid=' + orderid;

    return request;
}

function GetDeliveryZoneAddDeliveryFee(url, requestArguments, orderid, deliveryfee, onSuccess, onFail) {

    var postBody = GetGetDeliveryZoneAddDeliveryFeeRequest(url, requestArguments, orderid, deliveryfee);

    var request = new Ajax.Request(deliveryZoneServiceURL + 'AddDeliveryFee', {
        method: deliveryZoneServiceCommunicationMethod,
        postBody: postBody,
        contentType: deliveryZoneServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetDeliveryZoneDisplay(url, requestArguments, orderid, onSuccess, onFail){
	var postBody = GetGetDeliveryZoneDisplayRequest(url, requestArguments, orderid);
	
	var request = new Ajax.Request(deliveryZoneServiceURL + 'DisplayDeliveryZones', {
        method: deliveryZoneServiceCommunicationMethod,
        postBody: postBody,
        contentType: deliveryZoneServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });

}

function AddDeliveryFeeToOrder(orderid, deliveryfee){
	
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;
	
	GetDeliveryZoneAddDeliveryFee(url, requestArgs, orderid, deliveryfee, HandleAddDeliveryFeeSuccess, HandleAddDeliveryFeeFailure);
}

function DisplayDeliveryZones(orderid){
	var requestArgs = GSNContext.RequestArguments;
	var url = document.URL;

	GetDeliveryZoneDisplay(url, requestArgs, orderid, HandleDisplayDeliveryFeeSuccess, null);
}

function HandleAddDeliveryFeeSuccess(){
	deliveryZoneLightWindow.deactivate();
	alert('success');
}

function HandleAddDeliveryFeeFailure() {
	alert('There was an error setting your delivery fee. Please try again.'); 
}

function HandleDisplayDeliveryFeeSuccess(response){

	var div = $('deliveryzone');
	//div.style.display = 'none';
	
	if (response.responseXML.firstChild.textContent) {
		div.innerHTML = response.responseXML.firstChild.textContent;
	}
	else {
		div.innerHTML = response.responseXML.documentElement.firstChild.nodeValue;
	}
}



