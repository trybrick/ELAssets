function CheckBrowser() {
    if (typeof (bhawk) != 'object') {
        return;
    }
    
    var url = window.location.href;	
    var brow = bhawk.browser();
    var ver = bhawk.version();		
    var isValidBrowser = true;
	
    // check cookies
    if (bhawk.sessioncookies() == false) {
	    isValidBrowser = false;
    }

    // check browser
    if ((brow != 'IE') && (brow != 'Firefox') && (brow != 'Safari') && (brow != 'Opera')) {
	    isValidBrowser == false;
    }

    // check browser version
    if (
		    (brow == 'IE' && ver <= 6) ||
		    (brow == 'Firefox' && ver <= 2) ||
		    (brow == 'Safari' && ver <= 2) ||
		    (brow == 'Opera' && ver <= 9)
	    )
    {
	    isValidBrowser == false;
    }

    if (isValidBrowser == false) {
	    var caption = "Browser Check";
	    var bhtgDomain = 'http://bh' + getHost() + '';
	    var bhtgAccountID = 'groceryshopping';

	    bhawkret.showResults(caption, bhtgDomain + '/bhtg/ret/browsercheck.aspx?acct=' + bhtgAccountID + '&customtest=testC2&style=std1&TB_iframe=true&height=480&width=580', retHelpNotAvail);
    }
}

function getHost() {

    var url = window.location.href;
    var nohttp = url.split('//')[1];
    var start_from = nohttp.indexOf(".");
    var rootUrl = nohttp.substring(start_from, nohttp.indexOf("/"));
    var hostPort = rootUrl.split('/')[0];

    return hostPort;
}

function retHelpNotAvail() {
    alert('Your browser does not meet the requirements of x, y, z. Please correct these settings and try again. For more detailed help please try again shortly (our detailed help system is momentarily unavailable).');
}

setTimeout('CheckBrowser()', 3000);


