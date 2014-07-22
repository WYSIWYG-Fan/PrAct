<?php
// Verbindungsaufbau und Auswahl der Datenbank
$dbconn = pg_connect("host=localhost dbname=PrAct user=postgres password=password")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());

// Eine SQL-Abfrge ausführen
$query = 'SELECT name FROM citydimension order by name';	
$result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());

// Ergebnisse in HTML ausgeben
echo "<table>\n";
echo "\t<tr>\n";
echo "\t\t<td><option style='color: #D1D0CE' selected disabled>Choose City...</option></td>\n";
echo "\t</tr>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td><option>$col_value</option></td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Speicher freigeben
pg_free_result($result);

// Verbindung schließen
pg_close($dbconn);
?> 