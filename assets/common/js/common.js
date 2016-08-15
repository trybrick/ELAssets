function ImageRollOver(e, sURL){
	e.src = sURL;
}

function PasswordTest(w){ 
        t1 = /^[a-z\d]{6,20}$/i; // only and length 
        //t2 = /[a-z]/i           // at least 1 letter 
        //t3 = /\d/               // at least 1 number 

        return t1.test(w); //&& t2.test(w) && t3.test(w) 
}

function distantAssistant(lat1, lon1, lat2, lon2) {
	if (lat1 == lat2 && lon1 == lon2) {
		//same lat/long points, 0 distance = 
		return 0;
	}
		
	var x, earthRadius;
	
	//convert from degrees to radians
	lat1 = lat1 * Math.PI / 180;
	lon1 = lon1 * Math.PI / 180;
	lat2 = lat2 * Math.PI / 180;
	lon2 = lon2 * Math.PI / 180;
	
	/* distance formula - accurate to within 30 feet */
	x = (Math.sin(lat1) * Math.sin(lat2)) + (Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1));
	
	if (1 == x) { return 0; }
	
	earthRadius = 3963.1;

	return earthRadius * (-1 * Math.atan(x / Math.sqrt(1  - x * x)) + Math.PI / 2);
}
