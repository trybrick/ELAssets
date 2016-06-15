var pageTracker = _gat._getTracker("UA-4956436-3");
pageTracker._initData();
pageTracker._trackPageview();




document.getElementById('WOImage').src = "http://www.festfoods.com/WebOuts/CouponsWO/ClickMe.png";
document.getElementById('WOImage').onclick = playMovie;

var WOposition = "absolute";
var WOwidth = 300;
var WOheight = 290;
var WOtop = 400;
var WOzindex = 9999;
var WOleft = 70 + '%';
var WOMarginLeft = 100;

document.getElementById('WebOut').style.position = WOposition;
document.getElementById('WebOut').style.width = WOwidth +'px';
document.getElementById('WebOut').style.height = WOheight + 'px';
document.getElementById('WebOut').style.top = WOtop+'px';
document.getElementById('WebOut').style.zIndex = WOzindex;
document.getElementById('WebOut').style.left = WOleft;
document.getElementById('WebOut').style.marginLeft = WOMarginLeft + 'px';


var WOWOX = 0;
var WOWOY = 5;
var WOCY = 0;
var WOLL = 185;
var WOSL = "yes";
var WOSWF = "http://www.festfoods.com/WebOuts/CouponsWO/CouponsWO.swf";
var WOCP = "CouponsWO.flv";
var WOBT = 10;
var WOTT = 48;
var WOSWO = "yes";
var WOFI = "false";
var WOFIS = 3;
var WOFIT = 1;
var WOFO = "false";
var WOAFOS = 15;
var WOFOT = 1;
var WOVOL = 100;
var WOCCON = "false";
var WOCCV = "false";
var WOCCNUM = 0;
var WOCCH = 55;
var WOCCW = 300;
var WOCCY = 250;
var WOCCFS = 12;
var WOCCFC = "0xFFFFFF";
var WOCCBDC = "0xFFFFFF";
var WOCCF = "tahoma";
var WOCCBC = "0x000000";
var WOCOF = "off";
var WOS = "FestFoods";
var WOP = "CouponsWO";
var WOPX = undefined;
var WOPY = undefined;
var WOPV = "false";
var WOWOCAV = "true";
var WOEWOTP = "undefined";




function ReDirect () {

GetCookie('SplashSkip');

if (Splash == 'TRUE') {
	stopMovie();
}

else {
	playMovie();
}
}

var Splash = GetCookie('SplashSkip');


function getCookieVal (offset) {
  var endstr = document.cookie.indexOf (';', offset);
  if (endstr == -1)
    endstr = document.cookie.length;
  return unescape(document.cookie.substring(offset, endstr));
}

function GetCookie (name) {
  var arg = name + '=';
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
  var j = i + alen;
  if (document.cookie.substring(i, j) == arg)
    return getCookieVal (j);
  i = document.cookie.indexOf(' ', i) + 1;
  if (i == 0) break;
  }
  return null;
}

function SetCookie (name, value) {
  // Enter number of days the cookie should persist
  var expDays = 90000;
  var exp = new Date();
  exp.setTime(exp.getTime() + (expDays * 24 * 60 * 60 * 1000));
  expirationDate = exp.toGMTString();
  // Set cookie with name and value provided
  // in function call and date from above
  document.cookie = name + '=' + escape(value)
  document.cookie += '; expires=' + exp.toGMTString();
}


if (WOCOF == "on") {
	ReDirect(); SetCookie('SplashSkip','TRUE'); 
}
else {
	//window.onload = newWebOut;
}





