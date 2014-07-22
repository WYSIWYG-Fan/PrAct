select 	k.keyword_id, 
	k.german,
	dd.date_id,
	count(k.keyword_id)
from 	tweetkeywords k, 
	twitterdata t, 
	datedimension dd, 
	weatherdimension wd, 
	weatherdata2 w
where	wd.weather_id = w.weatherdimension
and	w.date = dd.date_id
and	dd.date_id = t.dateid
and 	t.keywordid = keyword_id
group by k.keyword_id, k.german, dd.date_id
order by dd.date_id, count(k.keyword_id) desc

--fact insert

insert into facts (activity_id, weather_id, season_id, ranking)
select 	k.keyword_id, 
	wd.weather_id,
	dd.seasonid,
	count(k.keyword_id)
from 	tweetkeywords k, 
	twitterdata t, 
	datedimension dd, 
	weatherdimension wd, 
	weatherdata2 w
where	wd.weather_id = w.weatherdimension
and	w.date = dd.date_id
and	dd.date_id = t.dateid
and 	t.keywordid = k.keyword_id
and 	t.dateid = w.date
and 	t.cityid = w.location
group by k.keyword_id, wd.weather_id, dd.seasonid
order by wd.weather_id, count(k.keyword_id) desc

select t.keywordid, w.weather_id, count(*) from twitterdata t, -- where keywordid = 7;
weatherdata2, weatherdimension w where t.dateid = weatherdata2.date
and w.weather_id = weatherdata2.weatherdimension
group by t.keywordid, w.weather_id
order by count(*)

select count(*) from twitterdata where keywordid = 20

select w.weather_id from weatherdimension w