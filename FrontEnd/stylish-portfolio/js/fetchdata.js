var month;
var acts = [];


// handles drawing an error message
function drawError () {
    console.log("php error");
}

// helper function for cross-browser request object
function getRequest(url, success, error) {
    var req = false;
    try{
        // most browsers
        req = new XMLHttpRequest();
    } catch (e){
        // IE
        try{
            req = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            // try an older version
            try{
                req = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e){
                return false;
            }
        }
    }
    if (!req) return false;
    if (typeof success != 'function') success = function () {};
    if (typeof error!= 'function') error = function () {};
    req.onreadystatechange = function(){
        if(req .readyState == 4){
            return req.status === 200 ? 
                success(req.responseText) : error(req.status)
            ;
        }
    }
    req.open("GET", url, false);
    req.send(null);
    return req;
}

function predict() {
	acts = [];
	setCity();
};

function setCity() {
	
	//google geolocation api
	var city_temp = $("#input_city").get(0).value;
	var url = 'http://maps.googleapis.com/maps/api/geocode/json?address=';
	$.getJSON(url + city_temp, function(data) {
		lat = data.results[0].geometry.location.lat;
		lon = data.results[0].geometry.location.lng;
		getForecast(lat, lon, data.results[0].formatted_address);
	});
	
};

function getForecast(lat, lon, city) {

	var apiKey = '400ecb30f9bfd3e667cd51eb00c7c09b';
	var url = 'https://api.forecast.io/forecast/';
	var data;

	var date = $("#input_date").get(0).value;
	if (date.substr(6,2).indexOf("-") > -1) 
		{month = date.substr(6,1);}
		else {month = date.substr(6,2);};
	//set Weather_date
	document.getElementById("weather_date").innerHTML = date;
	
	//get date for forecast API
	date = date + "T12:00:00";

		$.getJSON(url + apiKey + "/" + lat + "," + lon + "," + date + "?callback=?", function(data) {
			var temp = (data.currently.temperature - 32)* 5/9;
			temp = temp + "";
			temp = temp.substr(0, 5);
			var wind;
			if (data.daily.data[0].windSpeed > "10") { wind = "1"; } else {wind = "0"};
			var precip;
			if (data.daily.data[0].precipIntensity > 0.1) {precip = 1;} else {precip = 0};
			var sun;
			if (data.daily.data[0].cloudCover > 0.5) {sun = 1;} else {sun = 0};
			showActivities(temp, wind, precip, sun);
			
		
			//adjust weather data image and city
			document.getElementById("weather_city").innerHTML = city;
			if (sun == 0 && precip == 0) {
				document.getElementById("icon_weather").src = "http://localhost/PrAct/img/Wetter/cloudy.PNG";
				document.getElementById("weather_txt").innerHTML = "cloudy";
			} else 
				if (sun == 1 && precip == 0) {
					document.getElementById("weather_txt").innerHTML = "sunny";
					document.getElementById("icon_weather").src = "http://localhost/PrAct/img/Wetter/sunny.PNG";	
				} else if (sun == 1 && precip == 1) {
					document.getElementById("weather_txt").innerHTML = "http://localhost/PrAct/img/Wetter/sunrain.PNG";
					document.getElementById("icon_weather").src = ""; 	
					} else if (sun == 0 && precip == 1) {
						document.getElementById("weather_txt").innerHTML = "rainy";;
						document.getElementById("icon_weather").src = "http://localhost/PrAct/img/Wetter/rainy.PNG";
					};
		});
}

function showActivities(temp, wind, precip, sun) {
	month = 7;
	getRequest(
      'php/recommendActivities.php?temp=' + temp + '&wind=' + wind + '&precip=' + precip + '&sun=' + sun + '&month=' + month, // URL for the PHP file
       outputAct,  // handle successful request
       drawError    // handle error
	);
};

function outputAct(responseText) {

	// split activities into array
	acts = [];
	var acts_temp = responseText.split(" ");
	var length = acts_temp.length;
	for (i = 0; i < length; i = i+2) { 
		if (acts_temp[0].length > 0) {
			acts.push(acts_temp.shift());
		}
		else {
			acts_temp.shift();
		};
		acts_temp.shift();
	};
	
	setImages(acts);
};


function setImages(acts) {	
	//clear old image data
	for (i = 1; i < 11; i++) {
		document.getElementById("txt_act_" + i).innerHTML = "";
	};
	//set new images	
	if (acts.length > 0) {
		for (j = 0; j < acts.length; j++) {
			document.getElementById("txt_act_" + (j+1)).innerHTML = 
				"<img id='img_act_" + (j+1) + "' class='result-icon" + (j+1) + "' src='img/Act/" + acts[j] + ".JPG'>"+acts[j];
		};
		
	};
};