function newWebOut(){

/**
 * SWFObject v1.5: Flash Player detection and embed - http://blog.deconcept.com/swfobject/
 *
 * SWFObject is (c) 2007 Geoff Stearns and is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
if(typeof deconcept=="undefined"){var deconcept=new Object();}if(typeof deconcept.util=="undefined"){deconcept.util=new Object();}if(typeof deconcept.SWFObjectUtil=="undefined"){deconcept.SWFObjectUtil=new Object();}deconcept.SWFObject=function(_1,id,w,h,_5,c,_7,_8,_9,_a){if(!document.getElementById){return;}this.DETECT_KEY=_a?_a:"detectflash";this.skipDetect=deconcept.util.getRequestParameter(this.DETECT_KEY);this.params=new Object();this.variables=new Object();this.attributes=new Array();if(_1){this.setAttribute("swf",_1);}if(id){this.setAttribute("id",id);}if(w){this.setAttribute("width",w);}if(h){this.setAttribute("height",h);}if(_5){this.setAttribute("version",new deconcept.PlayerVersion(_5.toString().split(".")));}this.installedVer=deconcept.SWFObjectUtil.getPlayerVersion();if(!window.opera&&document.all&&this.installedVer.major>7){deconcept.SWFObject.doPrepUnload=true;}if(c){this.addParam("bgcolor",c);}var q=_7?_7:"high";this.addParam("quality",q);this.setAttribute("useExpressInstall",false);this.setAttribute("doExpressInstall",false);var _c=(_8)?_8:window.location;this.setAttribute("xiRedirectUrl",_c);this.setAttribute("redirectUrl","");if(_9){this.setAttribute("redirectUrl",_9);}};deconcept.SWFObject.prototype={useExpressInstall:function(_d){this.xiSWFPath=!_d?"expressinstall.swf":_d;this.setAttribute("useExpressInstall",true);},setAttribute:function(_e,_f){this.attributes[_e]=_f;},getAttribute:function(_10){return this.attributes[_10];},addParam:function(_11,_12){this.params[_11]=_12;},getParams:function(){return this.params;},addVariable:function(_13,_14){this.variables[_13]=_14;},getVariable:function(_15){return this.variables[_15];},getVariables:function(){return this.variables;},getVariablePairs:function(){var _16=new Array();var key;var _18=this.getVariables();for(key in _18){_16[_16.length]=key+"="+_18[key];}return _16;},getSWFHTML:function(){var _19="";if(navigator.plugins&&navigator.mimeTypes&&navigator.mimeTypes.length){if(this.getAttribute("doExpressInstall")){this.addVariable("MMplayerType","PlugIn");this.setAttribute("swf",this.xiSWFPath);}_19="<embed type=\"application/x-shockwave-flash\" src=\""+this.getAttribute("swf")+"\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\" style=\""+this.getAttribute("style")+"\"";_19+=" id=\""+this.getAttribute("id")+"\" name=\""+this.getAttribute("id")+"\" ";var _1a=this.getParams();for(var key in _1a){_19+=[key]+"=\""+_1a[key]+"\" ";}var _1c=this.getVariablePairs().join("&");if(_1c.length>0){_19+="flashvars=\""+_1c+"\"";}_19+="/>";}else{if(this.getAttribute("doExpressInstall")){this.addVariable("MMplayerType","ActiveX");this.setAttribute("swf",this.xiSWFPath);}_19="<object id=\""+this.getAttribute("id")+"\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\" style=\""+this.getAttribute("style")+"\">";_19+="<param name=\"movie\" value=\""+this.getAttribute("swf")+"\" />";var _1d=this.getParams();for(var key in _1d){_19+="<param name=\""+key+"\" value=\""+_1d[key]+"\" />";}var _1f=this.getVariablePairs().join("&");if(_1f.length>0){_19+="<param name=\"flashvars\" value=\""+_1f+"\" />";}_19+="</object>";}return _19;},write:function(_20){if(this.getAttribute("useExpressInstall")){var _21=new deconcept.PlayerVersion([6,0,65]);if(this.installedVer.versionIsValid(_21)&&!this.installedVer.versionIsValid(this.getAttribute("version"))){this.setAttribute("doExpressInstall",true);this.addVariable("MMredirectURL",escape(this.getAttribute("xiRedirectUrl")));document.title=document.title.slice(0,47)+" - Flash Player Installation";this.addVariable("MMdoctitle",document.title);}}if(this.skipDetect||this.getAttribute("doExpressInstall")||this.installedVer.versionIsValid(this.getAttribute("version"))){var n=(typeof _20=="string")?document.getElementById(_20):_20;n.innerHTML=this.getSWFHTML();return true;}else{if(this.getAttribute("redirectUrl")!=""){document.location.replace(this.getAttribute("redirectUrl"));}}return false;}};deconcept.SWFObjectUtil.getPlayerVersion=function(){var _23=new deconcept.PlayerVersion([0,0,0]);if(navigator.plugins&&navigator.mimeTypes.length){var x=navigator.plugins["Shockwave Flash"];if(x&&x.description){_23=new deconcept.PlayerVersion(x.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split("."));}}else{if(navigator.userAgent&&navigator.userAgent.indexOf("Windows CE")>=0){var axo=1;var _26=3;while(axo){try{_26++;axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+_26);_23=new deconcept.PlayerVersion([_26,0,0]);}catch(e){axo=null;}}}else{try{var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");}catch(e){try{var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");_23=new deconcept.PlayerVersion([6,0,21]);axo.AllowScriptAccess="always";}catch(e){if(_23.major==6){return _23;}}try{axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");}catch(e){}}if(axo!=null){_23=new deconcept.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(","));}}}return _23;};deconcept.PlayerVersion=function(_29){this.major=_29[0]!=null?parseInt(_29[0]):0;this.minor=_29[1]!=null?parseInt(_29[1]):0;this.rev=_29[2]!=null?parseInt(_29[2]):0;};deconcept.PlayerVersion.prototype.versionIsValid=function(fv){if(this.major<fv.major){return false;}if(this.major>fv.major){return true;}if(this.minor<fv.minor){return false;}if(this.minor>fv.minor){return true;}if(this.rev<fv.rev){return false;}return true;};deconcept.util={getRequestParameter:function(_2b){var q=document.location.search||document.location.hash;if(_2b==null){return q;}if(q){var _2d=q.substring(1).split("&");for(var i=0;i<_2d.length;i++){if(_2d[i].substring(0,_2d[i].indexOf("="))==_2b){return _2d[i].substring((_2d[i].indexOf("=")+1));}}}return "";}};deconcept.SWFObjectUtil.cleanupSWFs=function(){var _2f=document.getElementsByTagName("OBJECT");for(var i=_2f.length-1;i>=0;i--){_2f[i].style.display="none";for(var x in _2f[i]){if(typeof _2f[i][x]=="function"){_2f[i][x]=function(){};}}}};if(deconcept.SWFObject.doPrepUnload){if(!deconcept.unloadSet){deconcept.SWFObjectUtil.prepUnload=function(){__flash_unloadHandler=function(){};__flash_savedUnloadHandler=function(){};window.attachEvent("onunload",deconcept.SWFObjectUtil.cleanupSWFs);};window.attachEvent("onbeforeunload",deconcept.SWFObjectUtil.prepUnload);deconcept.unloadSet=true;}}if(!document.getElementById&&document.all){document.getElementById=function(id){return document.all[id];};}var WOCCOFN = " ";var getQueryParamValue=deconcept.util.getRequestParameter;var FlashObject=deconcept.SWFObject;var SWFObject=deconcept.SWFObject;



   var so = new FlashObject(WOSWF, "WOFlashMovie", WOwidth, WOheight, "8", "");
   so.addParam("allowScriptAccess", "always");
   so.addParam("wmode", "transparent");
   so.addParam("scale", "noScale");
   so.addVariable("WOX", WOWOX);
   so.addVariable("WOY", WOWOY);
   so.addVariable("CY", WOCY);
   so.addVariable("LL", WOLL);
   so.addVariable("SL", WOSL);
   so.addVariable("W", WOwidth);
   so.addVariable("H", WOheight);
   so.addVariable("CP", WOCP);
   so.addVariable("BT", WOBT);
   so.addVariable("TT", WOTT);
   so.addVariable("SWO", WOSWO);
   so.addVariable("FI", WOFI);
   so.addVariable("FIS", WOFIS);  
   so.addVariable("FIT", WOFIT);
   so.addVariable("FO", WOFO);
   so.addVariable("AF0S", WOAFOS);
   so.addVariable("F0T", WOFOT);
   so.addVariable("VOL", WOVOL);
   so.addVariable("CCT0", WOCCON);
   so.addVariable("CCV", WOCCV);
   so.addVariable("CCNUM", WOCCNUM);
   so.addVariable("CCOFN", WOCCOFN);
   so.addVariable("CCON", WOCCON);
   so.addVariable("CCH", WOCCH);
   so.addVariable("CCW", WOCCW);
   so.addVariable("CCY", WOCCY);
   so.addVariable("CCFS", WOCCFS);
   so.addVariable("CCFC", WOCCFC);
   so.addVariable("CCBDC", WOCCBDC);
   so.addVariable("CCF", WOCCF);
   so.addVariable("CCBC", WOCCBC);
   so.addVariable("WOS", WOS);
   so.addVariable("WOP", WOP);
   so.addVariable("PPX", WOPX);
   so.addVariable("PPY", WOPY);
   so.addVariable("PPV", WOPV);
   so.addVariable("WOCAV", WOWOCAV);
   so.addVariable("EWOTP", WOEWOTP);
   so.write("WOContent");


 
   
   

var persistclose=0 //set to 0 or 1. 1 means once the bar is manually closed, it will remain closed for browser session
var startX = 300 //set x offset of bar in pixels
var WebOutWidth = 355
var startY = 0 //set y offset of bar in pixels
var verticalpos="frombottom" //enter "fromtop" or "frombottom"

function iecompattest(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function get_cookie(Name) {
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) {
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}



function staticbar(){
	barheight=document.getElementById("WebOut").offsetHeight
	var ns = (navigator.appName.indexOf("Netscape") != -1) || window.opera;
	var d = document;
	function ml(id){
		var el=d.getElementById(id);
		if (!persistclose || persistclose && get_cookie("remainclosed")=="")
		el.style.visibility="visible"
		if(d.layers)el.style=el;
		el.sP=function(x,y){this.style.left=x+"%";this.style.top=y+"px";};
		el.x = 50;
		if (verticalpos=="fromtop")
		el.y = startY;
		else{
		el.y = ns ? pageYOffset + innerHeight : iecompattest().scrollTop + iecompattest().clientHeight;
		el.y -= startY;
		}
		return el;
	}
	window.stayTopLeft=function(){
		if (verticalpos=="fromtop"){
		var pY = ns ? pageYOffset : iecompattest().scrollTop;
		ftlObj.y += (pY + startY - ftlObj.y)/8;
		}
		else{
		var pY = ns ? pageYOffset + innerHeight - barheight: iecompattest().scrollTop + iecompattest().clientHeight - barheight;
		ftlObj.y += (pY - startY - ftlObj.y)/8;
		}
		ftlObj.sP(ftlObj.x, ftlObj.y);
		setTimeout("stayTopLeft()", 10);
	}
	ftlObj = ml("WebOut");
	stayTopLeft();
	 
        
}


//staticbar();

}




function setVisibility(objectID,state) {
	var object = document.getElementById(objectID);
	object.style.visibility = state;
	}

function closeWebOut(){
	setVisibility('WebOut','hidden');
	}
	

function getFlashMovieObject(movieName)
{
  if (window.document[movieName]) 
  {
    return window.document[movieName];
  }
  if (navigator.appName.indexOf("Microsoft Internet")==-1)
  {
    if (document.embeds && document.embeds[movieName])
      return document.embeds[movieName]; 
  }
  else 
  {
    return document.getElementById(movieName);
  }
}


function playMovie() {
	WOSWF = "http://www.festfoods.com/WebOuts/CouponsWO/CouponsWO.swf";
	WOSL = "yes";
	WOSWO = "yes";
	newWebOut();
	setVisibility('WebOut','visible');
}

function stopMovie() {
	WOSWF = "http://www.festfoods.com/WebOuts/CouponsWO/CouponsWO.swf";
	WOSL = "no";
	WOSWO = "no";
	newWebOut();
	setVisibility('WebOut','hidden');
}

