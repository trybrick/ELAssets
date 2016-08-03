/*****************************************************************
/*      Copyright notice :
/*   Script created by and copyright : www.cass-hacks.com
/*    This work is licensed according to the following Terms and Conditions :
/*    Copyright (c) 2007 & 2008 cass-hacks.com</p>
/*    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
/*    files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, 
/*    merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished 
/*    to do so, subject to the following conditions:
/*    1. Redistributions of source code must retain the above copyright notice, this list of conditions, and the following disclaimer.
/*    2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer 
/*        in the documentation and/or other materials provided with the distribution, and in the same place and form as other copyright, 
/*        license and disclaimer information.
/*    3. The end-user documentation included with the redistribution, if any, must include the following acknowledgment: "This product 
/*        includes software developed by Cass-hacks.com (http://cass-hacks.com/) and its contributors", in the same place and 
/*        form as other third-party acknowledgments. Alternately, this acknowledgment may appear in the software itself, in the same form 
/*        and location as other such third-party acknowledgments.
/*    4. Except as contained in this notice, the name of Cass-hacks.com shall not be used in advertising or otherwise to 
/*        promote the sale, use or other dealings in this Software without prior written authorization from Cass-hacks.com.
/*    
/*    THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
/*    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
/*    DISCLAIMED. IN NO EVENT SHALL THE XFREE86 PROJECT, INC OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
/*    INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
/*    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
/*    HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
/*    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
/*    POSSIBILITY OF SUCH DAMAGE.
/*    
/*    If you find something on this site useful, please use the contact form to inform Cass-hacks of your application.  If need be, 
/*    modifications could be made to any of the code found on this site to more accurately fit a given application's needs and 
/*    requirements.
/*
******************************************************************/

function Document_On_Finish_Loading() {

    document_is_loaded = true;
}

if (window.addEventListener) {
    window.addEventListener('load', Document_On_Finish_Loading, false);
}
else if (window.attachEvent) {
    window.attachEvent('onload', Document_On_Finish_Loading);
}
else {
    window.onload = Document_On_Finish_Loading;
}

var as_offsetX = -10;
var as_offsetY = 40;
var as_altOffsetX = -37;
var as_tipOffsetX = 20;
var as_tipOffsetY = -28;
var as_curOffsetX = as_offsetX;

var as_owner = null, as_tipContainer = null, as_tipBody = null;
var as_pointer = null, as_altPointer = null, as_curPointer = null;
var as_originalWidth = 0, as_originalHeight = 0;
var as_initialized = false, as_showing = false;
var as_opacity, as_opacity_timer;

var document_is_loaded = false;

var agt=navigator.userAgent.toLowerCase();
var is_major = parseInt(navigator.appVersion);
var test_ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
var is_ie6  = (test_ie && (is_major == 4) && (agt.indexOf("msie 6.")!=-1) );


function hideIEMenus() {
    if (is_ie6)	{
			$$('select').each(function (e) {e.hide(); });
	}
}

function showIEMenus() {
    if (is_ie6)	{
			$$('select').each(function (e) {e.show(); });
	}
}

