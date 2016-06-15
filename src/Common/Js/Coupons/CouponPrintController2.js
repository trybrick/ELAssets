var isInstalled = false, isChecked = false;

    var myPrintCheckService = {
      isScriptReady: false
    };

    function doPrintCoupon() {

      if (!isPluginInstalled()) {
        isInstalled = false;
        alert('Plugin is not installed.');
        continousDetect();
        return;
      }

      if (!isPrinterSupported()) {
        isInstalled = false;
        console.log('Printer is not supported.');
        continousDetect();
        return;
      }
      
      if (couponIds.length == 0)
        return; // no coupons to print

      var lastChar = couponIds.substr(couponIds.length - 1);
      if (lastChar == ',') 
          couponIds = couponIds.substring(0, couponIds.length - 1);

      gcprinter.print(chainId, couponIds.split(","));
    }

    function printInternal() {
      if (!isPluginInstalled()) {
        continousDetect();
      }
      else {
        isChecked = true;
        doPrintCoupon();
      }
    };

    // continously checks plugin to detect when it's installed
    function continousDetect() {
      if (isPluginInstalled()) {
        pluginSuccess();
        return;
      }

      // use faster checkInstall method for non-chrome
      setTimeout(function() {
        gcprinter.checkInstall(gcprinter.init, continousDetect);
        return;
      }, 2000);
    };

  	function pluginSuccess() {
        // force init
        isInstalled = true;
        printInternal();
  	};

  	function isPluginInstalled() {
      return isInstalled || gcprinter.hasPlugin();
  	};

  	function isPrinterSupported() {
        var result = false;
        try {
          result = gcprinter.isPrinterSupported();
        } catch (e) {
          console.log('isPrinterSupported err:' + e);
          result = true;
        }
        return result;
  	};

setTimeout(function(){

  // keep trying to init until ready
  gcprinter.on('initcomplete', function() {
    myPrintCheckService.isScriptReady = true;

    // determine if already sent to printer
    // this can happen if init is called multiple time
    if (!isChecked) {
      printInternal();
    }
  });

  gcprinter.on('printed', GSN.CouponPrinting.PrintSuccess);
  gcprinter.on('printfail', GSN.CouponPrinting.PrintFailed);

  jQuery('.print-help').dblclick(function(evt){
    jQuery('#log').toggle();
  });

  jQuery('#log').html("");
  if (typeof console != "undefined")
    if (typeof console.log != 'undefined')
      console.olog = console.log;
    else
      console.olog = function() {};

  console.log = function(message) {
    console.olog(message);
    msg = message.replace(/%c/gi, '');
    jQuery('#log').append('<li>' + msg + '</li>');
  };

  console.error = console.debug = console.info =  console.log;

  // make sure to perform gcprinter.init
  if (!myPrintCheckService.isScriptReady) {
    if (gcprinter.isChrome) {
      gcprinter.detectWithSocket(500, gcprinter.init, continousDetect, 2);
      return;
    }

    gcprinter.init();
    return;
  }

  // if script is ready, call printInternal
  // printInternal is responsible for continously detecting the printer if plugin is not installed
  // printInternal also trigger printing of coupon
  // continousDetect also trigger printInternal as soon as coupon printer is detected
  printInternal();
  
  return;
}, 500);