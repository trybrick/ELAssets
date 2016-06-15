var circularsServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Circulars.asmx/';
var circularsServiceCommunicationMethod = 'post';
var circularsServiceContentType = 'application/x-www-form-urlencoded';

//var circularsServiceContentType = 'application/json; charset=utf-8';

function GetGetCircularPageRequest(url, requestArgs, circularPageID) {
    //var request = "{url:\'" + url + "\',requestArgs:\'" + requestArgs + "\',circularPageID:\'" + circularPageID + "\'}";
    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&circularPageID=' + circularPageID;

    return request;
}

function GetCircularPage(url, requestArgs, circularPageID, onSuccess, onFail) {

    var postBody = GetGetCircularPageRequest(url, requestArgs, circularPageID);

    var request = new Ajax.Request(circularsServiceURL + 'GetCircularPage', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetCircularPageScaledRequest(url, requestArgs, circularPageID, scaleFactor) {

    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&circularPageID=' + circularPageID
                + '&scaleFactor=' + scaleFactor;

    return request;
}

function GetCircularPageScaled(url, requestArgs, circularPageID, scaleFactor, onSuccess, onFail) {

    var postBody = GetGetCircularPageScaledRequest(url, requestArgs, circularPageID, scaleFactor);

    var request = new Ajax.Request(circularsServiceURL + 'GetCircularPageScaled', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetCircularItemsByCategoryRequest(url, requestArgs, categoryID) {
    //var request = "{url:\'" + url + "\',requestArgs:\'" + requestArgs + "\',categoryID:\'" + categoryID + "\'}";
    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&categoryID=' + categoryID;

    return request;
}

function GetCircularItemsByCategory(url, requestArgs, categoryID, onSuccess, onFail) {

    var postBody = GetGetCircularItemsByCategoryRequest(url, requestArgs, categoryID);

    var request = new Ajax.Request(circularsServiceURL + 'GetCircularItemsByCategory', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetCircularItemsByBrandRequest(url, requestArgs, brandName) {
    //var request = "{url:\'" + url + "\',requestArgs:\'" + requestArgs + "\',brandName:\'" + escape(brandName) + "\'}";
    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&brandName=' + encodeURIComponent(escape(brandName));

    return request;
}

function GetCircularItemsByBrand(url, requestArgs, brandName, onSuccess, onFail) {

    var postBody = GetGetCircularItemsByBrandRequest(url, requestArgs, brandName);

    var request = new Ajax.Request(circularsServiceURL + 'GetCircularItemsByBrand', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetCircularItemsByKeyWordRequest(url, requestArgs, keyWord) {
    //var request = "{url:\'" + url + "\',requestArgs:\'" + requestArgs + "\',keyWord:\'" + escape(keyWord) + "\'}";
    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&keyWord=' + encodeURIComponent(escape(keyWord));
                
    return request;
}

function GetCircularItemsByKeyWord(url, requestArgs, keyWord, onSuccess, onFail) {

    var postBody = GetGetCircularItemsByKeyWordRequest(url, requestArgs, keyWord);

    var request = new Ajax.Request(circularsServiceURL + 'GetCircularItemsByKeyWord', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function GetGetAvailableVarietiesRequest(url, requestArgs, circularItemID) {

    var request = 'url=' + url
                + '&requestArgs=' + encodeURIComponent(requestArgs)
                + '&circularItemID=' + circularItemID;

    return request;
}

function GetAvailableVarieties(url, requestArgs, circularItemID, onSuccess, onFail) {

    var postBody = GetGetAvailableVarietiesRequest(url, requestArgs, circularItemID);

    var request = new Ajax.Request(circularsServiceURL + 'GetAvailableVarieties', {
        method: circularsServiceCommunicationMethod,
        postBody: postBody,
        contentType: circularsServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}


function getDealBusterStyle(id, style) {
    var obj = document.getElementById('DealBusterItem_' + id);
    var image = document.getElementById('CircularImage');
    
    //var xCoord = findPosX(image);
    //var yCoord = findPosY(image);
    var xCoord = image.offsetLeft;
    var yCoord = image.offsetTop;
    
    var X = 0;
    var Y = 0;
    
    var strArray = style.split(';');
    
    for (var i = 0; i < strArray.length; i++) {
        if (strArray[i] == "") {
            continue;
        }
        
        var test = strArray[i].search("top");
        if (test >= 0) {
            var str = strArray[i].replace("top:", "");
            str = str.replace("px", "").trim();
            Y = new Number(str);
            continue;
        }
        
        test = strArray[i].search("left");
        if (test >= 0) {
            var str = strArray[i].replace("left:", "");
            str = str.replace("px", "").trim();
            X = new Number(str);
            continue;
        }
    }
    
    xCoord += X;
    yCoord += Y;
    
    obj.style.left = xCoord + 'px';
    obj.style.top = yCoord + 'px';
}


