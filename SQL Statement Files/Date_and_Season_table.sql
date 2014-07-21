create table "datedimension"
( 
	date_id int primary key,
	day int, 
	month int,
	seasonid int
);


CREATE SEQUENCE date_id_seq;
ALTER TABLE "datedimension" ALTER "date_id" SET DEFAULT NEXTVAL('date_id_seq');


create table "seasondimension"
(
	season_id int primary key,
	season_txt character varying(7)
);

insert into "seasondimension" values (1, 'spring');
insert into "seasondimension" values (2, 'summer');
insert into "seasondimension" values (3, 'autumn');
insert into "seasondimension" values (4, 'winter');
