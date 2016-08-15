
var dofade=true;     
var center=false;    
var centertext=false; 
var speed = 100;
var looptime = 20;                   


var NS4 = (navigator.appName.indexOf("Netscape")>=0 && !document.getElementById)? true : false;
var IE4 = (document.all && !document.getElementById)? true : false;
var IE5 = (document.getElementById && document.all)? true : false;
var IE7 = (document.documentElement && typeof document.documentElement.style.maxHeight!="undefined")? true : false;
var NS6 = (document.getElementById && navigator.appName.indexOf("Netscape")>=0 )? true: false;
var W3C = (document.getElementById)? true : false;
var w_y, w_x, hovertxt, boxheight, boxwidth;
var ishover=false;
var isloaded=false;
var ieop=0;
var op_id=0;

function getwindowdims(){
	//w_y=(NS4||NS6)? window.innerHeight : (IE5||IE4)? document.body.clientHeight : 0;
	w_y=(NS4||NS6)? window.innerHeight : (IE5||IE4)? (document.compatMode=="CSS1Compat")?document.documentElement.clientHeight : document.body.clientHeight : 0;
	w_x=(NS4||NS6)? window.innerWidth : (IE5||IE4)? document.body.clientWidth : 0;
}

function getboxwidth(){
	if(NS4 && hovertxt)boxwidth=(hovertxt.document.width)? hovertxt.document.width : hovertxt.clip.width;
	if((IE5||IE4) && hovertxt)boxwidth=(hovertxt.style.pixelWidth)? hovertxt.style.pixelWidth : hovertxt.offsetWidth;
	if(NS6 && hovertxt)boxwidth=(hovertxt.style.width)? parseInt(hovertxt.style.width) : parseInt(hovertxt.offsetWidth);
}

function getboxheight(){
	if(NS4 && hovertxt)boxheight=(hovertxt.document.height)? hovertxt.document.height : hovertxt.clip.height;
	if((IE4||IE5) && hovertxt)boxheight=(hovertxt.style.pixelHeight)? hovertxt.style.pixelHeight : hovertxt.offsetHeight;
	if(NS6 && hovertxt)boxheight=parseInt(hovertxt.offsetHeight);
}

function movehovertxt(x,y){
	if(NS4 && hovertxt)hovertxt.moveTo(x,y);
	if((W3C||IE4) && hovertxt){
		hovertxt.style.left=x+'px';
		hovertxt.style.top=y+'px';
	}
}

function getpagescrolly(){
    if(IE7) return document.documentElement.scrollTop;
	if(NS4||NS6)return window.pageYOffset;
	//if(IE5||IE4)return document.body.scrollTop;
	if(IE5||IE4) return document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
}

function getpagescrollx(){
    if(IE7) return document.documentElement.scrollLeft;
	if(NS4||NS6)return window.pageXOffset;
	if(IE5||IE4)return document.body.scrollLeft;
}

function writeindiv(text){
	if(NS4 && hovertxt){
		hovertxt.document.open();
		hovertxt.document.write(text);
		hovertxt.document.close();
	}
	if((W3C||IE4) && hovertxt) {
		hovertxt.innerHTML=text;
	}
}

//**** END UTILITY FUNCTIONS ****//

function writetxt(text) {
	if(isloaded){
		if(text!=0){
		    
			ishover=true;
			if(NS4)text='<div class="hovertext">'+((centertext)?'<center>':'')+text+((centertext)?'</center>':'')+'</div>';
			writeindiv(text);
			getboxheight();
			if((W3C || IE4) && dofade){
				ieop=0;
				incropacity();
			}
			
		}
		else {
		    firstTime=true;
			if(NS4)hovertxt.visibility="hide";
			if(IE4||W3C){
				if(dofade)clearTimeout(op_id);
				hovertxt.style.visibility="hidden";
			}
			writeindiv('');
			ishover=false;
		}
	}
}

function incropacity(){
	if(ieop<=100){
		ieop+= speed;
		if(IE4 || IE5)hovertxt.style.filter="alpha(opacity="+ieop+")";
		if(NS6)hovertxt.style.MozOpacity=ieop/100;
		op_id=setTimeout('incropacity()', looptime);
	}
}

var firstTime;

function moveobj(evt){
	if(isloaded && ishover){
		margin=(IE4||IE5)? 1 : 23;
		if(NS6)if(document.height+27-window.innerHeight<0)margin=15;
		if(NS4)if(document.height-window.innerHeight<0)margin=10;


		if (NS4){
			mx=evt.pageX
			my=evt.pageY
		}
		else if (NS6){
			mx=evt.clientX
			my=evt.clientY
		}
		else if (IE5){
			mx=event.clientX
			my=event.clientY
		}
		else if (IE4){
			mx=0
			my=0
		}

		if(NS4){
			mx-=getpagescrollx();
			my-=getpagescrolly();
		}
		xoff=(center)? mx-boxwidth/2 : mx+5;
		yoff=(my+boxheight+30+margin-getpagescrolly()>=w_y)? -15-boxheight: 30;

		movehovertxt( Math.min(w_x-boxwidth-margin , Math.max(2,xoff))+getpagescrollx() , my+yoff+getpagescrolly());
		if(NS4 && hovertxt)hovertxt.visibility="show";
		if((W3C||IE4) && hovertxt)hovertxt.style.visibility="visible";
	}
}

if(NS4)document.captureEvents(Event.MOUSEMOVE);
document.onmousemove=moveobj;
window.onload=function() {
	hovertxt=(NS4)? document.layers['hovertxt'] : (IE4)? document.all['hovertxt'] : (W3C)? document.getElementById('hovertxt') : null;
	getboxwidth();
	getboxheight();
	getwindowdims();
	isloaded=true;
	if((W3C || IE4) && centertext && hovertxt)hovertxt.style.textAlign="center";
  	if(W3C && hovertxt)hovertxt.style.padding='0px';
  	if((IE4 || IE5) && dofade && hovertxt)hovertxt.style.filter="alpha(opacity=0)";
	setTimeout('setHover()',2000); //AJAX seems to throw off IE6 - reset
}

function setHover() {
	hovertxt=(NS4)? document.layers['hovertxt'] : (IE4)? document.all['hovertxt'] : (W3C)? document.getElementById('hovertxt') : null;
	setTimeout('setHover()',2000);
}

window.onresize=getwindowdims;


