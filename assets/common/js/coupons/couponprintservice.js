var couponPrintService = {
    api: 'https://clientapi.gsn2.com/api/v1/ShoppingList/CouponPrint',
    
    IsPluginInstalled: function(){
        return COUPONSINC.printcontrol.isPrintControlInstalled();
    },
    
    Print: function(couponCodes, siteId, onSuccess, onFail){
        var deviceId = COUPONSINC.printcontrol.getDeviceID();
        var payload = encodeURIComponent(couponCodes);
        if (payload.length > 0 && deviceId > 0) {
            jQuery.ajax({
                type: 'GET',
                url: this.api + "/" + siteId + "/" + deviceId + "?callback=?&coupons=" + payload,
                dataType: 'jsonp'
            }).done(function(response){
                if (response.Success) {
                    return COUPONSINC.printcontrol.printCoupons(response.Token, function(result){
                        onSuccess(result);
                    });
                }
                else {
                    onFail(response);
                }
            });
        }
        else {
            onFail({
                Success: false
            });
        }
    }
};
