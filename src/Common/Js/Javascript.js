  var s = new String(window.location.host);
  var i = new Number(s.indexOf('.', 1));
  if (i != - 1){
    document.domain= s.substring(i + 1,s.length);
  }


// JScript source code
//			Image Swap
function swapImages(imageName, imgURL) {
	document[imageName].src = imgURL;
}

//      Nav Button
function btnIn(e){
	e.style.background='E9194D';
	e.style.color='ffffff';
}
function btnOut(e){
	e.style.background='cccccc';
	e.style.color='000000';
}

//        Email Preferences

	function ValidateEmailPrefs() {
	 if ((document.Form1.email_daily.checked==true) && (document.Form1.email_daily_sun.checked==false) && (document.Form1.email_daily_mon.checked==false) && (document.Form1.email_daily_tue.checked==false) && (document.Form1.email_daily_wed.checked==false) && (document.Form1.email_daily_thu.checked==false) && (document.Form1.email_daily_fri.checked==false) && (document.Form1.email_daily_sat.checked==false)){
				alert("Please select the days you would like receive your shopping specials.");
				document.getElementById("scr1").style.display = "block";
				return false;
			}	
		else if ((document.Form1.email_weekly.checked==true) && (document.Form1.email_weekly_sun.checked==false) && (document.Form1.email_weekly_mon.checked==false) && (document.Form1.email_weekly_tue.checked==false) && (document.Form1.email_weekly_wed.checked==false) && (document.Form1.email_weekly_thu.checked==false) && (document.Form1.email_weekly_fri.checked==false) && (document.Form1.email_weekly_sat.checked==false)){
				alert("Please select a day of the week to receive your shopping specials.");
				document.getElementById("scr2").style.display = "block";
				return false;
			}
		else {
		 return true; 
		 }
	}
	
//<!--------------------    Checkbox controls ------------------------->
	function chkBoxToggle(checkbox){
	  var checkboxGroup = checkbox.form[checkbox.id];
	  for (var c = 0; c < checkboxGroup.length; c++)
		if (checkboxGroup[c] != checkbox)
		  checkboxGroup[c].checked = false;	  
	}	
function HideAllCheckBoxDivs() {
			SetDailyDivVisibility(false);
			SetWeeklyDivVisibility(false);
}
// Test if checked
function IsDailyChecked(){
	if(document.getElementById('profileDetails1_EmailPreferences_DailyCheckBox')) {
	return document.Form1.profileDetails1_EmailPreferences_DailyCheckBox.checked;
	} else {
	return false;
	}
}
function IsWeeklyChecked(){
	if(document.getElementById('profileDetails1_EmailPreferences_WeeklyCheckBox')) {
	return document.Form1.profileDetails1_EmailPreferences_WeeklyCheckBox.checked;
	} else {
	return false;
	}
}
function IsMonthlyChecked(){
	if(document.getElementById('profileDetails1_EmailPreferences_MonthlyCheckBox')) {
	return document.Form1.profileDetails1_EmailPreferences_MonthlyCheckBox.checked;
	} else {
	return false;
	}
}	
function IsNoEmailChecked(){
	if(document.getElementById('profileDetails1_EmailPreferences_NoEmailCheckBox')) {
	return document.Form1.profileDetails1_EmailPreferences_NoEmailCheckBox.checked;
	} else {
	return false;
	}
}

// Test for Divs	
function HasDailyDiv() {
	return document.getElementById('profileDetails1_EmailPreferences_DailyCheckBoxDiv');
}
function HasWeeklyDiv() {
	return document.getElementById('profileDetails1_EmailPreferences_WeeklyCheckBoxDiv');
}		
	
// Set visibility of divs
function SetDailyDivVisibility(val) {
	if (HasDailyDiv()){	
		document.getElementById('profileDetails1_EmailPreferences_DailyCheckBoxDiv').style.display = (val ? "block" : "none");
	}
}
function SetWeeklyDivVisibility(val) {
	if (HasWeeklyDiv()){	
		document.getElementById('profileDetails1_EmailPreferences_WeeklyCheckBoxDiv').style.display = (val ? "block" : "none");
	}
}


// Test for Rows
function HasDailyRow() {
	return document.getElementById('profileDetails1_EmailPreferences_DailyRow');
}
function HasWeeklyRow() {
	return document.getElementById('profileDetails1_EmailPreferences_WeeklyRow');
}
function HasMonthlyRow() {
	return document.getElementById('profileDetails1_EmailPreferences_MonthlyRow');
}


