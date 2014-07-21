CREATE TABLE "twitterdata" 
(
   tweet_id int primary key,
   keywordid int,
   dateid int,
   latitude double precision,
   longitude double precision,
   content character varying(140)
) 
;

CREATE SEQUENCE tweet_id_seq;
ALTER TABLE "twitterdata" ALTER "tweet_id" SET DEFAULT NEXTVAL('tweet_id_seq');