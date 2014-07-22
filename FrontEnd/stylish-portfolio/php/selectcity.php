<?php

// Verbindungsaufbau und Auswahl der Datenbank
$dbconn = pg_connect("host=localhost dbname=PrAct user=postgres password=password")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());

// Eine SQL-Abfrge ausführen
$query = "SELECT latitude, longitude FROM citydimension where name = '".$_GET["q"]."';";	
$result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());

// Ergebnisse in HTML ausgeben
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    foreach ($line as $col_value) {
        echo "$col_value ";
    }
}

// Speicher freigeben
pg_free_result($result);

// Verbindung schließen
pg_close($dbconn);
?> 