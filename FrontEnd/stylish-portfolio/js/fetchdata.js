var lat;
var lon;
var month;
var city;

  // handles the click event for link 1, sends the query
function getCities() {  
  getRequest(
      'php/selectcities.php', // URL for the PHP file
       drawOutputCities,  // handle successful request
       drawError    // handle error
  );
  return false;
}  

// handles drawing an error message
function drawError () {
    var container = document.getElementById('dropdown_city');	//anderen container fuer errors generell nutzen!!!
    container.innerHTML = 'There was an error!';
}
// handles the response, adds the html
function drawOutputCities(responseText) {
    var container = document.getElementById('dropdown_city');
    container.innerHTML = responseText;
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


function setCity() {
	city = $("#dropdown_city").get(0).options[$("#dropdown_city").get(0).selectedIndex].value;	
	getRequest(
      'php/selectcity.php?q=' + city, // URL for the PHP file
       outputCity,  // handle successful request
       drawError    // handle error
  );
};

function predict() {
	setCity();
	getForecast();
};

function outputCity(responseText) {
	lat = (responseText.trim()).substr(0, responseText.indexOf(" ")).trim();
	lon = (responseText.trim()).substr(responseText.indexOf(" ")+1, lat.length).trim();
};

function getForecast() {

	var apiKey = '400ecb30f9bfd3e667cd51eb00c7c09b';
	var url = 'https://api.forecast.io/forecast/';
	var data;

	var date = $("#input_date").get(0).value;
	if (date.substr(6,2).indexOf("-") > -1) 
		{month = date.substr(6,1);}
		else {month = date.substr(6,2);};
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
			
			//adjust weather data image
			if (sun == 0 && precip == 0) {
				document.getElementById("icon_weather").src = "http://localhost/PrAct/img/Wetter/bewoelkt.PNG";
				document.getElementById("weather_txt").innerHTML = "bewoelkt";
			} else 
				if (sun == 1 && precip == 0) {
					document.getElementById("weather_txt").innerHTML = "sonnig";
					document.getElementById("icon_weather").src = "";	//Sonne
				} else if (sun == 1 && precip == 1) {
					document.getElementById("weather_txt").innerHTML = "sonnig mit regen";
					document.getElementById("icon_weather").src = ""; 	//Sonne und Regen
					} else if (sun == 0 && precip == 1) {
						document.getElementById("weather_txt").innerHTML = "regnerisch";;
						document.getElementById("icon_weather").src = ""; //Regen
					}
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
	document.getElementById("weather_city").innerHTML = city;
	console.log(responseText);
};


