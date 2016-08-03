var counts=5;

function CountDown(){

	var s = '';   
 
	for(var i=0;i<=counts; i++)
	{
		s += '.';
	};
		    
	lbl = document.getElementById('timer');
		    
	if(lbl != null)
	{
		lbl.innerHTML = s;
	}
		    
	counts -= 1;
	if(counts == 0)
	{
		window.clearInterval();
                location.href = _sNavigatePage;
	}
}

window.setInterval('CountDown()',1000);