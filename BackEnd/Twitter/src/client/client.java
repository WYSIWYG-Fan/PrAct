package client;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import twitter.search;
import twitter4j.GeoLocation;
import database.datasource;
import database.loadData;
import database.models.CityModel;
import database.models.DateModel;
import database.models.KeywordModel;

public class client {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

		Connection con = datasource.connect();
		ArrayList<KeywordModel> keywords = loadData.load(con, new String(
				"TweetKeywords"), "KeywordModel", "");
		ArrayList<CityModel> cities = loadData.load(con,
				new String("CityData"), "CityModel", "");
		// select only dates in summer due to runtime reasons
		ArrayList<DateModel> dates = loadData.load(con, new String(
				"DateDimension"), "DateModel", "seasonid = 2");

		// Get Twitter Entries
		int counter = 0;

		GeoLocation loc;
		KeywordModel keyword;
		String datebegin;
		String dateend;
		DateModel date;

		for (int c = 0; c < cities.size(); c++) {
			loc = cities.get(c).getLocation();
			for (int d = 0; d < dates.size() / 3; d = d + 3) {
				date = dates.get(d);
				datebegin = "2013-"
						+ (Integer.toString(date.getMonth()).length() == 1 ? "0"
								: "")
						+ date.getMonth()
						+ "-"
						+ (Integer.toString(date.getDay()).length() == 1 ? "0"
								: "") + date.getDay();
				date = dates.get(d + 2);
				dateend = date.getDay() + "";
				for (int k = 0; k < keywords.size(); k++) {
					keyword = keywords.get(k);
					counter++;
					if (keyword.getGerman().length() > 0)
						search.searchTwitter(
								con,
								keyword.getGerman()
										+ " OR "
										+ keyword.getEnglish()
										+ (keyword.getAbbrev().length() > 0 ? (" OR " + keyword
												.getAbbrev()) : ""), keyword
										.getId(), 50, loc, true, datebegin,
								dateend);
					if (counter == 180)
						try {
							TimeUnit.MINUTES.sleep(15);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					// if (keywords.get(i).getEnglish().length() > 0)
					// search.searchTwitter(con, keywords.get(i).getEnglish(),
					// keywords.get(i).getId(), 50,
					// new GeoLocation(49.487715, 8.461563), true);
					// if (keywords.get(i).getAbbrev().length() > 0)
					// search.searchTwitter(con, keywords.get(i).getAbbrev(),
					// keywords.get(i).getId(), 50,
					// new GeoLocation(49.487715, 8.461563), true);
				}
			}
		}
	}

}