// Set Checked 	
function SetDailyChecked(val) {
	if (HasDailyRow()){	
		document.getElementById("profileDetails1_EmailPreferences_DailyCheckBox").checked = val;
	}
}
function SetWeeklyChecked(val) {
	if (HasWeeklyRow()){	
		document.getElementById("profileDetails1_EmailPreferences_WeeklyCheckBox").checked = val;
	}
}
function SetMonthlyChecked(val) {
	if (HasMonthlyRow()){	
		document.getElementById("profileDetails1_EmailPreferences_MonthlyCheckBox").checked = val;
	}
}
function SetNoEmailChecked(val) {
	//if (HasNoEmailRow()){
		document.getElementById("profileDetails1_EmailPreferences_NoEmailCheckBox").checked = val;
		if (val == true){
			HideAllCheckBoxDivs();
		}
	//}
}

	function DailyCheck(){
		if (IsMonthlyChecked()||IsDailyChecked()||IsWeeklyChecked()){	
		if (IsDailyChecked()){
			SetWeeklyChecked(false);
			SetNoEmailChecked(false);
			SetDailyDivVisibility(true);
			SetWeeklyDivVisibility(false);
			}else{
			SetDailyDivVisibility(false);
		}
		SetNoEmailChecked(false);	
	}else{
		SetNoEmailChecked(true);			
	}
}
	function WeeklyCheck(){
		if (IsMonthlyChecked()||IsDailyChecked()||IsWeeklyChecked()){	
		if (IsWeeklyChecked()){
			SetDailyChecked(false);
			SetNoEmailChecked(false);
			SetDailyDivVisibility(false);
			SetWeeklyDivVisibility(true);
			}else{
			SetWeeklyDivVisibility(false);
		}
		SetNoEmailChecked(false);	
	}else{
		SetNoEmailChecked(true);			
	}
}
	function MonthlyCheck(){
		if (IsMonthlyChecked()||IsDailyChecked()||IsWeeklyChecked()){
			SetNoEmailChecked(false);	
			}else{
			SetNoEmailChecked(true);			
		}
	}
	function NoEmailCheck(){
		if (IsNoEmailChecked()){
			SetDailyChecked(false);		
			SetWeeklyChecked(false);
			SetMonthlyChecked(false);		
		}	
		else{
			SetNoEmailChecked(true);	
		}	
		HideAllCheckBoxDivs();
	}
	
	
	
	
/*   <!----------------------------------------------------------------  START SIDE MENU   --->   */
	
var disappeardelay=200  //menu disappear speed onMouseout (in miliseconds)
var enableanchorlink=1 //Enable or disable the anchor link when clicked on? (1=e, 0=d)
var hidemenu_onclick=1 //hide menu when user clicks within menu? (1=yes, 0=no)

/////No further editting needed

var ie5=document.all
var ns6=document.getElementById&&!document.all

function getposOffset(what, offsettype){
	var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
	var parentEl=what.offsetParent;
	while (parentEl!=null){
		totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
		parentEl=parentEl.offsetParent;
	}
	return totaloffset;
}

function showhide(obj, e, visible, hidden){


	if (ie5||ns6)
		dropmenuobj.style.left=dropmenuobj.style.top=-500
	if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover")
		obj.visibility=visible
	else if (e.type=="click")
		obj.visibility=hidden
}

