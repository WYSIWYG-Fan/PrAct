drop table "TweetKeywords";

CREATE TABLE "TweetKeywords" 
(
   keyword_id int primary key,
   german character varying(31),
   english character varying(31),
   abbrev character varying(15),
) 
;

CREATE SEQUENCE keyword_id_seq;
ALTER TABLE "TweetKeywords" ALTER "keyword_id" SET DEFAULT NEXTVAL('keyword_id_seq');

insert into "TweetKeywords" (german, english, abbrev)
values ('grillen', 'barbecue', 'BBQ');

insert into "TweetKeywords" (german, english, abbrev)
values ('schwimmen', 'swim', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Theater', 'theater', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Kino', 'cinema', 'movie');

insert into "TweetKeywords" (german, english, abbrev)
values ('wandern', 'hike', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Kanu', 'canoe', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Fahrrad', 'bicycle', 'bike');

insert into "TweetKeywords" (german, english, abbrev)
values ('reiten', 'ride a horse', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Picknick', 'picknick', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Besichtigung', 'sightseeing', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('klettern', 'climb', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('skaten', 'skate', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Inline Skaten', 'inline skate', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('segeln', 'sail', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Schlittschuh', 'ice skate', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Bouldern', 'boulder', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Joggen', 'jogging', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Schifffahrt', 'ship cruise', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('einkaufen', 'Shopping', '');

insert into "TweetKeywords" (german, english, abbrev)
values ('Kaffee', 'Cafe', 'Tea');

insert into "TweetKeywords" (german, english, abbrev)
values ('Kneipe', 'Pub', 'Bar');

insert into "TweetKeywords" (german, english, abbrev)
values ('Spazieren gehen', 'jogging', 'take a walk');

select * from "TweetKeywords"