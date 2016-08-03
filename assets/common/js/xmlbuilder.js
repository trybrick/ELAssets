// JScript File
function SubmitForm(hdnName)
{
    var xml = BuildXML(document.forms[0].elements);   
    if(xml.length == 0)
    {
	//alert('Exit Bad');
	return false;
    }
    var hdn = document.getElementById(hdnName);
    hdn.value = xml;
	//alert('Exit Good');
    return true;
}

function BuildXMLDiv(divid){
	var selectid = '#' + divid;
	
	var elements = [];
	var inputs = $$( selectid + ' input');
	var selects = $$( selectid + ' select');
	
	inputs.each(function(e) { elements.push(e); });
	selects.each(function(e) { elements.push(e); });
	
	return BuildXML(elements);
}

function BuildXML(elements)
{ 
    var xml = new String('<?xml version="1.0"?><formdata>');
    var hasdata = false;
    var hasemail = false;
    var title;
    var value = '';
    var text = '';
    
    for(j=0; j<elements.length; j++)
    {
        var e = elements[j];
        value = '';
        title = GetTitle(e);
        
        if(title.length == 0)
        {
            title = GetID(e);
        }

        if(title.length > 0)            //Continue
        {
            //alert(e.type);
            switch(e.type)
            {
                case "text":
                    value = GetTextBoxValue(e);
		            if (value.length > 0)
		            {
			            hasdata = true;
			            //alert(title);
			            if(title == 'emailaddress')
			            {
    				       hasemail = true;
			            }
			            if(title == 'loyaltycardemailaddress')
			            {
			                hasemail = true;
			            }
			            if(title == 'cakeemailaddress')
			            {
			                hasemail = true;
			            }
			            if(title == 'maxcardemailaddress')
			            {
			                hasemail = true;
			            }
		            }
                   
                    xml += BuildNode(title, value);
                    break;
                case "radio":
                    value = GetRadioButtonValue(e);
                    if (value.length > 0)
                    {
                        hasdata = true;
                    }
                                     
                    xml += BuildNode(title, value);
                    break;
                case "checkbox":
                    value = GetCheckBoxValue(e);

                    if (value.length > 0)
                    {
                        hasdata = true;
                    }
                                       
                    xml += BuildNode(title, value);
                    break;
                case "select-one":
                    value = GetSelectOneListValue(e);
                           
                    if (value.length > 0)
                    {
                        hasdata = true;
                    }
                                        
                    text = GetSelectOneListText(e);
                    xml += BuildSelectorNode(title, value, text);
		            break;
                case "password":
                    value = GetTextBoxValue(e);
                    if (value.length > 0)
                    {
                        hasdata = true;
                    }
                    xml += BuildNode(title, value);
                    break;
                case "textarea":
                    value = GetTextBoxValue(e);
                    if (value.length > 0)
                    {
                        hasdata = true;
                    }
                    
                    value = value.replace(/\%0D\%0A$/g,"");
                    xml += BuildNode(title, value);
                    break;
                case "hidden":
                    value = GetTextBoxValue(e);
		            if (value.length > 0)
		            {
			            hasdata = true;
			            //alert(title);
			            if(title == 'emailaddress')
			            {
    				        hasemail = true;
			            }
		            }
		            
                    xml += BuildNode(title, value);
                    break;
            }       
        }     
    }

    xml += "</formdata>";

    //if(hasemail == false)
    //{
	    //alert('A valid email address is required. Please try again.');
	    //return '';
    //}

    if (hasdata == true)
    {
	    return xml;
    }
    else
    {
	    alert('Sorry, your submission was not sent due to missing information. Please try again.');
	    return '';
    }
    return xml;
}

function GetTitle(e)
{
    var s = e.title;

    if (e.title == '' || e.title == null) {
        s = e.name;
    }

    s = s.replace('$', '');
    s = s.replace(/ /g, ''); 
    s = s.replace(/</g, '&lt;');
    s = s.replace(/&/g, '&amp;');
    
    return s.toLowerCase();
    return e.title;
}

function GetID(e)
{
    var s = e.id.toLowerCase();
    s = s.replace(/ /g, '');
    s = s.replace(/</g, '&lt;');
    s = s.replace(/&/g, '&amp;');
    
    if(s.match("viewstate") !=null ||
       s.match("eventtarget") != null ||
       s.match("eventargument") != null ||
       s.match("eventvalidation") != null)
    {
        s = '';
        return s;
        
    }
    else
    {
        return s.toLowerCase();
        return e.ID;
    }
}

function GetTextBoxValue(e)
{
    return e.value;
}

function GetCheckBoxValue(e)
{
    return e.checked;
}

function GetRadioButtonValue(e)
{
    return e.checked;
}

function GetSelectOneListText(e)
{
	if(e.selectedIndex > -1){
		var o = e.options[e.selectedIndex];
		return o.text;
	}else{
		return '';
	}
}

function GetSelectOneListValue(e)
{
	if(e.selectedIndex > -1){
		var o = e.options[e.selectedIndex];
		return o.value;
	}
	else{
		return '';
	}
}

function BuildNode(title, value)
{
    value = value.toString();
    value = value.replace(/</g, '&lt;');
    value = value.replace(/&/g, '&amp;');
    
    var xml = '<' + title + '>';
    xml += value;
    xml += '</' + title + '>';
    return xml;
}

function BuildSelectorNode(title, value, text)
{
    //remove invalid XML values
    value = value.toString();
    value = value.replace(/</g, '&lt;');
    value = value.replace(/&/g, '&amp;');
                    
    var xml = '<' + title + 'value>';
    xml += value;
    xml += '</' + title + 'value>';

    //remove invalid XML values
    text = text.toString();
    text = text.replace(/</g, '&lt;');
    text = text.replace(/&/g, '&amp;');
    
    xml += '<' + title + 'text>';
    xml += text;
    xml += '</' + title + 'text>';

    return xml;
}




