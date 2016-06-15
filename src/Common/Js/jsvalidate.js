// JavaScript Document

/* JSValidate preferences */
var js_options = {
	errorTag: "span", // which tag do you want to use for error container. it must be one that opens and closes (div,span,p,b)
	errorClass: "jsvalidation", // this is the css class name given to the tag above
	errorLocation: "afterEnd", // only accepts beforeBegin or afterEnd (either before or after the input element)
	//note: if you choose "none" for the above attribute, you must create the error yourself and give the element an ID consisting of the option below + the name of the field to validate.
	errorIDPrefix: "jsvalidator", // prefix of the id of the element above that will attach to the name or id of the form element. don't use spaces or special characters.
	startGone: true, //couldn't think of another name for this, but if true, it will apply "display:none", otherwise, the element is just invisible.
	useBR: "none", // accepts before, after, both or none; This will add a new line (<br />) before and/or after the above element.
	useBlur: true, // this will attach an onBlur validator to each form element.
	submitClass: 'submit_action', // apply this class inside any form to let this element submit the form.
	highlightColor: '#FFFF99', //default color should be:  #FFFF99
	endColor: '#FFFFFF', //this is what you generally want to set to the background color behind the form elements.
	extMessage: true // if true, and you have accept value on file input, it tells user what extensions are accepted.
}
//note: can apply any of the custom options above by including {optionname: 'value'} in the element's class.

