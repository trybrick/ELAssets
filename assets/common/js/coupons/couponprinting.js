
if (typeof GSN != 'object' || GSN == null) {
    var GSN = new Object();
}


GSN.CouponPrinting = {
    frameCmd: function(x){
        var pframe = document.getElementById("runhere");
        if (pframe != null) {
            pframe.src = x;
        }
    },
    PrintListDelay: function(Pid, strToken){
        GSN.CouponPrinting.PrintCouponsNew();
        window.setTimeout('GSN.CouponPrinting.PrintList()', 3000);
        return;
    },
    
    JustPrintCoupons: function(Pid, strToken){
        GSN.CouponPrinting.PrintCouponsNew();
        return;
    },
    
    PrintCloseListDelay: function(){
        GSN.CouponPrinting.PrintCouponsNew();
        window.setTimeout('GSN.CouponPrinting.PrintCloseList()', 3000);
        return;
    },
    
    AutoPrintList: function(){
        window.setTimeout('GSN.CouponPrinting.PrintList()', 3000);
        return;
    },
    
    PrintList: function(){
        window.print();
        return;
    },
    
    PrintCloseList: function(){
        GSN.CouponPrinting.PrintList();
        window.close();
        return;
    },
    
    PrintCouponsNew: function(){
        if (isChecked) {
			if (couponIds.length == 0)
				return; //No coupons to print
            var lastChar = couponIds.substr(couponIds.length - 1);
            if (lastChar == ',') 
                couponIds = couponIds.substring(0, couponIds.length - 1);
            if (isInstalled) {
                gcprinter.on('printed', GSN.CouponPrinting.PrintSuccess);
                gcprinter.on('printfail', GSN.CouponPrinting.PrintFailed);
                gcprinter.print(chainId, couponIds.split(","));
            }
            else {
                alert("Plugn is not installed");
				GSN.CouponPrinting.DownloadClient();
            }
        }
        else {
            setTimeout(GSN.CouponPrinting.PrintCouponsNew, 2000);
        }
    },
    
    PrintSuccess: function(result){
        var status = parseInt(result);
		if (isNaN(status))
		  alert(result);
		else
		  GSN.CouponPrinting.CheckStatusCode(status);
    },
    
    PrintFailed: function(result){
        console.log("Printing failed");
        alert("We can't print coupons");
    },
    
    CheckStatusCode: function(statusCode){
		if(statusCode > 100) {
			alert("Some of your coupons are already printed");
		}
        switch (statusCode) {
            case 13:
                alert("Invalid printer settings");
                break;
            case -52:
                alert("No valid coupons");
                break;
            case 0:
                alert("Sending coupon to printer...");
                break;
            default:
                console.log("Status code: " + statusCode);
        }
    },
	
	DownloadClient: function () {
		var pframe = document.getElementById("ci_ic1");
		if (pframe != null) {
		  var usrc = gcprinter.getDownload();
		  pframe.src = usrc;
		}
	  },
};
