package client;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import twitter.search;
import twitter4j.GeoLocation;
import database.datasource;
import database.loadData;
import database.models.CityModel;
import database.models.DateModel;
import database.models.KeywordModel;

public class client {

	@SuppressWarnings({ "unchecked", "deprecation" })
	public static void main(String[] args) {

		Connection con = datasource.connect();
		ArrayList<KeywordModel> keywords = loadData.load(con, new String(
				"TweetKeywords"), "KeywordModel", "");
		ArrayList<CityModel> cities = loadData.load(con, new String(
				"CityDimension"), "CityModel", "province <> 'Baden-Württemberg'");
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

		Date current = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(current);
		System.out.println(current.toString());
		int cur_month = cal.get(Calendar.MONTH) + 1;
		int cur_day = cal.get(Calendar.DAY_OF_MONTH);

		for (int c = 0; c < cities.size(); c++) {
			// for (int d = 0; d < dates.size() / 3; d = d + 3) {
			for (int d = 8; d > 0; d--) {
				// date = dates.get(d);
				// if (date.getMonth() == cur_month && date.getDay() > cur_day)
				// break;

				String datebegin_month = (Integer.toString(cur_month).length() == 1 ? "0"
						+ cur_month
						: (Integer.toString(cur_month)));
				String datebegin_day = (Integer.toString(cur_day - d).length() == 1 ? "0"
						+ (cur_day - d)
						: Integer.toString(cur_day - d));
				datebegin = "2014-" + datebegin_month + "-" + datebegin_day;
				date = new DateModel(999, Integer.parseInt(datebegin_day),
						Integer.parseInt(datebegin_month), 2);

				String dateend_month = (Integer.toString(cur_month).length() == 1 ? "0"
						+ cur_month
						: Integer.toString(cur_month));
				String dateend_day = Integer.toString(cur_day - d + 1).length() == 1 ? "0"
						+ (cur_day - d + 1)
						: Integer.toString(cur_day - d + 1);

				dateend = "2014-" + dateend_month + "-" + dateend_day;

				System.out.println(datebegin);
				// System.out.println(dateend);
				// datebegin = "2014-" //uncommented for testing
				// + (Integer.toString(date.getMonth()).length() == 1 ? "0"
				// : "")
				// + date.getMonth()
				// + "-"
				// + (Integer.toString(date.getDay()).length() == 1 ? "0"
				// : "") + date.getDay();
				// date = dates.get(d + 2);
				// dateend = date.getDay() + "";

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
										.getId(), 50, cities.get(c), true,
								datebegin, dateend, date);
					if (counter == 180) {
						try {
							TimeUnit.MINUTES.sleep(15);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					counter = 0;
					};
					// if (keywords.get(i).getEnglish().length() > 0)
					// search.searchTwitter(con, keywords.get(i).getEnglish(),
					// keywords.get(i).getId(), 50,
					// new GeoLocation(49.487715, 8.461563), true);
					// if (keywords.get(i).getAbbrev().length() > 0)
					// search.searchTwitter(con, keywords.get(i).getAbbrev(),
					// keywords.get(i).getId(), 50,
					// new GeoLocation(49.487715, 8.461563), true);
				}
				//

			}
		}
	}

}