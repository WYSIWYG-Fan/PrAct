CREATE TABLE "citydimension" 
(
   city_id int primary key,
   name character varying(31),
   province character varying(31),
   latitude double precision,
   longitude double precision
) 
;

CREATE SEQUENCE city_id_seq;
ALTER TABLE "citydimension" ALTER "city_id" SET DEFAULT NEXTVAL('city_id_seq');

insert into "citydimension"(name, province, latitude, longitude) 
values ('Mannheim', 'Baden-Württemberg', 49.487699, 8.46591);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Feldberg (Schwarzwald)', 'Baden-Württemberg', 47.859735, 8.036392);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Freudenstadt', 'Baden-Württemberg', 48.464527, 8.417888);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Konstanz', 'Baden-Württemberg', 47.678045, 9.173069);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Lahr (Schwarzwald)', 'Baden-Württemberg', 48.339179, 7.872219);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Öhringen', 'Baden-Württemberg', 49.200018, 9.502873);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Rheinstetten', 'Baden-Württemberg', 48.961811, 8.292245);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Stuttgart', 'Baden-Württemberg', 48.775424, 9.181738);


insert into "citydimension"(name, province, latitude, longitude) 
values ('Aachen-Orsbach', 'Nordrhein-Westfalen', 50.797924, 5.996320);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Angermünde', 'Brandenburg', 53.014565, 13.996714);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Arkona', 'Mecklenburg-Vorpommern', 54.677922, 13.427253);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Augsburg', 'Bayern', 48.370396, 10.897640);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Bamberg', 'Bayern', 49.898771, 10.902252);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Berlin', 'Berlin', 52.495629, 13.372584);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Bremen', 'Bremen', 53.079283, 8.801002);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Brocken', 'Sachsen-Anhalt', 51.799715, 10.615518);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Cottbus', 'Brandenburg', 51.757008, 14.328595);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Cuxhaven', 'Niedersachsen', 53.859248, 8.687669);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Dresden-Klotzsche', 'Sachsen', 51.114466, 13.788961);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Düsseldorf', 'Nordrhein-Westfalen', 51.226846, 6.774696);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Emden', 'Niedersachsen', 53.359816, 7.204106);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Erfurt-Weimar', 'Thüringen', 50.980369, 11.191117);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Fehmarn', 'Schleswig-Holstein', 54.470194, 11.132590);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Fichtelberg', 'Bayern', 50.423589, 12.954540);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Frankfurt Main', 'Hessen', 50.110806, 8.679857);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Fürstenzell', 'Bayern', 48.521535, 13.316427);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Gera', 'Thüringen', 50.883503, 12.077600);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Gießen-Wettenberg', 'Hessen', 50.617003, 8.652804);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Görlitz', 'Sachsen', 51.151141, 14.968400);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Greifswald', 'Mecklenburg-Vorpommern', 54.086907, 13.390661);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Hahn', 'Rheinland-Pfalz', 49.945781, 7.264260);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Hamburg', 'Hamburg', 53.633593, 9.997402);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Hannover', 'Niedersachsen', 52.374008, 9.722333);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Helgoland', 'Schleswig-Holstein', 54.180740, 7.889089);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Hof', 'Bayern', 50.313774, 11.911898);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Hohenpeißenberg', 'Bayern', 47.794347, 11.005781);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Kassel', 'Hessen', 51.311560, 9.483274);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Kempten', 'Bayern', 47.733613, 10.315657);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Kiel-Holtenau', 'Schleswig-Holstein', 54.379453, 10.146421);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Köln-Bonn', 'Nordrhein-Westfalen', 50.870687, 7.140637);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Leipzig/Halle', 'Sachsen', 51.422104, 12.220392);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Lindenberg', 'Brandenburg', 47.603392, 9.886759);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Bad Lippspringe', 'Nordrhein-Westfalen', 51.783069, 8.815832);

insert into "citydimension"(name, province, latitude, longitude) 
values ('List auf Sylt', 'Schleswig-Holstein', 55.018944, 8.430048);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Magdeburg', 'Sachen-Anhalt', 52.124491, 11.621924);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Marnitz', 'Mecklenburg-Vorpommern', 53.317622, 11.925628);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Meiningen', 'Thüringen', 50.570961, 10.414488);

insert into "citydimension"(name, province, latitude, longitude) 
values ('München', 'Bayern', 48.353651, 11.774985);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Münster/Osnabrück', 'Nordrhein-Westfalen', 52.130821, 7.694703);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Neuruppin', 'Brandenburg', 52.914536, 12.795265);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Norderney', 'Niedersachsen', 53.715960, 7.280287);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Nürburg-Barweiler', 'Rheinland-Pfalz', 50.337899, 6.948413);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Nürnberg', 'Bayern', 49.454174, 11.071597);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Oberstdorf', 'Bayern', 47.406875, 10.278006);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Offenbach', 'Hessen', 50.089103, 8.784094);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Potsdam', 'Brandenburg', 52.395483, 13.052818);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Regensburg', 'Bayern', 49.014365, 12.092945);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Rostock-Warnemünde', 'Mecklenburg-Vorpommern', 54.167212, 12.082503);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Saarbrücken', 'Saarland', 49.220048, 7.112399);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Schleswig', 'Schleswig-Holstein', 54.523835, 9.563407);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Schwerin', 'Brandenburg', 53.633629, 11.399595);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Stötten', 'Bayern', 47.737894, 10.688470);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Straubing', 'Bayern', 48.878091, 12.580176);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Trier-Petrisberg', 'Rheinland-Pfalz', 49.750972, 6.655523);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Weiden', 'Bayern', 49.671210, 12.147878);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Würzburg', 'Bayern', 49.791262, 9.947492);
