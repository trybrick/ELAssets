var commentServiceURL = document.location.protocol + '//' + document.location.host + '/WebService/Comments.asmx/';
var commentServiceCommunicationMethod = 'post';
var commentServiceContentType = 'application/x-www-form-urlencoded';

function GetAddCommentToProductRequest(url, requestArguments, productID, comment) {

    var request = 'url=' + url
                + '&requestArguments=' + encodeURIComponent(requestArguments)
                + '&productID=' + productID
                + '&comment=' + encodeURIComponent(comment);

    return request;
}

function AddCommentToProduct(url, requestArguments, productID, comment, onSuccess, onFail) {

    var postBody = GetAddCommentToProductRequest(url, requestArguments, productID, comment);

    var request = new Ajax.Request(commentServiceURL + 'AddCommentToProduct', {
        method: commentServiceCommunicationMethod,
        postBody: postBody,
        contentType: commentServiceContentType,
        onSuccess: onSuccess,
        onFailure: onFail
    });
}
 

function SaveComment(productID, textBox) {

	try
	{
		var requestArgs = GSNContext.RequestArguments;
		var box = textBox;
	
		if(typeof(box) == 'string')
		{
			var field = $(box);

			//check if item is null,defined,empty, etc
			if(!field){
				return;
			}
			var comment = field.value;
			AddCommentToProduct(document.URL, requestArgs, productID, comment, null, null);
		}
	}
	catch(e){
		//alert(e.description);
	}
}


function SaveToShoppingListComment(productID, textBox) {
	try
	{
		var box = textBox;
		if(typeof(box) == 'string')
		{
			var field = $(box);
			
			//check if item is null,defined,empty, etc
			if(!field){
				return;
			}
			var comment = field.value;
			SetShoppingListItemComment(productID, 3, comment);
		}
	}
	catch(e)
	{
	}
}