function doTip(owner, bodyString, mouseX, mouseY) {

    // don't create a tooltip until the whole window is loaded
    if (!document_is_loaded) {
        return;
    }

    as_owner = owner;

    hideIEMenus();
    
	if ( as_tipContainer == null ) {
		
		as_tipContainer = document.createElement('div');
		document.getElementsByTagName('body')[0].appendChild(as_tipContainer);

		if (typeof (as_pointer) == 'undefined') {
		    return;
		}

		as_tipContainer.className = 'as_tipContainer';
		as_tipContainer.style.position = 'absolute';
		
		
		var protocol = document.location.protocol;
        // pointer init code
		as_pointer=document.createElement('img');
		as_altPointer=document.createElement('img');
		as_pointer.src = protocol + "//"+window.location.hostname+"/Assets/Common/images/pixel.gif";
		as_altPointer.src = protocol + "//" + window.location.hostname + "/Assets/Common/images/pixel.gif";
        as_pointer.className = as_altPointer.className = 'as_pointer';
        as_tipContainer.appendChild(as_pointer);
        as_tipContainer.appendChild(as_altPointer);

        
        as_tipBody = document.createElement('div');
        as_tipContainer.appendChild(as_tipBody);
    }
	
	if (typeof (as_opacity_timer) != 'undefined' && as_opacity_timer) {
	    clearTimeout(as_opacity_timer);
	}

	as_tipBody.innerHTML = bodyString;
    
    if (typeof (as_pointer) == 'undefined') {
        return;
    }
    
	as_originalHeight = as_tipContainer.offsetHeight;
	as_originalWidth = as_tipContainer.offsetWidth;
    as_pointer.style.top = as_tipOffsetY+'px';
	as_altPointer.style.top = as_originalHeight - 4 + 'px';
	as_curPointer = as_pointer;
	as_showing = true;
	as_initialized = false;
    
    if (as_owner.addEventListener) {
        as_owner.addEventListener('mousemove',moveTip,false);
        as_owner.addEventListener('mouseout',hideTip,false);
    } else if (as_owner.attachEvent) {
        as_owner.attachEvent('onmousemove',moveTip);	
        as_owner.attachEvent('onmouseout',hideTip);
    }
    
    if (typeof(is_ie) == 'undefined') {
        as_opacity = 0;
        as_tipContainer.style.opacity = 0;
        increaseOpaque();
    }

    if (typeof (mouseX) != 'undefined' && mouseX != null && mouseX != '') {
        moveTip(null, mouseX, mouseY);
    }
}

function doTipFromTag(owner, containerID) {

    var container = document.getElementById(containerID);

    if (typeof (container) == 'object') {
		doTip(owner, container.innerHTML, null, null);
    }
}

function doTipFromImage(owner, imageUrl, text) {
	if(isMobile())
		return;
    if (typeof (imageUrl) == 'string') {
    
        var tipContents = '<div id="hoverAdPage" class="thumbNail"><div class="top">'
                    + '<h1>#text#</h1></div><div class="middle">'
					+ '<img alt="" src="#imageUrl#?thumb" />'
					+ '</div><div class="bottom"></div></div>';

        var contentsTemplate = document.getElementById('doTipFromImageTemplate');

        if (contentsTemplate != null) {

            tipContents = contentsTemplate.innerHTML;
        }

        tipContents = tipContents.replace('#text#', text);
        tipContents = tipContents.replace('#imageUrl#', imageUrl);

		doTip(owner, tipContents, null, null);
    }
}

function doTipFromText(owner, mainText, headingText) {

    if (typeof (mainText) == 'string') {
    
        var tipContents = '<div id="hoverAdPage" class="thumbNail"><div class="top">'
                    + '<h1>#headingText#</h1></div><div class="middle">'
					+ '<p>#mainText#</p>'
					+ '</div><div class="bottom"></div></div>';

        var contentsTemplate = document.getElementById('doTipFromImageTemplate');

        if (contentsTemplate != null) {

            tipContents = contentsTemplate.innerHTML;
        }

        tipContents = tipContents.replace('#headingText#', headingText);
        tipContents = tipContents.replace('#mainText#', mainText);

		doTip(owner, tipContents, null, null);
    }
}

function increaseOpaque () {
    as_opacity += 10;
  
    if (as_opacity <= 100) {
        as_tipContainer.style.opacity = as_opacity/100;
        as_opacity_timer = setTimeout(increaseOpaque, 35);
    }
}

function decreaseOpaque () {
    as_opacity -= 10;

    if (as_opacity > 0) {
        as_tipContainer.style.opacity = as_opacity / 100;
        as_opacity_timer = setTimeout(decreaseOpaque, 35);
    }
    else {
        killTip();
    }
}

