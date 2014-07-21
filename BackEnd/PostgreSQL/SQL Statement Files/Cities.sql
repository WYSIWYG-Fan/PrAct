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
values ('Mannheim', 'Baden-Wuerttemberg', 49.487699, 8.46591);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Feldberg (Schwarzwald)', 'Baden-Wuerttemberg', 47.859735, 8.036392);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Freudenstadt', 'Baden-Wuerttemberg', 48.464527, 8.417888);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Konstanz', 'Baden-Wuerttemberg', 47.678045, 9.173069);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Lahr (Schwarzwald)', 'Baden-Wuerttemberg', 48.339179, 7.872219);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Öhringen', 'Baden-Wuerttemberg', 49.200018, 9.502873);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Rheinstetten', 'Baden-Wuerttemberg', 48.961811, 8.292245);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Stuttgart', 'Baden-Wuerttemberg', 48.775424, 9.181738);
