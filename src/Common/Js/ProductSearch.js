
function SearchProductInLucene()
{
    if (GSNContext.RequestArguments)
    {
        var requestHost = document.URL;
        var searchString = document.getElementById('ctl00$ContentPlaceHolder1$txtProductSearch');
        
        if (searchString != null && searchString.value != '')
            GSN.ExpressLane.Web.WebService.Product.SearchProductInLucene(requestHost, GSNContext.RequestArguments, searchString.value, OnSuccess, OnFailure);
    }
}


function OnSuccess(response) {

    var resultDiv = document.getElementById("SearchResults");
    resultDiv.innerHTML = response;
}

function OnFailure(response)
{
    var resultDiv = document.getElementById("SearchResults");
    resultDiv.innerHTML = response.get_message();
}
