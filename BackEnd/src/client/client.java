package client;

import java.sql.Connection;
import java.util.ArrayList;

import database.datasource;
import database.loadData;
import database.models.Citymodel;
import database.models.DatabaseEntry;
import database.models.KeywordModel;
import twitter4j.GeoLocation;
import TwitterAPI.search;

public class client {

	public static void main(String[] args) {

		Connection con = datasource.connect();
		ArrayList<Citymodel> cities = loadData.load(con, new String(
				"citydimension"), "Citymodel");
		ArrayList<KeywordModel> keywords = loadData.load(con, new String(
				"tweetkeywords"), "KeywordModel");

		KeywordModel keyword;

		// Get Twitter Entries
		for (int i = 0; i < keywords.size(); i++) {
			keyword = keywords.get(i);
			// if (keywords.get(i).getGerman().length() > 0)
			search.searchTwitter(
					con,
					keyword.getGerman()
							+ " OR "
							+ keyword.getEnglish()
							+ (keyword.getAbbrev().length() > 0 ? (" OR " + keyword
									.getAbbrev()) : ""), 50, new GeoLocation(
							49.487715, 8.461563));
			// if (keywords.get(i).getEnglish().length() > 0)
			// search.searchTwitter(con, keywords.get(i).getEnglish(), 50,
			// new GeoLocation(49.487715, 8.461563));
			// if (keywords.get(i).getAbbrev().length() > 0)
			// search.searchTwitter(con, keywords.get(i).getAbbrev(), 50,
			// new GeoLocation(49.487715, 8.461563));
		}
	}

}