function iecompattest(){
	return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function clearbrowseredge(obj, whichedge){
	var edgeoffset=0
	if (whichedge=="rightedge"){
		var windowedge=ie5 && !window.opera? iecompattest().scrollLeft+iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
		dropmenuobj.contentmeasure=dropmenuobj.offsetWidth
		if (windowedge-dropmenuobj.x < dropmenuobj.contentmeasure)
			edgeoffset=dropmenuobj.contentmeasure-obj.offsetWidth
	}
	else{
		var windowedge=ie5 && !window.opera? iecompattest().scrollTop+iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
		dropmenuobj.contentmeasure=dropmenuobj.offsetHeight
		if (windowedge-dropmenuobj.y < dropmenuobj.contentmeasure)
			edgeoffset=dropmenuobj.contentmeasure+obj.offsetHeight
	}
	return edgeoffset
}

function dropdownmenu(obj, e, dropmenuID){

	if (window.event) event.cancelBubble=true
	else if (e.stopPropagation) e.stopPropagation()
	
	if (typeof dropmenuobj!="undefined") //hide previous menu
		dropmenuobj.style.visibility="hidden"
		
		
	clearhidemenu()
	
	
	if (ie5||ns6){
		obj.onmouseout=delayhidemenu
		dropmenuobj=document.getElementById(dropmenuID)
		dropmenuImgName=dropmenuID+'IMG'
		if (hidemenu_onclick) dropmenuobj.onclick=function(){dropmenuobj.style.visibility='hidden'}
			dropmenuobj.onmouseover=clearhidemenu
		dropmenuobj.onmouseout=ie5? function(){ dynamichide(event)} : function(event){ dynamichide(event)}
		showhide(dropmenuobj.style, e, "visible", "hidden")
		dropmenuobj.x=getposOffset(obj, "left") + 150
		dropmenuobj.y=getposOffset(obj, "top") - 15
		dropmenuobj.style.left=dropmenuobj.x-clearbrowseredge(obj, "rightedge")+"px"
		dropmenuobj.style.top=dropmenuobj.y-clearbrowseredge(obj, "bottomedge")+obj.offsetHeight+"px"
	}
	return clickreturnvalue()
}

function clickreturnvalue(){
	if ((ie5||ns6) && !enableanchorlink) return false
	else return true
}

function contains_ns6(a, b) {
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
		return false;
}

function dynamichide(e){
	if (ie5&&!dropmenuobj.contains(e.toElement))
		delayhidemenu()
	else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
		delayhidemenu()
}

function delayhidemenu(){
	delayhide=setTimeout('hideStuff()',disappeardelay)
}

function clearhidemenu(){
	if (typeof delayhide!="undefined")
		clearTimeout(delayhide)
		setNavHighlight();		
		//this function is on page and is called here to hide rollover when other menu button is displayed
}

function hideStuff() {
	dropmenuobj.style.visibility='hidden';
	setNavHighlight();		
		//this function is on page and is called here to hide rollover when NON menu button is displayed
}
/*   <!----------------------------------------------------------------  END SIDE MENU   --->   */

/*   <!-----------------------------------------------------  START RUN ACTIVE CONTENT   --->   */

//v1.7
// Flash Player Version Detection
// Detect Client Browser type
// Copyright 2005-2007 Adobe Systems Incorporated.  All rights reserved.
var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;

function ControlVersion()
{
	var version;
	var axo;
	var e;

	// NOTE : new ActiveXObject(strFoo) throws an exception if strFoo isn't in the registry

	try {
		// version will be set for 7.X or greater players
		axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		version = axo.GetVariable("$version");
	} catch (e) {
	}

	if (!version)
	{
		try {
			// version will be set for 6.X players only
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
			
			// installed player is some revision of 6.0
			// GetVariable("$version") crashes for versions 6.0.22 through 6.0.29,
			// so we have to be careful. 
			
			// default to the first public version
			version = "WIN 6,0,21,0";

			// throws if AllowScripAccess does not exist (introduced in 6.0r47)		
			axo.AllowScriptAccess = "always";

			// safe to call for 6.0r47 or greater
			version = axo.GetVariable("$version");

		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 4.X or 5.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 3.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = "WIN 3,0,18,0";
		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 2.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
			version = "WIN 2,0,0,11";
		} catch (e) {
			version = -1;
		}
	}
	
	return version;
}

// JavaScript helper required to detect Flash Player PlugIn version information
function GetSwfVer(){
	// NS/Opera version >= 3 check for Flash plugin in plugin array
	var flashVer = -1;
	
	if (navigator.plugins != null && navigator.plugins.length > 0) {
		if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
			var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
			var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
			var descArray = flashDescription.split(" ");
			var tempArrayMajor = descArray[2].split(".");			
			var versionMajor = tempArrayMajor[0];
			var versionMinor = tempArrayMajor[1];
			var versionRevision = descArray[3];
			if (versionRevision == "") {
				versionRevision = descArray[4];
			}
			if (versionRevision[0] == "d") {
				versionRevision = versionRevision.substring(1);
			} else if (versionRevision[0] == "r") {
				versionRevision = versionRevision.substring(1);
				if (versionRevision.indexOf("d") > 0) {
					versionRevision = versionRevision.substring(0, versionRevision.indexOf("d"));
				}
			}
			var flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
		}
	}
	// MSN/WebTV 2.6 supports Flash 4
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
	// WebTV 2.5 supports Flash 3
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
	// older WebTV supports Flash 2
	else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
	else if ( isIE && isWin && !isOpera ) {
		flashVer = ControlVersion();
	}	
	return flashVer;
}

