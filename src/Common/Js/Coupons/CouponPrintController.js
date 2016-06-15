 var isInstalled = false, isChecked = false;
 var tried = 0;

    var myPrintCheckService = {
      isScriptReady: false,
      isDetecting: false,
      breakOut: false,
	  isDetecting: false
    };

    function printInternal() {
      if (!isPluginInstalled()) {
        if (!myPrintCheckService.isDetecting) {
          myPrintCheckService.isDetecting = true;
          continousDetect();
        }
      }
	  else if (gcprinter.isPluginBlocked()) {
        alert('Plugin is blocked');
      }
      else if (!isPrinterSupported()) {
        alert('Not supported printer');
      }
      else {
        isChecked = true;
		isInstalled = true;
		var delay = gcprinter.isChrome ? 5 : 2000;
        setTimeout(GSN.CouponPrinting.PrintCouponsNew, delay);
      }
    };

    // continously checks plugin to detect when it's installed
    function continousDetect() {
	  tried++;
      if (isPluginInstalled()) {
        pluginSuccess();
        return;
      }
	  if (tried == 3) {
		pluginFailed();
	  }
      if (gcprinter.isChrome) {
        gcprinter.detectWithSocket(2000, pluginSuccess, continousDetect, 1);
      }
      else {
        // use faster checkInstall method for non-chrome
        setTimeout(function() {
          gcprinter.checkInstall(continousDetect, continousDetect);
		  setTimeout(function() {
			if(!isInstalled && tried == 1)
				pluginFailed();
		  }, 5000);
        }, 2000);
      }
    };

  	function pluginSuccess() {
        // force init
		isChecked = true;
        isInstalled = true;
		gcprinter.init(true);
  	};
	
	function pluginFailed() {
		alert('Plugin is not installed');
	};

  	function isPluginInstalled() {
      if (gcprinter.isChrome){
        return isInstalled;
      }

      return gcprinter.hasPlugin();
  	};

  	function isPrinterSupported() {
        var result = false;
        try {
          result = gcprinter.isPrinterSupported();
        } catch (e) {
          result = true;
        }
        return result;
  	};

	function waitPrinter() {
		if (typeof gcprinter != 'undefined' && (typeof COUPONSINC !== 'undefined' && COUPONSINC !== null)) {
			gcprinter.on('initcomplete', function() {
			  myPrintCheckService.isScriptReady = true;
			  myPrintCheckService.breakOut = true;
			  setTimeout(printInternal, 5);
			});
			try {
    		    gcprinter.init();
			} catch(e) {
				isInstalled = false;
				pluginFailed();
			}
		}
		else
			setTimeout(function() {
				waitPrinter()
			}, 100);
	}

jQuery(document).ready(function(){
	var head = document.getElementsByTagName('head')[0];
	var sript = document.createElement('script');
	sript.type = 'text/javascript';
	sript.src = 'http://cdn.gsngrocers.com/script/expresslane/gcprinter.js?nocache=' + Math.floor(Date.now() / 3600000);
	head.appendChild(sript);

	// make sure to perform gcprinter.init
	if (!myPrintCheckService.isScriptReady) {
		waitPrinter();
		return;
	}

	// if script is ready, call printInternal
	// printInternal is responsible for continously detecting the printer if plugin is not installed
	// printInternal also trigger printing of coupon
	// continousDetect also trigger printInternal as soon as coupon printer is detected
	printInternal();
});

(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());