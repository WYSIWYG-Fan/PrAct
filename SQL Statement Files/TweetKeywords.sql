CREATE TABLE "tweetkeywords" 
(
   keyword_id int primary key,
   german character varying(31),
   english character varying(31),
   abbrev character varying(15)
) 
;

CREATE SEQUENCE keywords_id_seq;
ALTER TABLE "tweetkeywords" ALTER "keyword_id" SET DEFAULT NEXTVAL('keywords_id_seq');

CREATE SEQUENCE keyword_id_seq;
ALTER TABLE "tweetkeywords" ALTER "keyword_id" SET DEFAULT NEXTVAL('keyword_id_seq');

insert into "tweetkeywords" (german, english, abbrev)
values ('grillen', 'barbecue', 'BBQ');

insert into "tweetkeywords" (german, english, abbrev)
values ('schwimmen', 'swim', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Theater', 'theater', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Kino', 'cinema', 'movie');

insert into "tweetkeywords" (german, english, abbrev)
values ('wandern', 'hike', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Kanu', 'canoe', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Fahrrad', 'bicycle', 'bike');

insert into "tweetkeywords" (german, english, abbrev)
values ('reiten', 'ride a horse', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Picknick', 'picknick', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Besichtigung', 'sightseeing', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('klettern', 'climb', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('skaten', 'skate', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Inline Skaten', 'inline skate', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('segeln', 'sail', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Schlittschuh', 'ice skate', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Bouldern', 'boulder', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Joggen', 'jogging', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Schifffahrt', 'ship cruise', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('einkaufen', 'Shopping', '');

insert into "tweetkeywords" (german, english, abbrev)
values ('Kaffee', 'Cafe', 'Tea');

insert into "tweetkeywords" (german, english, abbrev)
values ('Kneipe', 'Pub', 'Bar');

insert into "tweetkeywords" (german, english, abbrev)
values ('Spazieren gehen', 'jogging', 'take a walk');

select * from "tweetkeywords"