CREATE TABLE "facts" 
(
  activity_id int,
  weather_id int, 
  season_id int,
  ranking int,
  primary key(activity_id, weather_id, season_id)
) 
;

