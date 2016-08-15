 function showImage(url) {
	    window.open('/Shop/ShowImage.aspx?url=' + url,'ShowLargeImage','width=500,height=500,scrollbars=no,menubar=no,top=10,left=10');
    }
	
    function hidediv(id) {
	    document.getElementById(id).style.display = 'none';
	    document.getElementById(id).style.visibility = 'hidden';
    }
    function showdiv(id) {
	    document.getElementById(id).style.display = 'block';
	    document.getElementById(id).style.visibility = 'visible';
    }
	
    function showHideAddToListControls()
    {
        var hasItemsSelected = false;
        
        for (var i = 0; i < 100; i++)
        {
            var checkBox;
            
            if (i < 10)
            {
                checkBox = document.getElementById('ctl00_ContentPlaceHolder1_AvailableVarieties1_dl_ctl0' + i + '_chk');
            }
            else
            {
                checkBox = document.getElementById('ctl00_ContentPlaceHolder1_AvailableVarieties1_dl_ctl' + i + '_chk');
            }
            
            if (checkBox == null)
            {
                i = 100;
            }
            else if (checkBox.checked == true)
            {
                hasItemsSelected = true;
                i = 100;
            }
        }
        
        if (hasItemsSelected)
        {
            showdiv('availablevarietiesadditemlink');
        }
        else
        {
            hidediv('availablevarietiesadditemlink');
        }
    }
    