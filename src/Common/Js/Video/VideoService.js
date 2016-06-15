var videoServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Video.asmx/';
var videoServiceCommunicationMethod = 'post';
var videoServiceContentType = 'application/x-www-form-urlencoded';

function UnwrapResponse(response) {

    var responseValue = '';

    if (response.responseXML.firstChild.textContent) {
        responseValue = response.responseXML.firstChild.textContent;
    }
    else if (response.responseXML.documentElement.firstChild.nodeValue) {
        responseValue = response.responseXML.documentElement.firstChild.nodeValue;
    }
    else {
        responseValue = response.responseJSON.d;
    }

    return responseValue;
}

function GetGetPlayListRequest(url, requestArguments, channelID) {

    var request = 'url=' + encodeURIComponent(url)
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&channelID=' + channelID;

    return request;
}

function GetPlayList(url, requestArguments, channelID, onSuccess, onFail) {

    var postBody = GetGetPlayListRequest(url, requestArguments, channelID);

    var request = new Ajax.Request(videoServiceURL + 'GetPlayList', {
        method: videoServiceCommunicationMethod,
        postBody: postBody,
        contentType: videoServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}

function LoadPlayList(channelID) {

    var requestArgs = GSNContext.RequestArguments;
    var url = document.URL;

    GetPlayList(url, requestArgs, channelID, HandlePlayListResponse, null);
}

function HandlePlayListResponse(response) {

    var content = UnwrapResponse(response);

    if (content != '') {
        $('PlayListTarget').innerHTML = content;
		switchDivs('PlayListTarget','CategoryList');
    }
}

function GetRateVideoRequest(url, requestArguments, videoID, rating, comment) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&videoID=' + videoID
                + '&rating=' + rating
                + '&comment=' + encodeURIComponent(comment);

    return request;
}

function RateVideo(url, requestArguments, videoID, rating, comment, onSuccess, onFail) {

    var postBody = GetRateVideoRequest(url, requestArguments, videoID, rating, comment);

    var request = new Ajax.Request(videoServiceURL + 'RateVideo', {
        method: videoServiceCommunicationMethod,
        postBody: postBody,
        contentType: videoServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}