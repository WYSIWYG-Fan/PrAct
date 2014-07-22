CREATE TABLE weatherdimension
(
  weather_id serial NOT NULL,
  min_temperature numeric,
  max_temperature numeric,
  wind integer, --0 is no, 1 is yes (> 20)
  sunshine integer, --0 is cloudy, 1 is sunny (>= 3 sun, < 5 cloud)
  precipitation integer, --0 is dry, 1 is rainy (> 5)
  CONSTRAINT weatherdimension_pkey PRIMARY KEY (weather_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weatherdimension
  OWNER TO postgres;

INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-100.0, -10, 1, 1, 1);

INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (-10.0, 0, 1, 1, 1);

INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (0.0, 10, 1, 1, 1);

INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (10.0, 20, 1, 1, 1);

INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (20.0, 30, 1, 1, 1);


INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (30.0, 40, 1, 1, 1);


INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 0, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 0, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 0, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 0, 1, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 1, 0, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 1, 0, 1);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 1, 1, 0);
INSERT INTO weatherdimension (min_temperature, max_temperature, wind, sunshine, precipitation)
values (40.0, 100, 1, 1, 1);

select * from weatherdimension where weather_id = 19 or weather_id = 11;

