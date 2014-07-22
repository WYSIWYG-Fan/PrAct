<?php

// connect to database
$dbconn = pg_connect("host=localhost dbname=PrAct user=postgres password=password")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());

// Query database
$query = "SELECT latitude, longitude FROM citydimension where name = '".$_GET["q"]."';"; //CHANGE!!!!!!!	
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