function moveTip(e, Xpos, Ypos) {

    if (typeof (as_showing) == 'undefined') {
        return;
    }
    
    if ( !as_showing ) {
	    hideTip();
        return;
    }

    var windowX, windowY;
    
    if (e == null) {
        windowX = Xpos;
        windowY = Ypos;
    } 
    else {
        if (!e) {
            e = window.event;
        }
        
        windowX = (typeof(e.pageX) != 'undefined') ? e.pageX : e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
        windowY = (typeof(e.pageY) != 'undefined') ? e.pageY : e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
    }
    
	var scrollY = window.scrollY ? window.scrollY : document.documentElement.scrollTop;
	var winwidth = (typeof(window.innerWidth) != 'undefined') ? window.innerWidth + self.pageXOffset - 20 : document.documentElement.clientWidth + document.documentElement.scrollLeft;
	var winBottom = (typeof(window.innerHeight) != 'undefined') ? window.innerHeight + self.pageYOffset - 20 : document.documentElement.clientHeight + document.documentElement.scrollTop;
    var height =  as_tipContainer.offsetHeight;
    var width = as_tipContainer.offsetWidth;
    var repositionRight = 0;

	if (windowY + height + as_offsetY > winBottom ){
	    as_curPointer = as_altPointer;
		
        if (as_initialized || typeof(Xpos) != 'undefined') {
	        as_pointer.style.visibility='hidden';
	        as_altPointer.style.visibility='visible';
	    }

	    var topValue = windowY - height - as_offsetY;

	    if (topValue < scrollY) {
	        topValue = scrollY;
	        repositionRight = 75;
	    }
	    
	    as_tipContainer.style.top = topValue + 10 + 'px';
		as_curOffsetX = as_altOffsetX;
    }
    else {

        as_curPointer = as_pointer;
		
        if (as_initialized || typeof(Xpos) != 'undefined') {
  		    as_altPointer.style.visibility='hidden';
  		    as_pointer.style.visibility='visible';
  		}
        
		as_curOffsetX = as_offsetX;
		as_tipContainer.style.top = windowY + as_offsetY + 'px';
    }

    if (windowX + width + as_curOffsetX > winwidth) {
        as_tipContainer.style.left = winwidth - width + 'px';
        as_curPointer.style.left = as_tipOffsetX + windowX + as_curOffsetX - as_tipContainer.offsetLeft + 'px';
    }
    else {
        as_curPointer.style.left = as_tipOffsetX + 'px';
        as_tipContainer.style.left = windowX + repositionRight + as_curOffsetX + 'px';
    }

    if (as_initialized || typeof (Xpos) != 'undefined') {
        as_tipContainer.style.visibility = 'visible';
    }
    
    as_initialized = true;
}

function hideTip() {

    bCancelled = true;
    as_showing = false;
	
	if (as_opacity_timer) {
	    clearTimeout(as_opacity_timer);
	}

	if (typeof (is_ie) == 'undefined') {
	    decreaseOpaque();
	}
	else {
	    killTip();
	}
}

function killTip() {

    showIEMenus();
		
    if (as_tipContainer != null) {
        as_tipContainer.style.visibility = 'hidden';
    }

    if (as_pointer != null) {
        as_pointer.style.visibility = 'hidden';
    }

    if (as_altPointer != null) {
        as_altPointer.style.visibility = 'hidden';
    }

    if (as_owner != null) {
        if (as_owner.removeEventListener) {
            as_owner.removeEventListener('mousemove', moveTip, false);
            as_owner.removeEventListener('mouseout', hideTip, false);
        }
        else if (as_owner.detachEvent) {
            as_owner.detachEvent('onmousemove', moveTip);
            as_owner.detachEvent('onmouseout', hideTip);
        }
    }
}

function UnTip() {

    killTip();
	

}

function isMobile() {
	var check = false;
	(function(a,b){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|mobile|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
	return check;
}

