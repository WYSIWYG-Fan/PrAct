function getForecast(lati, longi) {

	var apiKey = '400ecb30f9bfd3e667cd51eb00c7c09b';
	var url = 'https://api.forecast.io/forecast/';
	var data;

		$.getJSON(url + apiKey + "/" + lati + "," + longi + "?callback=?", function(data) {
			console.log(data);
			//weather data processing
		});
		
	return data;
}