// When called with reqMajorVer, reqMinorVer, reqRevision returns true if that version or greater is available
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision)
{
	versionStr = GetSwfVer();
	if (versionStr == -1 ) {
		return false;
	} else if (versionStr != 0) {
		if(isIE && isWin && !isOpera) {
			// Given "WIN 2,0,0,11"
			tempArray         = versionStr.split(" "); 	// ["WIN", "2,0,0,11"]
			tempString        = tempArray[1];			// "2,0,0,11"
			versionArray      = tempString.split(",");	// ['2', '0', '0', '11']
		} else {
			versionArray      = versionStr.split(".");
		}
		var versionMajor      = versionArray[0];
		var versionMinor      = versionArray[1];
		var versionRevision   = versionArray[2];

        	// is the major.revision >= requested major.revision AND the minor version >= requested minor
		if (versionMajor > parseFloat(reqMajorVer)) {
			return true;
		} else if (versionMajor == parseFloat(reqMajorVer)) {
			if (versionMinor > parseFloat(reqMinorVer))
				return true;
			else if (versionMinor == parseFloat(reqMinorVer)) {
				if (versionRevision >= parseFloat(reqRevision))
					return true;
			}
		}
		return false;
	}
}

function AC_AddExtension(src, ext)
{
  if (src.indexOf('?') != -1)
    return src.replace(/\?/, ext+'?'); 
  else
    return src + ext;
}

function AC_Generateobj(objAttrs, params, embedAttrs) 
{ 
  var str = '';
  if (isIE && isWin && !isOpera)
  {
    str += '<object ';
    for (var i in objAttrs)
    {
      str += i + '="' + objAttrs[i] + '" ';
    }
    str += '>';
    for (var i in params)
    {
      str += '<param name="' + i + '" value="' + params[i] + '" /> ';
    }
    str += '</object>';
  }
  else
  {
    str += '<embed ';
    for (var i in embedAttrs)
    {
      str += i + '="' + embedAttrs[i] + '" ';
    }
    str += '> </embed>';
  }

  document.write(str);
}

function AC_FL_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_SW_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , null
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_GetArgs(args, ext, srcParamName, classid, mimeType){
  var ret = new Object();
  ret.embedAttrs = new Object();
  ret.params = new Object();
  ret.objAttrs = new Object();
  for (var i=0; i < args.length; i=i+2){
    var currArg = args[i].toLowerCase();    

    switch (currArg){	
      case "classid":
        break;
      case "pluginspage":
        ret.embedAttrs[args[i]] = args[i+1];
        break;
      case "src":
      case "movie":	
        args[i+1] = AC_AddExtension(args[i+1], ext);
        ret.embedAttrs["src"] = args[i+1];
        ret.params[srcParamName] = args[i+1];
        break;
      case "onafterupdate":
      case "onbeforeupdate":
      case "onblur":
      case "oncellchange":
      case "onclick":
      case "ondblclick":
      case "ondrag":
      case "ondragend":
      case "ondragenter":
      case "ondragleave":
      case "ondragover":
      case "ondrop":
      case "onfinish":
      case "onfocus":
      case "onhelp":
      case "onmousedown":
      case "onmouseup":
      case "onmouseover":
      case "onmousemove":
      case "onmouseout":
      case "onkeypress":
      case "onkeydown":
      case "onkeyup":
      case "onload":
      case "onlosecapture":
      case "onpropertychange":
      case "onreadystatechange":
      case "onrowsdelete":
      case "onrowenter":
      case "onrowexit":
      case "onrowsinserted":
      case "onstart":
      case "onscroll":
      case "onbeforeeditfocus":
      case "onactivate":
      case "onbeforedeactivate":
      case "ondeactivate":
      case "type":
      case "codebase":
      case "id":
        ret.objAttrs[args[i]] = args[i+1];
        break;
      case "width":
      case "height":
      case "align":
      case "vspace": 
      case "hspace":
      case "class":
      case "title":
      case "accesskey":
      case "name":
      case "tabindex":
        ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i+1];
        break;
      default:
        ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i+1];
    }
  }
  ret.objAttrs["classid"] = classid;
  if (mimeType) ret.embedAttrs["type"] = mimeType;
  return ret;
}

/*   <!-----------------------------------------------------  END RUN ACTIVE CONTENT   --->   */
