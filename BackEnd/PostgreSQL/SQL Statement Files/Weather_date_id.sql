CREATE TABLE weatherdata2
(
  weather_id serial NOT NULL,
  location character varying(255),
  date integer,
  medium_temperature numeric,
  maximum_wind numeric,
  sunshine_duration numeric,
  medium_cloud_amount numeric,
  precipitation_height numeric,
  CONSTRAINT weatherdata2_pkey PRIMARY KEY (weather_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weatherdata2
  OWNER TO postgres;



insert into weatherdata2 (weather_id, location, date, medium_temperature, maximum_wind, sunshine_duration, medium_cloud_amount, precipitation_height)
select weather_id, 
	location, 
	date.date_id, 
	medium_temperature, 
	maximum_wind, 
	sunshine_duration, 
	medium_cloud_amount, 
	precipitation_height
from (select weather_id, 
	location, 
	date_id, 
	medium_temperature, 
	maximum_wind, 
	sunshine_duration, 
	medium_cloud_amount, 
	precipitation_height
from datedimension d, (select weather_id, 
	location, 
	medium_temperature, 
	maximum_wind, 
	sunshine_duration, 
	medium_cloud_amount, 
	precipitation_height,
  substr(to_char(t.date, '99999999'), 6, 2)::integer as month,
  substr(to_char(t.date, '99999999'), 8, 2)::integer as day
from "weatherdata" as t) AS t
where d.day = t.day and d.month = t.month) as date
order by date.date_id
