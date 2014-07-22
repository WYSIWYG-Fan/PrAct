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
and 	t.keywordid = keyword_id
group by k.keyword_id, wd.weather_id, dd.seasonid
order by wd.weather_id, count(k.keyword_id) desc