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
values ('Mannheim', 'Baden-W�rttemberg', 49.487699, 8.46591);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Feldberg (Schwarzwald)', 'Baden-W�rttemberg', 47.859735, 8.036392);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Freudenstadt', 'Baden-W�rttemberg', 48.464527, 8.417888);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Konstanz', 'Baden-W�rttemberg', 47.678045, 9.173069);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Lahr (Schwarzwald)', 'Baden-W�rttemberg', 48.339179, 7.872219);

insert into "citydimension"(name, province, latitude, longitude) 
values ('�hringen', 'Baden-W�rttemberg', 49.200018, 9.502873);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Rheinstetten', 'Baden-W�rttemberg', 48.961811, 8.292245);

insert into "citydimension"(name, province, latitude, longitude) 
values ('Stuttgart', 'Baden-W�rttemberg', 48.775424, 9.181738);