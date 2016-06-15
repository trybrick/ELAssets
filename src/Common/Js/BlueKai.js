
var blueKaiScriptSrc = 'http://www.bkrtx.com/js/bk-static.js';
var blueKaiRenderTarget = $('container-outer');
var pageLoad = true;
var iExplore = /msie/.test(navigator.userAgent.toLowerCase());


function RemoveBkScript() {

    try {
        if (typeof (BKPL) != 'undefined' && BKPL != null) {
            BKPL = null;
        }

        if (typeof (BKTAG) != 'undefined' && BKTAG != null) {
            BKTAG = null;
        }

        var bkScript = $('bkScript');

        if (bkScript != null) {
            var bkScriptParent = bkScript.parentNode;
            bkScriptParent.removeChild(bkScript);
        }
    } catch (e) { }
}

function WriteBKIFrame() {

    var bkIFrame = document.createElement('iframe');

    bkIFrame.id = 'bkIFrame';
    bkIFrame.name = '__bkframe';
    bkIFrame.height = '0';
    bkIFrame.width = '0';
    bkIFrame.frameborder = '0';
    bkIFrame.src = 'javascript:void(0)';

    blueKaiRenderTarget.appendChild(bkIFrame);

    if (typeof frames.__bkframe == 'undefined') {
        for (var i = 0; i < frames.length; i++) {
            try {
                if (frames[i].frameElement.name == '__bkframe') {
                    frames.__bkframe = frames[i];
                    break;
                }
            } catch (e) { }
        }
    }
}

function CallBKTag(event) {

    if (iExplore && ($('bkScript').readyState != 'loaded' && $('bkScript').readyState != 'complete')) {
        return;
    }

    if (typeof (GSNContext) == 'object') {
        bk_addUserCtx('gsnid', GSNContext.ConsumerID);
    }

    if (event) {
        bk_doJSTag(1319, 4);
    }
    else {
        bk_doJSTag(1319, 4, true);
    }
}

function WriteBkScript() {

    var bkScript = document.createElement('script');
    
    bkScript.type = 'text/javascript';
    bkScript.src = blueKaiScriptSrc;
    bkScript.id = 'bkScript';
    
    if (pageLoad) {
        pageLoad = false;

        if (iExplore) {
            Event.observe(bkScript, 'readystatechange', CallBKTag);
        }
        else {
            Event.observe(bkScript, 'load', CallBKTag);
        }
    }

    blueKaiRenderTarget.appendChild(bkScript);
}

function InitializeBK() {
    WriteBKIFrame();
    WriteBkScript();

    BK_AddSelectEventHandler();
}

function RefreshBK() {
    if (iExplore && $('bkIFrame').readyState != 'complete') {
        return;
    }
    
    RemoveBkScript();
    WriteBkScript();
}

function BK_AddClickEventParams(itemID, itemTypeID) {

    var itemsAdded = false;
    
    try {
        if (typeof (BKTAG) == 'undefined' || BKTAG == null) {
            return;
        }

        var keyContainers = $$('.ItemData_' + itemID + '_' + itemTypeID + ' span');

        if (keyContainers != null && keyContainers.length > 0) {
            
            itemsAdded = true;
            
            keyContainers.each(function(e) {
                bk_addUserCtx(e.className, e.innerHTML);
            });
        }
    }
    catch (e) { }

    return itemsAdded;
}

function BK_LogClickEvent(itemID, itemTypeID) {

    try {
        if (typeof (BKTAG) == 'undefined' || BKTAG == null) {
            return;
        }

        var itemsAdded = BK_AddClickEventParams(itemID, itemTypeID);

        if (itemsAdded) {
            CallBKTag(false);
        }
    }
    catch (e) {}
}

function BK_GetCategoryExportKeyID(select) {
    var exportCategoryID = null;

    try {
        if (select == null || typeof (select) != 'object') {
            return exportCategoryID;
        }

        var selectedIndex = select.selectedIndex;

        if (selectedIndex >= 0) {
            var options = select.options;
            var option = null;

            if (typeof (options) == 'object' && options != null) {
                option = options[selectedIndex];
            }

            var attribute = null;

            if (option != null && typeof (option.attributes) == 'object') {
                attribute = option.attributes.getNamedItem('exportkeyid');
            }

            if (attribute != null) {
                exportCategoryID = attribute.value;
            }
        }
    }
    catch (e) { }

    return exportCategoryID;
}

function BK_CategorySelected(e) {

    try {
        if (typeof (BKTAG) == 'undefined' || BKTAG == null) {
            return;
        }
        
        var select = null;
        var exportKeyID = new Number(e);

        if (exportKeyID.toString() == 'NaN') {

            if (typeof(e.tagName) != 'undefined' && e.tagName == 'SELECT') {
                select = e;
            }
            else {
                select = this;
            }
            exportKeyID = BK_GetCategoryExportKeyID(select);
        }
        
        if (exportKeyID) {
            bk_addUserCtx('ExportKeyID', exportKeyID);
            CallBKTag(false);
        }
    }
    catch (e) { }
}

function BK_AddSelectEventHandler() {
    $$('select').each(function(s) { Event.observe(s, 'change', BK_CategorySelected); });
}


if (document.location.protocol != 'https:') {
	if (blueKaiRenderTarget == null || blueKaiRenderTarget == 'undefined'){
		document.observe("dom:loaded", function() {
			blueKaiRenderTarget = $('container-outer');
			InitializeBK();
		});
	}
	else {
    	Event.observe(window, 'load', InitializeBK);
	}
}