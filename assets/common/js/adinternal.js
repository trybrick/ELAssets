
function LoadAdInternal(staticpagetypeid)
{
	var url = document.location.href;
	var requestArgs = null
	
	if(GSNContext.RequestArguments != null)
	{
		requestArgs = GSNContext.RequestArguments;
	}
	else
	{
		requestArgs = "No Args";
	}
	
	GetAdInternal(url, requestArgs, staticpagetypeid, DisplayAdInternal, null);
}

function DisplayAdInternal(response)
{
	if(document.getElementById('adInternal') != null)
	{
		var div = document.getElementById('adInternal');
		
		if(response != null && response.responseJSON.d != null)
		{
			div.innerHTML = response.responseJSON.d;
		}
		
	}
}