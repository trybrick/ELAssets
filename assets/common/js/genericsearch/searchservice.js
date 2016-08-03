if (typeof (GSNServices) == 'undefined' || GSNServices == null) {
    var GSNServices = new Object();
}

GSNServices.SearchService = {
    ServiceURL: document.location.protocol + '//' + document.location.host + '/WebService/Search.asmx/',
    CommunicationMethod: 'post',
    ContentType: 'application/x-www-form-urlencoded',

    GetRunSearchRequest: function(url, requestArguments, searchParameters) {

        var request = 'url=' + encodeURIComponent(url)
                    + '&requestArguments=' + encodeURIComponent(requestArguments)
                    + '&searchParameters=' + encodeURIComponent(searchParameters);
        return request;
    },

    RunSearch: function(url, requestArguments, searchParameters, onSuccess, onFail) {

        var postBody = this.GetRunSearchRequest(url, requestArguments, searchParameters);

        var request = new Ajax.Request(this.ServiceURL + 'RunSearch', {
            method: this.CommunicationMethod,
            postBody: postBody,
            contentType: this.ContentType,
            onSuccess: onSuccess,
            onFailure: onFail
        });
    },

    RunSearchFromForm: function(htmlForm, onSucess, onFail) {

        var searchParameters = $(htmlForm).serialize();
        var url = document.URL;
        var requestArgs = GSNContext.RequestArguments;
        this.RunSearch(url, requestArgs, searchParameters, onSucess, onFail);
    }
};
