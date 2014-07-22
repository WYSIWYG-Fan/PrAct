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
	location, --IMPORTANT: Load corresponding location id from citydimension
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

alter table weatherdata2 add column weatherdimension integer;
drop sequence weatherdata2_id_seq;
create sequence weatherdata2_id_seq increment by 1 start with 356;

insert into weatherdata2 (weather_id, location, date, medium_temperature, maximum_wind, sunshine_duration, medium_cloud_amount, precipitation_height, weatherdimension) 
(select nextval('weatherdata2_id_seq'), location, date, medium_temperature, maximum_wind, sunshine_duration, medium_cloud_amount, precipitation_height, dim.weather_id
from weatherdimension dim, 
	(select weather_id, location, date, medium_temperature, maximum_wind, sunshine_duration, medium_cloud_amount, precipitation_height,
		case when maximum_wind > 20 then 1
		else 0
		end as wind,
		case when sunshine_duration >=3 and medium_cloud_amount < 5 then 1
		else 0
		end as sunshine,
		case when precipitation_height > 5 then 1
		else 0
		end as precipitation
	from weatherdata2) as w
where w.medium_temperature > dim.min_temperature and w.medium_temperature <= dim.max_temperature
and w.wind = dim.wind
and w.sunshine = dim.sunshine
and w.precipitation = dim.precipitation)

select max(weather_id) from weatherdata2;


select * from weatherdata2 w, weatherdimension dim where w.weatherdimension = dim.weather_id