//setup validators like: name of validator, default message, /regular expression/ !don't forget the / in front and the / in back!!!!
var custom_validators = {
	number: {
		className: "jsvalidate_number",
		defaultMessage: "This field must have a numerical value.",
		regExp: /^[-]?\d+(\.\d+)?$/
	},
	digits: {
		className: "jsvalidate_digits",
		defaultMessage: "This field can only contain numbers.",
		regExp: /^[-]?\d+(\.\d+)?$/
	},
	email: {
		className: "jsvalidate_email",
		defaultMessage: "- Invalid Email Address",
		regExp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
	},
	uscanzip: {
		className: "jsvalidate_uscanzip",
		defaultMessage: "Invalid zip code.",
		regExp: /^((\d{5}([- ])\d{4})|(\d{5})|([AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvXxYy]\d[A-Za-z]\s?\d[A-Za-z]\d))$/
	},
	usstate: {
		className: "jsvalidate_usstate",
		defaultMessage: "This field must contain a valid 2 letter US state code.",
		regExp: /^(A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[ANU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$/
	},
	usphone: {
		className: "jsvalidate_usphone",
		defaultMessage: "This field must contain a valid phone number with area code.",
		regExp: /^([0-9]( |-|.)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-|.)?([0-9]{3}( |-|.)?[0-9]{4}|[a-zA-Z0-9]{7})$/
	},
	creditcard: {
		className: "jsvalidate_creditcard",
		defaultMessage: "This field must contain a valid credit card number.",
		regExp: /^((4\d{3})|(5[1-5]\d{2})|(6011))([- ])?\d{4}([- ])?\d{4}([- ])?\d{4}|3[4,7]\d{13}$/
	},
	ssn: {
		className: "jsvalidate_ssn",
		defaultMessage: "This field must contain a valid social security number.",
		regExp: /(^|\s)(00[1-9]|0[1-9]0|0[1-9][1-9]|[1-6]\d{2}|7[0-6]\d|77[0-2])(-?|[\. ])([1-9]0|0[1-9]|[1-9][1-9])\3(\d{3}[1-9]|[1-9]\d{3}|\d[1-9]\d{2}|\d{2}[1-9]\d)($|\s|[;:,!\.\?])/
	},
	alpha: {
		className: "jsvalidate_alpha",
		defaultMessage: "This field must contain only letters.",
		regExp: /^[a-zA-z\s]+$/
	},
	alphanum: {
		className: "jsvalidate_alphanum",
		defaultMessage: "This field must contain only letters or numbers.",
		regExp: /^[a-zA-Z0-9]+$/
	}
};


/* only change the default message, do not change the className */
var js_validators = {
	required: {
		className: "jsrequired",
		defaultMessage: "*Required"
	},
	notfirst: {
		className: "select-notfirst",
		defaultMessage: "Select something other than the first item."
	},
	filetypes: {
		defaultMessage: "This field accepts the following file types:"
	}
};


/* begin uneditable code ---- please don't touch */

String.prototype.trim = function() {
	a = this.replace(/^\s+/, '');
	return a.replace(/\s+$/, '');
};

Array.prototype.inArray = function (value){
    var i;
    for (i=0; i < this.length; i++) {
        // Matches identical (===), not just similar (==).
        if (this[i] === value) {
            return true;
        }
    }
    return false;
};

Array.prototype.remove=function(s){
	for(i=0;i<this.length;i++){
		if(s==this[i]) this.splice(i, 1);
	}
};

String.prototype.isEmpty = function() {
   if ((this.value.length == 0) || (this.value==null)) {
      return true;
   }
   return false;
};

// Removes the last element from an array
// and returns that element.
if (!Array.prototype.pop) {
	Array.prototype.pop = function() {
		var last;
		if (this.length) {
			last = this[this.length - 1];
			this.length -= 1;
		}
		return last||null;
	};
}

// Adds one or more elements to the end of an array and returns
// the new length of the array.
if (!Array.prototype.push) {
	Array.prototype.push = function() {
		for (var i = 0; i < arguments.length; ++i) {
			this[this.length] = arguments[i];
		}
		return this.length;
	};
}

function isset(v) {
	return((typeof(v)=='undefined' || v.length==0) ? false : true);
}

function getOption(property, localoptions){
	var value = '';
	
	if(typeof(localoptions) != 'undefined' && localoptions.length > 0){
		try{
			value = localoptions[property];
		}
		catch(err){
			value = '';
		}
	}
	
	if(value.length < 1){
		try{
			value = js_options[property];
		}
		catch(err){
			value = '';
		}
	}
	
	return value;
}

function getElementsByClassName(className, tag, elm){
	var testClass = new RegExp("(^|\\s)" + className + "(\\s|$)");
	var tag = tag || "*";
	var elm = elm || document;
	var elements = (tag == "*" && elm.all)? elm.all : elm.getElementsByTagName(tag);
	var returnElements = [];
	var current;
	var length = elements.length;
	for(var i=0; i<length; i++){
		current = elements[i];
		if(testClass.test(current.className)){
			returnElements.push(current);
		}
	}
	return returnElements;
}

function isArray() {
	if (typeof arguments[0] == 'object') { 
		var criterion = arguments[0].constructor.toString().match(/array/i); 
		return (criterion != null); 
	}
	return false;
}

function isString() {
	if (typeof arguments[0] == 'string') return true;
	if (typeof arguments[0] == 'object') {
		var criterion = arguments[0].constructor.toString().match(/string/i); 
		return (criterion != null);
	}
	return false;
}

function RemoveDuplicates(arr){
	if(isArray(arr)){
		arr.sort();
		returnArray = true;
	} else {
		returnArray = false;
		arr.trim();
		arr = arr.split(" ");
		arr.sort();
	}
	var result=new Array();
	var lastValue="";
	for (var i=0; i<arr.length; i++){
		var curValue=arr[i];
		if (curValue != lastValue){
			result[result.length] = curValue;
		}
		lastValue = curValue;
	}
	if(!returnArray){
		var newResult = "";
		for (var a=0; a < result.length; a++){
			newResult += result[a] + " ";
		}
		newResult.trim();
		result = newResult;
	}
	return result.trim();
}

var _emptyTags = {
   "IMG":   true,
   "BR":    true,
   "INPUT": true,
   "META":  true,
   "LINK":  true,
   "PARAM": true,
   "HR":    true
};


if(typeof HTMLElement!="undefined" && !HTMLElement.prototype.insertAdjacentHTML){
	HTMLElement.prototype.__defineGetter__("outerHTML", function () {
		var attrs = this.attributes;
		var str = "<" + this.tagName;
		for (var i = 0; i < attrs.length; i++)
			str += " " + attrs[i].name + "=\"" + attrs[i].value + "\"";
		
		if (_emptyTags[this.tagName])
			return str + ">";
		
		return str + ">" + this.innerHTML + "</" + this.tagName + ">";
	});
	
	HTMLElement.prototype.__defineSetter__("outerHTML", function (sHTML) {
		var r = this.ownerDocument.createRange();
		r.setStartBefore(this);
		var df = r.createContextualFragment(sHTML);
		this.parentNode.replaceChild(df, this);
	});
	
	
	HTMLElement.prototype.insertAdjacentHTML = function (sWhere, sHTML) {
	var df;   // : DocumentFragment
	var r = this.ownerDocument.createRange();
	
	switch (String(sWhere).toLowerCase()) {  // convert to string and unify case
	  case "beforebegin":
		 r.setStartBefore(this);
		 df = r.createContextualFragment(sHTML);
		 this.parentNode.insertBefore(df, this);
		 break;
		 
	  case "afterbegin":
		 r.selectNodeContents(this);
		 r.collapse(true);
		 df = r.createContextualFragment(sHTML);
		 this.insertBefore(df, this.firstChild);
		 break;
		 
	  case "beforeend":
		 r.selectNodeContents(this);
		 r.collapse(false);
		 df = r.createContextualFragment(sHTML);
		 this.appendChild(df);
		 break;
		 
	  case "afterend":
		 r.setStartAfter(this);
		 df = r.createContextualFragment(sHTML);
		 this.parentNode.insertBefore(df, this.nextSibling);
		 break;
	}   
	};
}

var jsValidator = new Array();
var these_options = eval("({})");


function findForms(){
	var forms = document.getElementsByTagName('form');
	return forms;
}

function getFields(formref,type){
	var els;
	if(type == "name"){
		els = document.forms[formref].elements;
	}
	if(type == "id"){
		els = Form.getElements(formref);
	}
	return els;	
}


function getParentForm(el){
  while(el.parentNode != null && el.tagName != "FORM") el = el.parentNode;
  return (el.name) ? el.name : el.id;
}

//altered
function hasLabel(el){
	var id = el.id;
	var elements = $$('label:[for ~=' + id +  ']');
	
	
	if(elements.length > 0){
		return true;
	}
	
	return false;
	
	//while(el.parentNode != null && el.tagName != "LABEL") el = el.parentNode;
	//return (el.tagName == "LABEL") ? true : false;
}

//altered
function getLabel(el){

	var id = el.id;
	var elements = $$('label:[for ~=' + id +  ']');
	
	
	if(elements.length > 0){
		return elements[0];
	}
	
	//while(el.parentNode != null && el.tagName != "LABEL") el = el.parentNode;
	//return el;
}


function attachSubmit(form_ref){
	var form_attach;
	var parent_ref;
	
	var form = $(form_ref);
	
	if(form.name.length > 0 || form.id.length > 0){
		if(document.forms[form.name]){
			form_attach = document.forms[eval("form_ref.cloneNode(false).getAttribute('name')")];
			form_ref = form.name;
		} else {
			form_attach = $(eval("form_ref.cloneNode(false).getAttribute('id')"));
			form_ref = form.id;
		}
	} else {
		form_attach = form_ref;
	}
	if(window.addEventListener){ // Mozilla, Netscape, Firefox
		form_attach.onsubmit = function(){ return submitAction(form_ref,'INPUT','submit'); };
	} else { // IE
		form_attach.attachEvent('onsubmit', function(){ return submitAction(form_ref,'INPUT','submit'); });
	}
	
	if(getElementsByClassName(js_options['submitClass']).length > 0){
		var buttons = getElementsByClassName(js_options['submitClass']);
		for(b=0; b < buttons.length; b++){
			parent_ref = getParentForm(buttons[b]);
			if(parent_ref == form_ref){
				tag = buttons[b].tagName;
				if(buttons[b].type){
					type = buttons[b].type.toLowerCase();
				} else {
					type = "";
				}
				Event.observe(buttons[b], 'click', function(){ return submitAction(form_ref,tag,type); });
			}
		}
	}
}

function extractOptions(vals){
	var first_pos = vals.indexOf("{");
	var last_pos = vals.indexOf("}") + 1;
	var the_options = vals.substring(first_pos,last_pos);
	return the_options;
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////// BEGIN MY EDITS //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

function attachValidation(fieldid, formid){
	
	if(fieldid.include('viewstate') || fieldid.include('eventvalidation')){
		return;
	}


	var form = $(formid);
	var field = $(fieldid);
	
	if(form == undefined || field == undefined){
		return;
	}
	
	var fieldClass = field.className;
	var localoptions = {};
	var validationmessage = '';
	
	if(typeof(field.className) != 'undefined' && field.className.length > 0){
		if(field.className.include('{') && field.className.include('}')){
			localoptions = extractOptions(field.className).toString();
			fieldClass = field.className.replace(localoptions, '');
			localoptions = eval('(' + localoptions + ')');
		}
		
		useBlur = getOption('useBlur', localoptions);
		extMessage = getOption('extMessage', localoptions);
		
		fieldClass.trim();
		fieldClass = RemoveDuplicates(fieldClass);
		
		var fieldClasses = [];
		fieldClasses = fieldClass.split(' ');

		if (fieldClasses.length > 0) {
		    validationmessage += ' ' + getValidationMessage(formid, field, fieldClasses[0]);
		}

		var field_name = js_options['errorIDPrefix'] + '_' + field.id;
		field_name = field_name.trim();		
		
		var html = getErrorHtml(validationmessage.strip(), localoptions, field_name);
		
		var errorLocation = getOption('errorLocation', localoptions);

		if(errorLocation.include('afterEnd') || errorLocation.include('beforeBegin')){
			appendValidatorHTML(html, field, errorLocation, field_name);
			
			if($(field_name)){
				new Effect.Opacity(field_name, {to:0.0, duration: 0 });
			}
			if(errorLocation == 'none' && startGone && $(field_name)){
				$(field_name).style.display = 'none';
			}
		}
		
		if(useBlur != undefined && useBlur == true){
			var type = field.type.toLowerCase();
			var tagName = field.tagName.toLowerCase();
			
			if(tagName == 'input'){
				switch(type){
					case 'password':
						Event.observe(field, 'blur', function(){ blurAction(field, formid); });
						break;
					case 'textarea':
						Event.observe(field, 'blur', function(){ blurAction(field, formid); });
						break;
					case 'checkbox':
						Event.observe(field, 'click', function(){ blurAction(field, formid); });
						Event.observe(field, 'blur', function(){ blurAction(field, formid); });
						Event.observe(field, 'click', function(){ blurAction(field, formid); });
						Event.observe(field, 'change', function(){ blurAction(field, formid); });						
						break;
					case 'radio':
						Event.observe(field, 'change', function(){ blurAction(field, formid); });
						break;
					case 'text':
						//Event.observe(field, 'click', function(){ blurAction(field, formid); });	
						Event.observe(field, 'blur', function(){ blurAction(field, formid); });
						//Event.observe(field, 'change', function(){ blurAction(field, formid); });
						//Event.observe(field, 'onkeyup', function(){ blurAction(field, formid); });
						
						break;
					default:
						//<!--Event.observe(field, 'click', function(){ blurAction(field, formid); });-->
						Event.observe(field, 'change', function(){ blurAction(field, formid); });
						break;
				}
			}		
		}
	}
	
}

function attachValidationArray(el, form_id){
	var form = $(form_id);
	
	var elements = form.select('[name=' + el.name + ']');
	
	if(elements != undefined && elements.length > 0){
		var x = elements.last();
		attachValidation(x.id, form_id);
	}
}

function getValidatorGroupMessage(validatorArray, className, field, formid){
	var message = '';
	
	var values = Object.values(validatorArray);
	
	for(i = 0; i < values.length; i++){
		value = values[i];
		
		if(className == value.className){
			message += ' ' + value.defaultMessage;
			insertValidator(field.id, formid, className);		
		}
	}
	
	return message;
}

function insertValidator(fieldid, formid, className){
	var validatorReference = fieldid + ',' + formid + ',' + className;
	
	if(!jsValidator.inArray(validatorReference)){
		jsValidator.push(validatorReference);
	}
}

function getValidationMessage(formid, field, className){

	var message = '';
	
	if(field.alt != undefined && field.alt != ''){
		message = field.alt;
		
		insertValidator(field.id, formid, field.className);
		return message.strip();
	}
	
	message += getValidatorGroupMessage(js_validators, className, field, formid);
	message += getValidatorGroupMessage(custom_validators, className, field, formid);
	
	return message.strip();
}

function getErrorHtml(message, localoptions, field_name){
	
	errorTag = getOption('errorTag', localoptions);
	errorClass = getOption('errorClass', localoptions);
	startGone = getOption('startGone', localoptions);
	useBR = getOption('useBR', localoptions);
	errorLocation = getOption('errorLocation', localoptions);
	
	var tagData = {errorTag: errorTag, field_name: field_name, errorClass: errorClass};
	var startTag = new Template('<#{errorTag} id="#{field_name}" class="#{errorClass}" style="display:none; opacity:0; filter:alpha(opacity=0);">');
	var endTag = new Template('</#{errorTag}>');
	
	var html = startTag.evaluate(tagData);
	
	if(useBR == "before" || useBR == "both"){
		html += '<br />';
	}
	
	html += message;
	
	if(useBR == "after" || useBR == "both"){
		html += '<br />';
	}
	
	html += endTag.evaluate(tagData);
	
	return html.strip();
}

function appendValidatorHTML(html, field, errorLocation, errorTagID){

	var existingTag = $(errorTagID);
	var target;
	
	if(existingTag != undefined){
		existingTag.remove();
	}
	
	var type = field.type.toLowerCase();
	
	switch(type){
		case 'checkbox':
			target = (hasLabel(field)) ? getLabel(field) : field;
			target.insertAdjacentHTML(errorLocation, html);
			break;
		case 'radio':
			var label = hasLabel(field);
			
			if(label == true){
				
				target = getLabel(field);
			}
			else{
				target = field;
			}

			target.insertAdjacentHTML(errorLocation, html);
		
			break;
		default:
			field.insertAdjacentHTML(errorLocation, html);
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// END MY EDITS ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

function getFileExtension(filename){
	if( filename.length == 0 ) return "";
	var dot = filename.lastIndexOf(".");
	if( dot == -1 ) return ""; 
	var extension = filename.substr(dot + 1,filename.length); 
	return extension;
}

function validateField(field, validationid, classname, formid){
	var isvalid = false;
	var isrequired = false;
	
	var form = $(formid);
	
	var classes = classname.split(' ');
	
	if(classes.include(js_validators['required']['className'])){
		isrequired = true;
		
		var type = field.type.toLowerCase();
		var tag = field.tagName.toLowerCase();
		
		var fieldtypes = ['text', 'password'];
		
		switch (tag){
			case 'input':
				if(fieldtypes.include(type)){
					var v = $F(field);
					if(typeof(v) != 'undefined' && v != ''){
						isvalid = true;
					}
				}else if(type.include('checkbox')){
					if(field.checked){
						isvalid = true;
					}
				}else if(type.include('radio')){
					var rdobtns = form.select('[name=' + field.name + ']');
					//.select do not work on IE9
					if(!rdobtns || rdobtns.length < 1){
						rdobtns= document.getElementsByName(field.name);
					}
					
					if(typeof(rdobtns) != 'undefined' && rdobtns.length > 0){
						for(i = 0; i < rdobtns.length; i++){
							if(rdobtns[i].checked){
								isvalid = true;
								break;
							}
						}
					}
				} else if(type.include('file')){
					return true;
				}
				break;
			case 'select':
				if(field.selectedIndex >= 0){
					isvalid = true;
				}
				break;
			case 'textarea':
				var v = $F(field);
				if(typeof(v) != 'undefined' && v.length > 0){
					isvalid = true;
				}			
				break;
		}
	}else{
		isvalid = true;
		isrequired = false;
	}
		
	if(classes.include(js_validators['notfirst']['className'])){
		if(field.tagName.toLowerCase().include('select')){
			isvalid = field.selectedIndex > 0;
		}
	}


	Object.keys(custom_validators).each(function(s) {
	    var v = custom_validators[s];
	    var iName = v.className;

	    if (classes.include(iName)) {
	        //if it is not required and has no value, pass it though
	        if (!isrequired && field.value == '') {
	            isvalid = true;
	        }
	        else {
	            var thisRegExp = v.regExp;

	            if (thisRegExp.test(field.value)) {
	                isvalid = isvalid && true;
	            } else {
	                isvalid = false;
	            }
	        }
	    }
	});
	
	return [isvalid, isrequired];
}

function blurAction(field, form_ref) {

    if (field == null) {
        return true;
    }

	var field_name;
	var localoptions = eval("({})");
	var isvalid = false;
	var isRequired = false;	
	
	var fields = [];
	the_field = field.id;
	classes = field.className;
	
	errorIDPrefix = getOption('errorIDPrefix', localoptions);
	
	if(typeof(field.type) == 'string' && field.type == 'radio'){
		var form = $(form_ref);
		
		fields = form.select('[name=' + field.name + ']');
		//function above dont work on IE9
		if(!fields || fields.length < 1){
			var array = document.getElementsByName(field.name);
			fields[0] = array[array.length -1];
		}
		
		var rdo = fields.last();

		if(errorIDPrefix == null){
			errorIDPrefix = 'jsvalidator';
		}
		
		field_name = errorIDPrefix + '_' + rdo.id;
	}
	
	if(typeof(fields) != 'undefined' && fields.length > 0){
		for(i = 0; i < fields.length; i++){
			var x = fields[i];
			classes += ' ' + x.className;
		}
	}
	
	if(typeof(classes) != 'string' || classes == ''){
		//no class, no validation
		return true;
	}
	
	if(field.className.include('{') && field.className.include('}')){
		localoptions = extractOptions(field.className).toString();
		classes = field.className.replace(localoptions, '');
		localoptions = eval('(' + localoptions + ')');
	}
	
	classes.trim();
	classes = RemoveDuplicates(classes);
	//classes = classes.split(' ');

	hColor = getOption('highlightColor', localoptions);
	eColor = getOption('endColor', localoptions);
	startGone = getOption('startGone', localoptions);
	errorLocation = getOption('errorLocation', localoptions);
	
	field_name = errorIDPrefix + '_' + the_field;
	field_name = field_name.trim();		
	
	var validity = validateField(field, field_name, classes, form_ref);
	
	isvalid = validity[0];
	isRequired = validity[1];	

	if(isvalid){
		hideFlag(field_name,startGone);
		
		//if(errorLocation != 'none'){
			
		//}
	}else{
		if(errorLocation != 'none'){
			throwFlag(field_name, hColor, eColor,startGone);	
		}
	}
	
	
	return isvalid;
}


function loadAction(){
	var forms = findForms();
	var attachIt;
	var fields;
	var j;
	var done;
	if(forms.length >= 1){
		for(var i=0; i < forms.length; i++){
			var form = $(forms[i].id);
			
			attachIt = attachSubmit(forms[i]);
			form_name = form.name;
			if(form_name){
				fields = getFields(form_name,"name");
			} else {
				fields = getFields(form.id,"id");
				form_name = form.id;
			}
			for(var j=0; j < fields.length; j++){
				done = false;
				var field = fields[j];
				if(typeof(field.id) != 'undefined' && field.type.toLowerCase() != 'radio'){ 
					attachValidation(field.id,form_name);
					done = true;
				}
				if(typeof(field.name) != 'undefined' && done == false){
					attachValidationArray(field, form_name);
					done = true;
				}
			}
		}
	}
}


function throwFlag(fieldToFlag, hColor, eColor, gone) {

    if ($(fieldToFlag) == null) {
        return;
    }

	var styles = $(fieldToFlag).getStyles();
	
	$(fieldToFlag).show();
	
	if(styles.opacity > .75){
		new Effect.Highlight(fieldToFlag,{duration:1.0, startcolor:hColor, endcolor:eColor });
	} else {
		if(gone){
			$(fieldToFlag).style.display = '';
		}
		new Effect.Opacity($(fieldToFlag), {to:1.0, duration: .5 });
		//Effect.toggle($(fieldToFlag), 'appear', { duration: 0.5 });

		$(fieldToFlag).style.opacity = 1;
	}
}

function hideFlag(fieldToHide, gone) {

    if ($(fieldToHide) == null) {
        return;
    }

    var styles = $(fieldToHide).getStyles();
	
	new Effect.Opacity($(fieldToHide), {to:0.0, duration: .5 });
	
	if(gone){
		$(fieldToHide).hide();
	}	
}


function validateFields(theForm){
	var the_field;
	
	var results = [];
	
	for(var i=0; i < jsValidator.length; i++){
		var bad_field = false;
		
		var els = jsValidator[i].split(",");
		
		field_ref = els[0];
		form_ref = els[1];
		class_ref = els[2];
		
		if(form_ref == theForm){
			var field = $(field_ref);
			checkField = blurAction(field,form_ref);
			if(checkField){
				results.push('true');
			}else{
				results.push('false');
			}
		}
	}
	
	return !results.include('false');
}

function submitAction(thisForm,tag,type){
	var process = validateFields(thisForm);
	if((tag != "INPUT" || (tag == "INPUT" && type != "submit")) && process && (document.forms[thisForm] || $(thisForm))){
		if(document.forms[thisForm]){
			document.forms[thisForm].submit();
		} else {
			$(thisForm).submit();
		}
		return false;
	}
	return process;
}


Event.observe(window, 'load', function(){ loadAction(); });