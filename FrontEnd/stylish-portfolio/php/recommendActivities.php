<?php

// connect to database
$dbconn = pg_connect("host=localhost dbname=PrAct user=postgres password=password")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());

// Query database
/*$query = "select distinct k.german 
from facts f 
join weatherdimension w on f.weather_id = w.weather_id, 
tweetkeywords k, 
datedimension d join seasondimension s on s.season_id = d.seasonid 
where ".$_GET("temp")." between w.min_temperature and w.max_temperature 
and w.wind = ".$_GET("wind")."
and precipitation =".$_GET("precip")." 
and sunshine = ".$_GET("sun")." 
and k.keyword_id = f.activity_id 
and d.month = ".$_GET("month")." 
and d.seasonid = f.season_id 
order by ranking desc limit 10;"; */

$query = "select distinct k.german, ranking
from facts f 
join weatherdimension w on f.weather_id = w.weather_id, 
tweetkeywords k, 
datedimension d join seasondimension s on s.season_id = d.seasonid 
where ".$_GET["temp"]." between w.min_temperature and w.max_temperature
and w.wind = ".$_GET["wind"]."
and precipitation = ".$_GET["precip"]." 
and sunshine = ".$_GET["sun"]." 
and k.keyword_id = f.activity_id 
and d.month = ".$_GET["month"]." 
and d.seasonid = f.season_id 
order by ranking desc limit 10;";

$result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());

// hand over results
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    foreach ($line as $col_value) {
        echo "$col_value ";
    }
}


// free memory
pg_free_result($result);

// close connection
pg_close($dbconn);
?> 



