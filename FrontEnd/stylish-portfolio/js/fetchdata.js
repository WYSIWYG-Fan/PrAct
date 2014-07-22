var lat;
var lon;

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
	var city = $("#dropdown_city").get(0).options[$("#dropdown_city").get(0).selectedIndex].value;	
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

		$.getJSON(url + apiKey + "/" + lat + "," + lon + "," + "2014-07-25T12:00:00" + "?callback=?", function(data) {
			var temp = (data.currently.temperature - 32)* 5/9;
			var wind;
			if (data.daily.data[0].windSpeed > "10") { wind = "1"; } else {wind = "0"};
			var precip;
			if (data.daily.data[0].precipIntensity > 0.1) {precip = 1;} else {precip = 0};
			var sun;
			if (data.daily.data[0].cloudCover > 0.5) {sun = 1;} else {sun = 0};
			showActivities(temp, wind, precip, sun);
		});
}

function showActivities(temp, wind, precip, sun) {
	getRequest(
      'php/recommendActivities.php?temp=' + temp + ',wind=' + wind + ',precip=' + precip + ',sun=' + sun, // URL for the PHP file
       outputAct,  // handle successful request
       drawError    // handle error
	);
};

function outputAct(responseText) {
};


