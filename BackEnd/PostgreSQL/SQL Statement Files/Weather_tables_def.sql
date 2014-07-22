
CREATE TABLE weatherdata
(
  weather_id serial NOT NULL,
  location character varying(255),
  date integer,
  medium_temperature numeric,
  maximum_wind numeric,
  sunshine_duration numeric,
  medium_cloud_amount numeric,
  precipitation_height numeric,
  CONSTRAINT weatherdata_pkey PRIMARY KEY (weather_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weatherdata
  OWNER TO postgres;


CREATE TABLE weatherdata2
(
  weather_id serial NOT NULL,
  location integer,
  date integer,
  medium_temperature numeric,
  maximum_wind numeric,
  sunshine_duration numeric,
  medium_cloud_amount numeric,
  precipitation_height numeric,
  weatherdimension integer,
  CONSTRAINT weatherdata2_pkey PRIMARY KEY (weather_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weatherdata2
  OWNER TO postgres;


CREATE TABLE weatherdimension
(
  weather_id serial NOT NULL,
  min_temperature numeric,
  max_temperature numeric,
  wind integer,
  sunshine integer,
  precipitation integer,
  CONSTRAINT weatherdimension_pkey PRIMARY KEY (weather_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weatherdimension
  OWNER TO postgres;
